import React, {useState} from 'react';
import { sample_users } from "./sample_data/users"

function App() {
  const [users, setUsers] = useState(sample_users)

  return (
    <div>
    <h1>User Table</h1>
    <button onClick={() => console.log(users)}>Click me for testing</button>
    </div>
  );
}

export default App;
