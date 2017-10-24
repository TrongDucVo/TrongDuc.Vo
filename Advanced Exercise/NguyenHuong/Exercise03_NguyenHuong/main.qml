import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: 450
    height: 780
    color: "white"
    property int change: 0
    Rectangle{
        id: speakers
        width: 420
        height:  parent.height
        color: "white"
        ListModel{
            id: myList
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
            id: myView
            x:0
            y: -50*change+50
            model: myList
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
            section.delegate: myComponent
        }
        Component{
            id: myComponent
            Rectangle {
                width: ListView.view.width
                height: 50
                color: "#00FF80"
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
        id: placeOfSelectQuick
        y:50
        visible: true
        width:30; height: root.height
        anchors.left: speakers.right
        Column{
            id: selectQuick
            Repeater{
                model: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
                Rectangle{
                    id: mySelect
                    width: 30; height: 30
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: mySelect.color = "#81BEF7"
                        onExited: mySelect.color = "white"
                        onClicked: {
                            if(modelData === "A" ) change = 0;
                            if(modelData === "B" ) change = 5;
                            if(modelData === "C" ) change = 8;
                            if(modelData === "D" ) change = 12;
                            if(modelData === "E" ) change = 15;
                            if(modelData === "H" ) change = 17;
                        }
                    }
                    Text{
                        width: 30; height: 30
                        font.pointSize: 15
                        color: "#00FF80"
                        text: modelData
                        font.bold: true
                        anchors.centerIn: mySelect
                    }
                }
            }
        }
    }
    Rectangle {
        id: name
        width: parent.width; height: 50
        color: "blue"
        Text {
            anchors.centerIn: parent
            font.pixelSize: 30
            font.bold: true
            text: "Speakers"
        }
    }
}
