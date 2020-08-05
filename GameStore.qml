import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import Qt.labs.settings 1.1
import "test.js" as Global
Page {
    visible: true
    width: 708
    height: 785
    title:"Competitive Mode"
    property int duration: 1000
    id: root
    property var found: true;
    property var bought: ["Normal Ball", "Blue", "Green"]
    property int count: 0;
    property var mName: "";
    property var mSource: "";
    property int numCoins: 100;
    property bool firstTime: true;
    property var currentBallSource: "file:///Users/arjun/Documents/All_Qt_Projects/Qt Quick/Qt Fundamentals Udemy Course/10-6AnimationDemo/images/basket_ball.png";
    onFoundChanged: {
        console.log("ONION")
        console.log(found);
    }
    Component.onCompleted: {
        console.log(found)
    }

    function checkIfFound()
    {
        found = false;
        for(var i =0; i < bought.length; i++){
            if(bought[i]===mName){
                found = true;
                return true;
            }
        }
        return false;
    }
    function someOfTheStuffToDoWhenClicked()
    {
        firstTime=false;
        if(!found){
            //not bought yet
            purchaseButton.visible=true;
            buttonFadeRect.visible=true;
            lockSign.visible = true;

            purchaseButtonText.text = count;

            if(numCoins>=count){
                purchaseButton.enabled=true;
                colorRect.color= "#bdbd22"
            }
            else{
                purchaseButton.enabled = false;
                colorRect.color= "#69685a"
            }
        }
        else{
            //bought before
            currentBallSource=mSource;
            purchaseButton.visible=false;
            buttonFadeRect.visible=false;
            lockSign.visible = false;
        }
        bigPicImage.source= mSource;
        bigPicText.text =mName;
    }
    Image{
        x:0.1
        anchors.fill: parent
        opacity: 0.2
        source: "file:///Users/arjun/Documents/CompetitiveBall/images/gameStoreBackground.jpg"
    }
    //Number of coins thingy
    Rectangle{
        Component.onCompleted: {
            bigPicAnim.start()
            if(Global.numberCoins===-95)
                Global.numberCoins=numCoins
            else
                numCoins = Global.numberCoins;
            numCoins = Global.numberCoins;
        }
        Component.onDestruction:  {
            Global.numberCoins=numCoins;
        }

        Row{
            spacing: 20;
            x: 10
            y:10
            Image{
                width: 25
                height: 25
                source: "file:///Users/arjun/Documents/CompetitiveBall/images/coinFront.png"
            }
            Text{
                property int value: numCoins
                text: value
                font.family: "Stencil"
                horizontalAlignment: Text.AlignHCenter
                font.pointSize:15
                Behavior on value {
                    NumberAnimation { duration: (firstTime)?1:1000; easing.type: Easing.InOutQuad}
                }
            }

        }
    }
    //Big Pic
    Rectangle{
        id: bigPic
        y:lockSign.y+lockSign.height/3-height+8
        anchors.horizontalCenter: parent.horizontalCenter
        width: purchaseButton.width*2.5
        height: purchaseButton.width*1.5
        border.color: "darkgray"
        border.width: 3
        radius: 4
        color: "transparent"
        Text{
            text: "Normal Ball"
            id: bigPicText
            font.family: "Tw Cen MT Condensed Extra Bold"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 25
            anchors.horizontalCenter: parent.horizontalCenter
            y:2
            color: "black"
        }
        Image{
            id: bigPicImage
            source: currentBallSource
            width: 165;
            height: 165;
            anchors.horizontalCenter: parent.horizontalCenter
            y:bigPicText.y+bigPicText.height+2
        }

        RotationAnimation{
            id: bigPicAnim
            target: bigPicImage
            property: "rotation"
            easing.type: Easing.Linear
            to: 360*5;
            duration: 10020
            onStopped: {
                bigPicImage.rotation =0;
                bigPicAnim.start()
            }
        }
    }

    //lockSign sign
    Image{
        visible: false
        id: lockSign
        width: purchaseButton.width/2
        height: width
        anchors.bottom: buttonFadeRect.top
        anchors.horizontalCenter: parent.horizontalCenter
        source: "file:///Users/arjun/Documents/CompetitiveBall/images/lockSign.png"
    }

    //Purchase Button
    Button{
        MessageDialog{
            id: confirmMessage
            title: "Confirmation"
            standardButtons: MessageDialog.Yes |MessageDialog.Cancel
            text: "Are you sure you want to purchase this?"
            onYes:{
                numCoins-=count
                bought.push(mName);
                boughtChanged();
                checkIfFound()
                someOfTheStuffToDoWhenClicked();
            }

        }
        onClicked: {
            confirmMessage.open()
        }
        visible:false;
        z:2
        x: buttonFadeRect.x+4
        y:buttonFadeRect.y-3
        id: purchaseButton
        height: 70;
        width:150;
        Rectangle{
            id: colorRect
            anchors.fill:parent
            color:"yellow"
            Row{
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 20
                Text{
                    id: purchaseButtonText
                    //cost
                    text: "25"
                    font.pointSize: 18
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Goudy Stout"
                }
                Image{
                    //coin pic
                    width:30
                    height:30;
                    source: "file:///Users/arjun/Documents/CompetitiveBall/images/coinFront.png"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }

    }
    Rectangle{
        visible: false;
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: grid.top
        id: buttonFadeRect
        height: 70;
        width:150;
        color: "#93a8c4"
    }
    //List model for all the different things
    ListModel{
        id: contactModel

        ListElement{
            type: "regularBall";
            name: "Normal Ball"
            picSource: "file:///Users/arjun/Documents/All_Qt_Projects/Qt Quick/Qt Fundamentals Udemy Course/10-6AnimationDemo/images/basket_ball.png"
            price: 0;
        } ListElement{
            type: "blueBall";
            name: "Blue"
            picSource: "file:///Users/arjun/Documents/CompetitiveBall/images/blueBall.png"
            price: 10
        } ListElement{
            type: "greenBall";
            name: "Green"
            picSource: "file:///Users/arjun/Documents/CompetitiveBall/images/greenBall.png";
            price: 10
        } ListElement{
            type: "redBall";
            name: "Red"
            picSource: "file:///Users/arjun/Documents/CompetitiveBall/images/redBall.png"
            price: 15
        }ListElement{
            type: "tennisBall";
            name: "Tennis Ball"
            picSource: "file:///Users/arjun/Documents/CompetitiveBall/images/tennis_ball.png"
            price: 15
        }ListElement{
            type: "soccerBall";
            name: "Soccer Ball"
            picSource: "file:///Users/arjun/Documents/CompetitiveBall/images/soccer_ball.png"
            price: 20
        }ListElement{
            type: "bowlingBall";
            name: "Bowling Ball"
            picSource: "file:///Users/arjun/Documents/CompetitiveBall/images/bowling_ball.png"
            price: 20

        }ListElement{
            type: "volleyBall";
            name: "Volley Ball"
            picSource: "file:///Users/arjun/Documents/CompetitiveBall/images/volley_ball.png"
            price: 25
        }
        ListElement{
            type: "moon";
            name: "The Moon"
            picSource: "file:///Users/arjun/Documents/CompetitiveBall/images/moon.png"
            price: 80
        }
        ListElement{
            type: "Earth";
            name: "The Earth"
            picSource: "file:///Users/arjun/Documents/CompetitiveBall/images/earth.png"
            price: 80
        }
    }

    GridView {
        width: 460; height: 345
        cellWidth: 115; cellHeight: 115
        id:grid
        anchors.horizontalCenter: parent.horizontalCenter
        y:root.height-height-40
        currentIndex: 0;
        model: contactModel
        Component{
            id: foundDel
            Rectangle{
                width: grid.cellWidth
                height: grid.cellHeight
                color: "transparent"
                Rectangle {
                    width: grid.cellWidth-20
                    height: grid.cellHeight-20
                    id: wrapper
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    border.width: 3
                    border.color: "black"
                    radius: 5;
                    color: "white"
                    Image{
                        id: mImage
                        x:parent.x
                        y:6
                        width: 65
                        height:65;
                        source: picSource

                    }
                    Text{
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
                    MouseArea{
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
        }
//        delegate: Component {
//            Loader {
//                source: if(checkIfFound()) {
//                            console.log("?????")
//                            return "GameStoreDelegate.qml"
//                        }
//                        else
//                            return "GameStoreDelegateNot.qml"
//            }
//        }
        delegate: foundDel
        highlight:
            Rectangle {
            z:8
            color: "steelblue";
            radius: 5;
            opacity: 0.6
            Image{
                id: checkMark
                visible: found;
                anchors.centerIn: parent
                width: 100;
                height: 100;
                source: "file:///Users/arjun/Documents/CompetitiveBall/images/checkMark.png"
            }
            Image{
                id: theXofDoom
                visible: !found;
                anchors.centerIn: parent
                width: 100;
                height: 100;
                source: "file:///Users/arjun/Documents/CompetitiveBall/images/theXOfDoomAndHorror.png"
            }
        }
        focus: true
    }

    Settings{
        category: "mySettingsThing5"
        property alias mBought: root.bought
        property alias numCoins: root.numCoins
        property alias mCurrentBallSource: root.currentBallSource
    }
}

