import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    id: win
    visible: true
    width: 450
    height: 780
    color: "#F5A9A9"
    property int change: 0
    Rectangle{
        id: rect1
        width: 420
        height:  parent.height
        color: "white"
        ListModel{
            id: listmodel
            ListElement{ name: "Afghanistan"; letter: "A"}
            ListElement{ name: "Albani"; letter: "A"}
            ListElement{ name: "Angola"; letter: "A"}
            ListElement{ name: "Afghanistan"; letter: "A"}
            ListElement{ name: "Bahrain"; letter: "B"}
            ListElement{ name: "Bolivia"; letter: "B"}
            ListElement{ name: "China"; letter: "C"}
            ListElement{ name: "Cuba"; letter: "C"}
            ListElement{ name: "Cameroon"; letter: "C"}
            ListElement{ name: "Danmark"; letter: "D"}
            ListElement{ name: "Dominica"; letter: "D"}
            ListElement{ name: "Ecuador"; letter: "E"}
            ListElement{ name: "Haiti"; letter: "H"}
            ListElement{ name: "Hungary"; letter: "H"}

        }
        ListView{
            id: listview
            x:0
            y: -50*change
            model: listmodel
            width: 420
            height: 4*parent.height
            focus: true
            clip: true
            anchors.margins: 20
            delegate: Rectangle{
                id: rect
                width: 420; height: 50
                Text {
                    id: text1
                    text: name
                    font.pointSize: 15
                    font.bold: true
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: rect.color = "#81BEF7"
                    onExited: rect.color = "white"
                }
            }
            section.property: "letter";
            section.criteria: ViewSection.FullString
            section.delegate: spaceManDelegate
        }
        Component{
            id: spaceManDelegate
            Rectangle {
                width: ListView.view.width
                height: 50
                color: "#088A4B"

                Text {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 8
                    font.pixelSize: 20
                    font.bold: true
                    text: section
                    color: '#1f1f1f'
                }
            }
        }
    }
    Rectangle{
        visible: true
        width:30; height: win.height
        anchors.left: rect1.right
        Column{
            id: column
            Repeater{
                id: repeater
                model: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

                Rectangle{
                    id: rect2
                    width: 30; height: 30
                    //property type name: value
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: rect2.color = "#81BEF7"
                        onExited: rect2.color = "white"
                        onClicked: {
                            if(modelData === "A" ) change = 0;
                            if(modelData === "B" ) change = 5;
                            if(modelData === "C" ) change = 8;
                            if(modelData === "D" ) change = 12;
                            if(modelData === "E" ) change = 15;
                            if(modelData === "H" ) change = 17;
                            console.log(index)
                        }
                    }
                    Text{
                        id: text2
                        font.pointSize: 15
                        color: "#088A4B"
                        text: modelData
                        font.bold: true
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }
}
