
import QtQuick 2.0
import QtQuick.Controls 2.2
Rectangle {
    id:rect2
    width:40
    height:150
    color: "steelblue"
    radius: 20
    Flickable {
        id: flickArea2
        anchors.fill: parent
        width: 40; height: 180
        flickableDirection: Flickable.VerticalFlick
        clip: true
        draggingVertically: true
Rectangle{
    id: rect3
    width: parent.width
    height: 60
    color: "black"
}
        Text{
            id: text
            width: 600
            height: 100
            text:  model.name
            font.pointSize: 20
            anchors.centerIn: parent
            color: "#0040FF"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                dataModel.append({"name": "Ice2"})
            }
        }
    }
}



