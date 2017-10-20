import QtQuick 2.0

Column{
    id: rect1
    width: 300
    height: 300
    property alias time: clock.text
    property alias comment: text.text
    Text{
        id: clock
        width: 200
        height: 200
        font.pointSize: 24
    }
    Text{
        id: text
        width: 100
        height: 100
        font.pointSize: 20
    }
}

