import React from "react";
import '../components/css/LoginRegisterPage.css'
import '../components/css/Buttons.css'
import '../components/css/LandingPage.css'
import LandingComponent from "../components/LandingComponent";
import {Redirect} from "react-router-dom";
import axios from 'axios';
import config from '../config.json'

class LowerRegisterComponent extends React.Component {
    constructor(props) {
        super(props);
        this.myChangeHandler = this.myChangeHandler.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
        this.state = {
            username: '', password: '', repeatedPassword: '', registerState: '', redirect: false, login: false
        };
    }

    checkResponse() {
        if (this.state.registerState.data.exitcode === 0) {
            this.setState({login: true});
            this.setState({redirect: true});
        } else if (this.state.registerState.data.exitCode === 2) {
            axios.get(config.BACKEND_URL + '/i18n?key=username_taken')
                .then(r => {
                    alert(r.data.translation);
                });
        } else {
            axios.get(config.BACKEND_URL + '/i18n?key=server_error')
                .then(r => {
                    alert(r.data.translation);
                });
        }
    }

    makeRegisterRequest() {
        const userdata = {username: this.state.username, password: this.state.password};
        axios.post("http://backend.local/user/register", userdata)
            .then(res => {
                console.log(res);
                this.setState({registerState: res});
                this.checkResponse();
            })
            .catch(error => {
                axios.get(config.BACKEND_URL + '/i18n?key=internet_error')
                    .then(r => {
                        alert(r.data.translation);
                    });
            })
    }

    myChangeHandler = (event) => {
        //set the state based on input
        let nam = event.target.name;
        let val = event.target.value;
        this.setState({[nam]: val});
    }

    handleSubmit(event) {
        if (this.state.repeatedPassword !== this.state.password) {
            axios.get(config.BACKEND_URL + '/i18n?key=password_match_error')
                .then(r => {
                    alert(r.data.translation);
                });
        } else if (this.state.password.length < 8) {
            axios.get(config.BACKEND_URL + '/i18n?key=short_password')
                .then(r => {
                    alert(r.data.translation);
                });
        } else {
            this.makeRegisterRequest();
        }
        event.preventDefault();
    }

    render() {
        if (this.state.redirect === true) {
            return (
                <Redirect to={{
                    state: {login: this.state.login},
                    pathname: "/hardwareconfigurator"
                }}/>
            );
        } else {
            return (
                <div className="fade-in" id="background">
                    <LandingComponent title="Register"/>
                    <form id="form" onSubmit={this.handleSubmit}>
                        <label>Username</label>
                        <input required type="text" name="username" className="formField"
                               onChange={this.myChangeHandler}/>

                        <label>Password</label>
                        <input required type="password" name="password" className="formField"
                               onChange={this.myChangeHandler}/>

                        <label>Repeat Password</label>
                        <input required type="password" name="repeatedPassword" className="formField"
                               onChange={this.myChangeHandler}/>

                        <input type="submit" className="button" value="Submit"/>
                    </form>
                </div>
            );
        }
    }
}

export default LowerRegisterComponent;