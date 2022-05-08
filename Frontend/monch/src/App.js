import React, {useState} from 'react';
import { sample_users } from "./sample_data/users"
import UserRow from "./components/UserRow"

  /* 
  1. Create Sample Data X
  2. Create Table X
  3. Create row components X 
  4. Create form for insert X
  5. create form for delete -----
  6. create query for insert/delete ----- 
  */


function App() {
  // State State Set Up
  const [users, setUsers] = useState(sample_users)

  // Add SQL Query

  // Form Set Up
  const [email, setEmail] = useState("")
  const [birthday, setBirthday] = useState("")
  const [location, setLocation] = useState("")

  function onChangeEmail(event) {
    setEmail(event.target.value)
  }

  function onChangeBirthday(event) {
    setBirthday(event.target.value)
  }

  function onChangeLocation(event) {
    setLocation(event.target.value)
  }
  // Function Set Up

  // Add SQL Insert
  function createUser(event) {
    event.preventDefault()
    let newUser = {
      userID: "None", 
      userEmail: email, 
      userBirthday: birthday,
      userLocation: location
    }
    const updatedUsers = [... users]
    updatedUsers.push(newUser)
    setUsers(updatedUsers)
  }

  // Add SQL Delete
  function deleteUser(id) {
    alert(`Deleting a User ${id}`)
    const updatedUsers = [... users]
    updatedUsers.filter(user => user["userID"] !== id)
    console.log(updatedUsers)
  }

  return (
    <div>
      <h1>User Table</h1>
      <tbody>
        <table>
          <tr>
            <th>userID</th>
            <th>userEmail</th>
            <th>userBirthday</th>
            <th>userLocation</th>
            <th>delete</th>
          </tr>
          {users.map((user) => {
            return <UserRow data={user} deleteUser={deleteUser}/>
          })}
        </table>
      </tbody>
      <button onClick={() => console.log(users)}>Click me for testing</button>
      <form onSubmit={createUser}>
        <h2>Create a new User</h2>
        <label for="userEmail">Email:</label>
        <input type="email" id="userEmail" name="userEmail" onChange={e => onChangeEmail(e)}/>
        <br/>
        <label for="userBirthday">Enter a birthday:</label>
        <input type="date" id="userBirthday" name="userBirthday" onChange={e => onChangeBirthday(e)}/>
        <br/>
        <label for="userLocation">Enter a Location</label>
        <input type="text" id="userLocation" name="userLocation" onChange={e => onChangeLocation(e)}/> 
        <br/>
        <input type="submit" value="Submit" />
        </form>
    </div>
  );
}

export default App;
