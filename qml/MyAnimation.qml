import QtQuick 2.11
SequentialAnimation { property string __felgo_live_id_component: "FELGO_COMPONENT_ID_59499"; property string __felgo_live_id_element: "FELGO_ID_59499_1095";
    property var upEasingType: Easing.OutCirc
    property int upEasingHeight: 20
    property var downEasingType: Easing.OutBounce
    property var toX: root.width-ball.width
    property var toY: 20
    property var otherToY: rim.y-15
    property int animationDuration: rootDuration
    property int rotationNumber : 750
    property var percentageSmall: 0.27
    property var percentageLarge: 0.73
    property bool shrink: true
    ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_59499_1096";
        SequentialAnimation { property string __felgo_live_id_element: "FELGO_ID_59499_1097";
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_59499_1098";
                target: basketBall
                properties: "y"
                to: toY
                duration: animationDuration * percentageLarge
                easing.type: upEasingType
            }
            ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_59499_1099";

                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_59499_1100";
                    target: basketBall
                    property: "width"
                    to: (shrink==true)?(72+25-10):(basketBall.width)
                    duration: animationDuration*percentageSmall
                    easing.type: Easing.InQuad
                }
                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_59499_1101";
                    target: basketBall
                    property: "height"
                    to: (shrink==true)?(72+25-10):(basketBall.height)
                    duration: animationDuration*percentageSmall
                    easing.type: Easing.InQuad
                }
                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_59499_1102";
                    target: basketBall
                    properties: "y"
                    to: otherToY
                    duration: animationDuration * percentageSmall
                    easing.type: downEasingType
                }
            }
        }
        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_59499_1103";
            target: basketBall
            properties: "x"
            to: toX
            duration: animationDuration
        }
        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_59499_1104";
            target: basketBall
            properties: "rotation"
            direction: RotationAnimation.Clockwise
            to: rotationNumber
            duration: animationDuration
        }
    }
    PauseAnimation{ property string __felgo_live_id_element: "FELGO_ID_59499_1105";
        duration: 400
    }
}
