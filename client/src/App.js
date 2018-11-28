import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'
import Fib from './Fib'
import OtherPage from './OtherPage'


class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <header>
            <h1>Fib Calculator changed</h1>
            <Link to="/">Home</Link>
            <Link to="/otherpage">Other Page</Link>
          </header>
          <div>
            <Route exact path="/" component={Fib} />
            <Route exact path="/otherpage" component={OtherPage} />
          </div>
        </div>
      </Router>

    );
  }
}

export default App;
