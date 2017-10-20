import QtQuick 2.6
import QtQuick.Controls 1.2

Button {
    //id: btnPage1
    height: 50
    width: 100
    signal signal_choose()
    Text {
        id: txt
        width: win.height/12
        height: parent.height
        text: model.name
        color: "black"
        font.pointSize: 15
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            signal_choose()
        }
    }
}
