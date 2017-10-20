import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true
    width: 400
    height: 400
    Loader{
        id: mainComponent
        width: 400
        height: 400
        source : {
            "qrc:/Home.qml"
        }
    }
    Rectangle{
        height: 30
        width: parent.width
        color: "#95a5a6"
        opacity: 0.5
        Text{
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 30
            text: "Viettel"
        }
        Image {
            id: name
            source: "/img/wireless.png"
            height: 15
            width: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
        }
        Text{
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 40
            text: "50%"
        }
        Image {
            source: "img/battery.png"
            height: 20
            width: 30
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 5
        }
    }

}
