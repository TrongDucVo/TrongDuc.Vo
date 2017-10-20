import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

ApplicationWindow{
    visible: true
    width: 1350; height:  1500
    title: qsTr("Dynamic QML")
    Rectangle{
        id: root
        width: 1000; height: parent.height
        visible: true
        anchors.left: parent.left
        anchors.top: parent.top
        border.color: "black"
        color: "#F7BE81"
        Loader{
            id: mainComponent
            active: true
        }
    }

    Rectangle{
        id: root1
        visible: true
        width: 350; height: parent.height
        anchors.left: root.right
        anchors.top: parent.top
        border.color: "black"
        color: "#F7BE81"
        Text{
            y: 700
            text: "Dynamic QML"
            font.family: "Comic Sans MS"
            font.pointSize: 30
            color: "#0000FF"
            font.bold: true
            anchors.centerIn:  parent
        }

        ListModel{
            id: listmodel
            ListElement {name: "Fluid Element" ; url: "qrc:/FluidElement.qml"}
            ListElement {name: "Connections" ; url: "qrc:/Connections.qml"}
            ListElement {name: "Timer" ; url: "qrc:/Timer.qml"}
            ListElement {name: "Model View Delegate" ; url: "qrc:/MarkManagerment.qml"}
        }
        ListView{
            id: listview
            model: listmodel
            width: 300
            height: 600
            highlight: Rectangle { color: "black"; radius: 20 }
            focus: true
            anchors.left: parent.left
            anchors.margins: 20
            spacing: 10
            delegate: Custom{
                width: parent.width
                height: 100
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        onClicked: listview.currentIndex = index
                        mainComponent.source = model.url
                }
            }
        }
    }
    }


}
