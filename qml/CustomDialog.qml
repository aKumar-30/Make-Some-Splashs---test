import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
/*
  DESCRIPTION:

//  An example dialog implementation, with modal option and simple animations.
//  EXAMPLE USAGE:

  Scene {
    id: scene
    width: 480
    height: 320

    SimpleButton {
      text: "SHOW DIALOG"
      anchors.centerIn: parent
      onClicked: myDialog.show()
    }

    customDialog.qml {
      id: myDialog
      box.color: "#f0f0f0"
      question.text: "Quit the game?"
      modal: true
      onSelectedOk: {
        Qt.quit()
      }
    }
  }

*/

Item { property string __felgo_live_id_component: "FELGO_COMPONENT_ID_13698"; property string __felgo_live_id_element: "FELGO_ID_13698_23912";
    Component.onCompleted: {
        Extra.volume=1
    }

    id: dialog
    // if the parent is a Scene, we can fill the whole screen with gameWindowAnchorItem
    anchors.fill: parent.gameWindowAnchorItem ? parent.gameWindowAnchorItem : parent
    // we need to disable this item if it is invisible, then all the contained MouseAreas are also disabled
    enabled: visible
    // by default, the dialog is invisible
    visible: false

    // alias to access the box
    property alias box: box
    // alias to access the question text
    property alias question: question

    // property to make this dialog modal and prevents selecting anything behind it
    property bool modal: false

    // signals emitted if a button has been pressed
    signal selectedOk
    signal selectedCancel

    // show function
    function show() {
        // set the dialog visible to enable it and start show animation
        dialog.visible = true
        showAnimation.start()
    }

    // hide function
    function hide() {
        // start hide animation, the dialog will be set invisible once the animation has finished
        hideAnimation.start()
    }

    // this component prevents selecting anything behind the dialog, only enabled if it's a modal dialog
    MouseArea { property string __felgo_live_id_element: "FELGO_ID_13698_23913";
        anchors.fill: parent
        enabled: dialog.modal
    }

    // visible overlay, only visible if it's a modal dialog
    Rectangle { property string __felgo_live_id_element: "FELGO_ID_13698_23914";
        id: overlay
        visible: dialog.modal
        anchors.fill: parent
        color: "#000"
    }

    // the box containing dialog text and buttons
    Rectangle { property string __felgo_live_id_element: "FELGO_ID_13698_23915";
        id: box
        x: 100
        y: 130
        height: width-70
        width: 470
        color: "#fff"
        border.width: 1
        border.color: "#000"
        radius: 10
        anchors.centerIn: parent
        onVisibleChanged: {
            if(visible){
                Extra.isOpen = true;
            }
            if(!visible){
                Extra.volume=volumeSlider.volume
                Extra.sound=soundSlider.sound
                Extra.isOpen = false;
            }
        }

        Column { property string __felgo_live_id_element: "FELGO_ID_13698_23916";
            id: settingsColumn
            spacing: 20
            y:15
            Text{ property string __felgo_live_id_element: "FELGO_ID_13698_23917";
                width: 200
                text: "Settings"
                font.family: "Bodoni MT Black"
                wrapMode: Label.Wrap
                font.pixelSize: 35
                font.bold:true;
                horizontalAlignment: "AlignHCenter"
            }
            Row{ property string __felgo_live_id_element: "FELGO_ID_13698_26502";
                spacing: 8
                IconButtonBarItem{ property string __felgo_live_id_element: "FELGO_ID_13698_26503";
                    visible:true
                    color: "black"
                    id: musicVolumeIcon
                    icon: (Extra.volume<0.45)?((Extra.volume<0.02)?IconType.volumeoff:IconType.volumeoff):IconType.volumeup
                    iconSize: 30
                    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_13698_26504";
                        anchors.centerIn: parent
                        width: 30
                        height:width
                        color:"transparent"
                        MouseArea{ property string __felgo_live_id_element: "FELGO_ID_13698_26505";
                            anchors.fill: parent
                            onClicked:{
                                musicVolumeIcon.icon=IconType.volumeoff
                                Extra.volume=0.0;
                                shouldExtraVolumeChange=false
                                volumeSlider.valueChanged();

                                //nobody knows why but do it twice
                                musicVolumeIcon.icon=IconType.volumeoff
                                Extra.volume=0.0;
                                shouldExtraVolumeChange=false
                                volumeSlider.valueChanged();
                            }
                        }
                    }
                }
                Label{ property string __felgo_live_id_element: "FELGO_ID_13698_26506";
                    text: "Music:"
                    font.pointSize: 10
                    font.bold: true
                }
                Slider { property string __felgo_live_id_element: "FELGO_ID_13698_26507";
                    id: volumeSlider
                    from: 0
                    to: 1
                    onValueChanged: {
                        if(value<0.02){
                            if(!(musicVolumeIcon.icon===IconType.volumeoff)){
                                musicVolumeIcon.icon=IconType.volumeoff
                            }
                        }
                        else if(value<0.45){
                            if(!(musicVolumeIcon.icon===IconType.volumedown)){
                                musicVolumeIcon.icon=IconType.volumedown
                            }
                        }
                        else {
                            if(!(musicVolumeIcon.icon===IconType.volumeup)){
                                musicVolumeIcon.icon=IconType.volumeup
                            }
                        }
                        if(shouldExtraVolumeChange){
                            Extra.volume=volumeSlider.volume
                        }
                        else
                            shouldExtraVolumeChange=true
                    }
                    value: QtMultimedia.convertVolume(Extra.volume,QtMultimedia.LinearVolumeScale,QtMultimedia.LogarithmicVolumeScale);
                    property real volume: QtMultimedia.convertVolume(volumeSlider.value,
                                                                     QtMultimedia.LogarithmicVolumeScale, QtMultimedia.LinearVolumeScale)
                }
            }
            Row{ property string __felgo_live_id_element: "FELGO_ID_13698_26508";
                spacing: 8
                IconButtonBarItem{ property string __felgo_live_id_element: "FELGO_ID_13698_26509";
                    visible:true
                    color: "black"
                    id: musicSoundIcon
                    icon: (Extra.sound<0.45)?((Extra.sound<0.02)?IconType.volumeoff:IconType.volumeoff):IconType.volumeup
                    iconSize: 30
                    Rectangle{ property string __felgo_live_id_element: "FELGO_ID_13698_26510";
                        anchors.centerIn: parent
                        width: 30
                        height:width
                        color:"transparent"
                        MouseArea{ property string __felgo_live_id_element: "FELGO_ID_13698_26511";
                            anchors.fill: parent
                            onClicked:{
                                musicSoundIcon.icon=IconType.volumeoff
                                Extra.sound=0.0;
                                shouldExtraSoundChange=false
                                soundSlider.valueChanged();

                                //nobody knows why but do it twice
                                musicSoundIcon.icon=IconType.volumeoff
                                Extra.sound=0.0;
                                shouldExtraSoundChange=false
                                soundSlider.valueChanged();
                            }
                        }
                    }
                }
                Label{ property string __felgo_live_id_element: "FELGO_ID_13698_26512";
                    text: "Sound:"
                    font.pointSize: 10
                    font.bold: true
                }
                Slider { property string __felgo_live_id_element: "FELGO_ID_13698_26513";
                    id: soundSlider
                    from: 0
                    to: 1
                    onValueChanged: {
                        if(value<0.02){
                            if(!(musicSoundIcon.icon===IconType.volumeoff)){
                                musicSoundIcon.icon=IconType.volumeoff
                            }
                        }
                        else if(value<0.45){
                            if(!(musicSoundIcon.icon===IconType.volumedown)){
                                musicSoundIcon.icon=IconType.volumedown
                            }
                        }
                        else {
                            if(!(musicSoundIcon.icon===IconType.volumeup)){
                                musicSoundIcon.icon=IconType.volumeup
                            }
                        }
                        if(shouldExtraSoundChange){
                            Extra.sound=soundSlider.sound
                        }
                        else
                            shouldExtraSoundChange=true
                    }
                    value: QtMultimedia.convertVolume(Extra.sound,QtMultimedia.LinearVolumeScale,QtMultimedia.LogarithmicVolumeScale);
                    property real sound: QtMultimedia.convertVolume(soundSlider.value,
                                                                    QtMultimedia.LogarithmicVolumeScale, QtMultimedia.LinearVolumeScale)
                }
            }
        }
        Text { property string __felgo_live_id_element: "FELGO_ID_13698_26514";
            id: question
            text: "Question?"
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -20
            color: "#000"
        }

        AppButton { property string __felgo_live_id_element: "FELGO_ID_13698_26515";
            text: "Ok"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            onClicked: {
                // emit signal and hide dialog if button is selected
                dialog.selectedOk()
                dialog.hide()
            }
        }

        AppButton { property string __felgo_live_id_element: "FELGO_ID_13698_26516";
            text: "Cancel"
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            onClicked: {
                // emit signal and hide dialog if button is selected
                dialog.selectedCancel()
                dialog.hide()
            }
        }
        // animation to show the dialog
        ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_13698_895";
            id: showAnimation
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_13698_896";
                target: box
                property: "scale"
                from: 0
                to: 1
                easing.type: Easing.OutBack
                duration: 250
            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_13698_897";
                target: overlay
                property: "opacity"
                from: 0
                to: 0.2
                duration: 250
            }
        }

        // animation to hide the dialog
        ParallelAnimation { property string __felgo_live_id_element: "FELGO_ID_13698_898";
            id: hideAnimation
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_13698_899";
                target: box
                property: "scale"
                from: 1
                to: 0
                easing.type: Easing.InBack
                duration: 250
            }
            NumberAnimation { property string __felgo_live_id_element: "FELGO_ID_13698_900";
                target: overlay
                property: "opacity"
                from: 0.2
                to: 0
                duration: 250
            }
            onStopped: {
                // set it invisible when the animation has finished to disable MouseAreas again
                dialog.visible = false
            }
        }
    }
}
