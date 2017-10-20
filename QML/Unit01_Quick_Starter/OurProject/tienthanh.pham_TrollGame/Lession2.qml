import QtQuick 2.6
import QtQuick.Window 2.2

Rectangle {
    id: root
    width: 1000; height: 680
    color: "#3498db"
    focus: true
    Keys.onLeftPressed: ufo.a = 1
    Keys.onRightPressed: ufo.a = 2
    Keys.onUpPressed: ufo.a = 3
    Keys.onDownPressed: ufo.a = 4
    Keys.onEnterPressed: rungame.start()
    property var count: 0

    Text{
        id: deadtxt
        visible: false
        text: "You are amazing :))"
        font.pointSize: 100
    }

    Rectangle{
        height: 150
        width: root.width
        anchors.left: root.left
        anchors.bottom: root.bottom
        color: "#2c3e50"
        Column{
            Text {
                text: qsTr("Thuc hanh key Element")
                font.pointSize: 24
                color: "#ecf0f1"
            }
            Text {
                id: sco
                text: "Your Score:" + ufo.score
                font.pixelSize: 24
                color: "#c0392b"
            }
            Text {
                text: "Try to distrol troll human, if not he will kiss you :v"
                font.pixelSize: 24
                color: "#8e44ad"
            }
        }
    }

    Rectangle{
        id: human
        width:81
        height: 81
        radius: 2
        x: Math.round(Math.random()*400/81)*81
        y: Math.round(Math.random()*400/81)*81
        color: "#00000000"
        Image {
            id: human_img
            source: "human.png"
            anchors.fill: parent
        }
    }
    Rectangle {
        id: ufo
        property var a: 0
        property var score: 0
        width: 81
        height: 81
        radius: 2
        x: 81; y: 81
        color: "#00000000"
        Image {
            id: ufoimg
            source: "ufo.png"
            anchors.fill: parent
        }

    }

    function makehuman(){
        root.count = 0
        human.x = Math.round(Math.random()*root.width/81-1)*81
        human.y = Math.round(Math.random()*root.height/81-1)*81
    }

    //update in real time
    Timer {
        id: rungame
        interval: 150
        running: true
        repeat: true
        onTriggered: {
            if (ufo.x===human.x&ufo.y===human.y){
                ufo.score++
                makehuman();
            }
            root.count += 1;
            if (root.count >= 50){
                deadtxt.visible=true
                rungame.stop()
            }
            switch (ufo.a){
                case 1:
                    if (ufo.x > 0) ufo.x -= 81;
                    break;
                case 2:
                    if (ufo.x < root.width-81) ufo.x += 81;
                    break;
                case 3:
                    if (ufo.y > 0) ufo.y -= 81;
                    break;
                case 4:
                    if (ufo.y < root.height-200) ufo.y += 81;
                    break;
            }
        }
    }
}
