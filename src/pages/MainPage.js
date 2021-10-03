import React from 'react'
import LandingComponent from '../components/LandingComponent';
import LowerLandingComponent from '../components/LowerLandingComponent';
import '../components/css/LandingPage.css'

function MainPage() {
    return (
        <div id="background">
            <LandingComponent title="Want the ultimate PC?"/>
            <LowerLandingComponent/>
        </div>
    )
}

export default MainPage
