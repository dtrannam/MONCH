function RestaurantRow( props ) {
    return (
        <tr id={props.data.restaurantID}>
            <td>{props.data.restaurantID}</td>
            <td>{props.data.restaurantName}</td>
            <td>{props.data.restaurantAddress}</td>
            <td>{props.data.restaurantCity}</td>
            <td>{props.data.restaurantPriceRange}</td>
            <td>{props.data.restaurantHasNutritionInfo}</td>
            <td>{props.data.restaurantDeals}</td>
            <td><button onClick={() => props.deleteReview(props.data.reviewID)}>Delete</button></td>
        </tr>
    );
};

export default RestaurantRow;