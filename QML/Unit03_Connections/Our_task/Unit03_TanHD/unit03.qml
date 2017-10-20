import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 800
    height: 800

    Image {
        id: background
        source: "img/Space2.png"
        anchors.fill: parent
    }

    Rocket {
        rColor: "red"
    }

    Rocket {
        x: 50
        rColor: "blue"
    }
    Rocket {
        x: 100
        rColor: "yellow"
    }
    Rocket {
        x: 150
        rColor: "purple"
    }
}
