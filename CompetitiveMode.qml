import QtQml.Models 2.2
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Universal 2.12
import Qt.labs.settings 1.0
import QtMultimedia 5.15
import Qt.labs.qmlmodels 1.0
import QtQuick.Dialogs 1.2
import otherArjun 1.0
import "test.js" as Global
Page { property string __felgo_live_id_component: "FELGO_COMPONENT_ID_37929"; property string __felgo_live_id_element: "FELGO_ID_37929_3";
    visible: true
    width: 708
    height: 785
    title:"Competitive Mode"
    property int duration: 1000
    id: root2
    property bool isNewColor: false
    property var gradientGround1: "#00FF00"
    property var gradientGround2: "#00803F"
    property bool whatToDoWhenClicked: false
    property int counterr1 : 0;
    property var mDuration: 1400
    property int points: 0;
    property var manyMisses : 0;
    property var manyMakes: 0;
    property var extraPoints: 0;
    property int level: 1;
    property int levelIndicator: 1
    property var sliderEasingType: Easing.Linear
    property var firstTime: true;
    property var levelIndicatorDown: (level!==3)?(22-levelIndicator):(50-levelIndicator)
    property var animationWhichIsRunning:1
    property var wasSecRunning: false;
    property var makingStreakColor: "red"
    property var colors: ["#cf3732","#db8d44","#e3d430","#29c910", "#e3d430", "#db8d44", "#cf3732"]
    property bool haveRandomlyChoosenIfCoinAppears: false;
    property int coinProb: 0;
    property int counterio: 0;
    property bool firstTime2: true
    property bool firstTime3: true
    property bool newRun: false;
    property var currentRandomOrder5: []
    property var currentIndexForRandom: 0;
    property var mIsOpen: Extra.isOpen
    property var coinsThisRound: 0
    property var presentMissions: []
    property int beforeHalftimeScore: 0;
    Connections{ property string __felgo_live_id_element: "FELGO_ID_37929_4";
        target: Extra
        function onGoBackFromHalftime(addedPoints){
            console.log("the CELTICS VITORY WILL BE GODLY")
            points+=addedPoints
            levelRectangleAnimation.start();
            seqAnimationId.pause()
        }
    }
    Component.onDestruction:{
        if(mMissionModel.count!==0 &&Extra.datastore){
            var datamodel = []
            for (let i = 0; i < mMissionModel.count; ++i) datamodel.push(mMissionModel.get(i))
            Extra.datastore = JSON.stringify(datamodel)
            console.log("From the COMPETITTIVE MODE:::"+Extra.datastore)
        }
    }
    Component.onCompleted: {
        if ( Extra.datastore) {
            mMissionModel.clear()
            var datamodel = JSON.parse(Extra.datastore)
            for (let i = 0; i < datamodel.length; ++i) mMissionModel.append(datamodel[i])
        }
        console.log("The Extra.myMissionsRn that compeittiveMode.qml got is "+Extra.myMissionsRn)
        getCurrentMissions()
    }
    //sound effects start here - coin clink
    Audio{ property string __felgo_live_id_element: "FELGO_ID_37929_5";
        id: coinClinkSoundEffect
        source:"file:///Users/arjun/Documents/CompetitiveBall/sounds/coinSound.mp3"
        volume: Extra.sound*1
    }

    //sound effects start here - mvp
    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_6";
        id: fadeIn
        target: mvpSoundEffect
        property: "volume"
        from:0.0
        to:0.8
        duration: 300
        easing.type: Easing.Linear
    }
    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_7";
        id: fadeOut
        target: mvpSoundEffect
        property: "volume"
        from:0.8
        to:0.001
        duration: 300
        easing.type: Easing.Linear
        onFinished:{
            mvpSoundEffect.stop()
            mvpSoundEffect.volume=0.0
        }
    }
    property bool mvpSoundEffectPlaying: false
    Audio{ property string __felgo_live_id_element: "FELGO_ID_37929_8";
        id: mvpSoundEffect
        source:"file:///Users/arjun/Documents/CompetitiveBall/sounds/mvpSoundEffect.mp3"
        loops:Audio.Infinite
        volume: 0.0
        playbackRate: 1.2
        onPlaying:{
            console.log("in here1")
            if(volume===0.0){
                console.log("in here")
                fadeIn.start();
                mvpSoundEffectPlaying= true
            }
            else{
                volume=0.0
            }
        }
    }
    //sound effects start here - fans cheering
    function whatToDoInsideRectangleMA(){
        if(!retryBox.visible){
            if(stateRectId.state=="notPaused" && level!==3){
                if(!seqAnimationId.running&&!pointingFinger.visible){
                    seqAnimationId.start();
                    whatToDoWhenClicked=true
                }
                else{
                    seqAnimationId.stop();
                    insideContainerId.sliderStopped(sliderId.value);
                }
            }
            pointingFinger.visible=false;
            firstTime2=false;
        }
    }
    function checkIfCurrentMission(num){
        console.log("i entered the thing")
        for(let i =0; i< 3; i++){
            if(presentMissions[i]===num){
                console.log("i returned true with " +num)
                return true;
            }
        }
        return false;
    }
    function getCurrentMissions(){
        let j =0;
        for(let i =0; i < 3; i++){
            var q = "";
            while(Extra.myMissionsRn[j]!==","){
                q+=Extra.myMissionsRn[j].toString();
                j++
            }
            j++;
            var g = parseInt(q)
            presentMissions.push(g)
        }
        console.log("THe current missions (local)after getting them in the compeittive mode is:"+presentMissions)
    }
    function setCurrentMissions(){
        Extra.myMissionsRn = presentMissions[0]+","+presentMissions[1]+","+presentMissions[2]+","
    }
    property var counter0: 0;
    property var counter1: 0;
    property var counter2: 0;
    property var counter3: 0;
    property var counter4: 0;
    property var counter5: 0;
    property var counter6: 0;
    property var counter7: 0;
    property var counter8: 0;
    property var counter9: 0;
    property var counter10: 0;
    property var counter11: 0;
    property var counter12: 0;
    property var counter13: 0;
    property var counter14: 0;
    ListModel{ property string __felgo_live_id_element: "FELGO_ID_37929_9";
        id:mMissionModel
    }
    onMIsOpenChanged:{
        if(Extra.isOpen===false)
            whatToDoWhenDoubleClicked()
        else{
            whatToDoWhenDoubleClicked()
        }
    }
    function newRandomColors3(){
        for(var i =0; i< 5; i++){
            let mArray = ["#cf3732","#cf3732","#db8d44","#db8d44","#e3d430","#e3d430","#29c910"]
            for(let i = mArray.length - 1; i > 0; i--){
                const j = Math.floor(Math.random() * i)
                const temp = mArray[i]
                mArray[i] = mArray[j]
                mArray[j] = temp
            }
            currentRandomOrder5.push(mArray);
        }
    }
    function figureOutShotWithColor(value){
        if(level!==3){
            return "null";
        }
        //red
        if(figureOutColor(value)==="#cf3732"){
            let random = Math.random()*3;
            if(random<=1)
                return "airball"
            else
                return "backboardMiss"
        }
        //orange
        else if(figureOutColor(value)==="#db8d44"){
            let random = Math.random()*7;
            if(random<=2)
                return "backboardMiss"
            else if(random<=6)
                return "rimMiss"
        }
        //yellow
        else if(figureOutColor(value)==="#e3d430"){
            let random = Math.random()*10;
            if(random<=5)
                return "backboardMake"
            else if(random<=9)
                return "rimMake"
        }
        //green
        else if(figureOutColor(value)==="#29c910"){
            let random = Math.random()*10;
            if(random<=1)
            {
                return "rimMake"
            }
            else if(random<=6)
            {
                return "splash"
            }
            else if(random<=9)
            {
                return "extraSplash"
            }
        }
    }
    function figureOutColor(value){
        if(value<142.9){
            return colors[0];
        }
        else if(value<285.8){
            return colors[1];
        }
        else if(value<428.7){
            return colors[2];
        }
        else if(value<571.5){
            return colors[3];
        }
        else if(value<714.4){
            return colors[4];
        }
        else if(value<857.2){
            return colors[5]
        }
        else{
            return colors[6]
        }
    }
    property var timerToCheck: [splashSoundEffectTimer, backboardMakeSoundEffectTimer, backboardMakeSoundEffectTimer2, backboardMissSoundEffectTimer,rimMissSoundEffectTimer,rimMissSoundEffectTimer2, rimMakeSoundEffectTimer, coinClinkSoundEffectForRimMakeTimer];
    property var theAudios: [mvpSoundEffect,/*fansSoundEffect,*/splashSoundEffect, backboardMakeSoundEffect, backboardMakeSoundEffect2, backboardMissSoundEffect, rimMakeSoundEffect, rimMissSoundEffect, rimMissSoundEffect2, coinClinkSoundEffect]
    property var timersToReplay:[];
    function whatToDoWhenDoubleClicked(){
        function pauseAllAnim()
        {
            animationWhichIsRunning=-1;
            wasSecRunning=false;
            if(levelRectangleAnimation.running){
                levelRectangleAnimation.pause();
                animationWhichIsRunning=levelRectangleAnimation
            }
            else if(airBallAnimation.running){
                airBallAnimation.pause()
                animationWhichIsRunning=airBallAnimation
            }
            else if(splashAnimation.running){
                splashAnimation.pause()
                animationWhichIsRunning=splashAnimation
            }
            else if(rimMakeAnimation.running){
                rimMakeAnimation.pause()
                animationWhichIsRunning=rimMakeAnimation
            }
            else if(rimMissAnimation.running){
                rimMissAnimation.pause()
                animationWhichIsRunning=rimMissAnimation
            }
            else if(backboardMissAnimation.running){
                backboardMissAnimation.pause();
                animationWhichIsRunning=backboardMissAnimation
            }
            else if(backboardAnimation.running){
                backboardAnimation.pause()
                animationWhichIsRunning=backboardAnimation
            }
            if(seqAnimationId.running){
                seqAnimationId.pause()
                wasSecRunning=true
            }
            //se
            timersToReplay=[]
            for (let q = 0; q< timerToCheck.length; q++){
                if(timerToCheck[q].running){
                    timerToCheck[q].pause();
                    timersToReplay.push(timerToCheck[q])
                }
            }
            for (let z = 0; z< theAudios.length; z++){
                if(theAudios[z].playbackState===Audio.PlayingState){
                    theAudios[z].pause();
                }
            }
        }
        function resumeAllAnim()
        {

            if(animationWhichIsRunning!=-1)
            {
                animationWhichIsRunning.resume()

            }
            if(wasSecRunning)
                seqAnimationId.resume()
            //            //se
            for (let q = 0; q< timersToReplay.length; q++){
                timersToReplay[q].start();
            }
            //se
            for (let z = 0; z< theAudios.length; z++){
                if(theAudios[z].playbackState===Audio.PausedState){
                    theAudios[z].play();
                }
            }

        }
        if(stateRectId.state==="notPaused")
        {
            stateRectId.state="paused"
            //mMusic1.play()
            pauseAllAnim();
        }
        else
        {
            if(!levelRectangleAnimationPause.running){
                stateRectId.state="notPaused"
                //mMusic1.play()
                resumeAllAnim();
            }
        }
    }
    //Pause button
    MouseArea{ property string __felgo_live_id_element: "FELGO_ID_37929_10";
        anchors.fill: parent
        onClicked: {
            if(levelRectangleAnimationPause.running)
            {
                levelRectangleAnimationPause.complete()
            }
            else if(levelRectangleAnimation.running){
                levelRectangleAnimation.complete()
                levelRectangleAnimationPause.complete()
            }
        }

        onDoubleClicked:{
            whatToDoWhenDoubleClicked();
        }
    }
    //Pause state rectangle
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37929_11";
        anchors.fill: parent
        id: pauseRectangle
        z: 100
        visible: true
        color: "#000000"
        opacity: 0.81
        anchors.centerIn: parent
        Image{ property string __felgo_live_id_element: "FELGO_ID_37929_12";
            width: 552*4/5
            height: 452*4/5
            anchors.centerIn: parent
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/pauseButton.png"
        }
    }
    function whatToDoWhenAnimFinished()
    {
        //variable declaration
        haveRandomlyChoosenIfCoinAppears = false;
        //this is the random prob for the coin
        //function for what to do when going to next level
        function whatToDoForNextLevel()
        {
            level++;
            levelIndicator=1;
            tally1.visible =false; tally2.visible =false; tally3.visible =false;
            tally4.visible =false; tally5.visible =false; tally6.visible =false;
            tally7.visible =false; tally3.visible =false; tally8.visible =false;
            tally9.visible =false; tally10.visible =false; plus11.visible=false;
            x1.visible=false;
            x2.visible=false;
            x3.visible=false;
            feedbackLabel.text=""
            flashingScoreText.color = "black"
            insideRectangleMouseArea.enabled = true; insideTheSliderRectangleMouseArea.enabled = true
            manyMakes=0;
            manyMisses=0;
            levelRectangleAnimation.start();
            seqAnimationId.pause()
        }
        //fix ball
        basketBall.width=115
        basketBall.height=115
        basketBall.y = root2.height-basketBall.height-50;
        basketBall.x=33;
        basketBall.rotation = 0

        //general check
        flashingScoreText.opacity=0;
        //Check if three misses- if game is over
        //If you lose it all...
        if(manyMisses==3)
        {
            if(seqAnimationId.running)
                seqAnimationId.pause()
            if(mPauseAnim.running)
                mPauseAnim.pause()
            sliderId.enabled=false;
            if(true){
                //7
                if(counter7>mMissionModel.get(7).currentThings&&!(mMissionModel.get(7).currentThings>=mMissionModel.get(7).neededThings)&&checkIfCurrentMission(7)){
                    mMissionModel.get(7).currentThings=counter7
                }
                counter7=0;
                //8
                if(counter8>mMissionModel.get(8).currentThings&&!(mMissionModel.get(8).currentThings>=mMissionModel.get(8).neededThings)&&checkIfCurrentMission(8)){
                    mMissionModel.get(8).currentThings=counter8
                }
                counter8=0;
                //10
                if(coinsThisRound===4){
                    if(!(mMissionModel.get(10).currentThings>=mMissionModel.get(10).neededThings)&&checkIfCurrentMission(10)){
                        mMissionModel.get(10).currentThings++
                    }
                }
                //
                if(coinsThisRound===0&&level===3){
                    if(!(mMissionModel.get(11).currentThings>=mMissionModel.get(10).neededThings)&&checkIfCurrentMission(11)){
                        mMissionModel.get(11).currentThings++
                    }
                }
            }
            if(true){
                //make all counters zero
                counter0= 0;
                counter1= 0;
                counter2= 0;
                counter3= 0;
                counter0= 0;
                counter0= 0;
                counter6= 0;
                counter7= 0;
                counter8= 0;
                counter9= 0;
                counter10= 0;
                counter11= 0;
                counter12= 0;
                counter13= 0;
                counter14= 0;
            }
            coinsThisRound=0;
            //Just resetting somethings
            flashingScoreText.color="black"
            insideRectangleMouseArea.enabled = true; insideTheSliderRectangleMouseArea.enabled = true
            if(points>Extra.personalBest)
            {
                Extra.personalBest=points;
            }
            points = 0;
            level= 1;
            levelIndicator=0;
            extraPoints=0;
            manyMisses=0;
            manyMakes = 0;
            mDuration=1200
            sliderEasingType = Easing.Linear


            retryBox.visible= true;
            fadedRED.visible=true;
            return;
            // mMusic1.stop()
        }
        //General thing to do if MAKE for AFTER THE ANIMATION IS FINISHED
        if(mvpSoundEffectPlaying){
            fadeOut.start();
            mvpSoundEffectPlaying=false
        }
        if(manyMakes>0){
            if(manyMakes>=10&&manyMakes%5===0){
                mvpSoundEffect.play()
            }
            if(flipable.visible){
                haveRandomlyChoosenIfCoinAppears=true;
                coinAnim.start()
            }
        }
        //Level one stuff
        if(level===1)
        {
            coinProb = 6;
            sliderId.value=100;
            mDuration-=42
            insideRectangleMouseArea.enabled = true; insideTheSliderRectangleMouseArea.enabled = true
            if(levelIndicator > 21)
            {
                whatToDoForNextLevel()
                mDuration=1300
                if(true){
                    //7
                    if(counter7===21&&!(mMissionModel.get(7).currentThings>=mMissionModel.get(7).neededThings)&&checkIfCurrentMission(7)){
                        mMissionModel.get(7).currentThings=21
                    }
                    if(counter7>mMissionModel.get(7).currentThings&&!(mMissionModel.get(7).currentThings>=mMissionModel.get(7).neededThings)&&checkIfCurrentMission(7)){
                        mMissionModel.get(7).currentThings=counter7
                    }
                    counter7=0;
                }
            }
            else{
                //have to have on all three, only restart thing if not going to next level
                if(stateRectId.state!="paused")
                    seqAnimationId.restart();
            }
        }
        //Level two stuff
        else if(level===2)
        {
            coinProb = 4;
            var options = [Easing.Linear, Easing.InQuad, Easing.OutQuad, Easing.InOutCubic, Easing.OutCubic, Easing.InQuart, Easing.OutQuart, Easing.OutQuint, Easing.InOutQuint, Easing.InSine, Easing.OutSine, Easing.InExpo, Easing.OutInExpo, Easing.OutCirc, Easing.OutInCirc, Easing.InOutElastic, Easing.OutElastic, Easing.OutBack, Easing.OutInBack, Easing.InBack, Easing.InBounce, Easing.OutBounce, Easing.InOutBounce, Easing.OutInBounce, Easing.BezierCurve]
            sliderEasingType=options[Math.floor((Math.random() * 26))];
            console.log("Easing type"+Math.floor((Math.random() * 26)))
            sliderId.value=200;
            mDuration-=28;
            insideRectangleMouseArea.enabled = true;insideTheSliderRectangleMouseArea.enabled = true
            if(levelIndicator >21)
            {
                handleId.visible=false;
                sliderId.enabled=false;
                whatToDoForNextLevel()
                if(true){
                    //8
                    if(counter8===21&&!(mMissionModel.get(8).currentThings>=mMissionModel.get(8).neededThings)&&checkIfCurrentMission(8)){
                        mMissionModel.get(8).currentThings=21
                    }
                    if(counter8>mMissionModel.get(8).currentThings&&!(mMissionModel.get(8).currentThings>=mMissionModel.get(8).neededThings)&&checkIfCurrentMission(8)){
                        mMissionModel.get(8).currentThings=counter8
                    }
                    counter8=0;
                }
                if(mvpSoundEffectPlaying){
                    fadeOut.start();
                    mvpSoundEffectPlaying=false
                }
                Extra.goToHalftime()
            }
            else{
                //have to have on all three, only restart thing if not going to next level
                if(stateRectId.state!="paused")
                    seqAnimationId.restart();
            }
        }
        //Level three stuff
        else if(level===3)
        {
            coinProb = 3;
            mPauseAnim.duration-=20;
            handleId.visible=false;
            sliderId.enabled=true;
            //clearling the last times random order
            currentRandomOrder5=[];
            //making sure it starts at the first index (index 0);
            currentIndexForRandom = 0;
            newRandomColors3();
            mPauseAnim.restart();

        }

        //other variables stuff for everything
        //So basically we needed this to only happen AFTER the animation appears, so  if the animation doesnt appear this runs but if it does then it will run at the end of it
        if(!haveRandomlyChoosenIfCoinAppears){
            if (Math.floor((Math.random()*coinProb))==0){
                flipable.visible=true;
                flipable.flipped = !flipable.flipped;
            }
            else
                flipable.visible=false;
        }
    }
    //Images start here
    //Sky
    Rectangle { property string __felgo_live_id_element: "FELGO_ID_37929_13";
        Component.onCompleted: {
            //Used to show level one message
            levelRectangleAnimation.start()
        }
        id: sky
        anchors.top: parent.top
        anchors.bottom: ground.top
        width: parent.width
        color:"blue"
        gradient: Gradient { property string __felgo_live_id_element: "FELGO_ID_37929_14";
            GradientStop { property string __felgo_live_id_element: "FELGO_ID_37929_15"; id: skyStartGradient ;position: 0.0; color: "#0080FF" }
            GradientStop { property string __felgo_live_id_element: "FELGO_ID_37929_16"; id: skyEndGradient ;position: 1.0; color: "#66CCFF"}
        }
    }
    //pointing finger
    //pointer finger associated text
    Text{ property string __felgo_live_id_element: "FELGO_ID_37929_17";
        id: explanationTutorialText
        text: "Click anywhere in the white"
        wrapMode: Text.Wrap
        font.pointSize: 14
        color: "black"
        font.bold: true
        width: 170
        horizontalAlignment: Text.AlignHCenter
        visible: pointingFinger.visible
        anchors.horizontalCenter: pointingFinger.horizontalCenter
        anchors.bottom: pointingFinger.top
        z:5
    }
    Image{ property string __felgo_live_id_element: "FELGO_ID_37929_18";
        visible: false;
        z:5
        id: pointingFinger
        width: 414*1/6;
        height: 600*1/6;
        x: insideContainerId.x+insideContainerId.width/2-width/2
        y: insideContainerId.y-height;
        source: "file:///Users/arjun/Documents/CompetitiveBall/images/pointingPicture.png"
        onVisibleChanged: {
            //start the animation once it is visible
            pointingFingerAnim.start()
        }
        onYChanged: {
            if(y===(insideContainerId.y-height-2)||y===(insideContainerId.y-height+32))
                pointingFingerAnim.restart()
        }

        SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_19";
            id: pointingFingerAnim
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_20";
                id: pointingFingerAnimFront
                target: pointingFinger
                property: "y"
                to:insideContainerId.y-pointingFinger.height+20;
                duration: 300
                easing.type: Easing.Linear
            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_21";
                id: pointingFingerAnimBack
                target: pointingFinger
                property: "y"
                to:(insideContainerId.y-pointingFinger.height-2)
                duration: 300
                easing.type: Easing.Linear
            }
        }
    }
    //Ground
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37929_22";
        id: ground
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        height: 300
        width: parent.width
        gradient: Gradient { property string __felgo_live_id_element: "FELGO_ID_37929_23";
            GradientStop { property string __felgo_live_id_element: "FELGO_ID_37929_24"; id: groundStartGradient; position: 0.0; color: "#00FF00"}
            GradientStop { property string __felgo_live_id_element: "FELGO_ID_37929_25";id: groundEndGradient; position: 1.0; color: "#00803F"}
        }
    }
    //Hoop
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37929_26";
        z:4
        y:200
        id: backboard;
        height: 160;
        width:12
        color: "darkgray"
        border.width: 1
        border.color: "black"
        anchors.right: parent.right
    }
    Image{ property string __felgo_live_id_element: "FELGO_ID_37929_27";
        z:4
        id: rim
        source: "file:///Users/arjun/Documents/CompetitiveBall/images/basketballHoop2.png"
        anchors.right: backboard.left
        y: backboard.y+(backboard.height*2/3)
        width: 150
        height: 110
    }
    //Sun
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37929_28";
        visible: true
        id: sun
        radius: 80
        x:80
        y:50
        width:130
        height:130
        color: "yellow"
        Text{ property string __felgo_live_id_element: "FELGO_ID_37929_29";
            id: onSunLevelText
            font.pointSize: 12
            text: "Level: " + level;
            anchors.centerIn: parent
            font.underline: true
            color: "black"
            font.family: "Blacklight"
            wrapMode: Text.Wrap
        }
        Text{ property string __felgo_live_id_element: "FELGO_ID_37929_30";
            id: onSunLevelText1
            font.pointSize: 12
            text: levelIndicatorDown;
            anchors.top: onSunLevelText.bottom
            color: "black"
            font.family: "Athletic"
            wrapMode: Text.Wrap
            x: parent.width/2-10
        }
    }
    //Coin counter thingy
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37929_31";
        Row{ property string __felgo_live_id_element: "FELGO_ID_37929_32";
            spacing: 20;
            x: 10
            y:10
            Image{ property string __felgo_live_id_element: "FELGO_ID_37929_33";
                width: 25
                height: 25
                source: "file:///Users/arjun/Documents/CompetitiveBall/images/coinFront.png"
            }
            Text{ property string __felgo_live_id_element: "FELGO_ID_37929_34";
                property int theText: Extra.numCoins
                text: theText
                font.family: "Stencil"
                horizontalAlignment: Text.AlignHCenter
                font.pointSize:15
            }
        }
    }
    //the coin with anim
    Flipable { property string __felgo_live_id_element: "FELGO_ID_37929_35";
        visible: false
        x: rim.x+65
        y:rim.y+17
        id: flipable
        property bool flipped: false
        front: Image { property string __felgo_live_id_element: "FELGO_ID_37929_36"; //--> collapse
            width: 50
            height: 50
            anchors.centerIn: parent
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/coinFront.png"
        }
        back: Image { property string __felgo_live_id_element: "FELGO_ID_37929_37"; //--> collapse
            width: 50
            height: 50
            anchors.centerIn: parent
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/coinBack.png"
        } //<-- collapse

        transform: Rotation { property string __felgo_live_id_element: "FELGO_ID_37929_38";
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: flipable.flipped ? 180 : 0
            onAngleChanged: {
                if(angle === 180 || angle ===0){
                    if(flipable.visible)
                        flipable.flipped = !flipable.flipped
                }
            }

            Behavior on angle { property string __felgo_live_id_element: "FELGO_ID_37929_39";
                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_40";
                    duration: 500
                }
            }
        }

        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_41";
            id: coinAnim
            onFinished:{
                flipable.visible = false;
                flipable.x= rim.x+65
                flipable.y = rim.y+17
                flipable.back.height = 50;
                flipable.back.width = 50;
                flipable.front.width = 50;
                flipable.front.height = 50;
                Extra.numCoins++;
                coinsThisRound++;
                //So basically we needed this to only happen AFTER the animation appears, so  if the animation doesnt appear this runs but if it does then it will run at the end of it
                if (Math.floor((Math.random()*coinProb))==0){
                    flipable.visible=true;
                    flipable.flipped = !flipable.flipped;
                }
                else
                    flipable.visible=false;
            }

            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_42";
                target: flipable.back
                property: "width"
                duration: 500
                to:30
            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_43";
                target: flipable.back
                property: "height"
                duration: 500
                to:30
            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_44";
                target: flipable.front
                property: "width"
                duration: 500
                to:30
            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_45";
                target: flipable.front
                property: "height"
                duration: 500
                to:30
            }
            PathAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_46";
                id: pathAnim
                duration: 1000
                target: flipable
                orientation: PathAnimation.TopFirst
                anchorPoint: Qt.point(flipable.width/2,
                                      flipable.height/2)
                path: Path { property string __felgo_live_id_element: "FELGO_ID_37929_47";
                    startX:rim.x+65 ; startY: rim.y+17
                    PathCurve { property string __felgo_live_id_element: "FELGO_ID_37929_48";
                        x: 22
                        y: 22
                    }
                }
            }
        }

    }
    //basketball
    Image{ property string __felgo_live_id_element: "FELGO_ID_37929_49";
        z:3
        id: basketBall
        y:root2.height-basketBall.height-50;
        x:33;
        width: 115
        height: 115
        source: Extra.ballSource
    }
    //feedback label
    Label{ property string __felgo_live_id_element: "FELGO_ID_37929_50";
        id: feedbackLabel
        font.family: "Century Gothic"
        text: "dda"
        z: 2
        width: 250
        wrapMode: Label.Wrap
        x: parent.width - width-20
        y: 20
        font.pointSize: 15
        visible: false
    }
    //level animation/rectangle
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37929_51";
        id: levelRectangle
        anchors.centerIn: parent
        width: 1
        height: 1
        z:100;
        color: "#f7fafc"
        radius: 20;
        visible: false;

        Text{ property string __felgo_live_id_element: "FELGO_ID_37929_52";
            anchors.horizontalCenter: parent.horizontalCenter
            id: levelRectangleText1
            text: "Level " + level
            font.pointSize: 1;
            font.family: "Impact"
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }
        Text{ property string __felgo_live_id_element: "FELGO_ID_37929_53";
            function levelTextFunc(level)
            {
                if(level===1){
                    levelRectangleText.text = "     Hint: The slider moves faster as you go along. Survive for 21 rounds to advance, 3 missed in a row and you're out"
                }
                else if(level===2){
                    levelRectangleText.text = "     Hint: The slider has different patterns of motion. Survive for 21 shots to advance, 3 missed in a row and you're are out"
                }
                else if(level===3){
                    levelRectangleText.text = "     Hint: The colors are switching! Try to catch the green one? (not as easy ias it looks)!  Survive for 21 shots to advance, 3 missed in a row and you're are out"
                }
            }
            id: levelRectangleText
            text: levelTextFunc(level)
            font.pointSize: 14;
            font.family: "Courier New"
            wrapMode: Text.Wrap
            width: parent.width-30
            y: levelRectangleText1.y+levelRectangleText1.implicitHeight+30
            anchors.horizontalCenter: parent.horizontalCenter
            visible:false
        }

        ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_54";
            id: levelRectangleAnimation
            onStarted: {
                levelRectangle.visible = true;
            }
            onFinished: {
                //Making bottom text appear
                levelRectangleText.visible=true
                levelRectangleAnimationPause.start()

            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_55";
                target: levelRectangleText1
                property: "font.pointSize"
                duration: 800
                easing.type: Easing.Linear
                to:30
            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_56";
                target: levelRectangle
                property: "width"
                duration: 800
                easing.type: Easing.Linear
                to: (root2.width*4/5)*7/10
            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_57";
                target: levelRectangle
                property: "height"
                duration: 800
                easing.type: Easing.Linear
                to: root2.height*3/7
            }
        }
        PauseAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_58";
            id: levelRectangleAnimationPause
            onStarted: {
                stateRectId.state = "paused"
            }
            onFinished: {
                //resetting everything to defaults
                stateRectId.state = "notPaused";
                levelRectangle.visible = false;
                levelRectangle.width=1;
                levelRectangle.height = 1;
                levelRectangleText1.font.pointSize=1
                levelRectangleText.visible=false
                if (level===3){
                    sliderId.enabled=true;
                    newRandomColors3();
                    mPauseAnim.start();
                }
                else{
                    insideRectangleMouseArea.enabled = true; insideTheSliderRectangleMouseArea.enabled = true
                    seqAnimationId.start()
                }
            }
            duration: 8000
        }
    }
    //faded Red
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37929_59";
        id:fadedRED
        z:19
        anchors.fill: parent
        color: "red"
        opacity: 0.26
        visible: false
    }

    //retry box
    signal quitButtonClicked
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37929_60";
        visible: false
        width: parent.width*2/3
        height:parent.height*1/3
        anchors.centerIn: parent
        z:20
        id: retryBox
        radius:20
        gradient: Gradient{ property string __felgo_live_id_element: "FELGO_ID_37929_61";
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_62";position: 0.0; color: "#f52a2a"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_63";position: 0.5; color: "#ffffff"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_64";position: 1.0; color: "#f52a2a"}
        }
        onVisibleChanged: {
            seqAnimationId.stop
        }

        Column{ property string __felgo_live_id_element: "FELGO_ID_37929_65";
            x:0
            y:0
            width:parent.width
            spacing:10
            Text{ property string __felgo_live_id_element: "FELGO_ID_37929_66";
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Rockwell Extra Bold"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 25
                width: parent.width
                text: "You lost!"
            }
            Text{ property string __felgo_live_id_element: "FELGO_ID_37929_67";
                x:10
                width: parent.width-20
                font.family: "Rockwell Condensed"
                font.pointSize: 18
                wrapMode: Text.Wrap
                text:"     Please try again! Remember 3 missed shots and you are out"
            }
            Row{ property string __felgo_live_id_element: "FELGO_ID_37929_68";
                x:60
                spacing:25
                Button{ property string __felgo_live_id_element: "FELGO_ID_37929_69";

                    height: 110
                    width: 190
                    Text{ property string __felgo_live_id_element: "FELGO_ID_37929_70";
                        color: "#ed912f"
                        text: "RETRY"
                        font.bold: true
                        font.pointSize: 20
                        anchors.centerIn: parent
                    }
                    onClicked: {
                        giantX.visible = false;
                        seqAnimationId.stop()
                        levelRectangleAnimation.start()
                        x1.visible=false; x2.visible = false; x3.visible = false;
                        retryBox.visible=false
                        fadedRED.visible=false
                    }
                }
                Button{ property string __felgo_live_id_element: "FELGO_ID_37929_71";
                    id: quitButton
                    anchors.verticalCenter: parent.verticalCenter
                    width: 120
                    Text{ property string __felgo_live_id_element: "FELGO_ID_37929_72";
                        color: "#ed912f"
                        text: "QUIT"
                        font.pointSize: 15
                        anchors.centerIn: parent
                    }
                    onClicked: {
                        retryBox.visible=false
                        fadedRED.visible=false
                        Extra.emittingSwitchFilesSignal();
                    }
                }
            }
        }
    }

    //Giant x
    Image{ property string __felgo_live_id_element: "FELGO_ID_37929_73";
        visible: false
        z:20
        id: giantX;
        anchors.centerIn: parent
        source: "file:///Users/arjun/Documents/CompetitiveBall/images/xSymbol.png"
        height: 600
        width: 515
    }

    //All three of the x's
    Row{ property string __felgo_live_id_element: "FELGO_ID_37929_74";
        id: threeMissesX
        anchors.bottom: scoreId.top
        x: scoreId.x +35
        Image{ property string __felgo_live_id_element: "FELGO_ID_37929_75";
            visible: false;
            id: x1
            height: 45;
            width: 30;
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/xSymbol.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_37929_76";
            visible: false
            id: x2
            height: 45;
            width: 30;
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/xSymbol.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_37929_77";
            visible: false
            id: x3
            height: 45;
            width: 30;
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/xSymbol.png"
        }
    }
    //All ten of the lines
    Row{ property string __felgo_live_id_element: "FELGO_ID_37929_78";
        id: allMakeTallies11
        anchors.bottom: scoreId.top
        x: scoreId.x +35
        Image{ property string __felgo_live_id_element: "FELGO_ID_37929_79";
            visible: false;
            id: tally1
            height: 50;
            width: 10;
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/oneLine1.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_37929_80";
            visible: false
            id: tally2
            height: 50;
            width: 10;
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/oneLine1.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_37929_81";
            visible: false
            id: tally3
            height: 50;
            width: 10;
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/oneLine1.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_37929_82";
            visible: false;
            id: tally4
            height: 50;
            width: 10;
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/oneLine1.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_37929_83";
            visible: false
            id: tally5
            height: 50;
            width: 10;
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/oneLine1.png"
            transform: Rotation{ property string __felgo_live_id_element: "FELGO_ID_37929_84";
                id: rotateImagePhoto
                angle: 315
                origin.x: tally5.width/2
                origin.y: tally5.height
            }
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_37929_85";
            visible: false
            id: tally6
            height: 50;
            width: 10;
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/oneLine1.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_37929_86";
            visible: false;
            id: tally7
            height: 50;
            width: 10;
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/oneLine1.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_37929_87";
            visible: false
            id: tally8
            height: 50;
            width: 10;
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/oneLine1.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_37929_88";
            visible: false
            id: tally9
            height: 50;
            width: 10;
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/oneLine1.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_37929_89";
            visible: false
            id: tally10
            height: 50;
            width: 10;
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/oneLine1.png"
            transform: Rotation{ property string __felgo_live_id_element: "FELGO_ID_37929_90";
                id: rotateImagePhoto2
                angle: 315
                origin.x: tally10.width/2
                origin.y: tally10.height
            }
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_37929_91";
            visible: false
            id: plus11
            height: 30
            width: 30
            source: "file:///Users/arjun/Documents/CompetitiveBall/images/plusSign.png"
        }
    }

    //Score and PB rectangle
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37929_92";
        id: flashingScore
        width: scoreId.width*1/2
        height: scoreId.height*3/2
        z:2
        color: "transparent"
        //border.color: "black" //no need for border
        x: scoreId.x-scoreId.width/2
        anchors.verticalCenter: scoreId.verticalCenter
        Text{ property string __felgo_live_id_element: "FELGO_ID_37929_93";
            id: flashingScoreText
            opacity: 0;
            color: "black"
            x: 1
            y: 1
            text:"apples are cool"
            rotation: 0
            font.family: "Snap ITC"
            font.pointSize: 14
        }

        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_94";
            id: flashingScoreAnim
            target: flashingScoreText
            property: "opacity"
            duration: 300
            easing.type: Easing.Linear
            to: 1;
        }
    }

    //Box in the corner with score and PB
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37929_95";
        z:2
        id: scoreId
        width: 150
        height: 90
        radius: 23
        border.color: "#134f13"
        border.width: 3
        x: rim.x-30
        y: ground.y + 24

        Text{ property string __felgo_live_id_element: "FELGO_ID_37929_96";
            property int value: points
            id: pointText
            text: value
            Behavior on value { property string __felgo_live_id_element: "FELGO_ID_37929_97";
                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_98"; duration: 500; easing.type: Easing.InOutQuad }
            }
            font.pointSize: 22
            y: 10
            color: "black"
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "impact"
        }

        Text{ property string __felgo_live_id_element: "FELGO_ID_37929_99";
            text: "PB: " + Extra.personalBest;
            font.pointSize: 12
            font.bold: true
            font.family: "Helventica"
            anchors.top: pointText.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }

        gradient: Gradient{ property string __felgo_live_id_element: "FELGO_ID_37929_100";
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_101";position: 0 ;color: "#faf5f5"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_102";position: 1/7 ;color: "#bfe6b1"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_103";position: 2/7 ;color: "#faf5f5"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_104";position: 3/7 ;color: "#bfe6b1"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_105";position: 4/7 ;color: "#faf5f5"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_106";position: 5/7 ;color: "#bfe6b1"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_107";position: 6/7 ;color: "#faf5f5"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_108";position: 1 ;color: "#bfe6b1"}
        }
    }

    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37929_109";
        id: insideContainerId
        color: "#dfedf2"
        opacity: 0.95
        width: 500
        height: 75
        x: parent.width/2-width/2+60
        y: parent.height-ground.height/2-height/2+40
        signal sliderStopped(double value);
        onSliderStopped: {
            //normal setting upp stuff
            basketBall.width=115
            basketBall.height=115
            basketBall.y = root2.height-basketBall.height-50;
            basketBall.x=33;
            basketBall.rotation = 0
            feedbackLabel.visible= false;
            feedbackLabel.font.italic=false
            feedbackLabel.font.bold = false
            //Variable declarations
            var feedback = [];
            var random_number=0;
            let level3ShotAccuracy = figureOutShotWithColor(value);
            let pointsThisRound = 0;

            if(level3ShotAccuracy==="airball"|| level3ShotAccuracy==="null"&&(value <80  || value > 920)){
                if(true){
                    //all mission stuff
                    //0
                    if(counter0>mMissionModel.get(0).currentThings&&!(mMissionModel.get(0).currentThings>=mMissionModel.get(0).neededThings)&&checkIfCurrentMission(0)){
                        mMissionModel.get(0).currentThings=counter0;
                    }
                    counter0=0;
                    //1
                    if(counter1>mMissionModel.get(1).currentThings&&!(mMissionModel.get(1).currentThings>=mMissionModel.get(1).neededThings)&&checkIfCurrentMission(1)){
                        mMissionModel.get(1).currentThings=counter1
                    }
                    counter1=0;
                    //2
                    console.log("useless zaza happened")
                    if(counter2>mMissionModel.get(2).currentThings&&!(mMissionModel.get(2).currentThings>=mMissionModel.get(2).neededThings)&&checkIfCurrentMission(2)){
                        mMissionModel.get(2).currentThings=counter2
                        console.log("zaza happened")
                    }
                    counter2=0;
                    //3
                    if(counter3>mMissionModel.get(3).currentThings&&!(mMissionModel.get(3).currentThings>=mMissionModel.get(3).neededThings)&&checkIfCurrentMission(3)){
                        mMissionModel.get(3).currentThings=counter3
                    }
                    counter3=0;
                    //4
                    if(level===3){
                        if(counter4>mMissionModel.get(4).currentThings&&!(mMissionModel.get(4).currentThings>=mMissionModel.get(4).neededThings)&&checkIfCurrentMission(4)){
                            mMissionModel.get(4).currentThings=counter4
                        }
                        counter4=0;
                    }
                    //5
                    if(level===2){
                        if(counter5>mMissionModel.get(5).currentThings&&!(mMissionModel.get(5).currentThings>=mMissionModel.get(5).neededThings)&&checkIfCurrentMission(5)){
                            mMissionModel.get(5).currentThings=counter5
                        }
                        counter5=0;
                    }
                    //6
                    if(level===3){
                        if(counter6>mMissionModel.get(6).currentThings&&!(mMissionModel.get(6).currentThings>=mMissionModel.get(6).neededThings)&&checkIfCurrentMission(6)){
                            mMissionModel.get(6).currentThings=counter6
                        }
                        counter6=0;
                    }
                    //7
                    //8
                    //9
                    if(level===3){
                        if(counter9>mMissionModel.get(9).currentThings&&!(mMissionModel.get(9).currentThings>=mMissionModel.get(9).neededThings)&&checkIfCurrentMission(9)){
                            mMissionModel.get(9).currentThings=counter9
                        }
                        counter9=0;
                    }
                    //10
                    //11
                    //12
                    //13
                    if(counter13>mMissionModel.get(13).currentThings&&!(mMissionModel.get(13).currentThings>=mMissionModel.get(13).neededThings)&&checkIfCurrentMission(13)){
                        mMissionModel.get(13).currentThings=counter13
                    }
                    counter13=0;
                    //14
                }
                manyMisses++;
                manyMakes=0;
                points -= 120;
                pointsThisRound -= 120;
                airBallAnimation.start();
                feedback = ["Have you ever shot a basketball before?","Seriously, you can do MUCH better", "An airball?", "You are supposed to shoot at the hoop, you know?", "My dog can shoot better than that", "A complete failure...", "Why do you even play this sport?"]
                random_number = Math.floor((Math.random() * 6));
                feedbackLabel.font.italic = true;
            }
            else if(level3ShotAccuracy==="backboardMiss"|| level3ShotAccuracy==="null"&&(value <180 || value >820)){
                if(true){
                    //all mission stuff
                    //0
                    if(counter0>mMissionModel.get(0).currentThings&&!(mMissionModel.get(0).currentThings>=mMissionModel.get(0).neededThings)&&checkIfCurrentMission(0)){
                        mMissionModel.get(0).currentThings=counter0;
                    }
                    counter0=0;
                    //1
                    if(counter1>mMissionModel.get(1).currentThings&&!(mMissionModel.get(1).currentThings>=mMissionModel.get(1).neededThings)&&checkIfCurrentMission(1)){
                        mMissionModel.get(1).currentThings=counter1
                    }
                    counter1=0;
                    //2
                    if(counter2>mMissionModel.get(2).currentThings&&!(mMissionModel.get(2).currentThings>=mMissionModel.get(2).neededThings)&&checkIfCurrentMission(2)){
                        mMissionModel.get(2).currentThings=counter2
                    }
                    counter2=0;
                    //3
                    counter3++;
                    if(counter3===2&&!(mMissionModel.get(3).currentThings>=mMissionModel.get(3).neededThings)&&checkIfCurrentMission(3)){
                        mMissionModel.get(3).currentThings=2
                    }
                    //4
                    if(level===3){
                        if(counter4>mMissionModel.get(4).currentThings&&!(mMissionModel.get(4).currentThings>=mMissionModel.get(4).neededThings)&&checkIfCurrentMission(4)){
                            mMissionModel.get(4).currentThings=counter4
                        }
                        counter4=0;
                    }
                    //5
                    if(level===2){
                        if(counter5>mMissionModel.get(5).currentThings&&!(mMissionModel.get(5).currentThings>=mMissionModel.get(5).neededThings)&&checkIfCurrentMission(5)){
                            mMissionModel.get(5).currentThings=counter5
                        }
                        counter5=0;
                    }
                    //6
                    if(level===3){
                        if(counter6>mMissionModel.get(6).currentThings&&!(mMissionModel.get(6).currentThings>=mMissionModel.get(6).neededThings)&&checkIfCurrentMission(6)){
                            mMissionModel.get(6).currentThings=counter6
                        }
                        counter6=0;
                    }
                    //7
                    //8
                    //9
                    if(level===3){
                        if(counter9>mMissionModel.get(9).currentThings&&!(mMissionModel.get(9).currentThings>=mMissionModel.get(9).neededThings)&&checkIfCurrentMission(9)){
                            mMissionModel.get(9).currentThings=counter9
                        }
                        counter9=0;
                    }
                    //10
                    //11
                    //12
                    //13
                    if(counter13>mMissionModel.get(13).currentThings&&!(mMissionModel.get(13).currentThings>=mMissionModel.get(13).neededThings)&&checkIfCurrentMission(13)){
                        mMissionModel.get(13).currentThings=counter13
                    }
                    counter13=0;
                    //14
                }

                manyMisses++;
                manyMakes=0;
                points -= 50;
                pointsThisRound -= 50;
                backboardMissAnimation.start()
                feedback = ["Well, better than an airball", "Atleast you hit the backboard", "Your NBA hopes are dwindling", "Next time, try to hit the rim", "Might want to start taking some basketball lessons", "Not your worst...", "I think you can do better"]
                random_number = Math.floor((Math.random() * 6));
            }
            else if(level3ShotAccuracy==="rimMiss"|| level3ShotAccuracy==="null"&&(value <270 || value >730)){
                if(true){
                    //all mission stuff
                    //0
                    if(counter0>mMissionModel.get(0).currentThings&&!(mMissionModel.get(0).currentThings>=mMissionModel.get(0).neededThings)&&checkIfCurrentMission(0)){
                        mMissionModel.get(0).currentThings=counter0;
                    }
                    counter0=0;
                    //1
                    if(counter1>mMissionModel.get(1).currentThings&&!(mMissionModel.get(1).currentThings>=mMissionModel.get(1).neededThings)&&checkIfCurrentMission(1)){
                        mMissionModel.get(1).currentThings=counter1
                    }
                    counter1=0;
                    //2
                    if(counter2>mMissionModel.get(2).currentThings&&!(mMissionModel.get(2).currentThings>=mMissionModel.get(2).neededThings)&&checkIfCurrentMission(2)){
                        mMissionModel.get(2).currentThings=counter2
                    }
                    counter2=0;
                    //3
                    if(counter3>mMissionModel.get(3).currentThings&&!(mMissionModel.get(3).currentThings>=mMissionModel.get(3).neededThings)&&checkIfCurrentMission(3)){
                        mMissionModel.get(3).currentThings=counter3
                    }
                    counter3=0;
                    //4
                    if(level===3){
                        if(counter4>mMissionModel.get(4).currentThings&&!(mMissionModel.get(4).currentThings>=mMissionModel.get(4).neededThings)&&checkIfCurrentMission(4)){
                            mMissionModel.get(4).currentThings=counter4
                        }
                        counter4=0;
                    }
                    //5
                    if(level===2){
                        if(counter5>mMissionModel.get(5).currentThings&&!(mMissionModel.get(5).currentThings>=mMissionModel.get(5).neededThings)&&checkIfCurrentMission(5)){
                            mMissionModel.get(5).currentThings=counter5
                        }
                        counter5=0;
                    }
                    //6
                    if(level===3){
                        if(counter6>mMissionModel.get(6).currentThings&&!(mMissionModel.get(6).currentThings>=mMissionModel.get(6).neededThings)&&checkIfCurrentMission(6)){
                            mMissionModel.get(6).currentThings=counter6
                        }
                        counter6=0;
                    }
                    //7
                    //8
                    //9
                    if(level===3){
                        counter9++;
                        if(counter9===2&&!(mMissionModel.get(9).currentThings>=mMissionModel.get(9).neededThings)&&checkIfCurrentMission(9)){
                            mMissionModel.get(9).currentThings=2
                        }
                    }
                    //10
                    //11
                    //12
                    //13
                    if(counter13>mMissionModel.get(13).currentThings&&!(mMissionModel.get(13).currentThings>=mMissionModel.get(13).neededThings)&&checkIfCurrentMission(13)){
                        mMissionModel.get(13).currentThings=counter13
                    }
                    counter13=0;
                    //14
                }

                manyMisses++;
                manyMakes=0;
                points -= 20;
                pointsThisRound -= 20;
                rimMissAnimation.start()
                feedback = ["Brick", "Close but not yet there", "Hit the net next time, not the rim", "Closer than ever", "You'll do it next time", "Good try!"]
                random_number = Math.floor((Math.random() * 5));
            }
            else if(level3ShotAccuracy==="backboardMake"|| level3ShotAccuracy==="null"&&(value < 350 || value >650)){
                if(true){
                    //all mission stuff
                    //0
                    if(counter0>mMissionModel.get(0).currentThings&&!(mMissionModel.get(0).currentThings>=mMissionModel.get(0).neededThings)&&checkIfCurrentMission(0)){
                        mMissionModel.get(0).currentThings=counter0;
                    }
                    counter0=0;
                    //1
                    if(counter1>mMissionModel.get(1).currentThings&&!(mMissionModel.get(1).currentThings>=mMissionModel.get(1).neededThings&&checkIfCurrentMission(1))){
                        mMissionModel.get(1).currentThings=counter1
                    }
                    counter1=0;
                    //2
                    if(counter2>mMissionModel.get(2).currentThings&&!(mMissionModel.get(2).currentThings>=mMissionModel.get(2).neededThings)&&checkIfCurrentMission(2)){
                        mMissionModel.get(2).currentThings=counter2
                    }
                    counter2=0;
                    //3
                    if(counter3>mMissionModel.get(3).currentThings&&!(mMissionModel.get(3).currentThings>=mMissionModel.get(3).neededThings)&&checkIfCurrentMission(3)){
                        mMissionModel.get(3).currentThings=counter3
                    }
                    counter3=0;
                    //4
                    if(level===3){
                        if(counter4>mMissionModel.get(4).currentThings&&!(mMissionModel.get(4).currentThings>=mMissionModel.get(4).neededThings)&&checkIfCurrentMission(4)){
                            mMissionModel.get(4).currentThings=counter4
                        }
                        counter4=0;
                    }
                    //5
                    if(level===2){
                        counter5++;
                        if(counter5===9&&!(mMissionModel.get(5).currentThings>=mMissionModel.get(5).neededThings)){
                            mMissionModel.get(5).currentThings=9
                        }
                    }
                    //6
                    if(level===3){
                        if(counter6>mMissionModel.get(6).currentThings&&!(mMissionModel.get(6).currentThings>=mMissionModel.get(6).neededThings)&&checkIfCurrentMission(6)){
                            mMissionModel.get(6).currentThings=counter6
                        }
                        counter6=0;
                    }
                    //7
                    //8
                    //9
                    if(level===3){
                        if(counter9>mMissionModel.get(9).currentThings&&!(mMissionModel.get(9).currentThings>=mMissionModel.get(9).neededThings)&&checkIfCurrentMission(9)){
                            mMissionModel.get(9).currentThings=counter9
                        }
                        counter9=0;
                    }
                    //10
                    //11
                    //12
                    //13
                    counter13++;
                    if(counter13===mMissionModel.get(13).neededThings&&!(mMissionModel.get(13).currentThings>=mMissionModel.get(13).neededThings)&&checkIfCurrentMission(13)){
                        mMissionModel.get(13).currentThings=4
                    }
                    //14
                }

                manyMakes++;
                manyMisses=0
                points +=30;
                pointsThisRound += 30;
                backboardAnimation.start()
                feedback = ["Good shot","A make is a make", "A bucket is a bucket", "Lucky shot??", "Banks don't count...try again", "Banks don't count...try again", "You can do even better"]
                random_number = Math.floor((Math.random() * 7));
            }
            else if(level3ShotAccuracy==="rimMake"|| level3ShotAccuracy==="null"&&(value <415 || value > 585)){
                if(true){
                    //all mission stuff
                    //0
                    if(counter0>mMissionModel.get(0).currentThings&&!(mMissionModel.get(0).currentThings>=mMissionModel.get(0).neededThings)&&checkIfCurrentMission(0)){
                        mMissionModel.get(0).currentThings=counter0;
                    }
                    counter0=0;
                    //1
                    if(counter1>mMissionModel.get(1).currentThings&&!(mMissionModel.get(1).currentThings>=mMissionModel.get(1).neededThings)&&checkIfCurrentMission(1)){
                        mMissionModel.get(1).currentThings=counter1
                    }
                    counter1=0;
                    //2
                    if(counter2>mMissionModel.get(2).currentThings&&!(mMissionModel.get(2).currentThings>=mMissionModel.get(2).neededThings)&&checkIfCurrentMission(2)){
                        mMissionModel.get(2).currentThings=counter2
                    }
                    counter2=0;
                    //3
                    if(counter3>mMissionModel.get(3).currentThings&&!(mMissionModel.get(3).currentThings>=mMissionModel.get(3).neededThings)&&checkIfCurrentMission(3)){
                        mMissionModel.get(3).currentThings=counter3
                    }
                    counter3=0;
                    //4
                    if(level===3){
                        counter4++;
                        if(counter4===6&&!(mMissionModel.get(4).currentThings>=mMissionModel.get(4).neededThings)){
                            mMissionModel.get(4).currentThings=6
                        }
                    }
                    //5
                    if(level===2){
                        if(counter5>mMissionModel.get(5).currentThings&&!(mMissionModel.get(5).currentThings>=mMissionModel.get(5).neededThings)&&checkIfCurrentMission(5)){
                            mMissionModel.get(5).currentThings=counter5
                        }
                        counter5=0;
                    }
                    //6
                    if(level===3){
                        if(counter6>mMissionModel.get(6).currentThings&&!(mMissionModel.get(6).currentThings>=mMissionModel.get(6).neededThings)&&checkIfCurrentMission(6)){
                            mMissionModel.get(6).currentThings=counter6
                        }
                        counter6=0;
                    }
                    //7
                    //8
                    //9
                    if(level===3){
                        if(counter9>mMissionModel.get(9).currentThings&&!(mMissionModel.get(9).currentThings>=mMissionModel.get(9).neededThings)&&checkIfCurrentMission(9)){
                            mMissionModel.get(9).currentThings=counter9
                        }
                        counter9=0;
                    }
                    //10
                    //11
                    //12
                    //13
                    if(counter13>mMissionModel.get(13).currentThings&&!(mMissionModel.get(13).currentThings>=mMissionModel.get(13).neededThings)&&checkIfCurrentMission(13)){
                        mMissionModel.get(13).currentThings=counter13
                    }
                    counter13=0;
                    //14
                }

                manyMakes++;
                manyMisses=0
                points+=50
                pointsThisRound += 50;
                rimMakeAnimation.start()
                feedback = ["I thought that was going to miss", "The rim was on your side", "Looks like you are on a set path to the NBA", "Amazing shot!", "Pretty nice!"]
                random_number = Math.floor((Math.random() * 5));
            }
            else if(level3ShotAccuracy==="splash"|| level3ShotAccuracy==="null"&&(value <485|| value>515)){
                if(true){
                    //all mission stuff
                    //0
                    counter0++;
                    console.log("this happened")
                    if(counter0===3&&!(mMissionModel.get(0).currentThings>=mMissionModel.get(0).neededThings)&&checkIfCurrentMission(0)){
                        mMissionModel.get(0).currentThings=3
                    }
                    //1
                    counter1++;
                    if(counter1===6&&!(mMissionModel.get(1).currentThings>=mMissionModel.get(1).neededThings)&&checkIfCurrentMission(1)){
                        mMissionModel.get(1).currentThings=6
                    }
                    //2
                    counter2++;
                    if(counter2===11&&!(mMissionModel.get(2).currentThings>=mMissionModel.get(2).neededThings)&&checkIfCurrentMission(2)){
                        mMissionModel.get(2).currentThings=11
                    }
                    //3
                    if(counter3>mMissionModel.get(3).currentThings&&!(mMissionModel.get(3).currentThings>=mMissionModel.get(3).neededThings)&&checkIfCurrentMission(3)){
                        mMissionModel.get(3).currentThings=counter3
                    }
                    counter3=0;
                    //4
                    if(level===3){
                        if(counter4>mMissionModel.get(4).currentThings&&!(mMissionModel.get(4).currentThings>=mMissionModel.get(4).neededThings)&&checkIfCurrentMission(4)){
                            mMissionModel.get(4).currentThings=counter4
                        }
                        counter4=0;
                    }
                    //5
                    if(level===2){
                        if(counter5>mMissionModel.get(5).currentThings&&!(mMissionModel.get(5).currentThings>=mMissionModel.get(5).neededThings)&&checkIfCurrentMission(5)){
                            mMissionModel.get(5).currentThings=counter5
                        }
                        counter5=0;
                    }
                    //6
                    if(level===3){
                        counter6++;
                        if(counter6===8&&!(mMissionModel.get(6).currentThings>=mMissionModel.get(6).neededThings)&&checkIfCurrentMission(6)){
                            mMissionModel.get(6).currentThings=8
                        }
                    }
                    //7
                    //8
                    //9
                    if(level===3){
                        if(counter9>mMissionModel.get(9).currentThings&&!(mMissionModel.get(9).currentThings>=mMissionModel.get(9).neededThings)&&checkIfCurrentMission(9)){
                            mMissionModel.get(9).currentThings=counter9
                        }
                        counter9=0;
                    }
                    //10
                    //11
                    //12
                    //13
                    if(counter13>mMissionModel.get(13).currentThings&&!(mMissionModel.get(13).currentThings>=mMissionModel.get(13).neededThings)&&checkIfCurrentMission(13)){
                        mMissionModel.get(13).currentThings=counter13
                    }
                    counter13=0;
                    //14
                }

                manyMakes++;
                manyMisses=0
                points+= 110
                pointsThisRound += 110;
                splashAnimation.start()
                feedback = ["The next Steph Curry?", "Splashing it like Klay Thompson?", "What an amazing shot?", "Making some splashes", "All the way from deep?", "Swish!", "Like a true nba player"]
                random_number = Math.floor((Math.random() * 7));
            }
            else{
                //need these stuffy here for if statement to check for make the work
                if(true){
                    //all mission stuff
                    //0
                    counter0++;
                    console.log("this happened")
                    if(counter0===3&&!(mMissionModel.get(0).currentThings>=mMissionModel.get(0).neededThings)&&checkIfCurrentMission(0)){
                        mMissionModel.get(0).currentThings=3
                        console.log("i went inside the hole")
                    }
                    //1
                    counter1++;
                    if(counter1===6&&!(mMissionModel.get(1).currentThings>=mMissionModel.get(1).neededThings)&&checkIfCurrentMission(1)){
                        mMissionModel.get(1).currentThings=6
                    }
                    //2
                    counter2++;
                    if(counter2===11&&!(mMissionModel.get(2).currentThings>=mMissionModel.get(2).neededThings)&&checkIfCurrentMission(2)){
                        mMissionModel.get(2).currentThings=11
                    }
                    //3
                    if(counter3>mMissionModel.get(3).currentThings&&!(mMissionModel.get(3).currentThings>=mMissionModel.get(3).neededThings)&&checkIfCurrentMission(3)){
                        mMissionModel.get(3).currentThings=counter3
                    }
                    counter3=0;
                    //4
                    if(level===3){
                        if(counter4>mMissionModel.get(4).currentThings&&!(mMissionModel.get(4).currentThings>=mMissionModel.get(4).neededThings)&&checkIfCurrentMission(4)){
                            mMissionModel.get(4).currentThings=counter4
                        }
                        counter4=0;
                    }
                    //5
                    if(level===2){
                        if(counter5>mMissionModel.get(5).currentThings&&!(mMissionModel.get(5).currentThings>=mMissionModel.get(5).neededThings)&&checkIfCurrentMission(5)){
                            mMissionModel.get(5).currentThings=counter5
                        }
                        counter5=0;
                    }
                    //6
                    if(level===3){
                        counter6++;
                        if(counter6===8&&!(mMissionModel.get(6).currentThings>=mMissionModel.get(6).neededThings)&&checkIfCurrentMission(6)){
                            mMissionModel.get(6).currentThings=8
                        }
                    }
                    //7
                    //8
                    //9
                    if(level===3){
                        if(counter9>mMissionModel.get(9).currentThings&&!(mMissionModel.get(9).currentThings>=mMissionModel.get(9).neededThings)&&checkIfCurrentMission(9)){
                            mMissionModel.get(9).currentThings=counter9
                        }
                        counter9=0;
                    }
                    //10
                    //11
                    //12
                    //13
                    if(counter13>mMissionModel.get(13).currentThings&&!(mMissionModel.get(13).currentThings>=mMissionModel.get(13).neededThings)&&checkIfCurrentMission(13)){
                        mMissionModel.get(13).currentThings=counter13
                    }
                    counter13=0;
                    //14
                }

                manyMakes++;
                manyMisses=0
                points+= 150
                pointsThisRound +=150;
                splashAnimation.start()
                feedback = ["The GOAT?", "May be the greatest shot ever", "Game winner!", "Buzzer beater", "MVP"]
                random_number = Math.floor((Math.random() * 5));
                feedbackLabel.font.bold = true;
                splashAnimation.start()
            }
            //Do every time either way
            feedbackLabel.visible = true;
            feedbackLabel.text = feedback[random_number];
            levelIndicator++;
            (level===3)?(sliderId.enabled=true):(sliderId.enabled=false);
            //If make- in general
            if(manyMakes>0)
            {
                if(true){
                    if(level===1){
                        //update mission
                        //7
                        counter7++;
                    }
                    if(level===2){
                        //update missions
                        //8
                        counter8++;
                    }
                }
                x1.visible=false;
                x2.visible=false;
                x3.visible=false;
                //Brighten the color of the score box text on the bottom left
                switch(manyMakes){
                case 1: tally1.visible =true;
                    flashingScoreText.color = "black"
                    break;
                case 2: tally1.visible =true; tally2.visible =true;
                    flashingScoreText.color = "#302525"
                    break;
                case 3:tally1.visible =true; tally2.visible =true; tally3.visible =true;
                    flashingScoreText.color = "#422e2e"
                    extraPoints=70;
                    points += extraPoints;
                    pointsThisRound +=extraPoints;
                    break;
                case 4:tally1.visible =true; tally2.visible =true;
                    tally3.visible =true; tally4.visible =true;
                    flashingScoreText.color = "#523333"
                    extraPoints=100;
                    points += extraPoints;
                    pointsThisRound +=extraPoints;
                    break;
                case 5:tally1.visible =true; tally2.visible =true; tally3.visible =true;
                    tally4.visible =true; tally5.visible =true;
                    flashingScoreText.color = "#633434"
                    extraPoints=120;
                    points += extraPoints;
                    pointsThisRound +=extraPoints;
                    break;
                case 6:tally1.visible =true; tally2.visible =true; tally3.visible =true;
                    tally4.visible =true; tally5.visible =true; tally6.visible =true;
                    flashingScoreText.color = "#803434"
                    extraPoints=140;
                    points += extraPoints;
                    pointsThisRound +=extraPoints;
                    break;
                case 7:tally1.visible =true; tally2.visible =true; tally3.visible =true;
                    tally4.visible =true; tally5.visible =true;
                    tally6.visible =true; tally7.visible =true;
                    flashingScoreText.color = "#a34141"
                    extraPoints=170;
                    points += extraPoints;
                    pointsThisRound +=extraPoints;
                    break;
                case 8:tally1.visible =true; tally2.visible =true; tally3.visible =true;
                    tally4.visible =true; tally5.visible =true;
                    tally6.visible =true; tally7.visible =true; tally8.visible =true;
                    flashingScoreText.color = "#d44242"
                    extraPoints=180;
                    points += extraPoints;
                    pointsThisRound +=extraPoints;
                    break;
                case 9:tally1.visible =true; tally2.visible =true; tally3.visible =true;
                    tally4.visible =true; tally5.visible =true; tally6.visible =true;
                    tally7.visible =true; tally8.visible =true; tally9.visible =true;
                    flashingScoreText.color = "#ed4747"
                    extraPoints=190;
                    points += extraPoints;
                    pointsThisRound +=extraPoints;
                    break;
                case 10: tally1.visible =true; tally2.visible =true; tally3.visible =true;
                    tally4.visible =true; tally5.visible =true; tally6.visible =true;
                    tally7.visible =true; tally8.visible =true;
                    tally9.visible =true; tally10.visible =true;
                    flashingScoreText.color = "#ff0000"
                    extraPoints=200;
                    points += extraPoints;
                    pointsThisRound +=extraPoints;
                    break;
                default: tally1.visible =true; tally2.visible =true; tally3.visible =true; tally4.visible =true;
                    tally5.visible =true; tally6.visible =true; tally7.visible =true; tally8.visible =true; tally9.visible =true;
                    tally10.visible =true; plus11.visible = true;
                    flashingScoreText.color = "#2b59ff"
                    extraPoints+=15;
                    points += extraPoints;
                    pointsThisRound +=extraPoints;
                    break;
                }
            }
            //If miss - in general
            else{
                tally1.visible =false; tally2.visible =false; tally3.visible =false;
                tally4.visible =false; tally5.visible =false; tally6.visible =false;
                tally7.visible =false; tally3.visible =false; tally8.visible =false;
                tally9.visible =false; tally10.visible =false; plus11.visible=false;
                extraPoints=70;
                flashingScoreText.color = "black"
                switch(manyMisses)
                {
                case 1: x1.visible=true; break;
                case 2: x1.visible=true; x2.visible = true; break;
                case 3: x1.visible=true; x2.visible = true; x3.visible = true; break;
                }
            }

            //Flashing plus or minus scoreId
            flashingScoreText.text= (manyMakes>0)?("+"+pointsThisRound):(pointsThisRound)
            flashingScoreText.x= Math.random()*(flashingScore.width-flashingScoreText.implicitWidth)+1;
            flashingScoreText.y= Math.random()*(flashingScore.height-flashingScoreText.implicitHeight)+1;
            flashingScoreText.rotation= (Math.random()*100)-50;
            sliderId.enabled=false
            flashingScoreAnim.start();

            insideRectangleMouseArea.enabled = false; insideTheSliderRectangleMouseArea.enabled = false
        }
        Timer{ property string __felgo_live_id_element: "FELGO_ID_37929_110";
            id: isDoubleClickTimer
            interval:1550 //should be 500 maybe
        }

        Connections{ property string __felgo_live_id_element: "FELGO_ID_37929_111";
            target: Extra
            function onSpaceClickedInComp(){
                if(!isDoubleClickTimer.running){
                    isDoubleClickTimer.start()
                    whatToDoInsideRectangleMA();
                }
                else{
                    whatToDoWhenDoubleClicked();
                }
            }
        }
        MouseArea{ property string __felgo_live_id_element: "FELGO_ID_37929_112";
            id: insideRectangleMouseArea
            enabled: false;
            anchors.fill: parent
            propagateComposedEvents: true
            onClicked: {
                whatToDoInsideRectangleMA()
            }
            onDoubleClicked:{
                mouse.accepted=false;
            }
        }
        Slider{ property string __felgo_live_id_element: "FELGO_ID_37929_113";
            onValueChanged: {
                if(firstTime2){
                    if(value===1){
                        counterio=1;
                    }
                    if(counterio ==1 && value===500.5){
                        seqAnimationId.stop();
                        pointingFinger.visible=true;
                    }
                }
                if(level===3)
                {
                    mPauseAnim.stop();
                    pointingFinger.visible=false;
                    insideContainerId.sliderStopped(sliderId.value);
                    handleId.visible=true;
                    sliderId.enabled=false;
                    firstTime3=false;
                }
                else{
                    if(value===1)
                    {
                        seqAnimationId.restart()
                    }
                }
            }
            anchors.centerIn: parent
            id: sliderId
            from: 1;
            to: 1000;
            value: 20;
            width: 440;
            height: 20;
            enabled:insideRectangleMouseArea.enabled;
            MouseArea{ property string __felgo_live_id_element: "FELGO_ID_37929_114";
                id: insideTheSliderRectangleMouseArea
                enabled: false;
                anchors.fill: parent
                propagateComposedEvents: true
                onClicked: {
                    whatToDoInsideRectangleMA()
                }
                onDoubleClicked:{
                    mouse.accepted=false;
                }
            }
            background: Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37929_115";
                implicitHeight: 4
                height: implicitHeight
                radius: 6
                gradient: Gradient{ property string __felgo_live_id_element: "FELGO_ID_37929_116";
                    orientation: Gradient.Horizontal
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_117";position: 0.0; color: (level===3)?colors[0]:"#cf3732"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_118";position: (level===3)?0.1428:0.2; color:(level===3)?colors[0]:"#db8d44"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_119";position: (level===3)?0.1429:0.35; color:(level===3)?colors[1]:"#e3d430"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_120";position: (level===3)?0.2857:0.5; color:(level===3)?colors[1]:"#29c910"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_121";position: (level===3)?0.2858:0.65; color:(level===3)?colors[2]:"#e3d430"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_122";position: (level===3)?0.4286:0.8; color:(level===3)?colors[2]:"#db8d44"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_123";position: (level===3)?0.4287:1.0; color:(level===3)?colors[3]:"#cf3732"}
                    //below ones not used until level 3
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_124";position: (level===3)?0.5714:1.1; color:(level===3)?colors[3]:"#000000"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_125";position: (level===3)?0.5715:1.1; color:(level===3)?colors[4]:"#000000"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_126";position: (level===3)?0.7143:1.1; color:(level===3)?colors[4]:"#000000"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_127";position: (level===3)?0.7144:1.1; color:(level===3)?colors[5]:"#000000"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_128";position: (level===3)?0.8571:1.1; color:(level===3)?colors[5]:"#000000"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_129";position: (level===3)?0.8572:1.1; color:(level===3)?colors[6]:"#000000"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_37929_130";position: (level===3)?1:1.1; color:(level===3)?colors[6]:"#000000"}
                }
                Rectangle { property string __felgo_live_id_element: "FELGO_ID_37929_131";
                    height: parent.height
                    color: "#21be2b"
                    radius: 2
                }
            }
            handle: Rectangle { property string __felgo_live_id_element: "FELGO_ID_37929_132";
                id: handleId
                x: sliderId.leftPadding + sliderId.visualPosition * (sliderId.availableWidth - width)
                y: sliderId.topPadding + sliderId.availableHeight / 2 - height / 2
                implicitWidth: 12
                implicitHeight: 31
                radius: 4
                color: sliderId.pressed ? "#f0f0f0" : "#ededed"
                border.color: "#9e9e9e"
            }
            SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_133";
                id: seqAnimationId
                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_134";
                    target: sliderId
                    property: "value"
                    to:1000
                    duration: mDuration
                    easing.type: sliderEasingType
                }
                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_135";
                    target: sliderId
                    property: "value"
                    to:0
                    duration: mDuration
                    easing.type: sliderEasingType

                }
            }
            PauseAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_136";
                onFinished: {
                    if(currentIndexForRandom===5)
                        currentIndexForRandom=0;
                    colors= currentRandomOrder5[currentIndexForRandom];
                    currentIndexForRandom+=1;
                    if(firstTime3===true&&currentIndexForRandom===4){
                        for(let i =0; i< colors.length; i++){
                            if(colors[i]==="#29c910"){
                                pointingFinger.x=sliderId.x-(pointingFinger.width/2)+(i/7*sliderId.width)+(1/14*sliderId.width)+165;
                                pointingFinger.y+= 34
                                pointingFingerAnimFront.to+=34
                                pointingFingerAnimBack.to+=34
                                firstTime3=false;
                                pointingFinger.visible=true;
                                break;
                            }
                        }
                    }
                    else
                        mPauseAnim.restart();
                }

                id: mPauseAnim
                duration: 1000
            }
        }
    }
    //splash animation
    MyAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_137";
        id: splashAnimation
        toX: rim.x+26;
        downEasingType: Easing.InQuad;
        toY: 50;
        animationDuration: 1600
        rotationNumber: 800
        onStopped:{
            whatToDoWhenAnimFinished()
        }
        onStarted: {
            splashSoundEffectTimer.start()
        }
    }
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_37929_138";
        id: splashSoundEffectTimer
        original:  1500
        onTimedOut: {
            splashSoundEffect.play()
        }
    }
    Audio{ property string __felgo_live_id_element: "FELGO_ID_37929_139";
        id: splashSoundEffect
        source:"file:///Users/arjun/Documents/CompetitiveBall/sounds/splashSoundEffectCropped.mp3"
        volume: Extra.sound*1
        onPlaybackStateChanged: {
            if(playbackState===Audio.PlayingState){
                if(flipable.visible){
                    coinClinkSoundEffect.play()
                }
            }
        }
    }

    //air ball animation
    MyAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_140";
        id: airBallAnimation
        toX: rim.x-75;
        downEasingType: Easing.InQuad;
        toY: 250;
        animationDuration: 1600
        rotationNumber: 800
        otherToY: rim.y + 200
        percentageSmall: 0.4
        percentageLarge: 0.6
        shrink: false
        onStopped: {
            whatToDoWhenAnimFinished()
        }

    }

    //Backboard make
    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_141";
        onStopped:{
            whatToDoWhenAnimFinished()
        }
        onStarted: {
            backboardMakeSoundEffectTimer.start()
        }
        id: backboardAnimation
        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_142";
            RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_143";
                target: basketBall
                properties: "rotation"
                direction: RotationAnimation.Clockwise
                to: 800
                duration: 1600
            }
            SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_144";
                ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_145";
                    SequentialAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_146";
                        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_147";
                            target: basketBall
                            properties: "y"
                            to: 50
                            duration: 1600 * 0.5
                            easing.type: Easing.OutCirc
                        }
                        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_148";
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_149";
                                target: basketBall
                                property: "width"
                                to: 90
                                duration: 1600*0.3
                                easing.type: Easing.InQuad
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_150";
                                target: basketBall
                                property: "height"
                                to: 90
                                duration: 1600*0.3
                                easing.type: Easing.InQuad
                            }

                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_151";
                                target: basketBall
                                properties: "y"
                                to: backboard.y-20
                                duration: 1600*0.3
                                easing.type: Easing.InQuad
                            }
                        }
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_152";
                        target: basketBall
                        properties: "x"
                        to: backboard.x-basketBall.width+20
                        duration: 1600*0.8
                    }
                }
                ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_153";
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_154";
                        target: basketBall
                        property: "y"
                        to: rim.y-15
                        duration: 1600*0.2
                        easing.type: Easing.Linear
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_155";
                        target: basketBall
                        property: "x"
                        duration: 1600*0.2
                        to: rim.x+26
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_156";
                        target: basketBall
                        property: "width"
                        to: 65
                        duration: 1600*0.2
                        easing.type: Easing.Linear
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_157";
                        target: basketBall
                        property: "height"
                        to: 65
                        duration: 1600*0.2
                        easing.type: Easing.Linear
                    }
                    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_158";
                        id: rimRockId
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_159";
                            target: rim
                            property: "rotation"
                            to: 3
                            duration: 1600*0.05
                        }
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_160";
                            target: rim
                            property: "rotation"
                            to: 0
                            duration: 1600*0.05
                        }
                        onFinished: {
                            if(counterr1<2){
                                rimRockId.start();
                                counterr1++;
                            }
                            else
                            {
                                rimRockId.rotation = 0;
                            }
                        }
                    }
                }
            }
        }
        PauseAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_161";
            duration: 400
        }
    }
    //SE
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_37929_162";
        id: backboardMakeSoundEffectTimer
        original:  1280
        onTimedOut: {
            backboardMakeSoundEffect.play()
            backboardMakeSoundEffectTimer2.start()
        }
    }
    Audio{ property string __felgo_live_id_element: "FELGO_ID_37929_163";
        id: backboardMakeSoundEffect
        source:"file:///Users/arjun/Documents/CompetitiveBall/sounds/backboardMissSoundEffectCropped1.mp3"
        volume: Extra.sound*1

    }
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_37929_164";
        id: backboardMakeSoundEffectTimer2
        original:  180
        onTimedOut: {
            backboardMakeSoundEffect2.play()
        }
    }
    Audio{ property string __felgo_live_id_element: "FELGO_ID_37929_165";
        id: backboardMakeSoundEffect2
        source:"file:///Users/arjun/Documents/CompetitiveBall/sounds/splashSoundEffectCropped.mp3"
        volume: Extra.sound*1
        onPlaybackStateChanged: {
            if(playbackState===Audio.PlayingState){
                if(flipable.visible){
                    coinClinkSoundEffect.play()
                }
            }
        }
    }

    //Backboard miss
    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_166";
        onStopped:{
            whatToDoWhenAnimFinished()
        }
        onStarted: {
            backboardMissSoundEffectTimer.start()
        }
        id: backboardMissAnimation
        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_167";
            RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_168";
                target: basketBall
                properties: "rotation"
                direction: RotationAnimation.Clockwise
                to: 800
                duration: 1600*(0.8+0.65)
            }
            SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_169";
                ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_170";
                    SequentialAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_171";
                        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_172";
                            target: basketBall
                            properties: "y"
                            to: 50
                            duration: 1600 * 0.5
                            easing.type: Easing.OutCirc
                        }
                        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_173";
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_174";
                                target: basketBall
                                property: "width"
                                to: 90
                                duration: 1600*0.3
                                easing.type: Easing.InQuad
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_175";
                                target: basketBall
                                property: "height"
                                to: 90
                                duration: 1600*0.3
                                easing.type: Easing.InQuad
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_176";
                                target: basketBall
                                properties: "y"
                                to: backboard.y-20
                                duration: 1600*0.3
                                easing.type: Easing.InQuad
                            }
                        }
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_177";
                        target: basketBall
                        properties: "x"
                        to: backboard.x-basketBall.width+20
                        duration: 1600*0.8
                    }
                }
                ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_178";
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_179";
                        target: basketBall
                        property: "y"
                        to: rim.y+200
                        duration: 1600*0.65
                        easing.type: Easing.InCubic
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_180";
                        target: basketBall
                        property: "x"
                        duration: 1600*0.65
                        to: rim.x-300
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_181";
                        target: basketBall
                        property: "width"
                        to: 110
                        duration: 1600*0.65
                        easing.type: Easing.InCubic
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_182";
                        target: basketBall
                        property: "height"
                        to: 110
                        duration: 1600*0.65
                        easing.type: Easing.InCubic
                    }
                    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_183";
                        id: rimRockId1
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_184";
                            target: rim
                            property: "rotation"
                            to: 3
                            duration: 1600*0.05
                        }
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_185";
                            target: rim
                            property: "rotation"
                            to: 0
                            duration: 1600*0.05
                        }
                        onFinished: {
                            if(counterr1<2){
                                rimRockId1.start();
                                counterr1++;
                            }
                            else
                            {
                                rimRockId1.rotation = 0;
                            }
                        }
                    }
                }
            }
        }
        PauseAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_186";
            duration: 400
        }
    }
    //SE
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_37929_187";
        id: backboardMissSoundEffectTimer
        original:  1200
        onTimedOut: {
            backboardMissSoundEffect.play()
        }
    }
    Audio{ property string __felgo_live_id_element: "FELGO_ID_37929_188";
        id: backboardMissSoundEffect
        source:"file:///Users/arjun/Documents/CompetitiveBall/sounds/backboardMissSoundEffectCropped.mp3"
        volume: Extra.sound*0.64
    }

    //Rim make
    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_189";
        onStarted: {
            rimMakeSoundEffectTimer.start()
        }
        onStopped :{
            whatToDoWhenAnimFinished()
        }
        id: rimMakeAnimation
        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_190";
            RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_191";
                target: basketBall
                properties: "rotation"
                direction: RotationAnimation.Clockwise
                to: 800
                duration: 1600
            }
            SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_192";
                ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_193";
                    SequentialAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_194";
                        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_195";
                            target: basketBall
                            properties: "y"
                            to: 50
                            duration: 1600 * 0.5
                            easing.type: Easing.OutCirc
                        }
                        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_196";
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_197";
                                target: basketBall
                                property: "width"
                                to: 90
                                duration: 1600*0.25
                                easing.type: Easing.InQuad
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_198";
                                target: basketBall
                                property: "height"
                                to: 90
                                duration: 1600*0.25
                                easing.type: Easing.InQuad
                            }

                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_199";
                                target: basketBall
                                properties: "y"
                                to: rim.y-basketBall.height+25
                                duration: 1600*0.25
                                easing.type: Easing.InQuad
                            }
                        }
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_200";
                        target: basketBall
                        properties: "x"
                        to: rim.x-basketBall.width/2+25
                        duration: 1600*0.75
                    }
                }
                ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_201";
                    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_202";
                        id: rimRockId2
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_203";
                            target: rim
                            property: "rotation"
                            to: 3
                            duration: 1600*0.05
                        }
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_204";
                            target: rim
                            property: "rotation"
                            to: 0
                            duration: 1600*0.05
                        }
                        onFinished: {
                            if(counterr1<2){
                                rimRockId2.start();
                                counterr1++;
                            }
                            else
                            {
                                rimRockId2.rotation = 0;
                            }
                        }
                    }
                    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_205";
                        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_206";
                            target: basketBall
                            property: "y"
                            to: 150
                            duration: (1600*0.25)*0.65
                            easing.type: Easing.OutQuad
                        }
                        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_207";
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_208";
                                target: basketBall
                                property: "width"
                                to: 70
                                duration: 1600*0.25*0.75
                                easing.type: Easing.Linear
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_209";
                                target: basketBall
                                property: "height"
                                to: 70
                                duration: 1600*0.25*0.75
                                easing.type: Easing.Linear
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_210";
                                target: basketBall
                                property: "y"
                                to: rim.y-20
                                duration: (1600*0.25)*0.55
                                easing.type: Easing.InQuad
                            }
                        }
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_211";
                        target: basketBall
                        property: "x"
                        to: rim.x+26
                        duration: 1600*0.25
                        easing.type: Easing.Linear
                    }
                }
                PauseAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_212";
                    duration: 400
                }
            }
        }
    }
    //SE
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_37929_213";
        id: rimMakeSoundEffectTimer
        original:  1200
        onTimedOut: {
            rimMakeSoundEffect.play()
        }
    }
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_37929_214";
        id: coinClinkSoundEffectForRimMakeTimer
        original: 300
        onTimedOut: {
            coinClinkSoundEffect.play()
        }
    }
    Audio{ property string __felgo_live_id_element: "FELGO_ID_37929_215";
        id: rimMakeSoundEffect
        source:"file:///Users/arjun/Documents/CompetitiveBall/sounds/rimMakeSoundEffectCropped.mp3"
        volume: Extra.sound*1
        onPlaybackStateChanged: {
            if(playbackState===Audio.PlayingState){
                if(flipable.visible){
                    coinClinkSoundEffectForRimMakeTimer.start()
                }
            }
        }
    }

    //Rim miss
    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_216";
        onStopped:{
            whatToDoWhenAnimFinished()
        }
        onStarted: {
            rimMissSoundEffectTimer.start()
        }
        id: rimMissAnimation
        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_217";
            RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_218";
                target: basketBall
                properties: "rotation"
                direction: RotationAnimation.Clockwise
                to: 800
                duration: 1600*1.7
            }
            SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_219";
                ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_220";
                    SequentialAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_221";
                        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_222";
                            target: basketBall
                            properties: "y"
                            to: 50
                            duration: 1600 * 0.5
                            easing.type: Easing.OutCirc
                        }
                        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_223";
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_224";
                                target: basketBall
                                property: "width"
                                to: 75
                                duration: 1600*0.35
                                easing.type: Easing.InQuad
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_225";
                                target: basketBall
                                property: "height"
                                to: 75
                                duration: 1600*0.35
                                easing.type: Easing.InQuad
                            }

                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_226";
                                target: basketBall
                                properties: "y"
                                to: rim.y-60
                                duration: 1600*0.35
                                easing.type: Easing.InQuad
                            }
                        }
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_227";
                        target: basketBall
                        properties: "x"
                        to: rim.x+50
                        duration: 1600*0.85
                    }
                }

                ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_228";
                    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_229";
                        id: rimRockId3
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_230";
                            target: rim
                            property: "rotation"
                            to: 3
                            duration: 1600*0.05
                        }
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_231";
                            target: rim
                            property: "rotation"
                            to: 0
                            duration: 1600*0.05

                            onFinished: {
                                if(counterr1<2){
                                    rimRockId2.start();
                                    counterr1++;
                                }
                                else
                                {
                                    rimRockId2.rotation = 0;
                                }
                            }
                        }
                        SequentialAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_232";
                            ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_233";
                                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_234";
                                    target: basketBall
                                    property: "width"
                                    to: 115
                                    duration: 1600*0.4
                                    easing.type: Easing.Linear
                                }
                                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_235";
                                    target: basketBall
                                    property: "height"
                                    to: 115
                                    duration: 1600*0.4
                                    easing.type: Easing.Linear
                                }

                                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_236";
                                    target: basketBall
                                    properties: "y"
                                    to: 140
                                    duration: 1600*0.4
                                    easing.type: Easing.OutQuad
                                }
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_237";
                                target: basketBall
                                properties: "y"
                                to: rim.y+150
                                duration: 1600 * 0.45
                                easing.type: Easing.InCubic
                            }
                        }
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_238";
                        target: basketBall
                        properties: "x"
                        to: rim.x-350
                        duration: 1600*0.85
                    }

                }
            }
        }
        PauseAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_239";
            duration: 400
        }
    }
    //SE
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_37929_240";
        id: rimMissSoundEffectTimer
        original:  1290
        onTimedOut: {
            rimMissSoundEffect.play()
            rimMissSoundEffectTimer2.start()
        }
    }
    Audio{ property string __felgo_live_id_element: "FELGO_ID_37929_241";
        id: rimMissSoundEffect
        source:"file:///Users/arjun/Documents/CompetitiveBall/sounds/rimMissSoundEffect2.mp3"
        volume: Extra.sound*0.8

    }
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_37929_242";
        id: rimMissSoundEffectTimer2
        original:  100
        onTimedOut: {
            rimMissSoundEffect2.play()
        }
    }
    Audio{ property string __felgo_live_id_element: "FELGO_ID_37929_243";
        id: rimMissSoundEffect2
        source:"file:///Users/arjun/Documents/CompetitiveBall/sounds/rimMissSoundEffect2.mp3"
        volume: Extra.sound*0.3
    }
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_37929_244";
        id: stateRectId
        state: "notPaused"
        states: [
            State { property string __felgo_live_id_element: "FELGO_ID_37929_245";
                name: "paused"
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_37929_246";
                    target: pauseRectangle
                    visible: true
                }
            },
            State { property string __felgo_live_id_element: "FELGO_ID_37929_247";
                name: "notPaused"
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_37929_248";
                    target: pauseRectangle
                    visible: false
                }
            }
        ]
        transitions: [
            Transition { property string __felgo_live_id_element: "FELGO_ID_37929_249";
                from: "*"
                to: "*"
                ColorAnimation { property string __felgo_live_id_element: "FELGO_ID_37929_250";
                    duration: 500
                }
                NumberAnimation{ property string __felgo_live_id_element: "FELGO_ID_37929_251";
                    property: opacity
                    duration: 500
                }
            }
        ]
    }
}
