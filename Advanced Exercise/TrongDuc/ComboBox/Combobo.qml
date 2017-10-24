import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.2

Rectangle {
    id :win
    //color : "gray"
    radius: 3
    Text {
        id: text1
        width: 180
        height: 50
        text : model.name
        font.pixelSize: 15
        x:10;y:15
    }
}
