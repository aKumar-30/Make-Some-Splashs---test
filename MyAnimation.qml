import QtQuick 2.11
SequentialAnimation { property string __felgo_live_id_component: "FELGO_COMPONENT_ID_38589"; property string __felgo_live_id_element: "FELGO_ID_38589_565";
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
    ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_38589_566";
        SequentialAnimation { property string __felgo_live_id_element: "FELGO_ID_38589_567";
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38589_568";
                target: basketBall
                properties: "y"
                to: toY
                duration: animationDuration * percentageLarge
                easing.type: upEasingType
            }
            ParallelAnimation{ property string __felgo_live_id_element: "FELGO_ID_38589_569";

                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38589_570";
                    target: basketBall
                    property: "width"
                    to: (shrink==true)?72:(basketBall.width)
                    duration: animationDuration*percentageSmall
                    easing.type: Easing.InQuad
                }
                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38589_571";
                    target: basketBall
                    property: "height"
                    to: (shrink==true)?72:(basketBall.height)
                    duration: animationDuration*percentageSmall
                    easing.type: Easing.InQuad
                }
                NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38589_572";
                    target: basketBall
                    properties: "y"
                    to: otherToY
                    duration: animationDuration * percentageSmall
                    easing.type: downEasingType
                }
            }
        }
        NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_38589_573";
            target: basketBall
            properties: "x"
            to: toX
            duration: animationDuration
        }
        RotationAnimation{ property string __felgo_live_id_element: "FELGO_ID_38589_574";
            target: basketBall
            properties: "rotation"
            direction: RotationAnimation.Clockwise
            to: rotationNumber
            duration: animationDuration
        }
    }
    PauseAnimation{ property string __felgo_live_id_element: "FELGO_ID_38589_575";
        duration: 400
    }
}
