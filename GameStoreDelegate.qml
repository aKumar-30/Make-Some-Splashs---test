import QtQuick 2.0

Rectangle{ property string __felgo_live_id_component: "FELGO_COMPONENT_ID_31327"; property string __felgo_live_id_element: "FELGO_ID_31327_359";
    width: grid.cellWidth
    height: grid.cellHeight
    color: "transparent"
    Rectangle { property string __felgo_live_id_element: "FELGO_ID_31327_360";
        width: grid.cellWidth-20
        height: grid.cellHeight-20
        id: wrapper
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        border.width: 3
        border.color: "black"
        radius: 5;
        color: "white"
        Image{ property string __felgo_live_id_element: "FELGO_ID_31327_361";
            id: mImage
            x:parent.x
            y:6
            width: 65
            height:65;
            source: picSource

        }
        Text{ property string __felgo_live_id_element: "FELGO_ID_31327_362";
            width: grid.cellWidth-15
            y: mImage.y+mImage.height+4
            anchors.horizontalCenter: parent.horizontalCenter
            id: nameText
            text: name
            font.family: "Palatino Linotype"
            font.bold:  (grid.isCurrentItem===true)?"true":"false"
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 8
            color:"#050027"
        }
        MouseArea{ property string __felgo_live_id_element: "FELGO_ID_31327_363";
            anchors.fill: parent
            onClicked:{
                count = price;
                mName = name;
                mSource = picSource;
                console.log("Clicked on :" + name)
                //what happens when u click
                grid.currentIndex=index;
                checkIfFound()
                someOfTheStuffToDoWhenClicked()
            }
        }
    }
}



