import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: appLoader
    visible: true
    width: 800
    height: 400
    title: qsTr("Loader")

    ListModel {
        id: dataModel
        ListElement {
            name: "Unit01-QuickStarter"
            url: "unit01.qml"
        }
        ListElement {
            name: "Unit02-FluidElements"
            url: "unit02.qml"
        }
        ListElement {
            name: "Unit03-Connections"
            url: "unit03.qml"
        }
        ListElement {
            name: "Unit04-Timer"
            url: "unit04.qml"
        }
        ListElement {
            name: "Unit05-ModelViewDelegate"
            url: "unit05.qml"
        }
    }
    // loader
    Rectangle{
        id: display
        width: 580
        height: parent.height
        anchors.left: parent.left

        Loader {
            id:lessonLoader
            anchors.fill: parent
        }

    }

    // sidebar
    Rectangle {
        id: sidebar
        width:200
        height: parent.height
        anchors.right: parent.right
        anchors.rightMargin: 10

        ListView {
            anchors.fill: parent
            model: dataModel
            focus: true
            spacing: 5
            delegate: SideBar {
            }

            //header
            header: Rectangle {
                height: 50
                width: 100
                Text {
                    anchors.centerIn: parent
                    font.pointSize: 15
                    color: "#e74c3c"
                    text: "Lessons"
                }
            }
        }
    }
}
