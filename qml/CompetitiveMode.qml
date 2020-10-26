import Felgo 3.0
import QtQml.Models 2.2
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Universal 2.12
import Qt.labs.settings 1.0
import QtMultimedia 5.8
//import Qt.labs.qmlmodels 1.0
import QtQuick.Dialogs 1.2
import otherArjun2 1.2
Page { property string __felgo_live_id_component: "FELGO_COMPONENT_ID_38469"; property string __felgo_live_id_element: "FELGO_ID_38469_6773";
    //do stuff in main yay
    function onGoToHalftime(){
        navigationStack.push(halftimeModeComponent)
    }
    function switchFileSignal(){
        navigationStack.pop()
        //starting timer
        thePauseTimer.start()
    }
    visible: true

    width: parent.width
    height: parent.height
    anchors.fill: parent
    title:"Game Mode"
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
    property var levelIndicatorDown: (level!==3)?(29-levelIndicator):(50-levelIndicator)
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
    property int beforeHalftimeScore: 0;
    //for going back after halftime
    property bool shouldStartThirdLevel: shouldBeginThirdLevel
    property bool adScreenHappeningHere: adScreenHappening
    property bool backButtonClickedWhenAdScreenHere: backButtonClickedWhenAdScreen
    property bool adUsed: false
    onBackButtonClickedWhenAdScreenHereChanged: {
        afterGameIsActuallyOver();
    }
    Connections{ property string __felgo_live_id_element: "FELGO_ID_38469_6774";
        target: Extra
        function onGoBackFromHalftime(addedPoints){
            points+=addedPoints
            levelRectangleAnimation.start();
            seqAnimationId.pause()
        }
    }
    Component.onCompleted: {
        console.log("the height is"+root2.height)
        getCurrentMissions()
    }
    //sound effects start here - coin clink
    Audio{ property string __felgo_live_id_element: "FELGO_ID_38469_6775";
        id: coinClinkSoundEffect
        source:"sounds/coinSound.mp3"
        volume: Extra.sound*1
    }
    function afterGameIsActuallyOver(){
        //this used to be above
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

            if(points>=mMissionModel.get(16).neededThings&&checkIfCurrentMission(16)){
                mMissionModel.get(16).currentThings=mMissionModel.get(16).neededThings
            }
            else if((points>mMissionModel.get(16).currentThings&&checkIfCurrentMission(16))){
                mMissionModel.get(16).currentThings=points
            }
            if (checkIfCurrentMission(14)&&!(mMissionModel.get(14).currentThings>=mMissionModel.get(14).neededThings)){
                let x = false
                for(let i = 0; i < counter14.length; i++){
                    if(Extra.ballSource===counter14[i]){
                        x=true;
                        break;
                    }
                }
                if(x===false){
                    counter14.push(Extra.ballSource);
                    if(counter14.length===mMissionModel.get(14).neededThings){
                        mMissionModel.get(14).currentThings=mMissionModel.get(14).neededThings
                    }
                    if(counter14.length===mMissionModel.get(14).currentThings){
                        mMissionModel.get(14).currentThings=counter14.length
                    }
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
            counterLast=0;
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
        adUsed = false
        //used to be above ended
    }

    //sound effects start here - mvp
    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6776";
        id: fadeIn
        target: mvpSoundEffect
        property: "volume"
        from:0.0
        to:0.8*Extra.volume
        duration: 300
        easing.type: Easing.Linear
    }
    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6777";
        id: fadeOut
        target: mvpSoundEffect
        property: "volume"
        from:0.8*Extra.volume
        to:0.001*Extra.volume
        duration: 300
        easing.type: Easing.Linear
        onFinished:{
            mvpSoundEffect.stop()
            mvpSoundEffect.volume=0.0
        }
    }
    property bool mvpSoundEffectPlaying: false
    Audio{ property string __felgo_live_id_element: "FELGO_ID_38469_6778";
        id: mvpSoundEffect
        source:"sounds/mvpSoundEffect.mp3"
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
        //        if(!retryBox.visible){
        if((!newRetryCircle.visible&&!retryBox.visible)){
            if(stateRectId.state==="notPaused" && level!==3){
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
    property var counterLast: 0;

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
    property var animationsToCheck: [levelRectangleAnimation,airBallAnimation,splashAnimation,rimMakeAnimation,rimMissAnimation,backboardMissAnimation,backboardAnimation,coinAnim,mPauseAnim];
    property var animationsToReplay:[]
    function whatToDoWhenDoubleClicked(){
        function pauseAllAnim()
        {
            animationsToReplay=[]
            for (let k = 0; k< animationsToCheck.length; k++){
                if(animationsToCheck[k].running){
                    animationsToCheck[k].pause();
                    animationsToReplay.push(animationsToCheck[k])
                }
            }
            wasSecRunning=false;
            if(seqAnimationId.running){
                seqAnimationId.pause()
                wasSecRunning=true
            }
            //se
            timersToReplay=[]
            for (let q = 0; q< timerToCheck.length; q++){
                if(timerToCheck[q].running){
                    console.log("One timer running here"+ "this is a q value"+ q+ "       "+timerToCheck[q])
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
            if(wasSecRunning)
                seqAnimationId.resume()
            for (let k = 0; k< animationsToReplay.length; k++){
                animationsToReplay[k].resume();
            }
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
    MouseArea{ property string __felgo_live_id_element: "FELGO_ID_38469_6779";
        anchors.fill: parent
        onClicked: {
            if(!newFadedRed.visible){
                if(levelRectangleAnimationPause.running)
                {
                    levelRectangleAnimationPause.complete()
                }
                else if(levelRectangleAnimation.running){
                    levelRectangleAnimation.complete()
                    levelRectangleAnimationPause.complete()
                }
            }
        }

        onDoubleClicked:{
            whatToDoWhenDoubleClicked();
        }
    }
    //Pause state rectangle
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6780";
        anchors.fill: parent
        id: pauseRectangle
        z: 100
        visible: true
        color: "#000000"
        opacity: 0.81
        anchors.centerIn: parent
        onVisibleChanged: {
            if(visible&&(retryBox.visible||newRetryCircle.visible)){
                visible=false
            }
        }

        Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6781";
            width: 552*4/5*1.45
            height: 452*4/5*1.45
            anchors.centerIn: parent
            source: "images/pauseButton.png"
        }
    }
    onShouldStartThirdLevelChanged: {
        if(shouldStartThirdLevel===true){
            sliderId.enabled=true;
            whatToDoWhenAnimFinished.whatToDoForNextLevel();
            shouldBeginThirdLevel=false
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
        whatToDoWhenAnimFinished.whatToDoForNextLevel = whatToDoForNextLevel;
        //fix ball
        basketBall.width=140
        basketBall.height=140
        basketBall.y = root2.height-basketBall.height-50;
        basketBall.x=33;
        basketBall.rotation = 0

        //general check
        flashingScoreText.opacity=0;
        if(mvpSoundEffectPlaying){
            fadeOut.start();
            mvpSoundEffectPlaying=false
        }
        //Check if three misses- if game is over
        //If you lose it all...
        if(manyMisses==3)
        {
            if(seqAnimationId.running)
                seqAnimationId.pause()
            if(mPauseAnim.running)
                mPauseAnim.pause()
            sliderId.enabled=false;
            insideRectangleMouseArea.enabled=false
            insideTheSliderRectangleMouseArea.enabled=false
            //            retryBox.visible= true;
            if(!adUsed)
                newRetryCircle.visible=true
            //            fadedRED.visible=true;
            else{
                retryBox.visible=true
            }

            newFadedRed.visible=true
            adScreenHappening=true;
            return;
            // mMusic1.stop()
        }
        //General thing to do if MAKE for AFTER THE ANIMATION IS FINISHED
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
            mDuration-=18/*29*/ /*42*/
            insideRectangleMouseArea.enabled = true; insideTheSliderRectangleMouseArea.enabled = true
            if(levelIndicator > 29)
            {
                whatToDoForNextLevel()
                mDuration=1210
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
            var options = [Easing.Linear, Easing.InQuad, Easing.OutQuad, Easing.InOutCubic, Easing.OutCubic, Easing.InQuart, Easing.OutQuart, Easing.OutQuint, Easing.InOutQuint, Easing.InSine, Easing.OutSine, Easing.InExpo, Easing.OutInExpo, Easing.OutCirc, Easing.OutInCirc, Easing.InOutElastic, Easing.OutElastic, Easing.OutBack, Easing.OutInBack, Easing.InBack, Easing.InBounce, Easing.OutBounce,Easing.InOutBounce, /*Easing.OutInBounce,*/ Easing.BezierCurve]
            sliderEasingType=options[Math.floor((Math.random() * 28))];
            console.log("Easing type"+Math.floor((Math.random() * 28)))
            sliderId.value=200;
            mDuration-=26/*39*/;
            insideRectangleMouseArea.enabled = true;insideTheSliderRectangleMouseArea.enabled = true
            if(levelIndicator >29)
            {
                sliderId.enabled=false;
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
                //head to halftime yay!
                onGoToHalftime()
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
            delayTimer.start()
            coinProb = 4;
            mPauseAnim.duration-=20;
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
    //delay timer
    Timer{ property string __felgo_live_id_element: "FELGO_ID_38469_6782";
        id: delayTimer
        interval: 1000
        onTriggered: {
            handleId.visible=false;
            sliderId.enabled=true;
        }
    }

    //Images start here
    //Sky
    Rectangle { property string __felgo_live_id_element: "FELGO_ID_38469_6783";
        Component.onCompleted: {
            //Used to show level one message
            levelRectangleAnimation.start()
        }
        id: sky
        anchors.top: parent.top
        anchors.bottom: ground.top
        width: parent.width
        color:"blue"
        gradient: Gradient { property string __felgo_live_id_element: "FELGO_ID_38469_6784";
            GradientStop { property string __felgo_live_id_element: "FELGO_ID_38469_6785"; id: skyStartGradient ;position: 0.0; color: "#0080FF" }
            GradientStop { property string __felgo_live_id_element: "FELGO_ID_38469_6786"; id: skyEndGradient ;position: 1.0; color: "#66CCFF"}
        }
    }
    //pointing finger
    //pointer finger associated text
    Text{ property string __felgo_live_id_element: "FELGO_ID_38469_6787";
        id: explanationTutorialText
        text: "Click anywhere in the white"
        wrapMode: Text.Wrap
        font.pointSize: 14
        color: "black"
        font.bold: true
        font.family: "Century Gothic"
        width: 170
        horizontalAlignment: Text.AlignHCenter
        //        visible: pointingFinger.visible
        visible: false
        anchors.horizontalCenter: pointingFinger.horizontalCenter
        z:5
        y:0                 //doesnt matter
        Component.onCompleted: {
            this.y= pointingFinger.y-width+15
        }
    }
    Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6788";
        visible: false;
        z:5
        id: pointingFinger
        width: 414*1/6*1.6;
        height: 600*1/6*1.6;
        x: insideContainerId.x+insideContainerId.width/2-width/2
        y: insideContainerId.y+50-height;
        source: "images/pointingPicture.png"
        onVisibleChanged: {
            //start the animation once it is visible
            pointingFingerAnim.start()
        }
        onYChanged: {
            if(y===(insideContainerId.y+25-height-2)||y===(insideContainerId.y+25-height+32))
                pointingFingerAnim.restart()
        }

        SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6789";
            id: pointingFingerAnim
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6790";
                id: pointingFingerAnimFront
                target: pointingFinger
                property: "y"
                to:insideContainerId.y+25-pointingFinger.height+20;
                duration: 300
                easing.type: Easing.Linear
            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6791";
                id: pointingFingerAnimBack
                target: pointingFinger
                property: "y"
                to:(insideContainerId.y+25-pointingFinger.height-2)
                duration: 300
                easing.type: Easing.Linear
            }
        }
    }
    //Ground
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6792";
        id: ground
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        height: 500
        width: parent.width
        gradient: Gradient { property string __felgo_live_id_element: "FELGO_ID_38469_6793";
            GradientStop { property string __felgo_live_id_element: "FELGO_ID_38469_6794"; id: groundStartGradient; position: 0.0; color: "#00FF00"}
            GradientStop { property string __felgo_live_id_element: "FELGO_ID_38469_6795";id: groundEndGradient; position: 1.0; color: "#00803F"}
        }
    }
    //Hoop
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6796";
        z:4
        y:200
        id: backboard;
        height: 160*1.38;
        width:12*1.38
        color: "darkgray"
        border.width: 1
        border.color: "black"
        anchors.right: parent.right
    }
    Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6797";
        z:4
        id: rim
        source: "images/basketballHoop2.png"
        anchors.right: backboard.left
        y: backboard.y+(backboard.height*2/3)
        width: 150*1.38
        height: 110*1.38
    }
    //Sun
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6798";
        visible: true
        id: sun
        radius: 130
        x:100
        y:100
        width:180
        height:180
        color: "yellow"
        Text{ property string __felgo_live_id_element: "FELGO_ID_38469_6799";
            id: onSunLevelText
            font.pointSize: 22
            text: "Level: " + level;
            anchors.centerIn: parent
            color: "black"
            font.bold: true
            font.underline: true
            font.family: "Century Gothic"
            wrapMode: Text.Wrap
        }
        Text{ property string __felgo_live_id_element: "FELGO_ID_38469_6800";
            id: onSunLevelText1
            font.pointSize: 23
            text: levelIndicatorDown;
            y: onSunLevelText.y+onSunLevelText.height+5
            color: "black"
            font.family: "Stencil"
            wrapMode: Text.Wrap
            anchors.horizontalCenter: onSunLevelText.horizontalCenter
        }
    }
    //Coin counter thingy
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6801";
        Row{ property string __felgo_live_id_element: "FELGO_ID_38469_6802";
            spacing: 20;
            x: 10
            y:10
            Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6803";
                width: 35
                height: 35
                source: "images/coinFront.png"
            }
            Text{ property string __felgo_live_id_element: "FELGO_ID_38469_6804";
                property int theText: Extra.numCoins
                text: theText
                font.family: "Stencil"
                horizontalAlignment: Text.AlignHCenter
                font.pointSize:21
            }
        }
    }
    //the coin with anim
    Flipable { property string __felgo_live_id_element: "FELGO_ID_38469_6805";
        visible: false
        x: rim.x+90
        y:rim.y+17
        id: flipable
        property bool flipped: false
        front: Image { property string __felgo_live_id_element: "FELGO_ID_38469_6806"; //--> collapse
            width: 62.5
            height: 62.5
            anchors.centerIn: parent
            source: "images/coinFront.png"
        }
        back: Image { property string __felgo_live_id_element: "FELGO_ID_38469_6807"; //--> collapse
            width: 62.5
            height: 62.5
            anchors.centerIn: parent
            source: "images/coinBack.png"
        } //<-- collapse

        transform: Rotation { property string __felgo_live_id_element: "FELGO_ID_38469_6808";
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: flipable.flipped ? 180 : 0
            onAngleChanged: {
                if(angle === 180 || angle ===0){
                    if(flipable.visible)
                        flipable.flipped = !flipable.flipped
                }
            }

            Behavior on angle { property string __felgo_live_id_element: "FELGO_ID_38469_6809";
                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6810";
                    duration: 500
                }
            }
        }

        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6811";
            id: coinAnim
            onFinished:{
                flipable.visible = false;
                flipable.x= rim.x+90
                flipable.y = rim.y+17
                flipable.back.height = 62.5;
                flipable.back.width = 62.5;
                flipable.front.width = 62.5;
                flipable.front.height = 62.5;
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

            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6812";
                target: flipable.back
                property: "width"
                duration: 500
                to:35
            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6813";
                target: flipable.back
                property: "height"
                duration: 500
                to:35
            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6814";
                target: flipable.front
                property: "width"
                duration: 500
                to:35
            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6815";
                target: flipable.front
                property: "height"
                duration: 500
                to:35
            }
            PathAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6816";
                id: pathAnim
                duration: 1000
                target: flipable
                orientation: PathAnimation.TopFirst
                anchorPoint: Qt.point(flipable.width/2,
                                      flipable.height/2)
                path: Path { property string __felgo_live_id_element: "FELGO_ID_38469_6817";
                    startX:rim.x+90 ; startY: rim.y+17
                    PathCurve { property string __felgo_live_id_element: "FELGO_ID_38469_6818";
                        x: 22
                        y: 22
                    }
                }
            }
        }

    }
    //basketball
    Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6819";
        z:3
        id: basketBall
        y:root2.height-basketBall.height-50
        x:33;
        width: 140
        height: 140
        source: Extra.ballSource
    }
    //feedback label
    Label{ property string __felgo_live_id_element: "FELGO_ID_38469_6820";
        id: feedbackLabel
        font.family: "Century Gothic"
        text: "dda"
        z: 2
        width: 250
        wrapMode: Label.Wrap
        x: parent.width - width-20
        y: 20
        font.pointSize: 22
        visible: false
    }
    //level animation/rectangle
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6821";
        id: levelRectangle
        anchors.centerIn: parent
        width: 1
        height: 1
        z:100;
        color: "#f7fafc"
        radius: 20;
        visible: false;

        Text{ property string __felgo_live_id_element: "FELGO_ID_38469_6822";
            anchors.horizontalCenter: parent.horizontalCenter
            id: levelRectangleText1
            text: "Level " + level
            font.pointSize: 1;
            font.family: "Bodoni MT Black"
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }
        Text{ property string __felgo_live_id_element: "FELGO_ID_38469_6823";
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
            font.pointSize: 18;
            font.family: "Century Gothic"
            wrapMode: Text.Wrap
            width: parent.width-30
            lineHeight: 1.32
            y: levelRectangleText1.y+levelRectangleText1.implicitHeight+30
            anchors.horizontalCenter: parent.horizontalCenter
            visible:false
        }

        ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6824";
            id: levelRectangleAnimation
            onStarted: {
                levelRectangle.visible = true;
                seqAnimationId.pause();
            }
            onFinished: {
                //Making bottom text appear
                levelRectangleText.visible=true
                levelRectangleAnimationPause.start()

            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6825";
                target: levelRectangleText1
                property: "font.pointSize"
                duration: 800
                easing.type: Easing.Linear
                to:36
            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6826";
                target: levelRectangle
                property: "width"
                duration: 800
                easing.type: Easing.Linear
                to: (root2.width*4/5)*7/10
            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6827";
                target: levelRectangle
                property: "height"
                duration: 800
                easing.type: Easing.Linear
                to: root2.height*3/7
            }
        }
        PauseAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6828";
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
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6829";
        id:fadedRED
        z:19
        anchors.fill: parent
        color: "red"
        opacity: 0.20
        visible: false
    }
    //new faded fadedRED
    //faded Red
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6830";
        id:newFadedRed
        z:10
        anchors.fill: parent
        color: "#b07979"
        opacity: 0.4
        visible: false
    }
    property bool quitButtonWasClicked: false
    //newRetryCircle
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6831";
        z:30
        visible: false
        id: newRetryCircle
        color: "transparent"
        anchors.centerIn: parent
        CircularProgress{ property string __felgo_live_id_element: "FELGO_ID_38469_6832";
            id: circularProgress
            y: 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -150
        }
        Button{ property string __felgo_live_id_element: "FELGO_ID_38469_6833";
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
                adUsed=true
                quitButtonWasClicked=true
                newRetryCircle.visible=false
                newFadedRed.visible=false
                adScreenHappening=false
                //                    // show the new video if user is below 10 credits
                //                    myRewardedVideo.showRewardedVideoIfLoaded()
                //                    // load a new video every time it got shown, to give the user a fresh ad
                //                    myRewardedVideo.loadRewardedVideo()
                //all of this should be after onRewardedVideoRewarded but this is for testing
                sliderId.enabled=true;
                insideRectangleMouseArea.enabled=true
                insideTheSliderRectangleMouseArea.enabled=true
                flashingScoreText.color="black"
                manyMisses=0
                x1.visible=false
                x2.visible=false
                x3.visible=false
                whatToDoWhenAnimFinished()
            }
            y: circularProgress.y+circularProgress.height+50
            id: newMissionsAdButton
            anchors.horizontalCenter: parent.horizontalCenter
            height: 55*1.3
            width: 140*2*1.3
            z:5
            Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6834";
                anchors.fill: parent
                color: "#2e8ddb"
            }
            Row{ property string __felgo_live_id_element: "FELGO_ID_38469_6835";
                x:10
                anchors.verticalCenter: parent.verticalCenter
                anchors.centerIn: parent
                Text{ property string __felgo_live_id_element: "FELGO_ID_38469_6836";
                    anchors.verticalCenter: parent.verticalCenter
                    color: "White"
                    font.family: "Swis721 Cn BT"
                    font.bold: true
                    font.pointSize: 28
                    text:"Continue"
                }
                Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6837";
                    width: 15*1.3
                    height: 2*1.3
                    color: "transparent"
                }
                //video pic
                Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6838";
                    anchors.verticalCenter: parent.verticalCenter
                    width: 50*1.3
                    height: 35*1.3
                    source: "images/PlayAdVideo.png"
                }
            }
        }
        Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6839";
            z:4
            visible: newMissionsAdButton.visible;
            id: newMissionsAdButtonFade
            width: newMissionsAdButton.width
            height: newMissionsAdButton.height
            y: newMissionsAdButton.y+5
            x: newMissionsAdButton.x-5
            color: "#18549e"
        }
        Button{ property string __felgo_live_id_element: "FELGO_ID_38469_6840";
            onClicked: {
                afterGameIsActuallyOver()
                quitButtonWasClicked=true
                seqAnimationId.stop()
                levelRectangleAnimation.start()
                x1.visible=false; x2.visible = false; x3.visible = false;
                newRetryCircle.visible=false
                newFadedRed.visible=false
                adScreenHappening=false
            }
            y: newMissionsAdButton.y+newMissionsAdButton.height+50
            id: quitRetryCircleButton
            anchors.horizontalCenter: parent.horizontalCenter
            height: newMissionsAdButton.height
            width: newMissionsAdButton.width
            z:5
            Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6841";
                anchors.fill: parent
                color: "#a8aeb3"
            }
            Row{ property string __felgo_live_id_element: "FELGO_ID_38469_6842";
                x:10
                anchors.verticalCenter: parent.verticalCenter
                anchors.centerIn: parent
                Text{ property string __felgo_live_id_element: "FELGO_ID_38469_6843";
                    anchors.verticalCenter: parent.verticalCenter
                    color: "White"
                    font.family: "Swis721 Cn BT"
                    font.bold: true
                    font.pointSize: 28

                    text:"Retry"
                }
                Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6844";
                    width: 15*1.3
                    height: 2*1.3
                    color: "transparent"
                }
                //undo button
                Icon{ property string __felgo_live_id_element: "FELGO_ID_38469_6845";
                    anchors.verticalCenter: parent.verticalCenter
                    size: 45*1.3
                    icon: IconType.undo
                }
            }
        }
        Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6846";
            z:4
            visible: quitRetryCircleButton.visible;
            id: quitRetryCircleButtonFade
            width: quitRetryCircleButton.width
            height: quitRetryCircleButton.height
            y: quitRetryCircleButton.y+5
            x: quitRetryCircleButton.x-5
            color: "#656a6e"
        }
    }
    //retry box
    signal quitButtonClicked
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6847";
        onVisibleChanged: {
            seqAnimationId.stop()
            if(visible)
                newFadedRed.visible=true
            else
                newFadedRed.visible=false
        }

        visible: false
        width: parent.width*2/3
        height:parent.height*1/3
        anchors.centerIn: parent
        z:20
        id: retryBox
        radius:20
        gradient: Gradient{ property string __felgo_live_id_element: "FELGO_ID_38469_6848";
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6849";position: 0.0; color: "#2e8ddb"/*"#f52a2a"*/}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6850";position: 0.5; color: "#ffffff"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6851";position: 1.0; color: "#2e8ddb"/*"#f52a2a"*/}
        }
        Column{ property string __felgo_live_id_element: "FELGO_ID_38469_6852";
            x:0
            y:0
            width:parent.width
            spacing:10
            Text{ property string __felgo_live_id_element: "FELGO_ID_38469_6853";
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Bodoni MT Black"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 34
                width: parent.width
                text: "You lost!"
            }
            Text{ property string __felgo_live_id_element: "FELGO_ID_38469_6854";
                x:10
                width: parent.width-20
                font.family: "Century Gothic"
                font.pointSize: 17.5
                wrapMode: Text.Wrap
                text:"     Please try again! Remember 3 missed shots and you are out"
            }
            Row{ property string __felgo_live_id_element: "FELGO_ID_38469_6855";
                x:60
                spacing:25
                anchors.horizontalCenter: parent.horizontalCenter
                Button { property string __felgo_live_id_element: "FELGO_ID_38469_6856";
                    anchors.verticalCenter: parent.verticalCenter
                    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6857";
                        anchors.fill: parent
                        color: okButton.pressed?"#233ab8" : "#3F51B5"
                    }
                    Text{ property string __felgo_live_id_element: "FELGO_ID_38469_6858";
                        anchors.centerIn: parent
                        font.pointSize: 20
                        text: "Retry"
                        color: "White"
                        font.family: "Century Gothic"
                    }
                    id: okButton
                    height: 115
                    width: 200
                    onClicked: {
                        seqAnimationId.stop()
                        levelRectangleAnimation.start()
                        x1.visible=false; x2.visible = false; x3.visible = false;
                        retryBox.visible=false
                        retryScreenHappening=false
                    }
                }
                Button { property string __felgo_live_id_element: "FELGO_ID_38469_6859";
                    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6860";
                        anchors.fill: parent
                        color: cancelButton.pressed?"#233ab8" : "#3F51B5"
                    }
                    Text{ property string __felgo_live_id_element: "FELGO_ID_38469_6861";
                        anchors.centerIn: parent
                        font.pointSize: 20
                        text: "Quit"
                        color: "White"
                        font.family: "Century Gothic"
                    }
                    id: cancelButton
                    width: okButton.width*0.7
                    height: okButton.height*0.7
                    onClicked: {
                        retryBox.visible=false
                        fadedRED.visible=false
                        switchFileSignal()
                    }
                }
                //                Button{

                //                    height: 150
                //                    width: 220
                //                    Text{
                //                        color: "#ed912f"
                //                        text: "RETRY"
                //                        font.bold: true
                //                        font.pointSize: 23
                //                        anchors.centerIn: parent
                //                    }
                //                    onClicked: {
                //                        seqAnimationId.stop()
                //                        levelRectangleAnimation.start()
                //                        x1.visible=false; x2.visible = false; x3.visible = false;
                //                        retryBox.visible=false
                //                        retryScreenHappening=false
                //                    }
                //                }
                //                Button{
                //                    id: quitButton
                //                    anchors.verticalCenter: parent.verticalCenter
                //                    width: 140
                //                    Text{
                //                        color: "#ed912f"
                //                        text: "QUIT"
                //                        font.pointSize: 20
                //                        anchors.centerIn: parent
                //                    }
                //                    onClicked: {
                //                        retryBox.visible=false
                //                        fadedRED.visible=false
                //                        switchFileSignal()
                //                    }
                //                }
            }
        }
    }

    //    //Giant x
    //    Image{
    //        visible: false
    //        z:20
    //        id: giantX;
    //        anchors.centerIn: parent
    //        source: "images/xSymbol.png"
    //        height: 600*1.3;
    //        width: 515*1.3;
    //    }

    //All three of the x's
    Row{ property string __felgo_live_id_element: "FELGO_ID_38469_6862";
        id: threeMissesX
        anchors.bottom: scoreId.top
        x: scoreId.x +35
        Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6863";
            visible: false;
            id: x1
            height: 45*1.4;
            width: 30*1.4;
            source: "images/xSymbol.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6864";
            visible: false
            id: x2
            height: 45*1.4;
            width: 30*1.4;
            source: "images/xSymbol.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6865";
            visible: false
            id: x3
            height: 45*1.4;
            width: 30*1.4;
            source: "images/xSymbol.png"
        }
    }
    //All ten of the lines
    Row{ property string __felgo_live_id_element: "FELGO_ID_38469_6866";
        id: allMakeTallies11
        anchors.bottom: scoreId.top
        x: scoreId.x +35
        Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6867";
            visible: false;
            id: tally1
            height: 250/3.7*1.3;
            width: 37/3.7*1.3;
            source: "images/oneTallyMark.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6868";
            visible: false
            id: tally2
            //            height: 50;
            //            width: 10;
            height: 250/3.7*1.3;
            width: 37/3.7*1.3;
            source: "images/oneTallyMark.png"        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6869";
            visible: false
            id: tally3
            height: 250/3.7*1.3;
            width: 37/3.7*1.3;
            source: "images/oneTallyMark.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6870";
            visible: false;
            id: tally4
            height: 250/3.7*1.3;
            width: 37/3.7*1.3;
            source: "images/oneTallyMark.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6871";
            visible: false
            id: tally5
            height: 250/3.7*1.3;
            width: 37/3.7*1.3;
            source: "images/oneTallyMark.png"
            transform: Rotation{ property string __felgo_live_id_element: "FELGO_ID_38469_6872";
                id: rotateImagePhoto
                angle: 326
                origin.x: tally5.width/2
                origin.y: tally5.height
            }
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6873";
            visible: false
            id: tally6
            height: 250/3.7*1.3;
            width: 37/3.7*1.3;
            source: "images/oneTallyMark.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6874";
            visible: false;
            id: tally7
            height: 250/3.7*1.3;
            width: 37/3.7*1.3;
            source: "images/oneTallyMark.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6875";
            visible: false
            id: tally8
            height: 250/3.7*1.3;
            width: 37/3.7*1.3;
            source: "images/oneTallyMark.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6876";
            visible: false
            id: tally9
            height: 250/3.7*1.3;
            width: 37/3.7*1.3;
            source: "images/oneTallyMark.png"
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6877";
            visible: false
            id: tally10
            height: 250/3.7*1.3;
            width: 37/3.7*1.3;
            source: "images/oneTallyMark.png"
            transform: Rotation{ property string __felgo_live_id_element: "FELGO_ID_38469_6878";
                id: rotateImagePhoto2
                angle: 326
                origin.x: tally10.width/2
                origin.y: tally10.height
            }
        }
        Image{ property string __felgo_live_id_element: "FELGO_ID_38469_6879";
            anchors.verticalCenter: parent.verticalCenter
            visible: false
            id: plus11
            height: 40*1.3;
            width: 40*1.3;
            source: "images/plusSign.png"
        }
    }

    //Score and PB rectangle
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6880";
        id: flashingScore
        width: scoreId.width*1/2
        height: scoreId.height*3/2
        z:6
        color: "transparent"
        //border.color: "black" //no need for border
        x: scoreId.x-scoreId.width/2-10
        anchors.verticalCenter: scoreId.verticalCenter
        Text{ property string __felgo_live_id_element: "FELGO_ID_38469_6881";
            id: flashingScoreText
            opacity: 0;
            color: "black"
            x: 1
            y: 1
            text:"apples are cool"
            rotation: 0
            font.family: "Snap ITC"
            font.pointSize: 19
        }

        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6882";
            id: flashingScoreAnim
            target: flashingScoreText
            property: "opacity"
            duration: 300
            easing.type: Easing.Linear
            to: 1;
        }
    }

    //Box in the corner with score and PB
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6883";
        z:2
        id: scoreId
        width: 180
        height: 140
        radius: 28
        border.color: "#134f13"
        border.width: 3
        x: rim.x-30
        y: ground.y + 24

        Text{ property string __felgo_live_id_element: "FELGO_ID_38469_6884";
            property int value: points
            id: pointText
            text: value
            Behavior on value { property string __felgo_live_id_element: "FELGO_ID_38469_6885";
                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6886"; duration: 500; easing.type: Easing.InOutQuad }
            }
            font.pointSize: 28
            y: 10
            color: "black"
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Impact"
        }

        Text{ property string __felgo_live_id_element: "FELGO_ID_38469_6887";
            text: "PB: " + Extra.personalBest;
            font.pointSize: 20
            font.bold: true
            font.family: "Stencil"
            anchors.top: pointText.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }

        gradient: Gradient{ property string __felgo_live_id_element: "FELGO_ID_38469_6888";
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6889";position: 0 ;color: "#faf5f5"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6890";position: 1/7 ;color: "#bfe6b1"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6891";position: 2/7 ;color: "#faf5f5"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6892";position: 3/7 ;color: "#bfe6b1"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6893";position: 4/7 ;color: "#faf5f5"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6894";position: 5/7 ;color: "#bfe6b1"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6895";position: 6/7 ;color: "#faf5f5"}
            GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6896";position: 1 ;color: "#bfe6b1"}
        }
    }

    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6897";
        id: insideContainerId
        color: "#dfedf2"
        opacity: 0.95
        width: 510
        height: 170
        radius: 12
        //        anchors.horizontalCenter: sliderId.horizontalCenter
        //        anchors.verticalCenter: sliderId.verticalCenter
        x: parent.width/2-width/2+80
        y: parent.height-ground.height/2-height/2+40
        signal sliderStopped(double value);
        onSliderStopped: {
            //normal setting upp stuff
            basketBall.width=140
            basketBall.height=140
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
            function lastMissionCheck(shotShot){
                function typeOfShot(shotShot){
                    var correctShot = typeOfShot[shotRandomNumber]
                    if(correctShot===shotShot){
                        return true;
                    }
                    return false;
                }
                let last= mMissionModel.get(17)
                if(typeOfShot(shotShot)){
                    if(level===levelOptions[levelRandomNumber]){
                        counterLast++;
                        if(counterLast===mMissionModel.get(last).neededThings&&!(mMissionModel.get(last).currentThings>=mMissionModel.get(last).neededThings)){
                            mMissionModel.get(last).currentThings=counterLast
                        }
                    }
                }
                else{
                    if(level===levelOptions[levelRandomNumber]){
                        if(counterLast>mMissionModel.get(last).currentThings&&!(mMissionModel.get(last).currentThings>=mMissionModel.get(last).neededThings)){
                            mMissionModel.get(last).currentThings=counterLast;
                        }
                        counterLast=0;
                    }

                }
            }
            if(level3ShotAccuracy==="airball"|| level3ShotAccuracy==="null"&&(value <80  || value > 920)){
                if(true){
                    //all mission stuff
                    lastMissionCheck("airball")
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
                feedback = ["Seriously, you can do better", "An airball?", "You are supposed to shoot it into the hoop", "My dog can shoot better than that", "A complete fail...", "Practice makes perfect...you need practice!"]
                random_number = Math.floor((Math.random() * 6));
                feedbackLabel.font.italic = true;
            }
            else if(level3ShotAccuracy==="backboardMiss"|| level3ShotAccuracy==="null"&&(value <180 || value >820)){
                if(true){
                    //all mission stuff
                    lastMissionCheck("backboardMiss")
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
                    lastMissionCheck("rimMiss")
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
                feedback = ["Brick", "Close but not yet there", "Hit the net next time, not the rim", "Closer than ever", "You'll do it next time", "Good try!", "Close but not there", "Seems like you have started practicing..."]
                random_number = Math.floor((Math.random() * 5));
            }
            else if(level3ShotAccuracy==="backboardMake"|| level3ShotAccuracy==="null"&&(value < 350 || value >650)){
                if(true){
                    //all mission stuff
                    lastMissionCheck("backboard")
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
                points +=30*level;
                pointsThisRound += 30;
                backboardAnimation.start()
                feedback = ["Good shot","A make is a make", "A splash is a splash", "Lucky shot??", "Banks don't count...try again", "You can do even better", "Atleast it made"]
                random_number = Math.floor((Math.random() * 7));
            }
            else if(level3ShotAccuracy==="rimMake"|| level3ShotAccuracy==="null"&&(value <415 || value > 585)){
                if(true){
                    //all mission stuff
                    lastMissionCheck("rim")
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
                points+=50*level
                pointsThisRound += 50;
                rimMakeAnimation.start()
                feedback = ["I thought that was going to miss", "The rim was on your side", "Looks like you are on a set path to the NBA", "Amazing shot!", "Pretty nice!", "Actually pretty good"]
                random_number = Math.floor((Math.random() * 5));
            }
            else if(level3ShotAccuracy==="splash"|| level3ShotAccuracy==="null"&&(value <485|| value>515)){
                if(true){
                    //all mission stuff
                    lastMissionCheck("splash")
                    //0
                    counter0++;
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
                points+= 110*level
                pointsThisRound += 110;
                splashAnimation.start()
                feedback = ["Next MVP?","Future NBA champ","The next Steph Curry?", "Splashing it like Klay Thompson?", "What an amazing shot?", "Making some splashes", "All the way from deep?", "Swish!", "Like a true nba player"]
                random_number = Math.floor((Math.random() * 7));
            }
            else{
                //need these stuffy here for if statement to check for make the work
                if(true){
                    //all mission stuff
                    lastMissionCheck("splash")
                    //0
                    counter0++;
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
                points+= 150*level
                pointsThisRound +=150;
                splashAnimation.start()
                feedback = ["The GOAT?", "May be the greatest shot ever", "Game winner!", "Buzzer beater", "MVP", "Champion"]
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
        Timer{ property string __felgo_live_id_element: "FELGO_ID_38469_6898";
            id: isDoubleClickTimer
            interval:1550 //should be 500 maybe
        }

        Connections{ property string __felgo_live_id_element: "FELGO_ID_38469_6899";
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
        MouseArea{ property string __felgo_live_id_element: "FELGO_ID_38469_6900";
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
        Slider{ property string __felgo_live_id_element: "FELGO_ID_38469_6901";
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
            value: 200;
            width: 480;
            height: 30;
            enabled:insideRectangleMouseArea.enabled;
            MouseArea{ property string __felgo_live_id_element: "FELGO_ID_38469_6902";
                id: insideTheSliderRectangleMouseArea
                enabled: false;
                anchors.fill: parent
                propagateComposedEvents: true
                onClicked: {
                    whatToDoInsideRectangleMA()
                    if(level===3){
                        enabled=false
                        mouse.accepted.false
                    }
                }
                onDoubleClicked:{
                    mouse.accepted=false;
                }
            }
            background: Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_6903";
                implicitHeight: 6
                height: implicitHeight
                radius: 8
                gradient: Gradient{ property string __felgo_live_id_element: "FELGO_ID_38469_6904";
                    orientation: Gradient.Horizontal
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6905";position: 0.0; color: (level===3)?colors[0]:"#cf3732"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6906";position: (level===3)?0.1428:0.2; color:(level===3)?colors[0]:"#db8d44"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6907";position: (level===3)?0.1429:0.35; color:(level===3)?colors[1]:"#e3d430"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6908";position: (level===3)?0.2857:0.5; color:(level===3)?colors[1]:"#29c910"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6909";position: (level===3)?0.2858:0.65; color:(level===3)?colors[2]:"#e3d430"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6910";position: (level===3)?0.4286:0.8; color:(level===3)?colors[2]:"#db8d44"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6911";position: (level===3)?0.4287:1.0; color:(level===3)?colors[3]:"#cf3732"}
                    //below ones not used until level 3
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6912";position: (level===3)?0.5714:1.1; color:(level===3)?colors[3]:"#000000"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6913";position: (level===3)?0.5715:1.1; color:(level===3)?colors[4]:"#000000"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6914";position: (level===3)?0.7143:1.1; color:(level===3)?colors[4]:"#000000"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6915";position: (level===3)?0.7144:1.1; color:(level===3)?colors[5]:"#000000"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6916";position: (level===3)?0.8571:1.1; color:(level===3)?colors[5]:"#000000"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6917";position: (level===3)?0.8572:1.1; color:(level===3)?colors[6]:"#000000"}
                    GradientStop{ property string __felgo_live_id_element: "FELGO_ID_38469_6918";position: (level===3)?1:1.1; color:(level===3)?colors[6]:"#000000"}
                }
                Rectangle { property string __felgo_live_id_element: "FELGO_ID_38469_6919";
                    height: parent.height
                    color: "#21be2b"
                    radius: 3
                }
            }
            handle: Rectangle { property string __felgo_live_id_element: "FELGO_ID_38469_6920";
                id: handleId
                x: sliderId.leftPadding + sliderId.visualPosition * (sliderId.availableWidth - width)
                y: sliderId.topPadding + sliderId.availableHeight / 2 - height / 2
                implicitWidth: 20
                implicitHeight: 50
                radius: 7
                color: sliderId.pressed ? "#f0f0f0" : "#ededed"
                border.color: "#9e9e9e"
            }
            SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6921";
                id: seqAnimationId
                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6922";
                    target: sliderId
                    property: "value"
                    to:1000
                    duration: mDuration
                    easing.type: sliderEasingType
                }
                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6923";
                    target: sliderId
                    property: "value"
                    to:0
                    duration: mDuration
                    easing.type: sliderEasingType

                }
            }
            PauseAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6924";
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
    MyAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6925";
        id: splashAnimation
        toX: rim.x+41;
        downEasingType: Easing.InQuad;
        toY: 50;
        animationDuration: 1600
        rotationNumber: 800
        onStopped:{
            whatToDoWhenAnimFinished()
        }
        onStarted: {
            console.log("onStartedEmittedHDKHJKDFJKHKJDhskjhfkh")
            splashSoundEffectTimer.start()
        }
    }
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_38469_6926";
        id: splashSoundEffectTimer
        original:  1500
        onTimedOut: {
            splashSoundEffect.play()
        }
    }
    Audio{ property string __felgo_live_id_element: "FELGO_ID_38469_6927";
        id: splashSoundEffect
        source:"sounds/splashSoundEffectCropped.mp3"
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
    MyAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6928";
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
    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6929";
        onStopped:{
            whatToDoWhenAnimFinished()
        }
        onStarted: {
            backboardMakeSoundEffectTimer.start()
        }
        id: backboardAnimation
        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6930";
            RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6931";
                target: basketBall
                properties: "rotation"
                direction: RotationAnimation.Clockwise
                to: 800
                duration: 1600
            }
            SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6932";
                ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6933";
                    SequentialAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6934";
                        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6935";
                            target: basketBall
                            properties: "y"
                            to: 50
                            duration: 1600 * 0.5
                            easing.type: Easing.OutCirc
                        }
                        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6936";
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6937";
                                target: basketBall
                                property: "width"
                                to: 92.5
                                duration: 1600*0.3
                                easing.type: Easing.InQuad
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6938";
                                target: basketBall
                                property: "height"
                                to: 92.5
                                duration: 1600*0.3
                                easing.type: Easing.InQuad
                            }

                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6939";
                                target: basketBall
                                properties: "y"
                                to: backboard.y-20
                                duration: 1600*0.3
                                easing.type: Easing.InQuad
                            }
                        }
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6940";
                        target: basketBall
                        properties: "x"
                        to: backboard.x-basketBall.width+20
                        duration: 1600*0.8
                    }
                }
                ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6941";
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6942";
                        target: basketBall
                        property: "y"
                        to: rim.y-15
                        duration: 1600*0.2
                        easing.type: Easing.Linear
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6943";
                        target: basketBall
                        property: "x"
                        duration: 1600*0.2
                        to: rim.x+41
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6944";
                        target: basketBall
                        property: "width"
                        to: 65+20
                        duration: 1600*0.2
                        easing.type: Easing.Linear
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6945";
                        target: basketBall
                        property: "height"
                        to: 65+20
                        duration: 1600*0.2
                        easing.type: Easing.Linear
                    }
                    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6946";
                        id: rimRockId
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6947";
                            target: rim
                            property: "rotation"
                            to: 3
                            duration: 1600*0.05
                        }
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6948";
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
        PauseAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6949";
            duration: 400
        }
    }
    //SE
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_38469_6950";
        id: backboardMakeSoundEffectTimer
        original:  1280
        onTimedOut: {
            backboardMakeSoundEffect.play()
            backboardMakeSoundEffectTimer2.start()
        }
    }
    Audio{ property string __felgo_live_id_element: "FELGO_ID_38469_6951";
        id: backboardMakeSoundEffect
        source:"sounds/backboardMissSoundEffectCropped1.mp3"
        volume: Extra.sound*1

    }
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_38469_6952";
        id: backboardMakeSoundEffectTimer2
        original:  180
        onTimedOut: {
            backboardMakeSoundEffect2.play()
        }
    }
    Audio{ property string __felgo_live_id_element: "FELGO_ID_38469_6953";
        id: backboardMakeSoundEffect2
        source:"sounds/splashSoundEffectCropped.mp3"
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
    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6954";
        onStopped:{
            whatToDoWhenAnimFinished()
        }
        onStarted: {
            backboardMissSoundEffectTimer.start()
        }
        id: backboardMissAnimation
        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6955";
            RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6956";
                target: basketBall
                properties: "rotation"
                direction: RotationAnimation.Clockwise
                to: 800
                duration: 1600*(0.8+0.65)
            }
            SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6957";
                ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6958";
                    SequentialAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6959";
                        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6960";
                            target: basketBall
                            properties: "y"
                            to: 50
                            duration: 1600 * 0.5
                            easing.type: Easing.OutCirc
                        }
                        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6961";
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6962";
                                target: basketBall
                                property: "width"
                                to: 90+20-5
                                duration: 1600*0.3
                                easing.type: Easing.InQuad
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6963";
                                target: basketBall
                                property: "height"
                                to: 90+20-5
                                duration: 1600*0.3
                                easing.type: Easing.InQuad
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6964";
                                target: basketBall
                                properties: "y"
                                to: backboard.y-20
                                duration: 1600*0.3
                                easing.type: Easing.InQuad
                            }
                        }
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6965";
                        target: basketBall
                        properties: "x"
                        to: backboard.x-basketBall.width+20
                        duration: 1600*0.8
                    }
                }
                ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6966";
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6967";
                        target: basketBall
                        property: "y"
                        to: rim.y+200
                        duration: 1600*0.65
                        easing.type: Easing.InCubic
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6968";
                        target: basketBall
                        property: "x"
                        duration: 1600*0.65
                        to: rim.x-300
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6969";
                        target: basketBall
                        property: "width"
                        to: 110+20-5
                        duration: 1600*0.65
                        easing.type: Easing.InCubic
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6970";
                        target: basketBall
                        property: "height"
                        to: 110+20-5
                        duration: 1600*0.65
                        easing.type: Easing.InCubic
                    }
                    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6971";
                        id: rimRockId1
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6972";
                            target: rim
                            property: "rotation"
                            to: 3
                            duration: 1600*0.05
                        }
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6973";
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
        PauseAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6974";
            duration: 400
        }
    }
    //SE
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_38469_6975";
        id: backboardMissSoundEffectTimer
        original:  1200
        onTimedOut: {
            backboardMissSoundEffect.play()
        }
    }
    Audio{ property string __felgo_live_id_element: "FELGO_ID_38469_6976";
        id: backboardMissSoundEffect
        source:"sounds/backboardMissSoundEffectCropped.mp3"
        volume: Extra.sound*0.64
    }

    //Rim make
    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6977";
        onStarted: {
            rimMakeSoundEffectTimer.start()
        }
        onStopped :{
            whatToDoWhenAnimFinished()
        }
        id: rimMakeAnimation
        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6978";
            RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6979";
                target: basketBall
                properties: "rotation"
                direction: RotationAnimation.Clockwise
                to: 800
                duration: 1600
            }
            SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6980";
                ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6981";
                    SequentialAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6982";
                        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6983";
                            target: basketBall
                            properties: "y"
                            to: 50
                            duration: 1600 * 0.5
                            easing.type: Easing.OutCirc
                        }
                        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6984";
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6985";
                                target: basketBall
                                property: "width"
                                to: 90+20-5
                                duration: 1600*0.25
                                easing.type: Easing.InQuad
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6986";
                                target: basketBall
                                property: "height"
                                to: 90+20-5
                                duration: 1600*0.25
                                easing.type: Easing.InQuad
                            }

                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6987";
                                target: basketBall
                                properties: "y"
                                to: rim.y-basketBall.height+25
                                duration: 1600*0.25
                                easing.type: Easing.InQuad
                            }
                        }
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6988";
                        target: basketBall
                        properties: "x"
                        to: rim.x-basketBall.width/2+25
                        duration: 1600*0.75
                    }
                }
                ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6989";
                    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6990";
                        id: rimRockId2
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6991";
                            target: rim
                            property: "rotation"
                            to: 3
                            duration: 1600*0.05
                        }
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6992";
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
                    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6993";
                        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6994";
                            target: basketBall
                            property: "y"
                            to: 150
                            duration: (1600*0.25)*0.65
                            easing.type: Easing.OutQuad
                        }
                        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_6995";
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6996";
                                target: basketBall
                                property: "width"
                                to: 70+20-5
                                duration: 1600*0.25*0.75
                                easing.type: Easing.Linear
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6997";
                                target: basketBall
                                property: "height"
                                to: 70+20-5
                                duration: 1600*0.25*0.75
                                easing.type: Easing.Linear
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6998";
                                target: basketBall
                                property: "y"
                                to: rim.y-20
                                duration: (1600*0.25)*0.55
                                easing.type: Easing.InQuad
                            }
                        }
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_6999";
                        target: basketBall
                        property: "x"
                        to: rim.x+41
                        duration: 1600*0.25
                        easing.type: Easing.Linear
                    }
                }
                PauseAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7000";
                    duration: 400
                }
            }
        }
    }
    //SE
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_38469_7001";
        id: rimMakeSoundEffectTimer
        original:  1200
        onTimedOut: {
            rimMakeSoundEffect.play()
        }
    }
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_38469_7002";
        id: coinClinkSoundEffectForRimMakeTimer
        original: 300
        onTimedOut: {
            coinClinkSoundEffect.play()
        }
    }
    Audio{ property string __felgo_live_id_element: "FELGO_ID_38469_7003";
        id: rimMakeSoundEffect
        source:"sounds/rimMakeSoundEffectCropped.mp3"
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
    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_7004";
        onStopped:{
            whatToDoWhenAnimFinished()
        }
        onStarted: {
            rimMissSoundEffectTimer.start()
        }
        id: rimMissAnimation
        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_7005";
            RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_7006";
                target: basketBall
                properties: "rotation"
                direction: RotationAnimation.Clockwise
                to: 800
                duration: 1600*1.7
            }
            SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_7007";
                ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7008";
                    SequentialAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7009";
                        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7010";
                            target: basketBall
                            properties: "y"
                            to: 50
                            duration: 1600 * 0.5
                            easing.type: Easing.OutCirc
                        }
                        ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_7011";
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7012";
                                target: basketBall
                                property: "width"
                                to: 75+20-5
                                duration: 1600*0.35
                                easing.type: Easing.InQuad
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7013";
                                target: basketBall
                                property: "height"
                                to: 75+20-5
                                duration: 1600*0.35
                                easing.type: Easing.InQuad
                            }

                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7014";
                                target: basketBall
                                properties: "y"
                                to: rim.y-60
                                duration: 1600*0.35
                                easing.type: Easing.InQuad
                            }
                        }
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7015";
                        target: basketBall
                        properties: "x"
                        to: rim.x+50
                        duration: 1600*0.85
                    }
                }

                ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7016";
                    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_7017";
                        id: rimRockId3
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_7018";
                            target: rim
                            property: "rotation"
                            to: 3
                            duration: 1600*0.05
                        }
                        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_7019";
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
                        SequentialAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7020";
                            ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_7021";
                                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7022";
                                    target: basketBall
                                    property: "width"
                                    to: 115+20-5
                                    duration: 1600*0.4
                                    easing.type: Easing.Linear
                                }
                                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7023";
                                    target: basketBall
                                    property: "height"
                                    to: 115+20-5
                                    duration: 1600*0.4
                                    easing.type: Easing.Linear
                                }

                                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7024";
                                    target: basketBall
                                    properties: "y"
                                    to: 140
                                    duration: 1600*0.4
                                    easing.type: Easing.OutQuad
                                }
                            }
                            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7025";
                                target: basketBall
                                properties: "y"
                                to: rim.y+150
                                duration: 1600 * 0.45
                                easing.type: Easing.InCubic
                            }
                        }
                    }
                    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7026";
                        target: basketBall
                        properties: "x"
                        to: rim.x-350
                        duration: 1600*0.85
                    }

                }
            }
        }
        PauseAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7027";
            duration: 400
        }
    }
    //SE
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_38469_7028";
        id: rimMissSoundEffectTimer
        original:  1290
        onTimedOut: {
            rimMissSoundEffect.play()
            rimMissSoundEffectTimer2.start()
        }
    }
    Audio{ property string __felgo_live_id_element: "FELGO_ID_38469_7029";
        id: rimMissSoundEffect
        source:"sounds/rimMissSoundEffect2.mp3"
        volume: Extra.sound*0.8

    }
    MyTimer{ property string __felgo_live_id_element: "FELGO_ID_38469_7030";
        id: rimMissSoundEffectTimer2
        original:  100
        onTimedOut: {
            rimMissSoundEffect2.play()
        }
    }
    Audio{ property string __felgo_live_id_element: "FELGO_ID_38469_7031";
        id: rimMissSoundEffect2
        source:"sounds/rimMissSoundEffect2.mp3"
        volume: Extra.sound*0.3
    }
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_38469_7032";
        id: stateRectId
        state: "notPaused"
        states: [
            State { property string __felgo_live_id_element: "FELGO_ID_38469_7033";
                name: "paused"
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_38469_7034";
                    target: pauseRectangle
                    visible: true
                }
            },
            State { property string __felgo_live_id_element: "FELGO_ID_38469_7035";
                name: "notPaused"
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_38469_7036";
                    target: pauseRectangle
                    visible: false
                }
            }
        ]
        transitions: [
            Transition { property string __felgo_live_id_element: "FELGO_ID_38469_7037";
                from: "*"
                to: "*"
                ColorAnimation { property string __felgo_live_id_element: "FELGO_ID_38469_7038";
                    duration: 500
                }
                NumberAnimation{ property string __felgo_live_id_element: "FELGO_ID_38469_7039";
                    property: opacity
                    duration: 500
                }
            }
        ]
    }
}
