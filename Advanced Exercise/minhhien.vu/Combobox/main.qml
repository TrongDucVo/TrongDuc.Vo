import QtQuick 2.6
import QtQuick.Window 2.2
Window {
    visible: true
    width: 800
    height: 800
    Rectangle{
        id: rec_1
        width: 500
        height: 80
        x: 50
        y: 50
        border.color: "black"
        Text {
            id: text_1
            anchors.centerIn: parent
            font.pointSize: 15
            text:""
        }
    }
    Rectangle{
        id: rec_2
        width: 80
        height: 80
        x: 550
        y: 50
        border.color: "black"
        Text {
            id: text_2
            anchors.centerIn: parent
            font.pointSize: 15
            text: "Choose"
        }
        MouseArea{
            id: mousearea_1
            anchors.fill: parent
            onClicked: {
                listView.visible = true
            }
        }
    }
    Rectangle{
        id: rec_3
        width: 500
        height: 500
        x: 50
        y: 130
//        color: "blue"
        ListModel{
            id: dataModel
            ListElement{name: "Banana"; color: "Yellow"}
            ListElement{name: "Apple"; color: "Red"}
            ListElement{name: "Mango"; color: "Green"}
            ListElement{name: "Banana"; color: "Yellow"}
            ListElement{name: "Apple"; color: "Red"}
            ListElement{name: "Mango"; color: "Green"}
            ListElement{name: "Banana"; color: "Yellow"}
            ListElement{name: "Apple"; color: "Red"}
            ListElement{name: "Mango"; color: "Green"}
            ListElement{name: "Banana"; color: "Yellow"}
            ListElement{name: "Apple"; color: "Red"}
            ListElement{name: "Mango"; color: "Green"}
            ListElement{name: "Banana"; color: "Yellow"}
            ListElement{name: "Apple"; color: "Red"}
            ListElement{name: "Mango"; color: "Green"}
        }
        ListView{
            id: listView
            visible: false
            x: 30
            y: 45
            height: rec_3.height - 90
            width: rec_3.width - 50
            model: dataModel
            spacing: 2
            focus: true
            delegate: ListComponent
            {
                MouseArea{
                    hoverEnabled: true
                    acceptedButtons: Qt.AllButtons
                    anchors.fill: parent
                    onEntered: {
                        color = "red"
                    }
                    onExited: {
                        color = "blue"
                    }

                    onPressed: {
                        listView.visible = false
                        color = "red"
                        text_1.text = model.name + "---" + model.color
                    }
                    onReleased: {
                        color = "blue"
                    }
                }
            }
        }
    }
}
