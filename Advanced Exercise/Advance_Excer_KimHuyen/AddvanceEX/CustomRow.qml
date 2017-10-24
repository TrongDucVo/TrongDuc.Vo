import QtQuick 2.0

Rectangle{

    id: row

    color: "white"
        Text {

            text: model.name
            font.pointSize: 18
            color: "#770000"
            x : 10
            y: 7
        }
    Text {

        color: "#770000"
        text:  "\n  Year : "+model.year +"Votes : "+ model.votes
        font.pointSize: 14
        y:15

    }
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
