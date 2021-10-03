import React from "react";
import Button from "@material-ui/core/Button";

const componentTypes = ["cpu", "gpu", "motherboard", "cpuCooler", "powerSupply", "disk", "ram", "pcCase"]
let componentList;
let sortedComponentDict = {
    "cpu": [],
    "gpu": [],
    "motherboard": [],
    "cpuCooler": [],
    "powerSupply": [],
    "disk": [],
    "ram": [],
    "pcCase": []
}

export default class HardwareValidationComponent extends React.Component {

    constructor(props) {
        super(props);
        this.executeChecks = this.executeChecks.bind(this)
        this.sortSelectedComponents = this.sortSelectedComponents.bind(this)
        this.areComponentsComplete = this.areComponentsComplete.bind(this)
        this.checkComponentsCount = this.checkComponentsCount.bind(this)
        this.checkPCIECompatibility = this.checkPCIECompatibility.bind(this)
        this.clearSortedComponentDict = this.clearSortedComponentDict.bind(this)
        this.validate = this.validate.bind(this)
    }

    executeChecks() {
        componentList = JSON.parse(localStorage.getItem("componentList"));
        if (componentList === null) {
            alert("No Components selected")
            return
        }
        this.sortSelectedComponents()
        if (this.areComponentsComplete()
            && this.checkComponentsCount()
            && this.checkPCIECompatibility()
        ) {
            alert("Success")
        }
        this.clearSortedComponentDict()

    }

    sortSelectedComponents() {
        for (let i = 0; i < componentList.length; i++) {
            sortedComponentDict[componentList[i]['type']].push(componentList[i])
        }
    }

    areComponentsComplete() {
        //TODO Refactoring with sortedComponentDict
        let areComponentsInList = componentTypes;
        for (let i = 0; i < componentList.length; i++) {
            const index = areComponentsInList.indexOf(componentList[i]['type'])
            if (index >= 0) {
                areComponentsInList.splice(index, 1)
            }
        }
        if (areComponentsInList.length !== 0) {
            let alertMessage = "PC Build not complete. Missing Components are:"
            for (let i = 0; i < areComponentsInList.length; i++) {
                alertMessage += " " + areComponentsInList[i]
            }
            alert(alertMessage)
            return false;
        }
        return true;
    }

    checkComponentsCount() {
        if (sortedComponentDict["cpu"].length > 1) {
            alert("You can only use one Cpu.")
            return false;
        }
        if (sortedComponentDict['gpu'].length > 1) {
            alert("We dont support Multigpu in the configurator yet")
            return false;
        }
        if (sortedComponentDict["pcCase"].length > 1) {
            alert("You've selected more than one PC Case")
            return false;
        }
        if (sortedComponentDict["powerSupply"].length > 1) {
            alert("You can only use one Power Supply.")
            return false;
        }
        if (sortedComponentDict["motherboard"] > 1) {
            alert("You can only use one Motherboard")
            return false;
        }

        let ramStickCount = 0;
        for (let i = 0; i < sortedComponentDict["ram"].length; i++) {
            ramStickCount += sortedComponentDict["ram"][0]['mmc']
        }
        if (ramStickCount > sortedComponentDict["motherboard"][0]['mmc']) {
            alert("You've selected " + ramStickCount + " Ram Modules. This Motherboard only Supports " + sortedComponentDict["motherboard"][0]['mmc'] + " Ram Modules")
            return false;
        }
        return true;
    }

    checkPCIECompatibility() {
        let components = [sortedComponentDict['motherboard'][0], sortedComponentDict['cpu'][0], sortedComponentDict['gpu'][0]];
        //TODO add sortedComponentDict['disk'] if disk M.2 Type
        console.log(components)
        let pcieVersion = sortedComponentDict['motherboard'][0]['pv_version']
        if (pcieVersion > sortedComponentDict['cpu'][0]['pv_version'] && pcieVersion > sortedComponentDict['gpu'][0]['pv_version']) {
            alert("PCIE Version not Compatible")
            return false;
        }
        return true;
    }

    clearSortedComponentDict() {
        for (const [key] of Object.entries(sortedComponentDict)) {
            sortedComponentDict[key] = []
        }
    }

    validate() {
        this.props.validator(true);
    }

    render() {
        return (
            <Button mx={2} variant="contained" className={'navButton'}
                    onClick={this.executeChecks}
            >Verify PC build</Button>)
    }
}
