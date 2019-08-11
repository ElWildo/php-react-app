import React, { Component, Fragment } from 'react';
import { render } from 'react-dom';
import { asyncComponent } from 'react-async-component';

/** We are importing our index.php my app Vairaible */
import myApp from 'myApp';

const REACT_APP_APIKEY = '&apikey=720c3666'
const REACT_APP_APIURL = './api/movie/create.php?'
const placeholder = './app/media/film-poster-placeholder.png'

/* globals __webpack_public_path__ */
__webpack_public_path__ = `${window.STATIC_URL}/app/assets/bundle/`;

class Myapp extends Component {

    constructor(props) {
        super(props);
        this.state = {
            movies: []
        };
    }

    movies_renderer = (moviesArr) => {
        var moviesArrRend = moviesArr.map(
            movie =>
                <div className="filmBlock">
                    <img src={(movie.Poster == "N/A")? placeholder:movie.Poster} alt="N/A" />
                    <h2>{movie.Title}</h2>
                    <p>{movie.Year}</p>
                    <p>{movie.Type}</p>
                </div>
        );
        this.setState({movies: moviesArrRend})
    }

    api_call = (film) => {
        this.setState({movies: []})
        fetch(REACT_APP_APIURL + "s=" + film + REACT_APP_APIKEY)
            .then(response => response.json())
            .then(data => this.movies_renderer(data.movies))
            .catch(error => alert(error));
    }

    render() {

        // const { user: { name, email }, logged } = myApp;

        return (
            <div className="container">
                <div className = "filmBlock" onClick={() => { this.api_call("Matrix") }}>Matrix</div>
                <div className = "filmBlock" onClick={() => { this.api_call("Matrix Reloaded") }}>Matrix Reloaded</div>
                <div className = "filmBlock" onClick={() => { this.api_call("Matrix Revolutions") }}>Matrix Revolutions</div>
                <div className="ul">{this.state.movies}</div>
            </div>
        )
    }
}

render(<Myapp />, document.getElementById('app'));