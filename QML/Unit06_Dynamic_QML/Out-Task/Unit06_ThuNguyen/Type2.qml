//Type2.qml
import QtQuick 2.0

Item {
    id: rect2
    width: 200
    height: 200
    property alias text: label.text
    property alias source: image.source
    property alias imagewidth: image.width
    property alias imageheight: image.height
    Column{
        Image{
            id: image
            width: 200
            height: 200
            source: "image/sad.png"}
        Text{
            id:label
            width: image.width
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 15
            wrapMode: Text.WordWrap
            color: "white"
            text: "Do you know that this Friday is Friday the 13th?"
        }
    }
    signal action(real x1, real y1)
    function cLICK(x1,y1) {
        rect2.source = "image/smile.png";
        rect2.text = "But don't worry , be happy!";
        console.log("Clicked mouse at", x1, y1)
        rect2.x = x1-100
        rect2.y = y1-100
    }
    function pRESS(x1,y1){
        rect2.source = "image/wink.png";
        rect2.text = "Sorry, I'm just kidding! :v"
        console.log("Pressed mouse at", x1, y1)
        rect2.x = x1-100
        rect2.y = y1-100
    }
    function pRESSandHOLD(x1,y1){
        rect2.source = "image/613.jpg";
        rect2.imagewidth = 1900
        rect2.imageheight = 1000
        console.log("Pressed and held mouse at", x1, y1)
        rect2.x = x1-100
        rect2.y = y1-100
    }
    Component.onCompleted: {
        rect2.action.connect(cLICK)
        rect2.action.connect(pRESS)
        rect2.action.connect(pRESSandHOLD)
    }
}
