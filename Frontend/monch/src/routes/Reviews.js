import React, {useState} from 'react';
import { sample_users } from "../sample_data/users"
import ReviewRow from "../components/ReviewRow"
import Navbar from "../components/NavBar";
import { sample_reviews } from '../sample_data/reviews';

  /* 
  1. Create Sample Data X
  2. Create Table X
  3. Create row components X
  4. Create form for insert X 
  5. create form for delete X 
  6. create query for insert/delete 
  7. search review x 

  QUERIES NEEDED:
  SELECT ALL REVIEWS - DO AN INNER JOIN FOR USERS/STORIES
  SELECT ALL USERS
  SELECT ALL STORES
  DELETE A REVIEW
  SELECT A RESTURANT REVIEW
  */

function Reviews() {
    // State Set Up
    const [reviews, setReviews] = useState(sample_reviews)
    const [search, setSearch] = useState("")
    // Add SQL Query 

    // Form Set Up

    // Add SQL Delete
    function deleteReview(id) {
        alert(`Deleting Review ${id}`)
    }

    // Search SQL
    function searchReview(event) {
        event.preventDefault()

    }

    function onChangeSearch(event) {
        setSearch(event.target.value)
        console.log(search)
    }


    // Return Data
    return (
        <div>
        <h1>Reviews</h1>
        <Navbar></Navbar>
        <h1>Review Table</h1>
        <form onSubmit={searchReview}>
            <label htmlFor="search">Search for a Restaurant: </label>
            <input type="text" id="search" onChange={e => onChangeSearch(e)}/>
            <button>Submit</button>
        </form>
        <br/>
        <tbody>
            <table>
            <tr>
                <th>reviewID</th>
                <th>userEmail</th>
                <th>restaurantName</th>
                <th>reviewContent</th>
                <th>reviewStar</th>
                <th>reviewDate</th>
            </tr>
            {reviews.map((review) => {
                return <ReviewRow data={review} deleteReview={deleteReview} />
            })}
            </table>
        </tbody>
        <br/>
        <form>
            <h2>Create a Review</h2>
            <label htmlFor="userEmail">User Email</label>
                <select id="userEmail" name="userEmail">
                <option value="3">kevin@luk.com</option>
                <option value="2">nathan@perkins.com</option>
                <option value="1">richie@lam.com</option>
                </select>
            <br/>
            <br/>
            <label htmlFor="restaurantName">Restaurant Name</label>
                <select id="restaurantName" name="restaurantName">
                <option value="3">Hugos Cellar</option>
                <option value="2">Cheesecake Factory</option>
                <option value="1">Jjanga AYCE Sushi</option>
                </select>
            <br/>
            <br/>
            <label htmlFor="reviewContent">Review Content</label>
            <br/>
            <textarea id="reviewContent" name="reviewContent" rows="10" cols="50"/>
            <br/>
            <label htmlFor="reviewStar">reviewStar</label>
                <select id="reviewStar" name="reviewStar">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                </select>
            <br/>
            <label htmlFor="date">Date of Visit</label>
            <input type="date" name="date" id="date" />
            <br/>
            <button>Submit</button>
        </form>
        </div>
        

    );
}

export default Reviews