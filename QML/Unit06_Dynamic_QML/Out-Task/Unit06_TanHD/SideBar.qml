import QtQuick 2.0

// Sidebar Loader
Rectangle {
    height: 50
    width: parent.width
    color: "#3498db"
    Text {
        id: txt
        font.pointSize: 12
        //anchors.fill: parent
        text: model.name
        MouseArea{
            anchors.fill: parent
            onPressed: {
                txt.color = "#e74c3c"
                lessonLoader.source = model.url
                console.log("clicked")
            }
            onReleased: {
                txt.color = "black"
            }
        }
    }

}
