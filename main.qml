import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Universal 2.12
import Qt.labs.settings 1.0
ApplicationWindow {
    visible: true
    width: 708
    height: 785
    title: qsTr("Make some splashs!")
    id: root
    property var p: false
    property var thisTitle: "Make some splashs!"
    property var endingPage: " "
    onClosing: {
        console.log("HELLO????")
        if(endingPage==="qrc:/CompetitiveMode.qml"){
            stackView.push("qrc:/GameStore.qml");
            stackView.pop()
        }
        else if (endingPage==="qrc:/GameStore.qml"){
            stackView.push("qrc:/CompetitiveMode.qml");
            stackView.pop()
        }
    }

    Dialog {
        id: aboutDialog
        modal: true
        focus: true
        x: (root.width - width) / 2
        y: root.height / 6
        width: Math.min(root.width, root.height) /4*3
        contentHeight: aboutColumn.height
        Flickable{
            contentHeight: aboutColumn.implicitHeight
            Column {
                id: aboutColumn
                spacing: 20
                anchors.fill: parent
                Label {
                    width: aboutDialog.availableWidth
                    text: "How to play"
                    wrapMode: Label.Wrap
                    font.pixelSize: 30
                    font.bold:true;
                    horizontalAlignment: "AlignHCenter"
                }
                Label {
                    width: aboutDialog.availableWidth
                    text: "A fun game related to sports and bouncing balls!"
                    wrapMode: Label.Wrap
                    font.pixelSize: 20
                }

                Label {
                    width: aboutDialog.availableWidth
                    text: "Competitive Mode: The objective of the game is to try to stop the slider as close to the "
                          + "middle as possible. The shot you shoot and the points earned are based on your accuracy. Three consecutive misses and your out! Be careful, it gets harder as you go "
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    font.family: "Helventica"
                }
                Label {
                    width: aboutDialog.availableWidth
                    text: "Customization mode: Play around with a bouncing ball and customize it the way you would like!"
                    wrapMode: Label.Wrap
                    font.pixelSize: 16
                    font.family: "Helventica"
                }
            }
            ScrollBar.vertical: ScrollBar{}
        }


    }
    function help() {
        let url = "https://nba.com/"
        Qt.openUrlExternally(url)
    }
    Settings {
        id: settings
        property string style: "Default"
    }
    Dialog {
        id: settingsDialog
        x: Math.round((root.width - width) / 2)
        y: Math.round(root.height / 6)
        width: Math.round(Math.min(root.width, root.height) / 3 * 2)
        modal: true
        focus: true
        title: "Settings"

        standardButtons: Dialog.Ok | Dialog.Cancel
        onAccepted: {
            settings.style = styleBox.displayText
            settingsDialog.close()
        }
        onRejected: {
            styleBox.currentIndex = styleBox.styleIndex
            settingsDialog.close()
        }

        contentItem: ColumnLayout {
            id: settingsColumn
            spacing: 20

            RowLayout {
                spacing: 10

                Label {
                    text: "Style:"
                }

                ComboBox {
                    id: styleBox
                    property int styleIndex: -1
                    model: availableStyles
                    Component.onCompleted: {
                        styleIndex = find(settings.style, Qt.MatchFixedString)
                        if (styleIndex !== -1)
                            currentIndex = styleIndex
                    }
                    Layout.fillWidth: true
                }
            }

            Label {
                text: "Restart required"
                color: "#e41e29"
                opacity: styleBox.currentIndex !== styleBox.styleIndex ? 1.0 : 0.0
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
    Shortcut {
        sequences: ["Esc", "Back"]
        enabled: stackView.depth > 1
        onActivated: navigateBackAction.trigger()
    }

    Shortcut {
        sequence: StandardKey.HelpContents
        onActivated: help()
    }
    Shortcut {
        sequence: "Menu"
        onActivated: optionsMenuAction.trigger()
    }

    Action {
        id: optionsMenuAction
        icon.name: "menu"
        icon.source: "file:///Users/arjun/Documents/CompetitiveBall/icons/splashs/menu.png"
        onTriggered: optionsMenu.open()
    }

    Action {
        id: navigateBackAction
        icon.name: stackView.depth > 1 ? "back" : "drawer"
        icon.source: stackView.depth > 1? "file:///Users/arjun/Documents/CompetitiveBall/icons/splashs/back.png":"file:///Users/arjun/Documents/CompetitiveBall/icons/splashs/drawer.png"
        onTriggered: {
            if (stackView.depth > 1) {
                //Give them a reset warning
                if(listView.currentIndex===0)
                    warningDialog.open();
                else{
                    stackView.pop()
                    listView.currentIndex = -1
                    thisTitle = "Make some splashs!"
                }
            }
            else {
                drawer.open()
            }
        }
    }
    Dialog {
        id: warningDialog
        x: Math.round((root.width - width) / 2)
        y: Math.round(root.height / 6)
        width: Math.round(Math.min(root.width, root.height) / 3 * 2)
        modal: true
        focus: true
        title: "Warning"

        standardButtons: Dialog.Ok | Dialog.Cancel
        onAccepted: {
            stackView.pop()
            listView.currentIndex = -1
            warningDialog.close()
            thisTitle = "Make some splashs!"
        }
        onRejected: {
            warningDialog.close()
        }

        contentItem: ColumnLayout {
            id: warningColumn
            spacing: 20

            RowLayout {
                spacing: 10

                Label {
                    text: "Are you sure you would like to leave? All progress in the current game will be lost"
                    horizontalAlignment: Label.AlignHCenter
                    verticalAlignment: Label.AlignVCenter
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    wrapMode: Label.Wrap
                }
            }
        }
    }
    header: ToolBar {
        Material.foreground: "mintcream"

        RowLayout {
            spacing: 20
            anchors.fill: parent

            ToolButton {
                action: navigateBackAction
            }

            Label {
                id: titleLabel
                text: thisTitle.toString()
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            ToolButton {
                action: optionsMenuAction

                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight

                    Action {
                        text: "Settings"
                        onTriggered: settingsDialog.open()
                    }
                    Action {
                        text: "Help"
                        onTriggered: help()
                    }
                    Action {
                        text: "About"
                        onTriggered: aboutDialog.open()
                    }
                }
            }
        }
    }

    Drawer {
        id: drawer
        width: Math.min(root.width, root.height) / 5 * 3
        height: root.height
        interactive: stackView.depth === 1

        ListView {
            id: listView

            focus: true
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {
                height: root.height/2
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                Text{
                    text: model.title
                    font.family: "PanRoman"
                    horizontalAlignment: Text.AlignHCenter
                    wrapMode: Text.Wrap
                    anchors.centerIn: parent
                    font.pointSize: 25
                    width: parent.width
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                highlighted: ListView.isCurrentItem
                onClicked: {
                    listView.currentIndex = index
                    stackView.push(model.source);
                    endingPage=model.source;
                    drawer.close()
                    if(model.source==="qrc:/CompetitiveMode.qml")
                    {
                        console.log("POTATOS ARE TAKING OVER THE WORLD")
                        thisTitle="Competitive Mode"
                    }
                    else if(model.source==="qrc:/GameMode.qml")
                    {
                        console.log("POTATOS ARE TAKING OVER THE WORLD FOREVER")
                        thisTitle="Game Mode"
                    }
                    //                        if(model.source==="qrc:/CustomizationMode.qml")
                    //                        {
                    //                            root.width= 1200
                    //                            root.height = 580
                    //                        }
                    //                        else if(model.source==="qrc:/CompetitiveMode.qml"){
                    //                            root.width = 708
                    //                            root.height = 785
                    //                        }

                }
            }

            model: ListModel {
                ListElement { title: "Game Mode"; source: "qrc:/CompetitiveMode.qml" }
                ListElement { title: "Store"; source: "qrc:/GameStore.qml" }
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }
    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Pane {
            id: pane
            Column{
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter
                Label {
                    text: "Shoot some hoops!!"
                    font.family:"Impact"
                    font.pointSize: 33
                    anchors.horizontalCenter: parent.horizontalCenter

                }
                Image{
                    source: "file:///Users/arjun/Documents/CompetitiveBall/images/Capture.PNG"
                    width: 500
                    height: 360
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Label {
                    text: "An interactive basketball shooting game. Have fun and lets make some splashs!"
                    font.family: "Helventica"
                    font.pointSize: 13
                    width:650
                    wrapMode: Label.Wrap
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            Image {
                id: arrow
                source: "file:///Users/arjun/Documents/CompetitiveBall/images/arrow1.png"
                //source: "images/arrow.png"
                width: 100
                height: 60
                anchors.left: parent.left
                anchors.bottom: parent.bottom
            }
        }
    }
    Settings{
        category: "windows1"
        property alias x: root.x
        property alias y: root.y
        property alias width: root.width
        property alias height: root.height
    }
}
