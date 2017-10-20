
//Touch.qml
import QtQuick 2.6

Rectangle {
    id: rec
    height: win.height/12
    width: height
    color: "gray"
    opacity: 0.5
    radius: height/2

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(textTen.text != "" && textDiem.text != "")
                modeldata.append({name: textTen.text, sco: textDiem.text})
            console.log("Clicked mouse at", mouse.x, mouse.y)
        }
        drag.target: rec
    }
}
