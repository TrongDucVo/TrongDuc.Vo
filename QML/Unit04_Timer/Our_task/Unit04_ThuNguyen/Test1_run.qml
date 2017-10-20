import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1200
    height: 800
    property real count: 1
    Test1{
        id: rect1
    }
    Timer{
        interval: 1000;
        running: true;
        repeat: true;
        onTriggered: {
            count++;
            rect1.time = Date().toString();
            if (count > 11){
                rect1.comment = "10 second passed"
            }
        }
    }
}
