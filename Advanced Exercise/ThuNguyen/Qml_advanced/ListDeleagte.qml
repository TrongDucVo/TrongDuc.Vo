import QtQuick 2.0

Rectangle {
    id: root
    property int globalIndex;
    Rectangle{
        id: rect
        width: 200
        height: 20
        color: "green"
        Text {
           text: alphabet[globalIndex]
        }
    }
    Column{
        id: col
        anchors.top: rect.bottom
        height: list.count*20
        Repeater{
            id: list
            width: 200
            model: array[globalIndex]
            delegate: Rectangle{
                id: wrapper
                width: 200
                height: 20
                color: "lightgrey"
                Text{
                    text:modelData
                }

            }
        }
    }
}
