import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    id: win
    width: 300
    height: 500
    Item {
        x: 0; y: 0
        width: parent.width
        height: 50
        ListModel {
            id: model1
            ListElement { name: "List" }
            ListElement { name: "Form" }
            ListElement { name: "Empty" }
        }
        ListView {
            id: listview1
            width: parent.width
            height: parent.height
            x: 0; y: 0
            spacing: 0
            orientation: ListView.Horizontal
            model: model1
            clip: true
            onCurrentItemChanged: {
                listview2.currentIndex = listview1.currentIndex
            }
            delegate: Rectangle {
                width: parent.width/3
                height: parent.height
                color: ListView.isCurrentItem ? "#A9D0F5" : "White"
                Text {
                    anchors.centerIn: parent
                    font.pixelSize: 18
                    color: "Black"
                    text: name
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        listview1.currentIndex = index
                    }
                }
            }
        }
    }
    Item {
        x: 0; y: 50
        width: 300
        height: 450
        ListModel {
            id: model2
            ListElement {name: "Page1"}
            ListElement {name: "Page2"}
            ListElement {name: "Page3"}
        }
        ListView {
            id: listview2
            width: 300
            height: 450
            x: 0; y: 0
            spacing: 0
            orientation: ListView.Horizontal
            model: model2
            clip: true
            snapMode: ListView.SnapToItem
            highlightRangeMode: ListView.StrictlyEnforceRange

            onCurrentItemChanged: {
                listview1.currentIndex = listview2.currentIndex
            }
            delegate: Rectangle {
                width: 300
                height: 450
                color: "#A9D0F5"
                clip: true

                Text{
                    text: name
                    color: "red"
                    font.pointSize: 20
                    font.family: "Comic Sans MS"
                    anchors.centerIn: parent
                }
            }
        }
    }
}
