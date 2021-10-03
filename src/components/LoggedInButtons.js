import React from 'react';
import './css/HardwareLayout.css';
import {FormControl, Grid, NativeSelect} from "@material-ui/core";
import Button from "@material-ui/core/Button";
import {Link} from 'react-router-dom';
import axios from "axios";
import config from "../config.json";
import Cookies from "universal-cookie";

function LoggedInButtons(props) {
    const cookies = new Cookies();

    const [state, setState] = React.useState({
        language: getLanguage(cookies)
    });

    const handleChange = (event) => {
        const name = event.target.name;
        setState({
            ...state,
            [name]: event.target.value,
        });
        changeLanguage(cookies, name);
    };

    return (
        <Grid container spacing={5}>
            <Grid item>
                <Link to='/'>
                    <Button variant="contained" className={'navButton'}
                            onClick={() => {
                                axios.get(config.BACKEND_URL + "/user/logout?" + config.XDEBUG);

                                cookies.remove('username');
                                cookies.set('login', false);
                            }} mr={2}>
                        Log Out
                    </Button>
                </Link>
            </Grid>
            <Grid item>
                <Button variant="contained" className={'navButton'} onClick={props.save}>
                    Save
                </Button>
            </Grid>

            <FormControl>
                <NativeSelect
                    value={state.name}
                    onChange={handleChange}
                    name="name"
                >
                    <optgroup label="Languages">
                        <option value="1">CH-DE</option>
                        <option value="2">EN-US</option>
                    </optgroup>
                </NativeSelect>
            </FormControl>
        </Grid>
    );
}

function changeLanguage(cookies, language) {

    const data = {username: cookies.get('username'), language: language}
    axios.post(config.BACKEND_URL + 'i18n/changeLanguage?' + config.XDEBUG, data)
        .then(r => {

        });
}

function getLanguage(cookies) {
    const data = {username: cookies.get('username'), login: cookies.get('login')}

    axios.post(config.BACKEND_URL + 'i18n/getUserLanguage?' + config.XDEBUG, data)
        .then(r => {
            return r.data.language;
        });
}

export default LoggedInButtons