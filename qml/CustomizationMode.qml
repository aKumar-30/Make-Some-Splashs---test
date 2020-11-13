import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.2
Page {
    //width: 1200
    //height: 580
    y: navigationStack.navigationBar.height
    width: parent.width
    height: parent.height+y
    title: "Customization Mode"
    property int duration: 1000
    id: root
    property bool isNewColor: false
    property var gradientGround1: "#00FF00"
    property var gradientGround2: "#00803F"
    property var ball: basketBall
    function whatHappensWhenClicked(){
        ball.x = 0;
        ball.y = root.height-ball.height;
        ball.rotation = 0;
        if (chooseBallComboBox.currentIndex===6)
        {
            var random_number = Math.floor((Math.random() * 5) + 1);
            changeBallBasedOnRandomNumber(random_number)
        }
        if(startText.visible)
            startText.visible=false;
        sequencialAnimation.restart()
        otherCustomizeButton.visible=true;
    }
    //Functions for setting type of ball start
    MouseArea{
        anchors.fill: parent
        onClicked: {
            whatHappensWhenClicked()
        }
    }

    Component.onCompleted: {
        startTextTimer.start()
    }
    SequentialAnimation{
        id: startAnim
        PauseAnimation {
            duration: 1000

        }
        NumberAnimation {
            target: startText
            property: "opacity"
            duration: 500
            to: 1
            from: 0;
        }
    }
    Rectangle{
        id: startText
        color: "transparent"
        border.color: "brown"
        border.width: 5
        radius: 5
        width: 500+15
        height: text.implicitHeight+15
        z:9
        opacity:0;
        anchors.centerIn: parent
        Text{
            id: text
            anchors.centerIn: parent
            font.pointSize: 2* 20
            color: "black"
            width: 360;
            wrapMode: Label.Wrap
            text: "Click anywhere or the customize button to begin"
            horizontalAlignment: Text.AlignHCenter
        }
    }
    Timer{
        id: startTextTimer
        interval: 3000
        onTriggered: {
            if(interval!=5000)
                interval= 5000;
            startAnim.start()
        }
    }

    function index1func(){
        basketBall.x = ball.x
        basketBall.y = ball.y
        ball.visible=false
        ball = basketBall
        ball.visible = true
    }
    function index2func(){
        volleyBall.x = ball.x
        volleyBall.y = ball.y
        ball.visible=false
        ball = volleyBall
        ball.visible=true
    }
    function index3func(){
        tennisBall.x = ball.x
        tennisBall.y = ball.y
        ball.visible=false
        ball = tennisBall
        ball.visible=true
    }
    function index4func(){
        soccerBall.x = ball.x
        soccerBall.y = ball.y
        ball.visible=false
        ball = soccerBall
        ball.visible=true
    }
    function index5func(){
        bowlingBall.x = ball.x
        bowlingBall.y = ball.y
        ball.visible=false
        ball = bowlingBall
        ball.visible=true
    }
    function changeBallBasedOnRandomNumber(random_number){
        if(random_number===1)
            index1func()
        else if (random_number===2)
            index2func()
        else if(random_number===3)
            index3func()
        else if(random_number===4)
            index4func()
        else
            index5func()
    }
    //Functions for setting type of ball end
    Button{
        id: otherCustomizeButton
        text: "Customize!"
        z:60
        x: 20
        y:20
        visible: true
        onClicked:{
            containerRectId.visible=true
            otherCustomizeButton.visible= false
        }
    }

    Rectangle
    {
        id: containerRectId
        color: "silver"
        opacity: 0.8
        width: parent.width
        y: 20
        height:140
        z: 100
        visible: false
        RowLayout
        {
            x: 10
            anchors.centerIn: parent
            Column{
                Layout.fillWidth: true
                id: durationSliderColumn
                Label{
                    text: "Choose duration (0-5 sec.)"
                    wrapMode: Label.WordWrap
                    font.bold: true
                    font.pointSize: 2* 10
                }

                Slider{
                    Layout.fillWidth: true
                    id: durationSlider;
                    to: 5000
                    from: 1
                    value: 1000
                    stepSize: 100
                    snapMode: Slider.SnapOnRelease
                }
            }

            Button{
                Layout.fillWidth: true
                id: chooseColorButton
                text: "Change ground color"
                width: 30
                onClicked:
                {
                    messageDialog.open()
                }
                MessageDialog{
                    width: 150
                    id: messageDialog
                    text: "Please choose a color. This color will appear as the color of
                        the ground the ball is bouncing on"
                    standardButtons: StandardButton.Ok | StandardButton.Cancel
                    onAccepted: colorDialogId.open()
                }

                ColorDialog{
                    id: colorDialogId
                    title: "Please choose a color"
                    onAccepted: {
                        isNewColor=true
                    }
                }
            }
            ComboBox{
                Layout.fillWidth: true
                id: chooseBallComboBox
                model: ["Balls","Basket Ball","Volley Ball","Tennis Ball", "Soccer Ball", "Bowling ball", "Random"]
            }
            ComboBox{
                Layout.fillWidth: true
                id: bouncesComboBox
                model: ["Bounces",1,2,3]
            }
            GroupBox{
                id: groupBoxforChecks
                Layout.fillWidth: true
                title: "Options"

                CheckBox{
                    text: "Become night"
                    id: changeStateCheckBox
                }
            }


            Button{
                Layout.fillWidth: true
                id: submitButton
                text: "Make changes"
                onClicked:{
                    containerRectId.visible=false

                    //Set duration
                    duration = durationSlider.value;

                    //Setting ball type(uses functions from top)
                    if (chooseBallComboBox.currentIndex==6){
                    }
                    else if(chooseBallComboBox.currentIndex===0){
                    }
                    else if(chooseBallComboBox.currentIndex===1){

                        index1func()
                    }
                    else if(chooseBallComboBox.currentIndex===2){
                        index2func()
                    }
                    else if(chooseBallComboBox.currentIndex===3){
                        index3func()
                    }
                    else if(chooseBallComboBox.currentIndex===4){
                        index4func()
                    }
                    else if(chooseBallComboBox.currentIndex===5){
                        index5func()
                    }
                    else{
                        index1func()
                    }
                    //Set number of ball bounces
                    function oneBallBounce(){
                        firstBounceDuration=root.duration
                        firstBounce.upEasingType=Easing.OutCirc
                        firstBounce.downEasingType=Easing.OutBounce
                        firstBounce.toX = root.width-ball.width
                        firstBounce.rotationNumber=720

                        secondBounce.toY = root.height-ball.height
                        thirdBounce.toY = root.height-ball.height
                        secondBounce.toX = root.width-ball.height
                        thirdBounce.toX =  root.width-ball.height

                        secondBounce.rotationNumber=0
                        thirdBounce.rotationNumber = 0
                    }
                    function twoBallBounce(){
                        firstBounceDuration=root.duration*1/2
                        firstBounce.upEasingType=Easing.OutCirc
                        firstBounce.downEasingType=Easing.InCirc
                        firstBounce.toX = (root.width-ball.width)*1/2
                        firstBounce.rotationNumber=450
                        firstBounce.toY = 20

                        secondBounceDuration=root.duration*3/5
                        secondBounce.upEasingType=Easing.OutCirc
                        secondBounce.downEasingType=Easing.OutBounce
                        secondBounce.toX = (root.width-ball.width)
                        secondBounce.toY = 180

                        thirdBounce.toY = root.height-ball.height

                        secondBounce.rotationNumber= 360  //intentioanl, weird thing happen otherwise
                        thirdBounce.rotationNumber = 0
                    }
                    function threeBallBounce(){
                        firstBounceDuration=root.duration*5/12
                        firstBounce.upEasingType=Easing.OutCirc
                        firstBounce.downEasingType=Easing.InCirc
                        firstBounce.toX = (root.width-ball.width)*4/12
                        firstBounce.rotationNumber = 450
                        firstBounce.toY = 20

                        secondBounceDuration=root.duration*4/12
                        secondBounce.upEasingType=Easing.OutCirc
                        secondBounce.downEasingType=Easing.InCirc
                        secondBounce.toX = (root.width-ball.width)*8/12
                        secondBounce.rotationNumber = 360
                        secondBounce.toY= 230

                        thirdBounceDuration=root.duration*3/12
                        thirdBounce.upEasingType=Easing.OutCirc
                        thirdBounce.downEasingType=Easing.OutBounce
                        thirdBounce.toX = (root.width-ball.width)
                        thirdBounce.rotationNumber = 720
                        thirdBounce.toY = 300
                    }

                    if(bouncesComboBox.currentIndex===0){
                    }
                    else if(bouncesComboBox.currentValue===1){
                        oneBallBounce()
                    }
                    else if(bouncesComboBox.currentValue===2){
                        twoBallBounce()
                    }
                    else if(bouncesComboBox.currentValue===3){
                        threeBallBounce()
                    }
                    else{
                        oneBallBounce()
                    }

                    //set all checkmarks
                    if(changeStateCheckBox.checked)
                        stateRectId.state = "night"
                    else
                        stateRectId.state = "day"

                    //set ground color
                    if(isNewColor){
                        groundStartGradient.color = colorDialogId.color
                        groundEndGradient.color= colorDialogId.color
                        //gradientGround2=colorDialogId.color
                    }
                }
            }

        }
    }

    Rectangle {
        id: sky
        width: parent.width
        height: 370
        color:"blue"
        gradient: Gradient {
            GradientStop { id: skyStartGradient ;position: 0.0; color: gradientGround1 }
            GradientStop { id: skyEndGradient ;position: 1.0; color: gradientGround2 }
        }
    }

    Rectangle{
        id: ground
        anchors.top: sky.bottom
        anchors.bottom: parent.bottom
        height: 20
        width: parent.width
        gradient: Gradient {
            GradientStop { id: groundStartGradient; position: 0.0; color: "#00FF00"}
            GradientStop {id: groundEndGradient; position: 1.0; color: "#00803F"}
        }
    }
    Rectangle{
        visible: true
        id: sun
        radius: 80
        x: parent.width-width-100
        y:50
        width:130
        height:130
        color: "yellow"
    }
    Image{
        visible: false
        id: moon
        x: parent.width-width-100
        y:50
        width:130
        height:130
        source:"file:///Users/arjun/Documents/All_Qt_Projects/Qt Quick/Qt Fundamentals Udemy Course/10-6AnimationDemo/../assets/images/moon.png"
    }
    BallImage{
        id: soccerBall
        source: "file:///Users/arjun/Documents/All_Qt_Projects/Qt Quick/Qt Fundamentals Udemy Course/10-6AnimationDemo/../assets/images/soccer_ball.png"
    }
    BallImage{
        myVisible: true
        id: basketBall
        source: "file:///Users/arjun/Documents/All_Qt_Projects/Qt Quick/Qt Fundamentals Udemy Course/10-6AnimationDemo/../assets/images/basket_ball.png"
    }
    BallImage{
        id: tennisBall
        source: "file:///Users/arjun/Documents/All_Qt_Projects/Qt Quick/Qt Fundamentals Udemy Course/10-6AnimationDemo/../assets/images/tennis_ball.png"
    }
    BallImage{
        id: volleyBall
        source: "file:///Users/arjun/Documents/All_Qt_Projects/Qt Quick/Qt Fundamentals Udemy Course/10-6AnimationDemo/../assets/images/volley_ball.png"
    }
    BallImage{
        id: bowlingBall
        source: "file:///Users/arjun/Documents/All_Qt_Projects/Qt Quick/Qt Fundamentals Udemy Course/10-6AnimationDemo/../assets/images/bowling_ball.png"
    }
    //../assets/images for the balls end here
    // M3>>
    property int firstBounceDuration: root.duration
    property int secondBounceDuration: 0
    property int thirdBounceDuration: 0
    SequentialAnimation
    {
        id: sequencialAnimation
        onFinished: {
            startText.visible = true;
            startText.opacity=0;
            startTextTimer.restart()
        }

        MyAnimationCustom{
            id: firstBounce
            upEasingHeight: 20
            toX: (root.width-ball.width)
            animationDuration: firstBounceDuration
            upEasingType: Easing.OutCirc
            downEasingType: Easing.OutBounce
        }
        MyAnimationCustom{
            id: secondBounce
            upEasingHeight: 150
            toX: (root.width-ball.width)
            animationDuration: secondBounceDuration
        }
        MyAnimationCustom{
            id: thirdBounce
            upEasingHeight: 400
            toX: (root.width-ball.width)
            animationDuration: thirdBounceDuration
        }
    }
    Rectangle{
        id: stateRectId
        state: "day"
        states: [
            State {
                name: "night"
                PropertyChanges {
                    target: skyStartGradient
                    color: "#292485"
                }
                PropertyChanges {
                    target: skyEndGradient
                    color: "#2045b3"
                }
                PropertyChanges {
                    id: propertyGroundStartGradientStateDay
                    target: groundStartGradient
                    color: "#287d27"
                }
                PropertyChanges {
                    id: propertyGroundEndGradientStateDay
                    target: groundEndGradient
                    color: "#1a4f19"
                }
                PropertyChanges {
                    target: sun
                    visible: false
                }
                PropertyChanges {
                    target: moon
                    visible: true
                }
            },
            State {
                name: "day"
                PropertyChanges {
                    target: skyStartGradient
                    color: "#0080FF"
                }
                PropertyChanges {
                    target: skyEndGradient
                    color: "#66CCFF"
                }
                PropertyChanges {
                    id: propertyGroundStartGradientStateNight
                    target: groundStartGradient
                    color:"#00FF00"
                }
                PropertyChanges {
                    id: propertyGroundEndGradientStateNight
                    target: groundEndGradient
                    color: "#00803F"
                }
                PropertyChanges {
                    target: sun
                    visible: true
                }
                PropertyChanges {
                    target: moon
                    visible: false
                }
            }
        ]
        transitions: [
            Transition {
                from: "*"
                to: "*"
                ColorAnimation {
                    duration: 500
                }
                NumberAnimation{
                    property: opacity
                    duration: 500
                }
            }
        ]
    }
}



