import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.2
import QtQuick.Dialogs 1.2
Page { property string __felgo_live_id_component: "FELGO_COMPONENT_ID_32747"; property string __felgo_live_id_element: "FELGO_ID_32747_826";
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
    MouseArea{ property string __felgo_live_id_element: "FELGO_ID_32747_828";
        anchors.fill: parent
        onClicked: {
            whatHappensWhenClicked()
        }
    }

    Component.onCompleted: {
        startTextTimer.start()
    }
    SequentialAnimation{ property string __felgo_live_id_element: "FELGO_ID_32747_829";
        id: startAnim
        PauseAnimation { property string __felgo_live_id_element: "FELGO_ID_32747_830";
            duration: 1000

        }
        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_32747_831";
            target: startText
            property: "opacity"
            duration: 500
            to: 1
            from: 0;
        }
    }
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_32747_832";
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
        Text{ property string __felgo_live_id_element: "FELGO_ID_32747_833";
            id: text
            anchors.centerIn: parent
            font.pointSize: 20
            color: "black"
            width: 360;
            wrapMode: Label.Wrap
            text: "Click anywhere or the customize button to begin"
            horizontalAlignment: Text.AlignHCenter
        }
    }
    Timer{ property string __felgo_live_id_element: "FELGO_ID_32747_834";
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
    Button{ property string __felgo_live_id_element: "FELGO_ID_32747_835";
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
    { property string __felgo_live_id_element: "FELGO_ID_32747_836";
        id: containerRectId
        color: "silver"
        opacity: 0.8
        width: parent.width
        y: 20
        height:140
        z: 100
        visible: false
        RowLayout
        { property string __felgo_live_id_element: "FELGO_ID_32747_837";
            x: 10
            anchors.centerIn: parent
            Column{ property string __felgo_live_id_element: "FELGO_ID_32747_838";
                Layout.fillWidth: true
                id: durationSliderColumn
                Label{ property string __felgo_live_id_element: "FELGO_ID_32747_839";
                    text: "Choose duration (0-5 sec.)"
                    wrapMode: Label.WordWrap
                    font.bold: true
                    font.pointSize: 10
                }

                Slider{ property string __felgo_live_id_element: "FELGO_ID_32747_840";
                    Layout.fillWidth: true
                    id: durationSlider;
                    to: 5000
                    from: 1
                    value: 1000
                    stepSize: 100
                    snapMode: Slider.SnapOnRelease
                }
            }

            Button{ property string __felgo_live_id_element: "FELGO_ID_32747_841";
                Layout.fillWidth: true
                id: chooseColorButton
                text: "Change ground color"
                width: 30
                onClicked:
                {
                    messageDialog.open()
                }
                MessageDialog{ property string __felgo_live_id_element: "FELGO_ID_32747_842";
                    width: 150
                    id: messageDialog
                    text: "Please choose a color. This color will appear as the color of
                        the ground the ball is bouncing on"
                    standardButtons: StandardButton.Ok | StandardButton.Cancel
                    onAccepted: colorDialogId.open()
                }

                ColorDialog{ property string __felgo_live_id_element: "FELGO_ID_32747_843";
                    id: colorDialogId
                    title: "Please choose a color"
                    onAccepted: {
                        isNewColor=true
                    }
                }
            }
            ComboBox{ property string __felgo_live_id_element: "FELGO_ID_32747_844";
                Layout.fillWidth: true
                id: chooseBallComboBox
                model: ["Balls","Basket Ball","Volley Ball","Tennis Ball", "Soccer Ball", "Bowling ball", "Random"]
            }
            ComboBox{ property string __felgo_live_id_element: "FELGO_ID_32747_845";
                Layout.fillWidth: true
                id: bouncesComboBox
                model: ["Bounces",1,2,3]
            }
            GroupBox{ property string __felgo_live_id_element: "FELGO_ID_32747_846";
                id: groupBoxforChecks
                Layout.fillWidth: true
                title: "Options"

                CheckBox{ property string __felgo_live_id_element: "FELGO_ID_32747_847";
                    text: "Become night"
                    id: changeStateCheckBox
                }
            }


            Button{ property string __felgo_live_id_element: "FELGO_ID_32747_848";
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

    Rectangle { property string __felgo_live_id_element: "FELGO_ID_32747_849";
        id: sky
        width: parent.width
        height: 370
        color:"blue"
        gradient: Gradient { property string __felgo_live_id_element: "FELGO_ID_32747_850";
            GradientStop { property string __felgo_live_id_element: "FELGO_ID_32747_851"; id: skyStartGradient ;position: 0.0; color: gradientGround1 }
            GradientStop { property string __felgo_live_id_element: "FELGO_ID_32747_852"; id: skyEndGradient ;position: 1.0; color: gradientGround2 }
        }
    }

    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_32747_853";
        id: ground
        anchors.top: sky.bottom
        anchors.bottom: parent.bottom
        height: 20
        width: parent.width
        gradient: Gradient { property string __felgo_live_id_element: "FELGO_ID_32747_854";
            GradientStop { property string __felgo_live_id_element: "FELGO_ID_32747_855"; id: groundStartGradient; position: 0.0; color: "#00FF00"}
            GradientStop { property string __felgo_live_id_element: "FELGO_ID_32747_856";id: groundEndGradient; position: 1.0; color: "#00803F"}
        }
    }
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_32747_857";
        visible: true
        id: sun
        radius: 80
        x: parent.width-width-100
        y:50
        width:130
        height:130
        color: "yellow"
    }
    Image{ property string __felgo_live_id_element: "FELGO_ID_32747_858";
        visible: false
        id: moon
        x: parent.width-width-100
        y:50
        width:130
        height:130
        source:"file:///Users/arjun/Documents/All_Qt_Projects/Qt Quick/Qt Fundamentals Udemy Course/10-6AnimationDemo/images/moon.png"
    }
    BallImage{ property string __felgo_live_id_element: "FELGO_ID_32747_859";
        id: soccerBall
        source: "file:///Users/arjun/Documents/All_Qt_Projects/Qt Quick/Qt Fundamentals Udemy Course/10-6AnimationDemo/images/soccer_ball.png"
    }
    BallImage{ property string __felgo_live_id_element: "FELGO_ID_32747_860";
        myVisible: true
        id: basketBall
        source: "file:///Users/arjun/Documents/All_Qt_Projects/Qt Quick/Qt Fundamentals Udemy Course/10-6AnimationDemo/images/basket_ball.png"
    }
    BallImage{ property string __felgo_live_id_element: "FELGO_ID_32747_861";
        id: tennisBall
        source: "file:///Users/arjun/Documents/All_Qt_Projects/Qt Quick/Qt Fundamentals Udemy Course/10-6AnimationDemo/images/tennis_ball.png"
    }
    BallImage{ property string __felgo_live_id_element: "FELGO_ID_32747_862";
        id: volleyBall
        source: "file:///Users/arjun/Documents/All_Qt_Projects/Qt Quick/Qt Fundamentals Udemy Course/10-6AnimationDemo/images/volley_ball.png"
    }
    BallImage{ property string __felgo_live_id_element: "FELGO_ID_32747_863";
        id: bowlingBall
        source: "file:///Users/arjun/Documents/All_Qt_Projects/Qt Quick/Qt Fundamentals Udemy Course/10-6AnimationDemo/images/bowling_ball.png"
    }
    //Images for the balls end here
    // M3>>
    property int firstBounceDuration: root.duration
    property int secondBounceDuration: 0
    property int thirdBounceDuration: 0
    SequentialAnimation
    { property string __felgo_live_id_element: "FELGO_ID_32747_864";
        id: sequencialAnimation
        onFinished: {
            startText.visible = true;
            startText.opacity=0;
            startTextTimer.restart()
        }

        MyAnimationCustom{ property string __felgo_live_id_element: "FELGO_ID_32747_865";
            id: firstBounce
            upEasingHeight: 20
            toX: (root.width-ball.width)
            animationDuration: firstBounceDuration
            upEasingType: Easing.OutCirc
            downEasingType: Easing.OutBounce
        }
        MyAnimationCustom{ property string __felgo_live_id_element: "FELGO_ID_32747_866";
            id: secondBounce
            upEasingHeight: 150
            toX: (root.width-ball.width)
            animationDuration: secondBounceDuration
        }
        MyAnimationCustom{ property string __felgo_live_id_element: "FELGO_ID_32747_867";
            id: thirdBounce
            upEasingHeight: 400
            toX: (root.width-ball.width)
            animationDuration: thirdBounceDuration
        }
    }
    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_32747_868";
        id: stateRectId
        state: "day"
        states: [
            State { property string __felgo_live_id_element: "FELGO_ID_32747_869";
                name: "night"
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_32747_870";
                    target: skyStartGradient
                    color: "#292485"
                }
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_32747_871";
                    target: skyEndGradient
                    color: "#2045b3"
                }
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_32747_872";
                    id: propertyGroundStartGradientStateDay
                    target: groundStartGradient
                    color: "#287d27"
                }
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_32747_873";
                    id: propertyGroundEndGradientStateDay
                    target: groundEndGradient
                    color: "#1a4f19"
                }
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_32747_874";
                    target: sun
                    visible: false
                }
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_32747_875";
                    target: moon
                    visible: true
                }
            },
            State { property string __felgo_live_id_element: "FELGO_ID_32747_876";
                name: "day"
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_32747_877";
                    target: skyStartGradient
                    color: "#0080FF"
                }
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_32747_878";
                    target: skyEndGradient
                    color: "#66CCFF"
                }
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_32747_879";
                    id: propertyGroundStartGradientStateNight
                    target: groundStartGradient
                    color:"#00FF00"
                }
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_32747_880";
                    id: propertyGroundEndGradientStateNight
                    target: groundEndGradient
                    color: "#00803F"
                }
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_32747_881";
                    target: sun
                    visible: true
                }
                PropertyChanges { property string __felgo_live_id_element: "FELGO_ID_32747_882";
                    target: moon
                    visible: false
                }
            }
        ]
        transitions: [
            Transition { property string __felgo_live_id_element: "FELGO_ID_32747_883";
                from: "*"
                to: "*"
                ColorAnimation { property string __felgo_live_id_element: "FELGO_ID_32747_884";
                    duration: 500
                }
                NumberAnimation{ property string __felgo_live_id_element: "FELGO_ID_32747_885";
                    property: opacity
                    duration: 500
                }
            }
        ]
    }
}



