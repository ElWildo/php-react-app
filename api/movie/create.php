<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// get database connection
include_once '../config/database.php';

// instantiate product object
include_once '../objects/movie.php';

$database = new Database();
$db = $database->getConnection();

$keywords = isset($_GET["s"]) ? urlencode($_GET["s"]) : "";
$apikey = isset($_GET["apikey"]) ? urlencode($_GET["apikey"]) : "";

$product = new Movie($db);

// get posted data
$dataArr = json_decode(file_get_contents("http://www.omdbapi.com/?s=" . $keywords . "&apikey=" . $apikey));

// make sure data is not empty
if (
    !empty($dataArr->Search)
) {
    $success = 0;
    $failure = 0;
    foreach ($dataArr->Search as $data) {
        if ($data->Poster == "N/A") {
            $product->poster = null;
        } else {
            $product->poster = $data->Poster;
        }
        // set product property values
        $product->title = $data->Title;
        $product->year = $data->Year;
        $product->imdb_id = $data->imdbID;
        $product->type = $data->Type;

        // create the product
        if ($product->create()) {
            $success++;
        } else {
            $failure++;
        }
    }
    
    if ($failure > 0) {
        http_response_code(201);
        echo json_encode(array(
            "message" => "$failure movie were not added.",
            "movies" => $dataArr->Search
        ));
    } else {
        http_response_code(201);
        echo json_encode(array(
            "message" => "Movies were added.",
            "movies" => $dataArr->Search
        ));
    }
}

// tell the user data is incomplete
else {

    // set response code - 400 bad request
    http_response_code(400);

    // tell the user
    echo json_encode(array("message" => "Unable to create product. Data is incomplete."));
}
