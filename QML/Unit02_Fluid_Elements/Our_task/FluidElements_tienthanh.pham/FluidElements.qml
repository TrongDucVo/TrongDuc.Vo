import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: win
    width: 1800
    height: 600
    Image {
        id: bg
        source: "img/background2.jpg"
        anchors.fill:parent
    }
    Mycar {
        id: car1
        source: "img/car1.png"
        h: 250
        onClicked: gogogo.start()
        NumberAnimation{
            id: gogogo
            target: car1
            properties: "x"
            to: 1700
            duration: 4000
        }
    }
    Mycar {
        id: car2
        source: "img/car3.png"
        h: 300
        Behavior on x{
            NumberAnimation{duration: 5000}
        }
        onClicked: x = 1700
    }
    Mycar {
        id: car3
        source: "img/car4.png"
        h: 320
        NumberAnimation on x{
            to: 1700; duration: 8000
        }
    }
}
