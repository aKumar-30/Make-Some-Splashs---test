import QtQuick 2.0
import QtQuick.Controls 2.5
Item{
    anchors.fill: parent
    Rectangle {
        id: mainRect
        width: parent.width*1/2
        height: parent.width*4/5
        Rectangle{
            anchors.top: parent.top
            id: header
            width: parent.width
            height: 120
            color: "#e6ae60"
            Text{
                color: "#ffffff"
                font.family: "AMGDT_IV50"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 40
            }
        }
        Rectangle{
            width: parent.width
            anchors.top:header.bottom
            height: 10
            color: "#c2910c"
        }
        Text{
            width: parent.width
            anchors.centerIn: parent
            text: "NEXT MISSIONS IN "
            font.family: "GENISO"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            color: "gray"
            y: header.y+16
        }
    }

    Rectangle{
        id: fadedRect
        x: mainRect.x-15
        y: mainRect.y-25
        color: "#c2910c"
    }
}


