import QtQuick 2.0
import QtQml.Models 2.2
import Felgo 3.0
import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Universal 2.12
import Qt.labs.settings 1.0
import QtQuick.Controls 2.12
import QtMultimedia 5.8

Component{
    id: mMissionDelegate
    Rectangle{
        Component.onCompleted: {
            console.log("on good delegate")
        }

        anchors.horizontalCenter: parent.horizontalCenter
        width: mainRect.width-25
        height: (width*1/4+50)
        id: outsideComponentRect
        Rectangle{
            visible: (completed)
            width: outsideComponentRect.width
            height: outsideComponentRect.height
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            border.width: 12
            border.color: "#7ae868"
            Text{
                anchors.centerIn: parent
                text: "COMPLETED"
                font.family: "Segoe UI Light"
                font.bold: true
                font.underline: true
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: textMultiplier* 20
                color: "#7ae868"

            }
        }
        Rectangle{
            visible: !completed
            width: outsideComponentRect.width
            height: outsideComponentRect.height
            anchors.horizontalCenter: parent.horizontalCenter
            color: "transparent"
            Rectangle{
                id: mainDelegateRect
                width: parent.width
                height: parent.height-12
                anchors.verticalCenter: parent.verticalCenter
                color: (currentThings>=neededThings)?"#7ae868":"#2e8ddb"
                Column{
                    x:16
                    y:10
                    spacing: 12;
                    width: parent.width
                    Text{
                        id: theText
                        y:15
                        font.family: centuryGothic.name
                        font.bold: true
                        width: parent.width*2/3+15
                        wrapMode: Text.Wrap
                        font.pointSize: textMultiplier* 14
                        color: "white"
                        text:description
                        //description text
                    }
                    Row{
                        spacing:2
                        //progress bar
                        ProgressBar {
                            id: thingsLeft
                            value: currentThings/neededThings
                            padding: 2
                            Text{
                                z:3
                                anchors.centerIn: parent
                                color: "white"
                                font.family: centuryGothic.name
                                font.bold: true
                                font.pointSize: textMultiplier* 18
                                text:(currentThings>=neededThings)?(neededThings+"/"+neededThings):(currentThings+"/"+neededThings)
                            }
                            background: Rectangle {
                                implicitWidth: theText.width
                                implicitHeight: 40
                                color: "#000000"
                                radius: 2
                            }
                            contentItem: Item {
                                implicitWidth: theText.width
                                implicitHeight: 30
                                Rectangle {
                                    width: thingsLeft.visualPosition * parent.width
                                    height: parent.height
                                    radius: 2
                                    color: "#06bf0c"
                                }
                            }
                        }
                        //filler space
                        Rectangle{
                            width: 30
                            height: 2
                            color: "transparent"
                        }
                        //reward
                        Text{
                            anchors.verticalCenter: parent.verticalCenter
                            color: "black"
                            font.family: centuryGothic.name
                            font.bold: true
                            font.pointSize: textMultiplier* 20
                            text:reward
                        }
                        //coin pic
                        Image{
                            anchors.verticalCenter: parent.verticalCenter
                            width: 40
                            height: 40
                            source: "../assets/images/coinFront.png"
                        }
                    }
                }
            }
        }
    }
}
