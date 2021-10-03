import React from 'react'
import './css/LandingPage.css';
import './css/Buttons.css';
import './css/FadeIn.css';
import './css/Fonts.css';
import {Link} from 'react-router-dom';

function LowerLandingComponent() {
    return (
        <div className="fade-in" id="background">
            <div className="lower-container">
                <h1>Start your journey</h1>
            </div>
            <div className="buttons">
                <Link to="/register">
                    <button>Register</button>
                </Link>
                <Link to="/login">
                    <button>Login</button>
                </Link>
            </div>
            <div>
                <Link to={{
                    pathname: "/hardwareconfigurator",
                    state: {login: false}
                }}>
                    <h1 id="lowest-text">Continue without Login</h1>
                </Link>
            </div>
        </div>
    )
}

export default LowerLandingComponent
