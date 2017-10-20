//Type1.qml
import QtQuick 2.0

Rectangle {
    id: rect1
    width: 200
    height: 200
    border.color: "green"
    signal cLICK(real x1, real y1)
        onCLICK:{
        rect1.color = "green";
        console.log("Clicked mouse at", x1, y1)
        rect1.x = x1-100
        rect1.y = y1-100
    }

    signal pRESS(real x2, real y2)
    onPRESS:{
        rect1.color = "red";
        console.log("Pressed mouse at", x2, y2)
        rect1.x = x2 - 100
        rect1.y = y2-100
    }
    signal pRESSandHOLD(real x3, real y3)
    onPRESSandHOLD:{
        rect1.color = "blue";
        console.log("Pressed and held mouse at", x3, y3)
        rect1.x = x3-100
        rect1.y = y3-100
    }

}
