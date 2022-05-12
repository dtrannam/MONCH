import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
import { BrowserRouter , Routes, Route, } from "react-router-dom";
import Users from "./routes/Users"
import Reviews from './routes/Reviews';
import Restaurants from './routes/Restaurants';
import Categories from "./routes/Categories";


const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <BrowserRouter>
  <Routes>
  <Route path="/" element={<App />} />
  <Route path="/users" element={<Users />} />
  <Route path="/reviews" element={<Reviews />} />
  <Route path="/restaurants" element={<Restaurants />} />
  <Route path="/categories" element={<Categories />} />
  {/*<Route path="/categories_restaurants" element={<Categories_restaurants />} />*/}
  {/*<Route path="/coupons" element={<Coupons />} />*/}
  </Routes>
  </BrowserRouter>
);
