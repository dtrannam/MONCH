import React, { useState } from "react";
import NavBar from "../components/NavBar";
import { sample_intersections } from "../sample_data/intersections";
import IntersectionRow from "../components/IntersectionRow";

function Intersections() {
  const [intersections, setIntersection] = useState(sample_intersections);
  function deleteIntersection() {
    alert("Deleting Intersection!");
  }

  return (
    <div>
      <h1>Restaurants with Categories</h1>
      <NavBar />
      <h2>Restaurants with Categories Table</h2>
      <table>
        <tr>
          <th>ID</th>
          <th>Category</th>
          <th>Restaurant Name</th>
        </tr>
        {intersections.map((intersection) => {
          return (
            <IntersectionRow
              data={intersection}
              deleteIntersection={deleteIntersection}
            />
          );
        })}
      </table>
    </div>
  );
}
export default Intersections;
