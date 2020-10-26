import QtQuick 2.11


ParallelAnimation { property string __felgo_live_id_component: "FELGO_COMPONENT_ID_10853"; property string __felgo_live_id_element: "FELGO_ID_10853_1106";
    property var upEasingType: Easing.OutCirc
    property int upEasingHeight: 20
    property var downEasingType: Easing.OutBounce
    property var toX: root.width-ball.width
    property var toY: 20
    property int animationDuration: rootDuration
    property int rotationNumber : 750
    SequentialAnimation { property string __felgo_live_id_element: "FELGO_ID_10853_1107";
        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_10853_1108";
            target: ball
            properties: "y"
            to: toY
            duration: animationDuration * 0.4
            easing.type: upEasingType
        }
        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_10853_1109";
            target: ball
            properties: "y"
            to: root.height-ball.height
            duration: animationDuration * 0.6
            easing.type: downEasingType
        }
    }
    NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_10853_1110";
        target: ball
        properties: "x"
        to: toX
        duration: animationDuration
    }
    RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_10853_1111";
        target: ball
        properties: "rotation"
        direction: RotationAnimation.Clockwise
        to: rotationNumber
        duration: animationDuration
    }
}
