import QtQuick 2.11


ParallelAnimation {
    property var upEasingType: Easing.OutCirc
    property int upEasingHeight: 20
    property var downEasingType: Easing.OutBounce
    property var toX: root.width-ball.width
    property var toY: 20
    property int animationDuration: rootDuration
    property int rotationNumber : 750
    SequentialAnimation {
        NumberAnimation {
            target: ball
            properties: "y"
            to: toY
            duration: animationDuration * 0.4
            easing.type: upEasingType
        }
        NumberAnimation {
            target: ball
            properties: "y"
            to: root.height-ball.height
            duration: animationDuration * 0.6
            easing.type: downEasingType
        }
    }
    NumberAnimation {
        target: ball
        properties: "x"
        to: toX
        duration: animationDuration
    }
    RotationAnimation{
        target: ball
        properties: "rotation"
        direction: RotationAnimation.Clockwise
        to: rotationNumber
        duration: animationDuration
    }
}
