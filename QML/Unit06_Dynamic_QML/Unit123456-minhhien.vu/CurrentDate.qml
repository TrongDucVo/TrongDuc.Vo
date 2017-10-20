import QtQuick 2.0

Item {
    id: currentDate
    height: 49
    width: 190
    visible: true
    Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: textCurrentTime.text = Date().toString()
    }
    Text {
        id: textCurrentTime
        anchors.centerIn: parent
    }
}
