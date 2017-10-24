import QtQuick 2.6

//Window{
Item {
    id: win
    visible: true
    width: 600
    height: 600
    Rectangle{
        id: rect1
        width: 400
        height:  parent.height
        //color: "blue"
        ListModel{
            id: listmodel
            ListElement{ name: "Bảo Trâm"; letter: "B"}
            ListElement{ name: "Bùi"; letter: "B"}
            ListElement{ name: "Đặng"; letter: "Đ"}
            ListElement{ name: "Nghi"; letter: "N"}
            ListElement{ name: "Nguyễn"; letter: "N"}
            ListElement{ name: "Ngọc Hân"; letter: "N"}
            ListElement{ name: "Nhật Nguyệt"; letter: "N"}
            ListElement{ name: "Nam"; letter: "N"}
            ListElement{ name: "My"; letter: "M"}
            ListElement{ name: "Phương Thảo"; letter: "P"}
            ListElement{ name: "Phương"; letter: "P"}
            ListElement{ name: "Trà"; letter: "T"}
            ListElement{ name: "Thảo Hương"; letter: "T"}
            ListElement{ name: "Thị Thuý"; letter: "T"}
            ListElement{ name: "Trân Châu"; letter: "T"}
            ListElement{ name: "Trâm Anh"; letter: "T"}
            ListElement{ name: "Thùy Dương"; letter: "T"}
            ListElement{ name: "Thị Huệ"; letter: "T"}
        }
        ListView{
            id: listview
            model: listmodel
            width: 400
            height: parent.height
            anchors.centerIn: parent
            focus: true
            clip: true
            spacing: 5
            delegate: Text{
                text: name
                font.pointSize: 15
            }
            section.property: "letter";
            section.criteria: ViewSection.FullString
            section.delegate: spaceManDelegate
        }
        Component{
            id: spaceManDelegate
            Rectangle {
                width: ListView.view.width
                height: 30
                border.color: "gray"
                border.width: 3
                Text {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 8
                    font.pixelSize: 20
                    text: section
                    color: 'green'
                }
            }
        }

        ListModel{
            id: listModel
            ListElement {name: "A"}
            ListElement {name: "B"}
            ListElement {name: "C"}
            ListElement {name: "D"}
            ListElement {name: "Đ"}
            ListElement {name: "E"}
            ListElement {name: "F"}
            ListElement {name: "G"}
            ListElement {name: "H"}
            ListElement {name: "I"}
            ListElement {name: "J"}
            ListElement {name: "K"}
            ListElement {name: "L"}
            ListElement {name: "M"}
            ListElement {name: "O"}
            ListElement {name: "P"}
            ListElement {name: "Q"}
            ListElement {name: "R"}
            ListElement {name: "S"}
            ListElement {name: "T"}
            ListElement {name: "U"}
            ListElement {name: "V"}
            ListElement {name: "W"}
            ListElement {name: "X"}
            ListElement {name: "Y"}
            ListElement {name: "Z"}
        }

        ListView {
            id: list
            height: 600
            width: 20
            anchors.right: parent.right
            model:listModel

            delegate: Rectangle {
                id: rect
                height: 23
                width: 20
                Text {
                    id: nameText
                    text: model.name
                    font.pixelSize: 15
                    color: "black"
                    anchors.centerIn: rect
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {

                    }
                }
            }
            clip: true
        }
    }
}
