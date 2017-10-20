import QtQuick 2.0

// unit03
Item {
    id:uItem03
    width: 50
    height: 50
    visible: true
    property alias rColor: rect.color

    signal  clickColorPoint
    signal  pressHoldColor
    signal  releaseColor

    Rectangle {
        id: rect
        anchors.fill: parent
        x: parent.x
        y: parent.y
        radius: width/2
        color: myColor

        MouseArea {
            id: mousa
            anchors.fill: parent
            onClicked: {
                uItem03.clickColorPoint();
                console.log("clicked")
            }

            onPressAndHold: {
                uItem03.pressHoldColor();
                 console.log("pressandhold")
            }

            onReleased: {
                uItem03.releaseColor();
                 console.log("released")
            }
        }


        function funcClick(){
            rect.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
        }
        function funcPressnHold(){
            rect.color = "red"
            mousa.drag.target = uItem03
        }
        function funcReleased(){
            rect.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
        }

        Component.onCompleted: {
            uItem03.onClickColorPoint.connect(funcClick)
            uItem03.onPressHoldColor.connect(funcPressnHold)
            uItem03.onReleaseColor.connect(funcReleased)
        }
    }
}
