import QtQuick 2.6

Rectangle {
    id: rect
    width: 200
    height: 400
    //visible: true
    signal select_Text()

    ListModel {
        id: listModel
        ListElement {
            name: "box1"
        }
        ListElement {
            name: "box2"
        }
        ListElement {
            name: "box3"
        }
        ListElement {
            name: "box1"
        }
        ListElement {
            name: "box2"
        }
        ListElement {
            name: "box3"
        }
    }

    Component {
        id: contactDelegate
        Rectangle {
            width: rect.width; height: 40
            border.color: "gray"
            border.width: 3
            Text {
                text: name
                font.pointSize: 20
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: select_Text()
            }
        }
    }

    ListView {
        id: list
        //visible: true
        width: rect.width
        height: rect.height
        model: listModel
        delegate : contactDelegate
        clip: true
        focus: true
        spacing: 5
    }

}
