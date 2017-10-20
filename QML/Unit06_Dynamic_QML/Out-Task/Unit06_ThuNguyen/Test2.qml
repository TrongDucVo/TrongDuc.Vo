import QtQuick 2.6

Column {
    visible: true
    id: rect2
    width: 300
    height: 600
    property alias background: bg.source
    property alias time: clock.text
    property alias country: local.text
    Text{
        id: local
        width: 300
        height: 100
        font.pointSize: 20
        horizontalAlignment: Text.AlignHCenter
        text:""
    }
    Image{
        id: bg
        width: 300
        height: 300
    }
    Text{
        id: clock
        width: 300
        height: 100
        font.pointSize: 27
        horizontalAlignment: Text.AlignHCenter
        text:""
    }



}
