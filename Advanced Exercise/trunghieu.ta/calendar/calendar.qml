import QtQuick 2.6
import QtQuick.Window 2.2

Item {
    id: root
    visible: true
    width: 600
    height: 400
    property int current: 0

    ListModel {
        id: listModel
        ListElement {name: "text1"}
        ListElement {name: "text2"}
        ListElement {name: "text3"}
        ListElement {name: "text4"}
        ListElement {name: "text1"}
        ListElement {name: "text2"}
        ListElement {name: "text3"}
        ListElement {name: "text4"}
    }

    Component {
        id: clock
        Rectangle{
            width: 100
            height: 80
            color: (listDate.currentIndex == index)?"#003366" : "#585858"//ListView.isCurrentItem ? "#003366" : "#585858"
            border.color: "gray"
            border.width: 1

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    listDate.currentIndex = index; // <---- Works
                }
            }
            Text {
                id: textD
                text: (index == 0 || index == 31) ? "" : index
                color: listDate.isCurrentItem ? "#003366" : "blue"
                font.pointSize: 20
                anchors.centerIn: parent
            }
        }
    }

    Component {
        id: clockM
        Rectangle{
            width: 100
            height: 80
            color: (listM.currentIndex === index) ? "#003366" : "#585858"//ListView.isCurrentItem ? "#003366" : "#585858"
            border.color: "gray"
            border.width: 1

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    listM.currentIndex = index; // <---- Works
                }
            }
            Text {
                id: textM
                text: (index == 0 || index == 13) ? "" : index
                color: "blue"//listM.isCurrentItem ? "#003366" : "blue"
                font.pointSize: 20
                anchors.centerIn: parent
            }
        }
    }

    Component {
        id: clocky
        Rectangle{
            width: 100
            height: 80
            color: (listY.currentIndex === index) ? "#003366" : "#585858"
            border.color: "gray"
            border.width: 1

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    listY.currentIndex = index; // <---- Works
                }
            }
            Text {
                id: textY
                text: (index == 0 || index == 31) ? "" : index + 1989
                color: listY.isCurrentItem ? "#003366" : "blue"
                font.pointSize: 20
                anchors.centerIn: parent
            }
        }
    }

    ListView {
        id: listDate
        height: 240
        width: 100
        clip: true
        snapMode: ListView.SnapToItem//SnapOneItem//
        model: 32
        currentIndex: 1
        onContentYChanged: {
            //current = contentY/80 + 1
            //listDate.currentIndex = parseInt(contentY/80 + 1)
            //console.log(listDate.currentIndex)
            listDate.currentIndex = Math.floor(contentY/80 + 0.5) + 1
        }
        delegate: clock

    }

    ListView {
        id: listM
        height: 240
        width: 100
        clip: true
        anchors.left: listDate.right
        anchors.top: listDate.top
        anchors.leftMargin: 20
        currentIndex: 1
        snapMode: ListView.SnapToItem//SnapOneItem//
        model: 14
        onContentYChanged: {
            //current = Math.floor(contentY/80 + 0.5) + 1
            listM.currentIndex = Math.floor(contentY/80 + 0.5) + 1
        }
        delegate: clockM
    }
    ListView {
        id: listY
        height: 240
        width: 100
        clip: true
        anchors.left: listM.right
        anchors.top: listM.top
        anchors.leftMargin: 20
        snapMode: ListView.SnapToItem//SnapOneItem//
        model: 1000
        currentIndex: 1
        onContentYChanged: {
            listY.currentIndex = Math.floor(contentY/80 + 0.5) + 1
        }
        delegate: clocky
    }
}
