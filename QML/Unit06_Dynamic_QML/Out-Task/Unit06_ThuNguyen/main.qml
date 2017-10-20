import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

ApplicationWindow {
    visible: true
    id: root
    width: 1800
    height: 1000
    Rectangle{
        width: 300
        height: parent.height
        border.color: "green"
        anchors.right: parent.right
        ListModel{
            id: datamodel
            ListElement {name: "Home"; url:""}
            ListElement {name: "Connection"; url:"connection.qml"}
            ListElement {name: "Timer"; url:"timer.qml"}
            ListElement {name: "Model-View-Delegate"; url:"model_view_delegate.qml"}
        }
        ListView{
            id: listview
            model: datamodel
            anchors.fill: parent
            delegate: Delegate{}
        }
    }
    Rectangle{
        width: 1400
        height: parent.height
        border.color: "green"
        Rectangle{
            id: home
            anchors.fill: parent
            Image{
                anchors.fill: parent
                source:"image/vietnam2.jpg"
            }
        }
        Loader{
            id: mainComponent
            anchors.fill: parent
        }
    }



}

