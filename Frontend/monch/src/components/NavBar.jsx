import React from 'react';
import { Link } from 'react-router-dom';

function NavBar() {
    return (
        <nav>
            <Link to="/users">Users</Link>
            <br />
            <Link to="/reviews">Reviews</Link>
            <br />
            <Link to="/restaurants">Restaurants</Link>
            <Link to="/categories">Categories</Link>
        </nav>
    )
};

export default NavBar;