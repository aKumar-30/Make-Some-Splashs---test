import QtQuick 2.0

Item {
    //basketball
    Image{
        visible: totalTimeTimer.running
        z:3
        id: mId
        y:0;
        x:Math.floor(Math.random() * (root2.width-width));
        width:140
        height:140
        source: ballSource
        NumberAnimation{
            onStopped: {
                mId.visible=false
            }
            id: fallingAnim
            target: mId
            property: "y"
            from: 0
            to: root2.height
            duration:Math.floor(Math.random() * (1200)+1000);

        }
        Component.onCompleted: {
            fallingAnim.start()
        }
        MultiPointTouchArea {
            anchors.fill: parent
            onPressed: {
                if(mId.visible&&totalTimeTimer.running){
                    mId.visible=false;
                    root2.ballClicked();
                }
            }
        }
    }
}
