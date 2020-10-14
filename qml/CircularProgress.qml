import QtQml 2.2
import QtQuick 2.0
import Felgo 3.0
// draws two arcs (portion of a circle)
// fills the circle with a lighter secondary color
// when pressed
Canvas {
    id: canvas
    width: 300
    height: 300
    antialiasing: true
    property color primaryColor: "#e6e8f0"
    property color secondaryColor: "#18549e"

    property real centerWidth: width / 2
    property real centerHeight: height / 2
    property real radius: Math.min(canvas.width, canvas.height) / 2-30

    property real minimumValue: 0
    property real maximumValue: 100
    property real currentValue: 100

    // this is the angle that splits the circle in two arcs
    // first arc is drawn from 0 radians to angle radians
    // second arc is angle radians to 2*PI radians
    property real angle: (currentValue - minimumValue) / (maximumValue - minimumValue) * 2 * Math.PI

    // we want both circle to start / end at 12 o'clock
    // without this offset we would start / end at 9 o'clock
    property real angleOffset: -Math.PI / 2

    property string text: "Text"

    signal clicked()

    onPrimaryColorChanged: requestPaint()
    onSecondaryColorChanged: requestPaint()
    onMinimumValueChanged: requestPaint()
    onMaximumValueChanged: requestPaint()
    onCurrentValueChanged: requestPaint()

    onPaint: {
        var ctx = getContext("2d");
        ctx.save();

        ctx.clearRect(0, 0, canvas.width, canvas.height);

        // fills the mouse area when pressed
        // the fill color is a lighter version of the
        // secondary color

//        if (mouseArea.pressed) {
//            ctx.beginPath();
//            ctx.lineWidth = 1;
//            ctx.fillStyle = Qt.lighter(canvas.secondaryColor, 1.25);
//            ctx.arc(canvas.centerWidth,
//                    canvas.centerHeight,
//                    canvas.radius,
//                    0,
//                    2*Math.PI);
//            ctx.fill();
//        }

        // First, thinner arc
        // From angle to 2*PI

        ctx.beginPath();
        ctx.lineWidth = 40;
        ctx.strokeStyle = primaryColor;
        ctx.arc(canvas.centerWidth,
                canvas.centerHeight,
                canvas.radius,
                angleOffset + canvas.angle,
                angleOffset + 2*Math.PI);
        ctx.stroke();


        // Second, thicker arc
        // From 0 to angle

        ctx.beginPath();
        ctx.lineWidth = 40;
        ctx.strokeStyle = canvas.secondaryColor;
        ctx.arc(canvas.centerWidth,
                canvas.centerHeight,
                canvas.radius,
                canvas.angleOffset,
                canvas.angleOffset + canvas.angle);
        ctx.stroke();

        ctx.restore();
    }


//    Rectangle{
//        anchors.centerIn: parent
//        color: "black"
//        width: 30
//        height: 30
//    }
    SequentialAnimation{
        id: beatingHeartAnim
        onStopped: {
            if(visible)
                start()
        }
        PropertyAnimation{
            target:heartIcon
            property: "iconSize"
            from: 175
            to: 145
            duration: 700
        }
        PropertyAnimation{
            target:heartIcon
            property: "iconSize"
            from: 145
            to: 175
            duration: 600
        }
    }
    IconButtonBarItem{
        onVisibleChanged: {
            if(visible){
                beatingHeartAnim.start()
                circleTimer.start()
            }
        }
        visible:true
        color: "red"
        id: heartIcon
        icon: IconType.heart
        iconSize: 175
        anchors.centerIn: parent
        Rectangle{
            anchors.centerIn: parent
            width: heartIcon.iconSize
            height: width
            color:"transparent"
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    newMissionsAdButton.clicked()
                }
            }
        }
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: canvas.clicked()
        onPressedChanged: canvas.requestPaint()
    }
    Timer{
        id: circleTimer
        interval: 15
        onTriggered: {
            if(canvas.currentValue<=0){
                if(quitButtonWasClicked){
                    quitButtonWasClicked=false
                }
                else{
                    newRetryCircle.visible=false
                    retryBox.visible=true;
                    canvas.currentValue=100;
                }
            }
            else{
            canvas.currentValue-=0.25
            start()
           }
        }
    }
}


