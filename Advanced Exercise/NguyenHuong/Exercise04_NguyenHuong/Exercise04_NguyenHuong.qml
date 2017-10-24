import QtQuick 2.8
import QtQuick.Window 2.2

Item {
    width: 300; height: 500
    Rectangle {
        color: "white"
        width: 300; height: 500
        Rectangle {
            id: root
            x:  0; y:50
            width: 900; height: 500
            Rectangle {
                id: list
                visible: true
                width: 300; height: 500
                x: 0; y: 0
                color: "red"
            }
            Rectangle {
                id: form
                visible: true
                width: 300; height: 500
                x:300; y: 0
                color: "green"
            }
            Rectangle {
                id: empty
                visible: true
                width: 300; height: 500
                x: 600; y: 0
                color: "yellow"
            }
            MouseArea {
                id: rootchange
                anchors.fill: parent
                onPositionChanged: {
                    drag.target= root
                    drag.minimumX= -600
                    drag.maximumX= 0
                    drag.minimumY= 50
                    drag.maximumY= 50
                }
                onReleased: {
                    if(root.x >= -600 && root.x < -450) root.x = -600;
                    if(root.x >= -450 && root.x < -150) root.x = -300;
                    if(root.x >= -150 && root.x < 0) root.x = 0;
                }
            }
        }
            Rectangle{
                id: listNotice
                x: 0
                width: 100; height: 50
                color: (root.x != 0)?"#00FF80":"blue"
                Text{
                    id: textList
                    width: 100; height: 50
                    font.pointSize: 20
                    text: "List"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        root.x = 0
                        color: "red"
                    }
                }
            }
            Rectangle{
                id: formNotice
                x: 100
                width: 100; height: 50
                color: (root.x != -300)?"#00FF80":"blue"
                Text{
                    id: textForm
                    width: 100; height: 50
                    font.pointSize: 20
                    text: "Form"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        root.x = -300
                        color: "red"
                    }
                }
            }
            Rectangle {
                id: emptyNotice
                x: 200
                width: 100; height: 50
                color: (root.x != -600)?"#00FF80":"blue"
                Text{
                    id: textEmpty
                    width: 100; height: 50
                    font.pointSize: 20
                    text: "Empty"
                    anchors.centerIn: parent
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        root.x = -600
                        color: "red"
                    }
                }
            }
    }
}
