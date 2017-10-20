import QtQuick 2.6
Item{
    height: 50
    property alias mytxt: txt.text
    property alias mycolor: txt.color
    Text{
        id:txt
        text:mytxt
        font.pointSize: 24
        color: mycolor
    }
}
