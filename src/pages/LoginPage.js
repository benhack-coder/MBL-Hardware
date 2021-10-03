import React from 'react';
import '../components/css/LoginRegisterPage.css';
import '../components/css/Buttons.css';
import '../components/css/LandingPage.css'
import LandingComponent from '../components/LandingComponent';
import axios from 'axios';
import {Redirect} from "react-router-dom";
import config from '../config.json';
import Cookies from 'universal-cookie';


class LowerLoginComponent extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            username: '', password: '', loginState: '', redirect: false, login: false, translatedText: {}
        };
        this.myChangeHandler = this.myChangeHandler.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    checkResponse(session) {
        if (this.state.loginState.data.exitcode === 0) {
            this.setState({login: true});
            this.setState({redirect: true});

            const cookies = new Cookies();

            cookies.remove('username', 'login');

            cookies.set("username", session.username);
            cookies.set("login", session.login);

        } else {
            axios.get(config.BACKEND_URL + '/i18n?key=wrong_credentials&' + config.XDEBUG)
                .then(r => {
                    alert(r.data.translation);
                });
        }
    }

    makeLoginRequest() {
        const userdata = {username: this.state.username, password: this.state.password};
        axios.post(config.BACKEND_URL + 'user/login/?' + config.XDEBUG, userdata)
            .then(res => {
                this.setState({loginState: res});
                this.checkResponse(res.data.session);
            })
            .catch(error => {
                axios.get(config.BACKEND_URL + '/i18n?key=internet_error')
                    .then(r => {
                        alert(r.data.translation);
                    });
            })
    }

    myChangeHandler = (event) => {
        //manipulates state based on event
        let nam = event.target.name;
        let val = event.target.value;
        this.setState({[nam]: val});
    }

    handleSubmit(event) {
        this.makeLoginRequest();
        event.preventDefault();
    }

    render() {
        if (this.state.redirect === true) {
            return <Redirect to={{
                state: {login: this.state.login},
                pathname: "/hardwareconfigurator"
            }}/>
        } else {
            return (
                <div className="fade-in" id="background">
                    <LandingComponent title="Login"/>
                    <form id="form" onSubmit={this.handleSubmit}>
                        <label>Username</label>
                        <input type="text" required className="formField" name="username"
                               onChange={this.myChangeHandler}/>

                        <label>Password</label>
                        <input type="password" required className="formField" name="password"
                               onChange={this.myChangeHandler}/>

                        <input type="submit" className="button" value="Submit"/>
                    </form>
                </div>
            )
        }
    }
}

export default LowerLoginComponent
