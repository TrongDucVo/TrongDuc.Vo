import QtQuick 2.0
import QtQuick.Window 2.2
Window {
    id: win_1
    width: 300
    height: 290
    ListView {
        anchors.fill: parent
        anchors.margins: 20
        clip: true
        model: dataModel
        delegate: contactDelegate
        snapMode: ListView.SnapOneItem
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightMoveVelocity: 3000
    }
    Component {
        id: contactDelegate

        Rectangle {
            width: ListView.view.width
            height: 20
            color: color

            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 20
                font.pixelSize: 18
                text: name
                color: "black"
            }
        }
    }
    ListModel {
        id: dataModel
        ListElement { name: "A"; color: "blue" }
        ListElement { name: "An1"; color: "Transparent" }
        ListElement { name: "An2"; color: "Transparent" }
        ListElement { name: "An3"; color: "Transparent" }
        ListElement { name: "An4"; color: "Transparent" }
        ListElement { name: "B"; color: "blue" }
        ListElement { name: "Binh1"; color: "Transparent" }
        ListElement { name: "Binh2"; color: "Transparent" }
        ListElement { name: "Binh3"; color: "Transparent" }
        ListElement { name: "Binh4"; color: "Transparent" }
        ListElement { name: "Binh5"; color: "Transparent" }
        ListElement { name: "C"; color: "blue" }
        ListElement { name: "Cam1"; color: "Transparent" }
        ListElement { name: "D"; color: "blue" }
        ListElement { name: "Dinh1"; color: "Transparent" }
        ListElement { name: "E"; color: "blue" }
        ListElement { name: "Em1"; color: "Transparent" }
        ListElement { name: "F"; color: "blue" }
        ListElement { name: "Finh1"; color: "Transparent" }
        ListElement { name: "G"; color: "blue" }
        ListElement { name: "Giang1"; color: "Transparent" }
        ListElement { name: "Giang2"; color: "Transparent" }
        ListElement { name: "Giang3"; color: "Transparent" }
        ListElement { name: "H"; color: "blue" }
        ListElement { name: "Hien1"; color: "Transparent" }
        ListElement { name: "Hien2"; color: "Transparent" }
        ListElement { name: "I"; color: "blue" }
        ListElement { name: "Ian1"; color: "Transparent" }
        ListElement { name: "J"; color: "blue" }
        ListElement { name: "Jack1"; color: "Transparent" }
        ListElement { name: "K"; color: "blue" }
        ListElement { name: "Kien1"; color: "Transparent" }
        ListElement { name: "L"; color: "blue" }
        ListElement { name: "Linh1"; color: "Transparent" }
        ListElement { name: "Linh2"; color: "Transparent" }
        ListElement { name: "M"; color: "blue" }
        ListElement { name: "Minh1"; color: "Transparent" }
        ListElement { name: "Minh2"; color: "Transparent" }
        ListElement { name: "N"; color: "blue" }
        ListElement { name: "Ninh1"; color: "Transparent" }
        ListElement { name: "Ninh2"; color: "Transparent" }
        ListElement { name: "O"; color: "blue" }
        ListElement { name: "Oanh1"; color: "Transparent" }
        ListElement { name: "P"; color: "blue" }
        ListElement { name: "Phong1"; color: "Transparent" }
        ListElement { name: "Phong2"; color: "Transparent" }
        ListElement { name: "Phong3"; color: "Transparent" }
        ListElement { name: "Q"; color: "blue" }
        ListElement { name: "R"; color: "blue" }
        ListElement { name: "Ranh1"; color: "Transparent" }
        ListElement { name: "S"; color: "blue" }
        ListElement { name: "T"; color: "blue" }
        ListElement { name: "Tam1"; color: "Transparent" }
        ListElement { name: "Rosalba Thurgood"; color: "Transparent" }
        ListElement { name: "U"; color: "blue" }
        ListElement { name: "Uyen1"; color: "Transparent" }
        ListElement { name: "V"; color: "blue" }
        ListElement { name: "Vinh1"; color: "Transparent" }
    }
    ListView {
        id: listLetter
        anchors.right: parent.right; anchors.rightMargin: 15
        anchors.top: parent.top; anchors.topMargin: 10
        anchors.bottom: parent.bottom; anchors.bottomMargin: 10
        model: firstCharacter

        delegate: Rectangle {
            width: 10
            height: (win_1.height - 20) / 26
            color: "Transparent"

            Text {
                anchors.centerIn: parent
                font.pixelSize: 18
                text: letter
                color: "black"
            }

            Rectangle {
                id: popup
                width: 100
                height: 30
                anchors.right: parent.right; anchors.rightMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                color: "Black"
                opacity: 0

                Text {
                    anchors.left: parent.left; anchors.leftMargin: 10
                    font.pixelSize: 24
                    text: letter
                    color: "White"
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listContact.currentIndex = indexNumber
                }

                hoverEnabled: true
                onEntered: {
                    popup.opacity = 0.7
                }
                onExited: {
                    popup.opacity = 0
                }
            }
        }
    }
    ListModel {
        id: firstCharacter

        ListElement { letter: "A"; indexNumber: 0 }
        ListElement { letter: "B"; indexNumber: 0 }
        ListElement { letter: "C"; indexNumber: 0 }
        ListElement { letter: "D"; indexNumber: 0 }
        ListElement { letter: "E"; indexNumber: 0 }
        ListElement { letter: "F"; indexNumber: 0 }
        ListElement { letter: "G"; indexNumber: 0 }
        ListElement { letter: "H"; indexNumber: 0 }
        ListElement { letter: "I"; indexNumber: 0 }
        ListElement { letter: "J"; indexNumber: 0 }
        ListElement { letter: "K"; indexNumber: 0 }
        ListElement { letter: "L"; indexNumber: 0 }
        ListElement { letter: "M"; indexNumber: 0 }
        ListElement { letter: "N"; indexNumber: 0 }
        ListElement { letter: "O"; indexNumber: 0 }
        ListElement { letter: "P"; indexNumber: 0 }
        ListElement { letter: "Q"; indexNumber: 0 }
        ListElement { letter: "R"; indexNumber: 0 }
        ListElement { letter: "S"; indexNumber: 0 }
        ListElement { letter: "T"; indexNumber: 0 }
        ListElement { letter: "U"; indexNumber: 0 }
        ListElement { letter: "V"; indexNumber: 0 }
        ListElement { letter: "W"; indexNumber: 0 }
        ListElement { letter: "X"; indexNumber: 0 }
        ListElement { letter: "Y"; indexNumber: 0 }
        ListElement { letter: "Z"; indexNumber: 0 }
    }
}
