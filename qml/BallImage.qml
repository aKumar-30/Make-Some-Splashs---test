import QtQuick 2.0

Image { property string __felgo_live_id_component: "FELGO_COMPONENT_ID_52446"; property string __felgo_live_id_element: "FELGO_ID_52446_576";
    property var myId: soccerBall
    property string mySource: ""
    property var myVisible: false

    visible: myVisible
    id: myId
    x: 0; y: root.height-height
    width:150
    height:150
    source: mySource
    MouseArea { property string __felgo_live_id_element: "FELGO_ID_52446_577";
        anchors.fill: parent
        onClicked: {
            myId.x = 0;
            myId.y = root.height-myId.height;
            myId.rotation = 0;
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
    }
}
