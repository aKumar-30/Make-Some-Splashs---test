import Lebron 1.0
import QtQml.Models 2.2
import Felgo 3.0
import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Universal 2.12
import Qt.labs.settings 1.0
import QtQuick.Controls 2.12
import QtMultimedia 5.8

////New VERSION STARTS HERE
GameWindow {
    Item{
        focus: true
        Keys.onPressed:{
            if(event.key===Qt.Key_Space){
                if(Extra.endingPage==="CompetitiveMode.qml"){
                    Extra.emittingSpaceInCompSignal();
                }
                else if(Extra.endingPage==="CustomizationMode.qml"){
                    Extra.emittingSpaceInCustSignal();
                }
            }
        }
    }
    visible: true
    //    width: 708
    //    height: 785
    property var p: false
    property var thisTitle: "Shoot some hoops!"
    property var mArray:[]
    property var firstTime5: true;
    property var currentMissionRewards: 0;
    property var arr: []
    property var presentMissions: [];

    property bool shouldBeginThirdLevel: false
    id: root
    //        width: 708
    //        height: 785
    Audio{
        id: mMusic1
        source:"file:///Users/arjun/Documents/FelgoCompetitiveBallTryOne/images/mMusic1.wav"
        loops:Audio.Infinite
        volume: Extra.volume*4/5
    }
    Component.onDestruction: {
        mMusic1.stop()
        storeForSettings();

        var datamodel = []
        for (let i = 0; i < mMissionModel.count; ++i) datamodel.push(mMissionModel.get(i))
        Extra.datastore = JSON.stringify(datamodel)

                s_manager.writeSettings("volume0100", Extra.volume);
                s_manager.writeSettings("sound0100",Extra.sound);
                s_manager.writeSettings("numCoins21", Extra.numCoins);
                s_manager.writeSettings("ballSource", Extra.ballSource);
                s_manager.writeSettings("personalBest555",Extra.personalBest);
                console.log("saving to settings tge datastore   "+mMissionModel.get(presentMissions[1]).completed);
                s_manager.writeSettings("lukagamewinner22222",Extra.datastore);
                //convert array to string
                setCurrentMissions()
                s_manager.writeSettings("walkerfinals2222",Extra.myMissionsRn);
                console.log("While being destroyed in main.qml, the Extra.myMissionsRn is : "+Extra.myMissionsRn)
    }
        SettingsManager{
            id: s_manager
        }
        //may no longer be used
        Connections{
            target: Extra;
            function onSomethingCompetitiveChanged(){
                navigationStack.pop()
                //starting timer
                thePauseTimer.start()
            }
            function onGoBackFromHalftime(points1){
                navigationStack.pop()
                Extra.points+=points1
            }
            function onGoToHalftime(){
                console.log("should go to halftime now")
                navigationStack.push(halftimeModeComponent)
            }
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
    Timer{
        interval: 1001
        id: delayTimer
    }
    Connections{
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
    //---------------------------------------------------------------------------------------------------------------------------------------------------
    Dialog {
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
        Label {
            id: title
            height: 35
            Text{
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
        Flickable{
            id: howToPlayFlickable
            y: title.y+title.width+50
            width: aboutDialog.width-25
            height: aboutDialog.height-title.width-90
            contentHeight: parent.height*2
            contentWidth: aboutColumn.width
            flickableDirection: Flickable.VerticalFlick
            clip: true
            Column {
                id: aboutColumn
                spacing: 20
                anchors.fill:parent
                Label {
                    width: aboutDialog.availableWidth
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                        font.underline: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 23
                        text: "The Game"
                    }
                }
                Label {
                    width: aboutDialog.availableWidth
                    Text{
                        font.bold: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 19
                        text: "Level 1"
                    }
                }
                Label {
                    width: aboutDialog.availableWidth
                    text: "    Click near the slider to get the ball to shoot towards the basketball. The closer the slider is to the green the better the shot. If the ball misses three times in a row, you lose. Be careful, the slider moves faster as you go!"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
                Label {
                    width: aboutDialog.availableWidth
                    Text{
                        font.bold: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 19
                        text: "Level 2"
                    }
                }
                Label {
                    width: aboutDialog.availableWidth
                    text: "    Click near the slider to get the ball to shoot towards the basketball. The closer the slider is to the green the better the shot. If the ball misses three times in a row, you lose. Be careful, the slider moves in different speeds and speed patterns as you go!"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
                Label {
                    width: aboutDialog.availableWidth
                    Text{
                        font.bold: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 19
                        text: "Halftime"
                    }
                }
                Label {
                    width: aboutDialog.availableWidth
                    text: "    Time to have some fun! Try to click on as many balls as you can as they fall. The more balls you click the more bonus points you earn"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
                Label {
                    width: aboutDialog.availableWidth
                    Text{
                        font.bold: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 19
                        text: "Level 3"
                    }
                }
                Label {
                    width: aboutDialog.availableWidth
                    text: "    Try to click on the green part of the slider. The closer you are to a geen color (green then yellow then orange then red) the better the shot! If the ball misses three times in a row, you lose. Be careful, it switches faster as you go!"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
                Label {
                    width: aboutDialog.availableWidth
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                        font.underline: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 23
                        text: "Coins"
                    }
                }
                Label {
                    width: aboutDialog.availableWidth
                    text: "    Earn coins by completing daily missions, watching ads, or playing the game (randomly appearing)!"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
                Label {
                    width: aboutDialog.availableWidth
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                        font.underline: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 23
                        text: "Daily Missions"
                    }
                }
                Label {
                    width: aboutDialog.availableWidth
                    text: "    Complete tasks by playing to game to earn coins. There are 3 missions, which reset and change every day"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
                Label {
                    width: aboutDialog.availableWidth
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                        font.underline: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 23
                        text: "The Store"
                    }
                }
                Label {
                    width: aboutDialog.availableWidth
                    text: "    Use coins to purchase a new ball! These balls provide cool new looks for when you play. Wow!"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
                Label {
                    width: aboutDialog.availableWidth
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                        font.underline: true
                        wrapMode: Label.Wrap
                        font.pixelSize: 23
                        text: "Customization Mode"
                    }
                }
                Label {
                    width: aboutDialog.availableWidth
                    text: "    Bored of playing the game? Take a break in the customization mode where you can expirement with bouncing around different balls. How fun!"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    lineHeight: 1.45
                }
            }
            ScrollBar.vertical: ScrollBar{}
        }
    }
    function help() {
        let url = "https://nba.com/"
        Qt.openUrlExternally(url)
    }
    Settings {
        id: settings
        property string style: "Default"
    }
    property bool shouldExtraVolumeChange: true
    property bool shouldExtraSoundChange: true
    Dialog {

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
        contentItem: ColumnLayout {
            id: settingsColumn
            spacing: 20
            y:15
            Text{
                width: 200
                text: "Settings"
                font.family: "Bodoni MT Black"
                wrapMode: Label.Wrap
                font.pixelSize: 35
                font.bold:true;
                horizontalAlignment: "AlignHCenter"
            }
            RowLayout{
                spacing: 8
                IconButtonBarItem{
                    visible:true
                    color: "black"
                    id: musicVolumeIcon
                    icon: (Extra.volume<0.45)?((Extra.volume<0.02)?IconType.volumeoff:IconType.volumeoff):IconType.volumeup
                    iconSize: 30
                    Rectangle{
                        anchors.centerIn: parent
                        width: 30
                        height:width
                        color:"transparent"
                        MouseArea{
                            anchors.fill: parent
                            onClicked:{
                                musicVolumeIcon.icon=IconType.volumeoff
                                Extra.volume=0.0;
                                shouldExtraVolumeChange=false
                                volumeSlider.valueChanged();

                                //nobody knows why but do it twice
                                musicVolumeIcon.icon=IconType.volumeoff
                                Extra.volume=0.0;
                                shouldExtraVolumeChange=false
                                volumeSlider.valueChanged();
                            }
                        }
                    }
                }
                Label{
                    text: "Music:"
                    font.pointSize: 10
                    font.bold: true
                }
                Slider {
                    id: volumeSlider
                    from: 0
                    to: 1
                    onValueChanged: {
                        if(value<0.02){
                            if(!(musicVolumeIcon.icon===IconType.volumeoff)){
                                musicVolumeIcon.icon=IconType.volumeoff
                            }
                        }
                        else if(value<0.45){
                            if(!(musicVolumeIcon.icon===IconType.volumedown)){
                                musicVolumeIcon.icon=IconType.volumedown
                            }
                        }
                        else {
                            if(!(musicVolumeIcon.icon===IconType.volumeup)){
                                musicVolumeIcon.icon=IconType.volumeup
                            }
                        }
                        if(shouldExtraVolumeChange){
                            Extra.volume=volumeSlider.volume
                        }
                        else
                            shouldExtraVolumeChange=true
                    }
                    value: QtMultimedia.convertVolume(Extra.volume,QtMultimedia.LinearVolumeScale,QtMultimedia.LogarithmicVolumeScale);
                    property real volume: QtMultimedia.convertVolume(volumeSlider.value,
                                                                     QtMultimedia.LogarithmicVolumeScale, QtMultimedia.LinearVolumeScale)
                }
            }
            RowLayout{
                spacing: 8
                IconButtonBarItem{
                    visible:true
                    color: "black"
                    id: musicSoundIcon
                    icon: (Extra.sound<0.45)?((Extra.sound<0.02)?IconType.volumeoff:IconType.volumeoff):IconType.volumeup
                    iconSize: 30
                    Rectangle{
                        anchors.centerIn: parent
                        width: 30
                        height:width
                        color:"transparent"
                        MouseArea{
                            anchors.fill: parent
                            onClicked:{
                                musicSoundIcon.icon=IconType.volumeoff
                                Extra.sound=0.0;
                                shouldExtraSoundChange=false
                                soundSlider.valueChanged();

                                //nobody knows why but do it twice
                                musicSoundIcon.icon=IconType.volumeoff
                                Extra.sound=0.0;
                                shouldExtraSoundChange=false
                                soundSlider.valueChanged();
                            }
                        }
                    }
                }
                Label{
                    text: "Sound:"
                    font.pointSize: 10
                    font.bold: true
                }
                Slider {
                    id: soundSlider
                    from: 0
                    to: 1
                    onValueChanged: {
                        if(value<0.02){
                            if(!(musicSoundIcon.icon===IconType.volumeoff)){
                                musicSoundIcon.icon=IconType.volumeoff
                            }
                        }
                        else if(value<0.45){
                            if(!(musicSoundIcon.icon===IconType.volumedown)){
                                musicSoundIcon.icon=IconType.volumedown
                            }
                        }
                        else {
                            if(!(musicSoundIcon.icon===IconType.volumeup)){
                                musicSoundIcon.icon=IconType.volumeup
                            }
                        }
                        if(shouldExtraSoundChange){
                            Extra.sound=soundSlider.sound
                        }
                        else
                            shouldExtraSoundChange=true
                    }
                    value: QtMultimedia.convertVolume(Extra.sound,QtMultimedia.LinearVolumeScale,QtMultimedia.LogarithmicVolumeScale);
                    property real sound: QtMultimedia.convertVolume(soundSlider.value,
                                                                    QtMultimedia.LogarithmicVolumeScale, QtMultimedia.LinearVolumeScale)
                }
            }
            RowLayout {
                spacing: 10
                Label {
                    text: "Style:"
                }
                ComboBox {
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

            Label {
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
    Shortcut {
        sequences: ["Esc", "Back"]
        enabled: stackView.depth > 1
        onActivated: navigateBackAction.trigger()
    }
    Shortcut {
        sequence: StandardKey.HelpContents
        onActivated: help()
    }
    Shortcut {
        sequence: "Menu"
        onActivated: optionsMenuAction.trigger()
    }

    //        Action {
    //            id: navigateBackAction
    //            icon.name: stackView.depth > 1 ? "back" : ""
    //            icon.source: stackView.depth > 1? "file:///Users/arjun/Documents/FelgoCompetitiveBallTryOne/icons/splashs/back.png":""
    //            onTriggered: {
    //                if (stackView.depth > 1) {
    //                    //Give them a reset warning
    //                    if(root.width!=708){
    //                        root.width = 708;
    //                        root.height = 785;
    //                    }

    //                    if(Extra.endingPage==="CompetitiveMode.qml"){
    //                        warningDialog.open();
    //                    }
    //                    else{
    //                        stackView.pop()
    //                        thisTitle = "Shoot some hoops!"
    //                    }
    //                }
    //            }
    //        }
    Timer{
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
    Dialog {
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
            navigationStack.pop()
            warningDialog.close()
            thisTitle = "Shoot some hoops!"
            //starting timer
            thePauseTimer.start()
        }
        onRejected: {
            warningDialog.close()
        }

        contentItem: ColumnLayout {
            id: warningColumn
            spacing: 20

            RowLayout {
                spacing: 10

                Label {
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

    StackView {
        id: stackView
        anchors.fill: parent
    }
    Item{
        id: clicker
        anchors.fill: parent
        focus: true
        Keys.onDigit5Pressed: {
            if(event.modifiers===Qt.ControlModifier){
                verification.visible=true;
            }
        }
    }
    TextField{
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
    Settings{
        category: "windows"
        property alias x: root.x
        property alias y: root.y
    }
    Settings{
        category: "missions"
    }
    //    }

    //cool kids style with the navigation toolBar
    Scene{
        width: 708
        height: 785
        NavigationStack{
            id: navigationStack
            navigationBar.backButtonVisible: false
            //            navigationBar.onBackButtonItemPressedChanged: {
            //                if (navigationStack.depth > 1) {
            //                    //Give them a reset warning
            //                    if(root.width!=708){
            //                        root.width = 708;
            //                        root.height = 785;
            //                    }
            //                    Extra.endingPage==="CompetitiveMode.qml"

            //                    if(Extra.endingPage==="CompetitiveMode.qml"){
            //                        warningDialog.open();
            //                    }
            //                }
            //            }
            navigationBar.leftBarItem: IconButtonBarItem{
                visible:  navigationStack.depth>1
                icon: IconType.arrowleft
                color: "white"
                onClicked: {
                    //Give them a reset warning
                    if(Extra.endingPage==="CompetitiveMode.qml"){
                        warningDialog.open();
                    }
                    else
                        navigationStack.pop()
                }
            }
            navigationBar.titleItem: Text{
                anchors.horizontalCenter: parent.horizontalCenter
y:10
                anchors.horizontalCenterOffset: 200
                font.pointSize: 15
                font.bold: true
                text:navigationStack.currentPage.title
                font.family: "Microsoft YaHei Light"
                color: "white"
            }

            navigationBar.rightBarItem:
                IconButtonBarItem{
                color: "white"
                icon: IconType.ellipsisv
                onClicked: {
                    optionsMenu.open()
                }
                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight

                    Action {
                        text: "Settings"
                        onTriggered: settingsDialog.open()
                    }
                    Action {
                        text: "How to play?"
                        onTriggered: aboutDialog.open()
                    }
                    Action {
                        text: "Help"
                        onTriggered: help()
                    }
                }
            }
            initialPage:Page {
                title: "Shoot some hoops"
                y: navigationStack.navigationBar.height
                width: parent.width
                height: parent.height
                id: pane
                //MISSSIONS START HERE+++++++++++++++++++++++++++++++++++
                Rectangle {
                    visible:false
                    z:17
                    id: mainRect
                    width: parent.width*2/3
                    height: parent.width*4/5
                    anchors.centerIn: parent
                    border.color:"#2e8ddb"
                    border.width:3
                    Rectangle{
                        anchors.top: parent.top
                        id: header
                        width: parent.width
                        height: 60
                        color: "#2e8ddb"
                        Text{
                            anchors.fill: parent
                            color: "#ffffff"
                            font.bold: true
                            horizontalAlignment: Text.AlignHCenter
                            font.pointSize: 28
                            text: "Missions"
                            font.family: "Complex"
                        }
                    }
                    Rectangle{
                        id: headerFade
                        width: parent.width
                        anchors.top:header.bottom
                        height: 8
                        color: "#18549e"
                    }
                    Text{
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
                    ListModel{
                        id: mMissionModel
                        ListElement{//0
                            index: 0
                            completed: false;
                            description: "Splash 3 times in a row. Record: "
                            multipleTimes: true
                            reward: 2;
                            neededThings: 3
                            currentThings: 0
                        }
                        ListElement{//1
                            index: 1
                            completed: false;
                            description: "Splash 6 times in a row. Record: "
                            multipleTimes: true
                            reward: 4;
                            neededThings: 6
                            currentThings: 0
                        }
                        ListElement{//2
                            index: 2
                            completed: false;
                            description: "Splash 11 times in a row. Record: "
                            multipleTimes: true
                            reward: 12;
                            neededThings: 11
                            currentThings: 0
                        }
                        ListElement{//3
                            index: 3
                            completed: false;
                            description: "Miss at the backboard two consecutive time. Record: "
                            multipleTimes: true
                            reward: 2;
                            neededThings: 2
                            currentThings: 0
                        }
                        ListElement{//4
                            index: 4
                            completed: false;
                            description: "Make at the rim 6 times in a row in level 3. Record:"
                            multipleTimes: true
                            reward: 6;
                            neededThings: 6
                            currentThings: 0
                        }
                        ListElement{//5
                            index: 5
                            completed: false;
                            description: "Make at the backboard 9 times in a row in level 2. Record:"
                            multipleTimes: true
                            reward: 23;
                            neededThings: 9
                            currentThings: 0
                        }
                        ListElement{//6
                            index: 6
                            completed: false;
                            description: "Splash the ball 8 times in a row during level 3. Record:"
                            multipleTimes: true
                            reward: 7;
                            neededThings: 8
                            currentThings: 0
                        }
                        ListElement{//7
                            index: 7
                            completed: false;
                            description: "Make all the shots in level 1. Record"
                            multipleTimes: true
                            reward: 9;
                            neededThings: 21
                            currentThings: 0
                        }
                        ListElement{//8
                            index: 8
                            completed: false;
                            description: "Make all the shots in level 2. Record"
                            multipleTimes: true
                            reward: 23;
                            neededThings: 21
                            currentThings: 0
                        }
                        ListElement{//9
                            index: 9
                            completed: false
                            description: "Miss two consecutively at the rim in level 3. Record:"
                            multipleTimes: true
                            reward: 4;
                            neededThings: 2
                            currentThings: 0
                        }
                        ListElement{//10
                            index: 10
                            completed: false;
                            description: "Get exactly 4 coins in a game in a twice"
                            multipleTimes: true
                            reward: 4;
                            neededThings: 2
                            currentThings: 0
                        }
                        ListElement{//11
                            index: 11
                            completed: false;
                            description: "Advance to level 3 while earning zero coins in the match"
                            multipleTimes: true
                            reward: 14;
                            neededThings: 1
                            currentThings: 0
                        }
                        ListElement{//12
                            index: 12
                            completed: false;
                            description: "Complete the other two challenges."
                            multipleTimes: true
                            reward: 4;
                            neededThings: 2
                            currentThings: 0
                        }
                        ListElement{//13
                            index: 13
                            completed: false;
                            description: "Make at the backboard four consecutive times. Record: "
                            multipleTimes: true
                            reward: 4;
                            neededThings: 4
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

                        Rectangle{
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: mainRect.width-25
                            height: width*1/4+16
                            Rectangle{
                                visible: (completed)
                                width: mainRect.width-25
                                height: width*1/4+16
                                anchors.horizontalCenter: parent.horizontalCenter
                                color: "white"
                                border.width: 10
                                border.color: "#7ae868"
                                Text{
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
                            Rectangle{
                                visible: !completed
                                width: mainRect.width-25
                                height: width*1/4+16
                                anchors.horizontalCenter: parent.horizontalCenter
                                color: "transparent"
                                Rectangle{
                                    id: mainDelegateRect
                                    width: parent.width
                                    height: parent.height-12
                                    anchors.verticalCenter: parent.verticalCenter
                                    color: (currentThings>=neededThings)?"#7ae868":"#2e8ddb"
                                    Column{
                                        x:16
                                        y:10
                                        spacing: 12;
                                        width: parent.width
                                        Text{
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
                                        Row{
                                            spacing:2
                                            //progress bar
                                            ProgressBar {
                                                id: thingsLeft
                                                value: currentThings/neededThings
                                                padding: 2
                                                Text{
                                                    z:3
                                                    anchors.centerIn: parent
                                                    color: "white"
                                                    font.family: "Swis721 Cn BT"
                                                    font.bold: true
                                                    font.pointSize: 14
                                                    text:(currentThings>=neededThings)?(neededThings+"/"+neededThings):(currentThings+"/"+neededThings)
                                                }
                                                background: Rectangle {
                                                    implicitWidth: theText.width
                                                    implicitHeight: 32
                                                    color: "#000000"
                                                    radius: 2
                                                }
                                                contentItem: Item {
                                                    implicitWidth: theText.width
                                                    implicitHeight: 26
                                                    Rectangle {
                                                        width: thingsLeft.visualPosition * parent.width
                                                        height: parent.height
                                                        radius: 2
                                                        color: "#06bf0c"
                                                    }
                                                }
                                            }
                                            //filler space
                                            Rectangle{
                                                width: 35
                                                height: 2
                                                color: "transparent"
                                            }
                                            //reward
                                            Text{
                                                anchors.verticalCenter: parent.verticalCenter
                                                color: "black"
                                                font.family: "Swis721 Cn BT"
                                                font.bold: true
                                                font.pointSize: 18
                                                text:reward
                                            }
                                            //coin pic
                                            Image{
                                                anchors.verticalCenter: parent.verticalCenter
                                                width: 35
                                                height: 35
                                                source: "file:///Users/arjun/Documents/FelgoCompetitiveBallTryOne/images/coinFront.png"
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    ListView {
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
                    DelegateModel {
                        id: displayDelegateModel
                        delegate:  mMissionDelegate
                        model: mMissionModel
                        groups: [
                            DelegateModelGroup   {
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
                    //get rewards button
                    Button{
                        onClicked: {
                            if(visible){
                                Extra.numCoins+= currentMissionRewards;
                                //remove delegates for completed missions
                                let j =0;
                                for(let i =displayDelegateModel.items.count-3; i< displayDelegateModel.items.count;i++){
                                    if(displayDelegateModel.items.get(i).model.currentThings>=displayDelegateModel.items.get(i).model.neededThings){
                                        displayDelegateModel.items.get(i).model.completed=true;
                                        mMissionModel.get(presentMissions[j]).completed=true
                                        console.log("completed updated");
                                        console.log("Is completed "+ "THis: "+(presentMissions[j])+ "and the result : "+ mMissionModel.get(presentMissions[j]).completed);
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
                        Rectangle{
                            anchors.fill: parent
                            color: "#40ad36"

                        }
                        Row{
                            x:10
                            anchors.verticalCenter: parent.verticalCenter
                            Text{
                                anchors.verticalCenter: parent.verticalCenter
                                color: "black"
                                font.family: "Swis721 Cn BT"
                                font.bold: true
                                font.pointSize: 18
                                text:"Get"
                            }
                            Rectangle{
                                width: 15
                                height: 2
                                color: "transparent"
                            }

                            //text
                            Text{
                                anchors.verticalCenter: parent.verticalCenter
                                color: "black"
                                font.family: "Swis721 Cn BT"
                                font.bold: true
                                font.pointSize: 18
                                text: currentMissionRewards
                            }
                            //coin pic
                            Image{
                                anchors.verticalCenter: parent.verticalCenter
                                width: 35
                                height: 35
                                source: "file:///Users/arjun/Documents/FelgoCompetitiveBallTryOne/images/coinFront.png"
                            }
                        }
                    }
                    Rectangle{
                        visible: currentMissionRewards!=0;
                        id: getRewardsButtonFade
                        width: getRewardsButton.width
                        height: getRewardsButton.height
                        y: getRewardsButton.y+5
                        x: getRewardsButton.x-5
                        color: "#188509"
                    }

                    //ADS FOR THE MONEY MONEY MONEY
                    Button{
                        //these are the rewarded ad stuff IGNORE ERRORS FOR NOW
                        //                        AdMobRewardedVideo {
                        //                            id: myRewardedVideo
                        //                            // test ad for rewarded videos
                        //                            adUnitId: "ca-app-pub-3940256099942544/5224354917"

                        //                            onRewardedVideoRewarded: {
                        //                                updateMissions();
                        //                            }
                        //                            // load rewarded video at app start to cache it
                        //                            Component.onCompleted: {
                        //                                loadRewardedVideo()
                        //                            }
                        //                        }
                        onClicked: {
                            if(visible){
                                // show the new video if user is below 10 credits
                                myRewardedVideo.showRewardedVideoIfLoaded()
                                // load a new video every time it got shown, to give the user a fresh ad
                                myRewardedVideo.loadRewardedVideo()
                            }
                        }
                        visible: !getRewardsButton.visible;
                        z: 19
                        id: newMissionsAdButton
                        anchors.top: listOfMissions.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 55
                        width: 140*3
                        Rectangle{
                            anchors.fill: parent
                            color: "#2e8ddb"
                        }
                        Row{
                            x:10
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.centerIn: parent
                            Text{
                                anchors.verticalCenter: parent.verticalCenter
                                color: "White"
                                font.family: "Swis721 Cn BT"
                                font.bold: true
                                font.pointSize: 25
                                text:"New Missions"
                            }
                            Rectangle{
                                width: 15
                                height: 2
                                color: "transparent"
                            }
                            //video pic
                            Image{
                                anchors.verticalCenter: parent.verticalCenter
                                width: 50*1.2
                                height: 35*1.2
                                source: "file:///Users/arjun/Documents/FelgoCompetitiveBallTryOne/images/PlayAdVideo.png"
                            }
                        }
                    }
                    Rectangle{
                        visible: newMissionsAdButton.visible;
                        id: newMissionsAdButtonFade
                        width: newMissionsAdButton.width
                        height: newMissionsAdButton.height
                        y: newMissionsAdButton.y+5
                        x: newMissionsAdButton.x-5
                        color: "#18549e"
                    }
                }
                Rectangle{
                    visible:false;
                    z:16
                    id: mainRectFade
                    x: mainRect.x-10
                    y: mainRect.y+17
                    width: mainRect.width
                    height:mainRect.height
                    color: "#18549e"
                }
                //MISSIOSN ENDS HERE_________________________________
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        if(mainRect.visible){
                            mainRect.visible = false
                            mainRectFade.visible = false
                        }
                    }
                }
                Image{
                    z:-1
                    id: backgroundImage
                    opacity: 0.4
                    anchors.fill: parent
                    source: "file:///Users/arjun/Documents/FelgoCompetitiveBallTryOne/images/homeBackground.png"
                }
                Text{
                    x:528
                    y:547
                    text: "PB: " +Extra.personalBest;
                    font.pointSize: 12
                    font.bold: true
                    font.family: "Helventica"
                }
                //coin thing in corner
                Rectangle{
                    id:coinThing
                    Row{
                        spacing: 20;
                        x: 10
                        y:10
                        Image{
                            anchors.verticalCenter: parent.verticalCenter
                            width: 25
                            height: 25
                            source: "file:///Users/arjun/Documents/FelgoCompetitiveBallTryOne/images/coinFront.png"
                        }
                        Text{
                            anchors.verticalCenter: parent.verticalCenter
                            property int value: Extra.numCoins
                            text: value
                            font.family: "Stencil"
                            horizontalAlignment: Text.AlignHCenter
                            font.pointSize:15
                            Behavior on value {
                                NumberAnimation { duration: 1000; easing.type: Easing.InOutQuad}
                            }
                        }

                    }
                }
                Label {
                    text: "Shoot some hoops!"
                    font.family:"Impact"
                    font.pointSize: 45
                    width: 450
                    wrapMode: Label.Wrap
                    y:90
                    anchors.horizontalCenter: parent.horizontalCenter
                    horizontalAlignment: Label.AlignHCenter
                }
                Rectangle{
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
                    Text{
                        text: "START"
                        font.family: "Tahoma"
                        font.bold: true
                        style: Text.Raised
                        font.pointSize: 31
                        anchors.centerIn: parent
                    }
                    radius: 50
                    Timer{
                        id: switchToBlueTimer
                        interval: 500
                        onTriggered: {
                            buttonToPlayGame.border.color="#3074c7" //blue
                            switchToRedTimer.start()
                        }
                    }
                    Timer{
                        id: switchToGreenTimer
                        interval: 600
                        onTriggered: {
                            buttonToPlayGame.border.color="#58b853"  //green
                            switchToBlueTimer.start()
                        }
                    }
                    Timer{
                        id: switchToRedTimer
                        interval: 500
                        onTriggered: {
                            buttonToPlayGame.border.color="#cc3f3f"  //red
                            switchToGreenTimer.restart()
                        }
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(!mainRect.visible){
                                //store for settings
                                //update model
                                var datamodel = []
                                for (let i = 0; i < mMissionModel.count; ++i) datamodel.push(mMissionModel.get(i))
                                Extra.datastore = JSON.stringify(datamodel)
                                //update current missions (just double checking)
                                setCurrentMissions()

                                mainRect.visible = false;
                                mainRectFade.visible = false;
                                //                            stackView.push("CompetitiveMode.qml");
                                navigationStack.push(competitiveModeComponent)
                                Extra.endingPage="CompetitiveMode.qml";
                                thisTitle="Game Mode"
                            }
                        }
                    }
                }
                Column{
                    y: 200
                    x:20
                    spacing: 50
                    Rectangle{
                        color: "transparent"
                        width: 75
                        height: 75
                        radius: 50
                        border.width: 2
                        border.color: "black"
                        Image{
                            z:-1
                            anchors.centerIn: parent
                            width: 70
                            height: 70
                            source: "file:///Users/arjun/Documents/FelgoCompetitiveBallTryOne/images/shopIcon.png"
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                mainRect.visible = false;
                                mainRectFade.visible = false;
                                //                            stackView.push("GameStore.qml");
                                navigationStack.push(gameStoreComponent);
                                Extra.endingPage="GameStore.qml";
                                thisTitle="The Store"
                            }
                        }
                    }
                    Rectangle{
                        color: "transparent"
                        width: 75
                        height: 75
                        radius: 50
                        border.width: 2
                        border.color: "black"
                        Image{
                            z:-1
                            anchors.centerIn: parent
                            width: 70
                            height: 70
                            source: "file:///Users/arjun/Documents/FelgoCompetitiveBallTryOne/images/bouncingBallIcon.png"
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                mainRect.visible = false;
                                mainRectFade.visible = false;
                                //                            stackView.push("CustomizationMode.qml");
                                navigationStack.push(customizationModeComponent);
                                Extra.endingPage="CustomizationMode.qml";
                                thisTitle="Customization Mode"
                                root.width = 1200
                                root.height= 580
                            }
                        }
                    }
                    Rectangle{
                        color: "transparent"
                        width: 75
                        height: 75
                        radius: 50
                        border.width: 2
                        border.color: "black"
                        Image{
                            x: 5
                            y:5
                            width: 20
                            height: 20
                            source: "file:///Users/arjun/Documents/FelgoCompetitiveBallTryOne/images/exclamationMark.png"
                            visible: checkIfButtonNeedsToBeVisible(false)    //change this to something else
                        }

                        Image{
                            z:-1
                            anchors.centerIn: parent
                            width: 70
                            height: 70
                            source: "file:///Users/arjun/Documents/FelgoCompetitiveBallTryOne/images/missionsIcon.png"
                        }
                        Rectangle{
                            visible: thePauseTimer.running
                            z:-1
                            anchors.centerIn: parent
                            width: 70
                            height: 70
                            radius: 70
                            color:"darkgray"
                            opacity: 0.50
                        }

                        MouseArea{
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
                Image {
                    id: arrow
                    source: "file:///Users/arjun/Documents/FelgoCompetitiveBallTryOne/images/arrow1.png"
                    width: 90
                    height: 50
                    rotation: 90
                    y:navigationStack.height
                    x: root.width-width+10
                }
            }
        }
    }

    //    /*header: */ToolBar {
    //        id: toolBar
    //        Material.foreground: "mintcream"
    //        width: parent.width
    //        height: 60
    //        RowLayout {
    //            spacing: 20
    //            anchors.fill: parent

    //            ToolButton {
    //                visible: stackView.depth>1
    //                action: navigateBackAction
    //            }

    //            Label {
    //                id: titleLabel
    //                text: thisTitle.toString()
    //                font.pixelSize: 20
    //                elide: Label.ElideRight
    //                horizontalAlignment: Qt.AlignHCenter
    //                verticalAlignment: Qt.AlignVCenter
    //                Layout.fillWidth: true
    //            }
    //            ToolButton {
    //                action: optionsMenuAction

    //                Menu {
    //                    id: optionsMenu1
    //                    x: parent.width - width
    //                    transformOrigin: Menu.TopRight

    //                    Action {
    //                        text: "Settings"
    //                        onTriggered: settingsDialog.open()
    //                    }
    //                    Action {
    //                        text: "How to play?"
    //                        onTriggered: aboutDialog.open()
    //                    }
    //                    Action {
    //                        text: "Help"
    //                        onTriggered: help()
    //                    }
    //                }
    //            }
    //        }
    //    }
    Component{
        id: competitiveModeComponent
        CompetitiveMode{
        }
    }
    Component{
        id: gameStoreComponent
        GameStore{
        }
    }
    Component{
        id: customizationModeComponent
        CustomizationMode{
        }
    }
    Component{
        id: halftimeModeComponent
        HalftimeMode{
        }
    }
}

