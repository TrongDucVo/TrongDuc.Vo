import QtQuick 2.6
import QtQuick.Window 2.2




Item{
    id: root
    width: 100
    height: 100
    visible: true
    property alias myColor: rec.color

    signal clickImage
    signal pressHold

    Column{
        spacing: 2
        anchors.fill: parent

        Text {
            text: "Click to circle to change the colour"
            font.pixelSize: 24
            color: "Blue"
        }
        Text {
            text: "Press and hold the circle to make it smaller"
            font.pixelSize: 24
            color: "Blue"
        }

    }

    Rectangle{
        id: rec

        x : 150
        y : 250
        width: 100
        height: 100
        radius : 50
        color:"green"

        MouseArea{
            id: poit
            anchors.fill: parent
            onClicked: {
                root.clickImage();
            }
            onPressAndHold: {
                root.pressHold()
            }
            onReleased: {
                rec.scale = 1;
                drag.target = poit
            }

        }
    }
    function myClick(){
        rec.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
        poit.drag.target=root
    }

    function myPressHold(){
        rec.scale = 0.5
        poit.drag.target = root
    }
    Component.onCompleted: {
        root.onClickImage.connect(myClick)
        root.onPressHold.connect(myPressHold)

    }
}

