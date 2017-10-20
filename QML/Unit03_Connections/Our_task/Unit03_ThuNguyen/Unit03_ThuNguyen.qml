import QtQuick 2.6
import QtQuick.Window 2.2

Window{
    visible: true
    width: 1900
    height: 1000
    Image {
        id: background
        anchors.fill: parent
        source: "image/background2.jpg"
    }
// There are two types of using signal in this project

    /// Type1: Signals are added to custom QML Types. A signal is emitted by invoking the signal as a method

    Type1{
        id: rect1
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            rect1.cLICK(mouse.x, mouse.y)
        }
        onPressed: {
            rect1.pRESS(mouse.x, mouse.y)
        }
        onPressAndHold: {
            rect1.pRESSandHOLD(mouse.x, mouse.y)
            drag.target = rect1
        }
    }

    /// Type2: Connecting Signals to Methods and Signals
    // Please uncomment the code below to run Type2

//    Type2{
//        id: rect2

//    }
//    MouseArea{
//        anchors.fill: parent
//        onClicked: {
//            rect2.cLICK(mouse.x, mouse.y)
//        }
//        onPressed: {
//            rect2.pRESS(mouse.x, mouse.y)
//        }
//        onPressAndHold: {
//            rect2.pRESSandHOLD(mouse.x, mouse.y)
//            drag.target = rect2
//        }
//    }
}
