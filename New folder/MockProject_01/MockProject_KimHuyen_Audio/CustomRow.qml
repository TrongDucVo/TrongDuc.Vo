import QtQuick 2.0

Rectangle{

    id: row


    color: "transparent"
        Text {

            text: model.name
            font.pointSize: 18
            color: "black"
            x : 10
            y: 7
            font.bold:true


    MouseArea{

        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            row.color ="#FFFFCC"


        }
        onExited: {

            row.color = "white"


        }
    }



}
}
