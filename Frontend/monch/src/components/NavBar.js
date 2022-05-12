import React from 'react';
import { Link } from 'react-router-dom';

function Navbar() {
    return (
        <nav>
            <Link to="/users">Users</Link>
            <br />
            <Link to="/reviews">Reviews</Link>
            <br />
            <Link to="/restaurants">Restaurant</Link>
        </nav>
    )
};

export default Navbar; 