<?php
class Movie{
 
    // database connection and table name
    private $conn;
    private $table_name = "movies";
 
    // object properties
    public $id;
    public $title;
    public $year;
    public $imdb_id;
    public $type;
    public $poster;
    public $poster_id = null;
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    function read(){
 
        // select all query
        $query = "SELECT
                    c.link as poster, p.id, p.title, p.year, p.imdb_id, p.type
                FROM
                    " . $this->table_name . " p
                    LEFT JOIN
                        posters c
                            ON p.poster_id = c.id";
     
        // prepare query statement
        $stmt = $this->conn->prepare($query);
     
        // execute query
        $stmt->execute();
     
        return $stmt;
    }

    function create(){


        if($this->poster){
            // query to insert record
            $query = "INSERT INTO posters
                    SET
                        link=:link";

            // prepare query
            $stmt = $this->conn->prepare($query);

            // sanitize
            $this->poster=htmlspecialchars(strip_tags($this->poster));

            // bind values
            $stmt->bindParam(":link", $this->poster);

            // execute query
            if($stmt->execute()){
                $this->poster_id = $this->conn->lastInsertId();;
            }
        } else {
            $this->poster_id = null;
        }
 
        // query to insert record
        $query = "INSERT INTO
                    " . $this->table_name . "
                SET
                title=:title, year=:year, imdb_id=:imdb_id, type=:type, poster_id=:poster_id";
     
        // prepare query
        $stmt = $this->conn->prepare($query);
     
        // sanitize
        $this->title=htmlspecialchars(strip_tags($this->title));
        $this->year=htmlspecialchars(strip_tags($this->year));
        $this->imdb_id=htmlspecialchars(strip_tags($this->imdb_id));
        $this->type=htmlspecialchars(strip_tags($this->type));
        $this->poster_id=htmlspecialchars(strip_tags($this->poster_id));
     
        // bind values
        $stmt->bindParam(":title", $this->title);
        $stmt->bindParam(":year", $this->year);
        $stmt->bindParam(":imdb_id", $this->imdb_id);
        $stmt->bindParam(":type", $this->type);
        $stmt->bindParam(":poster_id", $this->poster_id);
     
        // execute query
        if($stmt->execute()){
            return true;
        }
     
        return false;
    }    
}