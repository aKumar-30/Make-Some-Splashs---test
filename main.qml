import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.2
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Universal 2.12
import Qt.labs.settings 1.0
import Qt.labs.qmlmodels 1.0
import QtMultimedia 5.15
import "test.js" as Global

import Arjun 1.0

//New VERSION STARTS HERE
ApplicationWindow { property string __felgo_live_id_component: "FELGO_COMPONENT_ID_37726"; property string __felgo_live_id_element: "FELGO_ID_37726_410";
    Item{ property string __felgo_live_id_element: "FELGO_ID_37726_411";
        focus: true
        Keys.onPressed:{
            if(event.key===Qt.Key_Space){
                if(Extra.endingPage==="qrc:/CompetitiveMode.qml"){
                    Extra.emittingSpaceInCompSignal();
                }
                else if(Extra.endingPage==="qrc:/CustomizationMode.qml"){
                    Extra.emittingSpaceInCustSignal();
                }
            }
        }
    }
    visible: true
    width: 708
    height: 785
    title: qsTr("Shoot some hoops!")
    id: root
    property var p: false
    property var thisTitle: "Shoot some hoops!"
    property var mArray:[]
    property var firstTime5: true;
    property var currentMissionRewards: 0;
    property var arr: []
    property var presentMissions: [];

    Audio{ property string __felgo_live_id_element: "FELGO_ID_37726_412";
        id: mMusic1
        source:"file:///Users/arjun/Documents/CompetitiveBall/images/mMusic1.wav"
        loops:Audio.Infinite
        volume: Extra.volume*4/5
    }
    Component.onDestruction: {
        mMusic1.stop()
        s_manager.writeSettings("volume0100", Extra.volume);
        s_manager.writeSettings("sound0100",Extra.sound);
        s_manager.writeSettings("numCoins21", Extra.numCoins);
        s_manager.writeSettings("ballSource", Extra.ballSource);
        s_manager.writeSettings("personalBest55",Extra.personalBest);
        s_manager.writeSettings("lukagamewinner22222",Extra.datastore);
        //convert array to string
        setCurrentMissions()
        s_manager.writeSettings("walkerfinals2222",Extra.myMissionsRn);
        console.log("While being destroyed in main.qml, the Extra.myMissionsRn is : "+Extra.myMissionsRn)
    }
    SettingsManager{ property string __felgo_live_id_element: "FELGO_ID_37726_413";
        id: s_manager
    }
    Connections{ property string __felgo_live_id_element: "FELGO_ID_37726_414";
        target: Extra;
        function onSomethingCompetitiveChanged(){
            stackView.pop()
            //starting timer
            thePauseTimer.start()
        }
        function onGoBackFromHalftime(){
            stackView.pop()
        }
        function onGoToHalftime(j){
            stackView.push("qrc:/HalftimeMode.qml")
        }
    }
    onClosing: {
        if(Extra.endingPage==="qrc:/CompetitiveMode.qml"){
            stackView.push("qrc:/GameStore.qml");
            stackView.pop()
        }
        stackView.push("qrc:/CompetitiveMode.qml");
        stackView.pop()
        //--------------------------------------------------------------------------------------------------------------MISSIONS START HERE

        storeForSettings();

        var datamodel = []
        for (let i = 0; i < mMissionModel.count; ++i) datamodel.push(mMissionModel.get(i))
        Extra.datastore = JSON.stringify(datamodel)
    }
    function getCurrentMissions(){
        let j =0;
        for(let i =0; i < 3; i++){
            var q = "";
            while(Extra.myMissionsRn[j]!==","){
                q+=(Extra.myMissionsRn[j]).toString();
                j++
            }
            j++;
            presentMissions.push(parseInt(q))
        }
        console.log("THe current missions (local) after getting them in the main mode is:"+presentMissions)
    }
    function setCurrentMissions(){
        Extra.myMissionsRn = presentMissions[0]+","+presentMissions[1]+","+presentMissions[2]+","
    }

    Component.onCompleted: {
        mMusic1.play()
        console.log(Extra.myMissionsRn)
        if ( Extra.datastore) {
            mMissionModel.clear()
            var datamodel = JSON.parse(Extra.datastore)
            for (let i = 0; i < datamodel.length; ++i) mMissionModel.append(datamodel[i])
        }
        if(Extra.myMissionsRn){
            console.log("Guess what? We are in the if statement which means Extra.myMissionsRn is NOT empty, coolio. This is what is in it: "+Extra.myMissionsRn)
            getCurrentMissions()

        }
    }

    //--------------------------------------------------------------------------------------------------------------MISSIONS START HERE
    function storeForSettings(){
        if(presentMissions.length===0){
            presentMissions.push(displayDelegateModel.items.get(0).model.index);
            presentMissions.push(displayDelegateModel.items.get(1).model.index);
            presentMissions.push(displayDelegateModel.items.get(2).model.index);
            setCurrentMissions()
        }
    }
    function checkIfCurrentMission(num){
        for(let i =0; i< 3; i++){
            if(presentMissions[i]===num){
                return true;
            }
        }
        return false;
    }
    function checkIfButtonNeedsToBeVisible(whatFor){
        let thing = false;
        currentMissionRewards=0;
        for(let i =0; i< 3; i++){
            if( mMissionModel.get(presentMissions[i]).currentThings>=mMissionModel.get(presentMissions[i]).neededThings && mMissionModel.get(presentMissions[i]).completed!==true){
                if(whatFor)
                    currentMissionRewards+= mMissionModel.get(presentMissions[i]).reward
                thing=true;
            }
        }
        return thing
        //        }
    }
    Timer{ property string __felgo_live_id_element: "FELGO_ID_37726_415";
        interval: 1001
        id: delayTimer
    }
    Connections{ property string __felgo_live_id_element: "FELGO_ID_37726_416";
        target: FlashingTimer
        function onCallUpdateMissions(){
            if(!delayTimer.running){
                //changed update missions
                var rowCount = mMissionModel.count
                mArray = []
                for(let i =0;i < rowCount;i++ ) {
                    let entry = mMissionModel.get(i)
                    if((!entry.multipleTimes || !entry.completed))
                        mArray.push(entry)
                }
                arr = mArray.sort(() => Math.random() - Math.random()).slice(0, 3)
                presentMissions=[]
                for(let h =0; h < arr.length; h++){
                    //subject to change
                    arr[h].completed=false
                    arr[h].currentThings=0;
                    presentMissions.push(arr[h].index);
                }
                //used stored settings to manuelly replace
                for(let s = 0; s< 3; s++){
                    displayDelegateModel.items.get(displayDelegateModel.items.count-1-s).model.index=mMissionModel.get(presentMissions[s]).index
                    displayDelegateModel.items.get(displayDelegateModel.items.count-1-s).model.completed=mMissionModel.get(presentMissions[s]).completed
                    displayDelegateModel.items.get(displayDelegateModel.items.count-1-s).model.description=mMissionModel.get(presentMissions[s]).description
                    displayDelegateModel.items.get(displayDelegateModel.items.count-1-s).model.multipleTimes=mMissionModel.get(presentMissions[s]).multipleThings
                    displayDelegateModel.items.get(displayDelegateModel.items.count-1-s).model.reward=mMissionModel.get(presentMissions[s]).reward
                    displayDelegateModel.items.get(displayDelegateModel.items.count-1-s).model.neededThings=mMissionModel.get(presentMissions[s]).neededThings
                    displayDelegateModel.items.get(displayDelegateModel.items.count-1-s).model.currentThings=mMissionModel.get(presentMissions[s]).currentThings
                }
                delayTimer.start()
            }
        }
    }
    function updateMissions(){
        var rowCount = mMissionModel.count
        mArray = []
        displayDelegateModel.items.remove(0,displayDelegateModel.items.count)

        for(let i =0;i < rowCount;i++ ) {
            let entry = mMissionModel.get(i)
            if((!entry.multipleTimes || !entry.completed))
                mArray.push(entry)
        }
        arr = mArray.sort(() => Math.random() - Math.random()).slice(0, 3)
        for(let h =0; h < arr.length; h++){
            //subject to change
            arr[h].completed=false
            arr[h].currentThings=0;
        }
        displayDelegateModel.items.insert(arr[0], "todaysMissions");
        displayDelegateModel.items.insert(arr[1], "todaysMissions");
        displayDelegateModel.items.insert(arr[2], "todaysMissions");
        presentMissions=[]
        storeForSettings();
    }
    Rectangle { property string __felgo_live_id_element: "FELGO_ID_37726_417";
        visible:false
        z:17
        id: mainRect
        width: parent.width*2/3
        height: parent.width*4/5
        anchors.centerIn: parent
        border.color:"#2e8ddb"
        border.width:3
        Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_418";
            anchors.top: parent.top
            id: header
            width: parent.width
            height: 60
            color: "#2e8ddb"
            Text{ property string __felgo_live_id_element: "FELGO_ID_37726_419";
                anchors.fill: parent
                color: "#ffffff"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 28
                text: "Missions"
                font.family: "Complex"
            }
        }
        Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_420";
            id: headerFade
            width: parent.width
            anchors.top:header.bottom
            height: 8
            color: "#18549e"
        }
        Text{ property string __felgo_live_id_element: "FELGO_ID_37726_421";
            id: countdownText
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            anchors.top: headerFade.bottom
            text: "NEXT MISSIONS IN "+whatToPrint;
            font.family: "GENISO"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            color: "#595756"
            y: header.y+16
            font.pointSize: 12
        }
        //Actual model stuff START HERE-----------------------------------
        ListModel{ property string __felgo_live_id_element: "FELGO_ID_37726_422";
            id: mMissionModel
            ListElement{ property string __felgo_live_id_element: "FELGO_ID_37726_423";//0
                // @disable-check M16
                index: 0
                // @disable-check M16
                completed: false;
                // @disable-check M16
                description: "Splash 3 times in a row. Record: "
                // @disable-check M16
                multipleTimes: true
                // @disable-check M16
                reward: 2;
                // @disable-check M16
                neededThings: 3
                // @disable-check M16
                currentThings: 0
            }
            ListElement{ property string __felgo_live_id_element: "FELGO_ID_37726_424";//1
                // @disable-check M16
                index: 1
                // @disable-check M16
                completed: false;
                // @disable-check M16
                description: "Splash 6 times in a row. Record: "
                // @disable-check M16
                multipleTimes: true
                // @disable-check M16
                reward: 4;
                // @disable-check M16
                neededThings: 6
                // @disable-check M16
                currentThings: 0
            }
            ListElement{ property string __felgo_live_id_element: "FELGO_ID_37726_425";//2
                // @disable-check M16
                index: 2
                // @disable-check M16
                completed: false;
                // @disable-check M16
                description: "Splash 11 times in a row. Record: "
                // @disable-check M16
                multipleTimes: true
                // @disable-check M16
                reward: 12;
                // @disable-check M16
                neededThings: 11
                // @disable-check M16
                currentThings: 0
            }
            ListElement{ property string __felgo_live_id_element: "FELGO_ID_37726_426";//3
                // @disable-check M16
                index: 3
                // @disable-check M16
                completed: false;
                // @disable-check M16
                description: "Miss at the backboard two consecutive time. Record: "
                // @disable-check M16
                multipleTimes: true
                // @disable-check M16
                reward: 2;
                // @disable-check M16
                neededThings: 2
                // @disable-check M16
                currentThings: 0
            }
            ListElement{ property string __felgo_live_id_element: "FELGO_ID_37726_427";//4
                // @disable-check M16
                index: 4
                // @disable-check M16
                completed: false;
                // @disable-check M16
                description: "Make at the rim 6 times in a row in level 3. Record:"
                // @disable-check M16
                multipleTimes: true
                // @disable-check M16
                reward: 6;
                // @disable-check M16
                neededThings: 6
                // @disable-check M16
                currentThings: 0
            }
            ListElement{ property string __felgo_live_id_element: "FELGO_ID_37726_428";//5
                // @disable-check M16
                index: 5
                // @disable-check M16
                completed: false;
                // @disable-check M16
                description: "Make at the backboard 9 times in a row in level 2. Record:"
                // @disable-check M16
                multipleTimes: true
                // @disable-check M16
                reward: 23;
                // @disable-check M16
                neededThings: 9
                // @disable-check M16
                currentThings: 0
            }
            ListElement{ property string __felgo_live_id_element: "FELGO_ID_37726_429";//6
                // @disable-check M16
                index: 6
                // @disable-check M16
                completed: false;
                // @disable-check M16
                description: "Splash the ball 8 times in a row during level 3. Record:"
                // @disable-check M16
                multipleTimes: true
                // @disable-check M16
                reward: 7;
                // @disable-check M16
                neededThings: 8
                // @disable-check M16
                currentThings: 0
            }
            ListElement{ property string __felgo_live_id_element: "FELGO_ID_37726_430";//7
                // @disable-check M16
                index: 7
                // @disable-check M16
                completed: false;
                // @disable-check M16
                description: "Make all the shots in level 1. Record"
                // @disable-check M16
                multipleTimes: true
                // @disable-check M16
                reward: 9;
                // @disable-check M16
                neededThings: 21
                // @disable-check M16
                currentThings: 0
            }
            ListElement{ property string __felgo_live_id_element: "FELGO_ID_37726_431";//8
                // @disable-check M16
                index: 8
                // @disable-check M16
                completed: false;
                // @disable-check M16
                description: "Make all the shots in level 2. Record"
                // @disable-check M16
                multipleTimes: true
                // @disable-check M16
                reward: 23;
                // @disable-check M16
                neededThings: 21
                // @disable-check M16
                currentThings: 0
            }
            ListElement{ property string __felgo_live_id_element: "FELGO_ID_37726_432";//9
                // @disable-check M16
                index: 9
                // @disable-check M16
                completed: false
                // @disable-check M16
                description: "Miss two consecutively at the rim in level 3. Record:"
                // @disable-check M16
                multipleTimes: true
                // @disable-check M16
                reward: 4;
                // @disable-check M16
                neededThings: 2
                // @disable-check M16
                currentThings: 0
            }
            ListElement{ property string __felgo_live_id_element: "FELGO_ID_37726_433";//10
                // @disable-check M16
                index: 10
                // @disable-check M16
                completed: false;
                // @disable-check M16
                description: "Get exactly 4 coins in a game in a twice"
                // @disable-check M16
                multipleTimes: true
                // @disable-check M16
                reward: 4;
                // @disable-check M16
                neededThings: 2
                // @disable-check M16
                currentThings: 0
            }
            ListElement{ property string __felgo_live_id_element: "FELGO_ID_37726_434";//11
                // @disable-check M16
                index: 11
                // @disable-check M16
                completed: false;
                // @disable-check M16
                description: "Advance to level 3 while earning zero coins in the match"
                // @disable-check M16
                multipleTimes: true
                // @disable-check M16
                reward: 14;
                // @disable-check M16
                neededThings: 1
                // @disable-check M16
                currentThings: 0
            }
            ListElement{ property string __felgo_live_id_element: "FELGO_ID_37726_435";//12
                // @disable-check M16
                index: 12
                // @disable-check M16
                completed: false;
                // @disable-check M16
                description: "Complete the other two challenges."
                // @disable-check M16
                multipleTimes: true
                // @disable-check M16
                reward: 4;
                // @disable-check M16
                neededThings: 2
                // @disable-check M16
                currentThings: 0
            }
            ListElement{ property string __felgo_live_id_element: "FELGO_ID_37726_436";//13
                // @disable-check M16
                index: 13
                // @disable-check M16
                completed: false;
                // @disable-check M16
                description: "Make at the backboard four consecutive times. Record: "
                // @disable-check M16
                multipleTimes: true
                // @disable-check M16
                reward: 4;
                // @disable-check M16
                neededThings: 4
                // @disable-check M16
                currentThings: 0
            }
            //            ListElement{//5
            //                index: 5
            //                completed: false;
            //                description: "Play with three different balls"
            //                multipleTimes: false
            //                reward: 3;
            //                neededThings: 3
            //                currentThings: 0
            //            }
            //            ListElement{//6
            //                index: 6
            //                completed: false;
            //                description: "Purchase 'The Moon' ball"
            //                multipleTimes: false
            //                reward: 9;
            //                neededThings: 1
            //                currentThings: 0
            //            }
            //            ListElement{//6
            //                index: 6
            //                completed: false;
            //                description: "Purchase 'The Moon' ball"
            //                multipleTimes: false
            //                reward: 9;
            //                neededThings: 1
            //                currentThings: 0
            //            }
            //            ListElement{//7
            //                index: 7
            //                completed: false;
            //                description: "Buy 3 different types of balls"
            //                multipleTimes: false
            //                reward: 8;
            //                neededThings: 3
            //                currentThings: 0
            //            }
            //            ListElement{//10
            //                index: 10
            //                completed: false;
            //                description: "Earning 8 coins in a game. Record: "
            //                multipleTimes: true
            //                reward: 4;
            //                neededThings: 1
            //                currentThings: 0
            //            }


            //            ListElement{//14
            //                index: 14
            //                completed: false;
            //                name: ""
            //                description: "Advance to level 2 while earning zero coins in the match"
            //                multipleTimes: true
            //                reward: 9;
            //                neededThings: 1
            //                currentThings: 0
            //            }
        }
        Component{
            id: mMissionDelegate

            Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_437";
                anchors.horizontalCenter: parent.horizontalCenter
                width: mainRect.width-25
                height: width*1/4+16
                Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_438";
                    visible: (completed)
                    width: mainRect.width-25
                    height: width*1/4+16
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "white"
                    border.width: 10
                    border.color: "#7ae868"
                    Text{ property string __felgo_live_id_element: "FELGO_ID_37726_439";
                        anchors.centerIn: parent
                        text: "COMPLETED"
                        font.family: "Segoe UI Light"
                        font.bold: true
                        font.underline: true
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 16
                        color: "#7ae868"

                    }
                }
                Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_440";
                    visible: !completed
                    width: mainRect.width-25
                    height: width*1/4+16
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "transparent"
                    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_441";
                        id: mainDelegateRect
                        width: parent.width
                        height: parent.height-12
                        anchors.verticalCenter: parent.verticalCenter
                        color: (currentThings>=neededThings)?"#7ae868":"#2e8ddb"
                        Column{ property string __felgo_live_id_element: "FELGO_ID_37726_442";
                            x:16
                            y:10
                            spacing: 12;
                            width: parent.width
                            Text{ property string __felgo_live_id_element: "FELGO_ID_37726_443";
                                id: theText
                                y:15
                                font.family: "Swis721 Cn BT"
                                font.bold: true
                                width: parent.width*2/3+15
                                wrapMode: Text.Wrap
                                font.pointSize: 12.5
                                color: "white"
                                text:description
                                //description text
                            }
                            Row{ property string __felgo_live_id_element: "FELGO_ID_37726_444";
                                spacing:2
                                //progress bar
                                ProgressBar { property string __felgo_live_id_element: "FELGO_ID_37726_445";
                                    id: thingsLeft
                                    value: currentThings/neededThings
                                    padding: 2
                                    Text{ property string __felgo_live_id_element: "FELGO_ID_37726_446";
                                        z:3
                                        anchors.centerIn: parent
                                        color: "white"
                                        font.family: "Swis721 Cn BT"
                                        font.bold: true
                                        font.pointSize: 14
                                        text:(currentThings>=neededThings)?(neededThings+"/"+neededThings):(currentThings+"/"+neededThings)
                                    }
                                    background: Rectangle { property string __felgo_live_id_element: "FELGO_ID_37726_447";
                                        implicitWidth: theText.width
                                        implicitHeight: 32
                                        color: "#000000"
                                        radius: 2
                                    }
                                    contentItem: Item { property string __felgo_live_id_element: "FELGO_ID_37726_448";
                                        implicitWidth: theText.width
                                        implicitHeight: 26
                                        Rectangle { property string __felgo_live_id_element: "FELGO_ID_37726_449";
                                            width: thingsLeft.visualPosition * parent.width
                                            height: parent.height
                                            radius: 2
                                            color: "#06bf0c"
                                        }
                                    }
                                }
                                //filler space
                                Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_450";
                                    width: 35
                                    height: 2
                                    color: "transparent"
                                }
                                //reward
                                Text{ property string __felgo_live_id_element: "FELGO_ID_37726_451";
                                    anchors.verticalCenter: parent.verticalCenter
                                    color: "black"
                                    font.family: "Swis721 Cn BT"
                                    font.bold: true
                                    font.pointSize: 18
                                    text:reward
                                }
                                //coin pic
                                Image{ property string __felgo_live_id_element: "FELGO_ID_37726_452";
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: 35
                                    height: 35
                                    source: "file:///Users/arjun/Documents/CompetitiveBall/images/coinFront.png"
                                }
                            }
                        }
                    }
                }
            }
        }
        ListView { property string __felgo_live_id_element: "FELGO_ID_37726_453";
            id: listOfMissions
            z:18
            anchors.top: countdownText.bottom
            width: parent.width
            height: parent.height-header.height-headerFade.height-countdownText.height-getRewardsButton.height-15
            x: 0;
            spacing: 5
            model: displayDelegateModel             // 6
            interactive: false;
        }
        DelegateModel { property string __felgo_live_id_element: "FELGO_ID_37726_454";
            id: displayDelegateModel
            delegate:  mMissionDelegate
            model: mMissionModel
            groups: [
                DelegateModelGroup   { property string __felgo_live_id_element: "FELGO_ID_37726_455";
                    id: mDelegateGroupModel
                    includeByDefault: false
                    name: "todaysMissions"
                }
            ]
            filterOnGroup: "todaysMissions"
            Component.onCompleted: {
                if(presentMissions.length!==0){
                    displayDelegateModel.items.remove(0,displayDelegateModel.items.count);
                    displayDelegateModel.items.insert(mMissionModel.get(presentMissions[0]), "todaysMissions");
                    displayDelegateModel.items.insert(mMissionModel.get(presentMissions[1]), "todaysMissions");
                    displayDelegateModel.items.insert(mMissionModel.get(presentMissions[2]), "todaysMissions");
                }
                else{
                    updateMissions()
                }
            }
        }
        //Actual model stuff ENDS HERE------------------------------------------------------------
        Button{ property string __felgo_live_id_element: "FELGO_ID_37726_456";
            onClicked: {
                if(visible){
                    Extra.numCoins+= currentMissionRewards;
                    //remove delegates for completed missions
                    let j =0;
                    for(let i =displayDelegateModel.items.count-3; i< displayDelegateModel.items.count;i++){
                        if(displayDelegateModel.items.get(i).model.currentThings>=displayDelegateModel.items.get(i).model.neededThings){
                            displayDelegateModel.items.get(i).model.completed=true;
                            mMissionModel.get(presentMissions[j]).completed=true
                        }
                        j++;
                    }
                    visible=false;
                    getRewardsButtonFade.visible=false;
                }
            }
            visible: currentMissionRewards!=0;
            z: 19
            id: getRewardsButton
            anchors.top: listOfMissions.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            height: 50
            width: 140
            Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_457";
                anchors.fill: parent
                color: "#40ad36"

            }
            Row{ property string __felgo_live_id_element: "FELGO_ID_37726_458";
                x:10
                anchors.verticalCenter: parent.verticalCenter
                Text{ property string __felgo_live_id_element: "FELGO_ID_37726_459";
                    anchors.verticalCenter: parent.verticalCenter
                    color: "black"
                    font.family: "Swis721 Cn BT"
                    font.bold: true
                    font.pointSize: 18
                    text:"Get"
                }
                Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_460";
                    width: 15
                    height: 2
                    color: "transparent"
                }

                //text
                Text{ property string __felgo_live_id_element: "FELGO_ID_37726_461";
                    anchors.verticalCenter: parent.verticalCenter
                    color: "black"
                    font.family: "Swis721 Cn BT"
                    font.bold: true
                    font.pointSize: 18
                    text: currentMissionRewards
                }
                //coin pic
                Image{ property string __felgo_live_id_element: "FELGO_ID_37726_462";
                    anchors.verticalCenter: parent.verticalCenter
                    width: 35
                    height: 35
                    source: "file:///Users/arjun/Documents/CompetitiveBall/images/coinFront.png"
                }
            }
        }
        Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_463";
            visible: currentMissionRewards!=0;
            id: getRewardsButtonFade
            width: getRewardsButton.width
            height: getRewardsButton.height
            y: getRewardsButton.y+5
            x: getRewardsButton.x-5
            color: "#188509"
        }
    }
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_464";
        visible:false;
        z:16
        id: mainRectFade
        x: mainRect.x-10
        y: mainRect.y+17
        width: mainRect.width
        height:mainRect.height
        color: "#18549e"
    }

    //---------------------------------------------------------------------------------------------------------------------------------------------------
    Dialog { property string __felgo_live_id_element: "FELGO_ID_37726_465";
        onOpened: {
            Extra.isOpen = true;
        }
        onClosed: {
            Extra.isOpen = false;
        }
        id: aboutDialog
        modal: true
        focus: true
        anchors.centerIn: parent
        width: root.width*7/10
        height: root.height*4/5
        Label { property string __felgo_live_id_element: "FELGO_ID_37726_466";
            id: title
            height: 35
            Text{ property string __felgo_live_id_element: "FELGO_ID_37726_467";
                id: labelText
                font.pointSize: 5
                text: "How to play??"
                font.family: "Bodoni MT Black"
                wrapMode: Label.Wrap
                font.pixelSize:35
                font.bold:true;
                horizontalAlignment: "AlignHCenter"
            }
        }
        Flickable{ property string __felgo_live_id_element: "FELGO_ID_37726_468";
            id: howToPlayFlickable
            y: title.y+title.width+50
            width: aboutDialog.width-25
            height: aboutDialog.height-title.width-90
            contentHeight: parent.height*2
            contentWidth: aboutColumn.width
            flickableDirection: Flickable.VerticalFlick
            clip: true
            Column { property string __felgo_live_id_element: "FELGO_ID_37726_469";
                id: aboutColumn
                spacing: 20
                anchors.fill:parent
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_470";
                    width: aboutDialog.availableWidth
                    Text{ property string __felgo_live_id_element: "FELGO_ID_37726_471";
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                        font.underline: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 23
                        text: "The Game"
                    }
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_472";
                    width: aboutDialog.availableWidth
                    Text{ property string __felgo_live_id_element: "FELGO_ID_37726_473";
                        font.bold: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 19
                        text: "Level 1"
                    }
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_474";
                    width: aboutDialog.availableWidth
                    text: "    Click near the slider to get the ball to shoot towards the basketball. The closer the slider is to the green the better the shot. If the ball misses three times in a row, you lose. Be careful, the slider moves faster as you go!"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_475";
                    width: aboutDialog.availableWidth
                    Text{ property string __felgo_live_id_element: "FELGO_ID_37726_476";
                        font.bold: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 19
                        text: "Level 2"
                    }
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_477";
                    width: aboutDialog.availableWidth
                    text: "    Click near the slider to get the ball to shoot towards the basketball. The closer the slider is to the green the better the shot. If the ball misses three times in a row, you lose. Be careful, the slider moves in different speeds and speed patterns as you go!"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_478";
                    width: aboutDialog.availableWidth
                    Text{ property string __felgo_live_id_element: "FELGO_ID_37726_479";
                        font.bold: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 19
                        text: "Halftime"
                    }
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_480";
                    width: aboutDialog.availableWidth
                    text: "    Time to have some fun! Try to click on as many balls as you can as they fall. The more balls you click the more bonus points you earn"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_481";
                    width: aboutDialog.availableWidth
                    Text{ property string __felgo_live_id_element: "FELGO_ID_37726_482";
                        font.bold: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 19
                        text: "Level 3"
                    }
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_483";
                    width: aboutDialog.availableWidth
                    text: "    Try to click on the green part of the slider. The closer you are to a geen color (green then yellow then orange then red) the better the shot! If the ball misses three times in a row, you lose. Be careful, it switches faster as you go!"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_484";
                    width: aboutDialog.availableWidth
                    Text{ property string __felgo_live_id_element: "FELGO_ID_37726_485";
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                        font.underline: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 23
                        text: "Coins"
                    }
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_486";
                    width: aboutDialog.availableWidth
                    text: "    Earn coins by completing daily missions, watching ads, or playing the game (randomly appearing)!"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_487";
                    width: aboutDialog.availableWidth
                    Text{ property string __felgo_live_id_element: "FELGO_ID_37726_488";
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                        font.underline: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 23
                        text: "Daily Missions"
                    }
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_489";
                    width: aboutDialog.availableWidth
                    text: "    Complete tasks by playing to game to earn coins. There are 3 missions, which reset and change every day"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_490";
                    width: aboutDialog.availableWidth
                    Text{ property string __felgo_live_id_element: "FELGO_ID_37726_491";
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                        font.underline: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 23
                        text: "The Store"
                    }
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_492";
                    width: aboutDialog.availableWidth
                    text: "    Use coins to purchase a new ball! These balls provide cool new looks for when you play. Wow!"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_493";
                    width: aboutDialog.availableWidth
                    Text{ property string __felgo_live_id_element: "FELGO_ID_37726_494";
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                        font.underline: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 23
                        text: "Customization Mode"
                    }
                }
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_495";
                    width: aboutDialog.availableWidth
                    text: "    Bored of playing the game? Take a break in the customization mode where you can expirement with bouncing around different balls. How fun!"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
            }
            ScrollBar.vertical: ScrollBar{ property string __felgo_live_id_element: "FELGO_ID_37726_496";}
        }
    }
    function help() {
        let url = "https://nba.com/"
        Qt.openUrlExternally(url)
    }
    Settings { property string __felgo_live_id_element: "FELGO_ID_37726_497";
        id: settings
        property string style: "Default"
    }
    Dialog { property string __felgo_live_id_element: "FELGO_ID_37726_498";
        onOpened: {
            Extra.isOpen = true;
        }
        onClosed: {
            Extra.volume=volumeSlider.volume
            Extra.sound=soundSlider.sound
            Extra.isOpen = false;
        }

        id: settingsDialog
        x: Math.round((root.width - width) / 2)
        y: Math.round(root.height / 6)
        width: Math.round(Math.min(root.width, root.height) / 3 * 2)
        modal: true
        focus: true
        standardButtons: Dialog.Ok | Dialog.Cancel
        onAccepted: {
            settings.style = styleBox.displayText
            settingsDialog.close()
        }
        onRejected: {
            styleBox.currentIndex = styleBox.styleIndex
            settingsDialog.close()
        }

        contentItem: ColumnLayout { property string __felgo_live_id_element: "FELGO_ID_37726_499";
            id: settingsColumn
            spacing: 20
            y:15
            Text{ property string __felgo_live_id_element: "FELGO_ID_37726_500";
                width: 200
                text: "Settings"
                font.family: "Bodoni MT Black"
                wrapMode: Label.Wrap
                font.pixelSize: 35
                font.bold:true;
                horizontalAlignment: "AlignHCenter"
            }
            RowLayout{ property string __felgo_live_id_element: "FELGO_ID_37726_501";
                spacing: 10

                Label{ property string __felgo_live_id_element: "FELGO_ID_37726_502";
                    text: "Music:"
                    font.pointSize: 10
                    font.bold: true
                }
                Slider { property string __felgo_live_id_element: "FELGO_ID_37726_503";
                    id: volumeSlider
                    from: 0
                    to: 1
                    onValueChanged: {
                        Extra.volume=volumeSlider.volume

                    }
                    value: QtMultimedia.convertVolume(Extra.volume,QtMultimedia.LinearVolumeScale,QtMultimedia.LogarithmicVolumeScale);
                    property real volume: QtMultimedia.convertVolume(volumeSlider.value,
                                                                     QtMultimedia.LogarithmicVolumeScale, QtMultimedia.LinearVolumeScale)
                }
            }
            RowLayout{ property string __felgo_live_id_element: "FELGO_ID_37726_504";
                spacing: 10

                Label{ property string __felgo_live_id_element: "FELGO_ID_37726_505";
                    text: "Sound:"
                    font.pointSize: 10
                    font.bold: true
                }
                Slider { property string __felgo_live_id_element: "FELGO_ID_37726_506";
                    id: soundSlider
                    from: 0
                    to: 1
                    onValueChanged: {
                        Extra.sound=soundSlider.sound

                    }
                    value: QtMultimedia.convertVolume(Extra.sound,QtMultimedia.LinearVolumeScale,QtMultimedia.LogarithmicVolumeScale);
                    property real sound: QtMultimedia.convertVolume(soundSlider.value,
                                                                    QtMultimedia.LogarithmicVolumeScale, QtMultimedia.LinearVolumeScale)
                }
            }
            RowLayout { property string __felgo_live_id_element: "FELGO_ID_37726_507";
                spacing: 10
                Label { property string __felgo_live_id_element: "FELGO_ID_37726_508";
                    text: "Style:"
                }
                ComboBox { property string __felgo_live_id_element: "FELGO_ID_37726_509";
                    id: styleBox
                    property int styleIndex: -1
                    model: availableStyles
                    Component.onCompleted: {
                        styleIndex = find(settings.style, Qt.MatchFixedString)
                        if (styleIndex !== -1)
                            currentIndex = styleIndex
                    }
                    Layout.fillWidth: true
                }
            }

            Label { property string __felgo_live_id_element: "FELGO_ID_37726_510";
                text: "Restart required"
                color: "#e41e29"
                opacity: styleBox.currentIndex !== styleBox.styleIndex ? 1.0 : 0.0
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
    Shortcut { property string __felgo_live_id_element: "FELGO_ID_37726_511";
        sequences: ["Esc", "Back"]
        enabled: stackView.depth > 1
        onActivated: navigateBackAction.trigger()
    }
    Shortcut { property string __felgo_live_id_element: "FELGO_ID_37726_512";
        sequence: StandardKey.HelpContents
        onActivated: help()
    }
    Shortcut { property string __felgo_live_id_element: "FELGO_ID_37726_513";
        sequence: "Menu"
        onActivated: optionsMenuAction.trigger()
    }

    Action { property string __felgo_live_id_element: "FELGO_ID_37726_514";
        id: optionsMenuAction
        icon.name: "menu"
        icon.source: "file:///Users/arjun/Documents/CompetitiveBall/icons/splashs/menu.png"
        onTriggered: optionsMenu.open()
    }

    Action { property string __felgo_live_id_element: "FELGO_ID_37726_515";
        id: navigateBackAction
        icon.name: stackView.depth > 1 ? "back" : ""
        icon.source: stackView.depth > 1? "file:///Users/arjun/Documents/CompetitiveBall/icons/splashs/back.png":""
        onTriggered: {
            if (stackView.depth > 1) {
                //Give them a reset warning
                if(root.width!=708){
                    root.width = 708;
                    root.height = 785;
                }

                if(Extra.endingPage==="qrc:/CompetitiveMode.qml"){
                    warningDialog.open();
                }
                else{
                    stackView.pop()
                    thisTitle = "Shoot some hoops!"
                }
            }
        }
    }
    Timer{ property string __felgo_live_id_element: "FELGO_ID_37726_516";
        id: thePauseTimer
        interval: 1000
        onTriggered: {
            //update model
            mMissionModel.clear()
            var datamodel = JSON.parse(Extra.datastore)
            for (let i = 0; i < datamodel.length; ++i) mMissionModel.append(datamodel[i])

            //update delegate with updated model
            for(let s = 0; s< 3; s++){
                //                    if(presentMissions.length===0)
                //                        displayDelegateModel.items.get(displayDelegateModel.items.count-1-s).model.currentThings=mMissionModel.get(displayDelegateModel.items.get(displayDelegateModel.items.count-1-s).model.index).currentThings
                //                    else
                displayDelegateModel.items.get(displayDelegateModel.items.count-1-s).model.currentThings=mMissionModel.get(presentMissions[2-s]).currentThings
            }
        }
    }
    Dialog { property string __felgo_live_id_element: "FELGO_ID_37726_517";
        onOpened: {
            Extra.isOpen = true;
        }
        onClosed: {
            Extra.isOpen = false;
        }
        id: warningDialog
        x: Math.round((root.width - width) / 2)
        y: Math.round(root.height / 6)
        width: Math.round(Math.min(root.width, root.height) / 3 * 2)
        modal: true
        focus: true
        title: "Warning"

        standardButtons: Dialog.Ok | Dialog.Cancel

        onAccepted: {
            stackView.pop()
            warningDialog.close()
            thisTitle = "Shoot some hoops!"
            //starting timer
            thePauseTimer.start()
        }
        onRejected: {
            warningDialog.close()
        }

        contentItem: ColumnLayout { property string __felgo_live_id_element: "FELGO_ID_37726_518";
            id: warningColumn
            spacing: 20

            RowLayout { property string __felgo_live_id_element: "FELGO_ID_37726_519";
                spacing: 10

                Label { property string __felgo_live_id_element: "FELGO_ID_37726_520";
                    text: "Are you sure you would like to leave? All progress in the current game (including missions) may be lost"
                    horizontalAlignment: Label.AlignHCenter
                    verticalAlignment: Label.AlignVCenter
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    wrapMode: Label.Wrap
                }
            }
        }
    }
    header: ToolBar { property string __felgo_live_id_element: "FELGO_ID_37726_521";
        Material.foreground: "mintcream"

        RowLayout { property string __felgo_live_id_element: "FELGO_ID_37726_522";
            spacing: 20
            anchors.fill: parent

            ToolButton { property string __felgo_live_id_element: "FELGO_ID_37726_523";
                visible: stackView.depth>1
                action: navigateBackAction
            }

            Label { property string __felgo_live_id_element: "FELGO_ID_37726_524";
                id: titleLabel
                text: thisTitle.toString()
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            ToolButton { property string __felgo_live_id_element: "FELGO_ID_37726_525";
                action: optionsMenuAction

                Menu { property string __felgo_live_id_element: "FELGO_ID_37726_526";
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight

                    Action { property string __felgo_live_id_element: "FELGO_ID_37726_527";
                        text: "Settings"
                        onTriggered: settingsDialog.open()
                    }
                    Action { property string __felgo_live_id_element: "FELGO_ID_37726_528";
                        text: "How to play?"
                        onTriggered: aboutDialog.open()
                    }
                    Action { property string __felgo_live_id_element: "FELGO_ID_37726_529";
                        text: "Help"
                        onTriggered: help()
                    }
                }
            }
        }
    }

    StackView { property string __felgo_live_id_element: "FELGO_ID_37726_530";
        id: stackView
        anchors.fill: parent

        initialItem: Pane { property string __felgo_live_id_element: "FELGO_ID_37726_531";
            id: pane
            MouseArea{ property string __felgo_live_id_element: "FELGO_ID_37726_532";
                anchors.fill: parent
                onClicked:{
                    if(mainRect.visible){
                        mainRect.visible = false
                        mainRectFade.visible = false
                    }
                }
            }
            Image{ property string __felgo_live_id_element: "FELGO_ID_37726_533";
                z:-1
                id: backgroundImage
                opacity: 0.4
                anchors.fill: parent
                source: "file:///Users/arjun/Documents/CompetitiveBall/images/homeBackground.png"
            }
            Text{ property string __felgo_live_id_element: "FELGO_ID_37726_534";
                x:528
                y:547
                text: "PB: " +Extra.personalBest;
                font.pointSize: 12
                font.bold: true
                font.family: "Helventica"
            }
            //coin thing in corner
            Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_535";
                id:coinThing
                Row{ property string __felgo_live_id_element: "FELGO_ID_37726_536";
                    spacing: 20;
                    x: 10
                    y:10
                    Image{ property string __felgo_live_id_element: "FELGO_ID_37726_537";
                        anchors.verticalCenter: parent.verticalCenter
                        width: 25
                        height: 25
                        source: "file:///Users/arjun/Documents/CompetitiveBall/images/coinFront.png"
                    }
                    Text{ property string __felgo_live_id_element: "FELGO_ID_37726_538";
                        anchors.verticalCenter: parent.verticalCenter
                        property int value: Extra.numCoins
                        text: value
                        font.family: "Stencil"
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize:15
                        Behavior on value { property string __felgo_live_id_element: "FELGO_ID_37726_539";
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37726_540"; duration: 1000; easing.type: Easing.InOutQuad}
                        }
                    }

                }
            }
            Label { property string __felgo_live_id_element: "FELGO_ID_37726_541";
                text: "Shoot some hoops!"
                font.family:"Impact"
                font.pointSize: 45
                width: 450
                wrapMode: Label.Wrap
                y:90
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Label.AlignHCenter
            }
            Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_542";
                y: parent.width/2
                anchors.horizontalCenter: parent.horizontalCenter
                id: buttonToPlayGame
                width: 320
                height: 100
                border.color: "red"
                border.width: 7
                color: "#5db0f5"
                Component.onCompleted: {
                    switchToGreenTimer.start()
                }
                Text{ property string __felgo_live_id_element: "FELGO_ID_37726_543";
                    text: "START"
                    font.family: "Tahoma"
                    font.bold: true
                    style: Text.Raised
                    font.pointSize: 31
                    anchors.centerIn: parent
                }
                radius: 50
                Timer{ property string __felgo_live_id_element: "FELGO_ID_37726_544";
                    id: switchToBlueTimer
                    interval: 500
                    onTriggered: {
                        buttonToPlayGame.border.color="#3074c7" //blue
                        switchToRedTimer.start()
                    }
                }
                Timer{ property string __felgo_live_id_element: "FELGO_ID_37726_545";
                    id: switchToGreenTimer
                    interval: 600
                    onTriggered: {
                        buttonToPlayGame.border.color="#58b853"  //green
                        switchToBlueTimer.start()
                    }
                }
                Timer{ property string __felgo_live_id_element: "FELGO_ID_37726_546";
                    id: switchToRedTimer
                    interval: 500
                    onTriggered: {
                        buttonToPlayGame.border.color="#cc3f3f"  //red
                        switchToGreenTimer.restart()
                    }
                }

                MouseArea{ property string __felgo_live_id_element: "FELGO_ID_37726_547";
                    anchors.fill: parent
                    onClicked: {
                        //store for settings
                        //update model
                        var datamodel = []
                        for (let i = 0; i < mMissionModel.count; ++i) datamodel.push(mMissionModel.get(i))
                        Extra.datastore = JSON.stringify(datamodel)
                        //update current missions (just double checking)
                        setCurrentMissions()

                        mainRect.visible = false;
                        mainRectFade.visible = false;
                        stackView.push("qrc:/CompetitiveMode.qml");
                        Extra.endingPage="qrc:/CompetitiveMode.qml";
                        thisTitle="Game Mode"
                    }
                }
            }
            Column{ property string __felgo_live_id_element: "FELGO_ID_37726_548";
                y: 200
                x:20
                spacing: 50
                Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_549";
                    color: "transparent"
                    width: 75
                    height: 75
                    radius: 50
                    border.width: 2
                    border.color: "black"
                    Image{ property string __felgo_live_id_element: "FELGO_ID_37726_550";
                        z:-1
                        anchors.centerIn: parent
                        width: 70
                        height: 70
                        source: "file:///Users/arjun/Documents/CompetitiveBall/images/shopIcon.png"
                    }
                    MouseArea{ property string __felgo_live_id_element: "FELGO_ID_37726_551";
                        anchors.fill: parent
                        onClicked: {
                            mainRect.visible = false;
                            mainRectFade.visible = false;
                            stackView.push("qrc:/GameStore.qml");
                            Extra.endingPage="qrc:/GameStore.qml";
                            thisTitle="The Store"
                        }
                    }
                }
                Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_552";
                    color: "transparent"
                    width: 75
                    height: 75
                    radius: 50
                    border.width: 2
                    border.color: "black"
                    Image{ property string __felgo_live_id_element: "FELGO_ID_37726_553";
                        z:-1
                        anchors.centerIn: parent
                        width: 70
                        height: 70
                        source: "file:///Users/arjun/Documents/CompetitiveBall/images/bouncingBallIcon.png"
                    }
                    MouseArea{ property string __felgo_live_id_element: "FELGO_ID_37726_554";
                        anchors.fill: parent
                        onClicked: {
                            mainRect.visible = false;
                            mainRectFade.visible = false;
                            stackView.push("qrc:/CustomizationMode.qml");
                            Extra.endingPage="qrc:/CustomizationMode.qml";
                            thisTitle="Customization Mode"
                            root.width = 1200
                            root.height= 580
                        }
                    }
                }
                Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_555";
                    color: "transparent"
                    width: 75
                    height: 75
                    radius: 50
                    border.width: 2
                    border.color: "black"
                    Image{ property string __felgo_live_id_element: "FELGO_ID_37726_556";
                        x: 5
                        y:5
                        width: 20
                        height: 20
                        source: "file:///Users/arjun/Documents/CompetitiveBall/images/exclamationMark.png"
                        visible: checkIfButtonNeedsToBeVisible(false)    //change this to something else
                    }

                    Image{ property string __felgo_live_id_element: "FELGO_ID_37726_557";
                        z:-1
                        anchors.centerIn: parent
                        width: 70
                        height: 70
                        source: "file:///Users/arjun/Documents/CompetitiveBall/images/missionsIcon.png"
                    }
                    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37726_558";
                        visible: thePauseTimer.running
                        z:-1
                        anchors.centerIn: parent
                        width: 70
                        height: 70
                        radius: 70
                        color:"darkgray"
                        opacity: 0.50
                    }

                    MouseArea{ property string __felgo_live_id_element: "FELGO_ID_37726_559";
                        anchors.fill: parent
                        onClicked: {
                            if(!thePauseTimer.running){
                                mainRect.visible = true;
                                mainRectFade.visible = true;
                                checkIfButtonNeedsToBeVisible(true);
                                if(true){
                                    //12
                                    let couldTheMissionBeCompleted = 0;
                                    for(let i =0; i< 3; i++){
                                        if(presentMissions[i]!==12){
                                            if ((mMissionModel.get(presentMissions[i]).currentThings>=mMissionModel.get(presentMissions[i]).neededThings)){
                                                couldTheMissionBeCompleted++;
                                            }
                                            return true;
                                        }
                                    }
                                    if(couldTheMissionBeCompleted===2&&checkIfCurrentMission(12)){
                                        mMissionModel.get(12).currentThings++
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Image { property string __felgo_live_id_element: "FELGO_ID_37726_560";
                id: arrow
                source: "file:///Users/arjun/Documents/CompetitiveBall/images/arrow1.png"
                width: 90
                height: 50
                rotation: 90
                y: 10;
                x: root.width-width+10
            }
        }
    }
    Item{ property string __felgo_live_id_element: "FELGO_ID_37726_561";
        id: clicker
        anchors.fill: parent
        focus: true
        Keys.onDigit5Pressed: {
            if(event.modifiers===Qt.ControlModifier){
                verification.visible=true;
            }
        }
    }
    TextField{ property string __felgo_live_id_element: "FELGO_ID_37726_562";
        z:5
        color: "white"
        id: verification
        placeholderText:"Enter the code"
        visible: false;
        width: 200
        height: 50
        onEditingFinished:{
            if(text==="4895"){
                Extra.numCoins+=4;
                text=""
            }
            visible = false;
            clicker.focus=true;
        }
    }
    Settings{ property string __felgo_live_id_element: "FELGO_ID_37726_563";
        category: "windows"
        property alias x: root.x
        property alias y: root.y
    }
    Settings{ property string __felgo_live_id_element: "FELGO_ID_37726_564";
        category: "missions"
    }
}
