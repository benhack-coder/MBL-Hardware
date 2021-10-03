import React from 'react';
import { Grid } from "@material-ui/core";
import './css/HardwareLayout.css';
import Navbar from './Navbar';
import Fab from '@material-ui/core/Fab';
import AddIcon from '@material-ui/icons/Add';
import RemoveIcon from '@material-ui/icons/Remove';
import CpuComponent from './hardwarecomponents/CpuComponent';
import GpuComponent from './hardwarecomponents/GpuComponent';
import MotherboardComponent from './hardwarecomponents/MotherboardComponent';
import CpuCoolerComponent from "./hardwarecomponents/CpuCoolerComponent";
import PowerSupplyComponent from "./hardwarecomponents/PowerSupplyComponent";
import DriveComponent from "./hardwarecomponents/DriveComponent";
import RamComponent from "./hardwarecomponents/RamComponent";
import PcCaseComponent from "./hardwarecomponents/PcCaseComponent";
import HardwareValidationComponent from "./validation/HardwareValidationComponent";
import axios from "axios";
import config from '../config.json';
import ComponentButtons from './ComponentButtons';
import RenderComponent from './RenderComponent';
import ComponentList from './ComponentList';

class HardwareLayoutComponent extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            component: {}, chosen: false, render: [], valid: false, input: '', showDelete: false, showPlus: false
        }
    }

    handleType() {
        //loading infocomponent based on type -> CPU = CPUComponent
        let component = null;
        switch (this.state.component.type) {
            case "gpu":
                component = <GpuComponent chosen={this.state.chosen} component={this.state.component} />
                break;
            case "cpu":
                component = <CpuComponent chosen={this.state.chosen} component={this.state.component} />
                break;
            case "motherboard":
                component = <MotherboardComponent chosen={this.state.chosen} component={this.state.component} />
                break;
            case "cpuCooler":
                component = <CpuCoolerComponent chosen={this.state.chosen} component={this.state.component} />
                break;
            case "powerSupply":
                component = <PowerSupplyComponent chosen={this.state.chosen} component={this.state.component} />
                break;
            case "disk":
                component = <DriveComponent chosen={this.state.chosen} component={this.state.component} />
                break;
            case "ram":
                component = <RamComponent chosen={this.state.chosen} component={this.state.component} />
                break;
            case "pcCase":
                component = <PcCaseComponent chosen={this.state.chosen} component={this.state.component} />
                break;
            default:
                return null;
        }
        return component;
    }

    handleRender(type) {
        //renders components based on type
        switch (type) {
            case "gpu":
                this.setState({ render: this.props.gpus, showPlus: false, showDelete: false, chosen: false })
                break;
            case "cpu":
                this.setState({ render: this.props.cpus, showPlus: false, showDelete: false, chosen: false })
                break;
            case "motherboard":
                this.setState({ render: this.props.motherboards, showPlus: false, showDelete: false, chosen: false })
                break;
            case "cpuCoolers":
                this.setState({ render: this.props.cpuCoolers, showPlus: false, showDelete: false, chosen: false })
                break;
            case "powerSupply":
                this.setState({ render: this.props.powerSupplies, showPlus: false, showDelete: false, chosen: false })
                break;
            case "disk":
                this.setState({ render: this.props.disk, showPlus: false, showDelete: false, chosen: false })
                break;
            case "memory":
                this.setState({ render: this.props.ram, showPlus: false, showDelete: false, chosen: false })
                break;
            case "pcCase":
                this.setState({ render: this.props.pcCase, showPlus: false, showDelete: false, chosen: false })
                break;
            default:
                alert("Undefined Type")
        }
    }

    receiveCheck(validation) {
        this.setState({ valid: validation });
    }

    addToMyList() {
        let componentList = [];
        componentList.push(this.state.component)
        if (!localStorage.getItem("componentList")) {
            localStorage.setItem("componentList", JSON.stringify(componentList));
        } else {
            let existingList;
            existingList = JSON.parse(localStorage.getItem("componentList"));
            existingList.push(this.state.component)
            localStorage.setItem("componentList", JSON.stringify(existingList))
        }
        this.forceUpdate();
    }

    removeFromMyList() {
        let componentList = JSON.parse(localStorage.getItem("componentList"));
        const component = this.state.component;
        for (let i = 0; i < componentList.length; i++) {
            if (componentList[i].name === component.name) {
                componentList.splice(i, 1);
                break;
            }
        }
        localStorage.clear();
        localStorage.setItem("componentList", JSON.stringify(componentList));
        this.forceUpdate();
    }

    toggleAddButtonVisibility() {
        if (this.state.showPlus) {
            return (
                <Fab id="icon" aria-label="add" onClick={() => this.addToMyList()}>
                    <AddIcon />
                </Fab>
            );
        } else {
            return (
                <Fab disabled={true} id="icon" aria-label="add" onClick={() => this.addToMyList()}>
                    <AddIcon />
                </Fab>
            );
        }
    }

    toggleRemoveButtonVisibility() {
        if (this.state.showDelete) {
            return (
                <Fab id="icon" aria-label="remove" onClick={() => this.removeFromMyList()}>
                    <RemoveIcon />
                </Fab>);
        } else {
            return (
                <Fab disabled={true} id="icon" aria-label="remove" onClick={() => this.removeFromMyList()}>
                    <RemoveIcon />
                </Fab>
            );
        }
    }
    makeRequest() {
        //makes a request to store the configuration in our DB
        if (this.state.valid) {
            axios.post(config.BACKEND_URL + "user/conf", localStorage.getItem("componentList"))
                .then(result => {
                    console.log(result.data);
                    alert("Saved")
                })
        } else {
            alert("You need to first validate your list before saving")
        }
    }

    render() {
        return (
            <div className="mainContainer">
                <Navbar login={this.props.login} save={this.makeRequest.bind(this)} />
                <Grid container className="mainContent">
                    <Grid item xs={6} className="mainItem1">
                        <RenderComponent render={this.state.render} isLoading={this.props.isLoading} onClick={(item) =>
                            this.setState({
                                component: item,
                                showDelete: false,
                                chosen: true,
                                showPlus: true
                            })
                        } />
                    </Grid>
                    <Grid item xs={6} className="mainItem2">
                        {this.handleType()}
                        <div>
                            {this.toggleAddButtonVisibility()}
                            {this.toggleRemoveButtonVisibility()}
                        </div>
                        <div>
                            <hr id="line" />
                        </div>
                        <div className="compButtons">
                            <ComponentButtons onClick={this.handleRender.bind(this)} />
                            <HardwareValidationComponent validator={this.receiveCheck.bind(this)} />
                        </div>
                        <br />
                        <h1>Your Configuration</h1>
                        <Grid container spacing={3}>
                            {
                                <ComponentList onClick = {(item) => this.setState({
                                    showDelete: true,
                                    component: item,
                                    chosen: true,
                                    showPlus: false
                                })}/>
                            }
                        </Grid>
                    </Grid>
                </Grid>
            </div>
        )
    }
}

export default HardwareLayoutComponent;