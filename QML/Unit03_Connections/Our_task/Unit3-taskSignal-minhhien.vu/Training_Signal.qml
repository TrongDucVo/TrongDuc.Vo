import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    id: win1
    visible: true
    width: 640
    height: 480
    Loader{
        id: loader
        focus: true
    }

    Rectangle {
        id: forwarder
        color: "red"
        width: 100; height: 100

        signal send()
        onSend: {
            loader.source= "page.qml"
            forwarder.visible= false
        }

        MouseArea {
            id: mousearea
            anchors.fill: parent
            onClicked: console.log("MouseArea clicked")
        }
        Component.onCompleted: {
            mousearea.clicked.connect(send)
        }
    }
}
