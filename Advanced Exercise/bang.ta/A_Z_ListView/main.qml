import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("A_Z_ListView")

    property int i: 0

    Rectangle{
        id: rect1
        width: 600
        height: parent.height
        color: "lightpink"
        ListModel {
            id: dataModel
            ListElement { name: "Abdul Ahad Mohmand"; letter: "A"; }
            ListElement { name: "Arcos Pontes"; letter: "A"; }
            ListElement { name: "Alexandar Panayotov Alexandrov"; letter: "A"; }
            ListElement { name: "Beorgi Ivanov"; letter: "B"; }
            ListElement { name: "Coberta Bondar"; letter: "C"; }
            ListElement { name: "Carc Garneau"; letter: "C"; }
            ListElement { name: "Dhris Hadfield"; letter: "D"; }
            ListElement { name: "Euy Laliberte"; letter: "E"; }
            ListElement { name: "Gteven MacLean"; letter: "G"; }
            ListElement { name: "Hulie Payette"; letter: "H"; }
            ListElement { name: "Mobert Thirsk"; letter: "M"; }
            ListElement { name: "Tran Thi Trang"; letter: "T"; }
            ListElement { name: "Nguyen Thi Trinh"; letter: "T"; }
            ListElement { name: "Tran Thi Tram"; letter: "T"; }
            ListElement { name: "Tran Thi Thu"; letter: "T"; }
            ListElement { name: "Hoang Thi Thom"; letter: "T"; }
            ListElement { name: "Zafydd Williams"; letter: "Z"; }
        }
        ListView{
            id: lV
            model: dataModel
            anchors.fill: parent
            anchors.margins: 20
            clip: true
            focus: true
            delegate:spaceManDelegate
            section.property: "letter"
            section.delegate: sectionDelegate
            highlight: Rectangle {color: "red"; opacity: 0.5}
        }
        Component {
            id: spaceManDelegate
            Item {
                width: ListView.view.width
                height: 20
                Text {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 8
                    font.pixelSize: 12
                    text: name
                    color: '#1f1f1f'
                }
            }
        }
        Component {
            id: sectionDelegate
            Rectangle {
                width: ListView.view.width
                height: 20
                Text {
                    id: txt
                    text: section
                    color: "black"
                }
                color: "blue"
            }
        }
    }
    Column {
        height: 30
        width: 20
        anchors.left: rect1.right
        anchors.right:  parent.right
        Repeater {
            model: ["A", "B", "C", "D", "E", "G", "H", "M", "T", "Z"]
                Rectangle {
                id: recDelegate
                width: parent.width
                height: parent.height
                border.color: "red"
                color: "orange"
//                property alias text:

                Text {
                    id: textContent
                    text: modelData
                    height: 400
                    width: 400
                    anchors.fill: parent
                    color: "black"
                    font.pixelSize: 15
                    anchors.verticalCenter: parent.verticalCenter
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        getIndex(textContent.text)
                        console.log("click " + textContent.text)
                    }
                }
        }
    }
    }

    function getIndex(data) {
        for(i = 0; i < dataModel.count; i++) {
            if (data === dataModel.get(i).letter)
                lV.currentIndex = i;
        }
    }
}
