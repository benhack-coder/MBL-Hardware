import React from 'react'
import './css/LandingPage.css';
import './css/FadeIn.css';
import './css/Fonts.css';
function LandingComponent(props) {
    return (
        <div className = "fade-in">
            <div className = "container">
                <h1 className = "title">{props.title}</h1>
            </div>
        </div>
    )
}

export default LandingComponent
