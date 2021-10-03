import './App.css';
import MainPage from './pages/MainPage';
import LoginPage from './pages/LoginPage';
import RegisterPage from './pages/RegisterPage';
import HardwareConfiguratorPage from './pages/HardWareConfiguratorPage';
import {BrowserRouter as Router, Route} from 'react-router-dom';
function App() {
  return (
    <Router>
      <Route path = "/" exact component = {MainPage} />
      <Route path = "/login" exact component={LoginPage} />
      <Route path = "/register" exact component={RegisterPage} />
      <Route path = "/hardwareconfigurator" exact component={HardwareConfiguratorPage} />
    </Router>
  );
}

export default App;



