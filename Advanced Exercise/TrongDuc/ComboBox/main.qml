import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
ApplicationWindow{

    id: win
    visible: true
    width: 500; height: 500
    title: qsTr("ComboBox")
    Rectangle{
        id:recmain1
        width: 500
        height: 500
        color: "#ccff33"
        border.color: "black"

        MouseArea{
            anchors.fill: parent
            onClicked: { if (rect5.visible==true)
                { rect5.visible= false}
                rect3.color = "#3399ff"
            }
        }
    }
    Rectangle{
        id: rect3
        width: 200; height: 40
        radius: 3
        border.color: "black"
        color:"#3399ff"
        x:150
        y:50
        Image {
            id: button1
            source: "button.png"
            rotation: 90
            scale: 0.8
            anchors.right: parent.right
            anchors.margins: 10
            y : 12
        }
        Text {
            id: text
            text: "EngLish"
            font.pointSize: 12
            x:10 ; y :10
            //anchors.centerIn: recmain1
            anchors.horizontalCenter: parent.horizontalCenter
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {if(rect3.color == "#3399ff")
                {rect3.color= "#d9d9d9" }
                else {rect3.color = "#3399ff"}
                rect5.visible = !rect5.visible
            }
        }
    }
   //signal signal_click(int index)
    Rectangle{
        id: rect5
        visible: false
        width: 200; height: 250
        anchors.top: rect3.bottom
        anchors.right: rect3.right
        color: "#d9d9d9"
        ListModel{
            id: listmodel
            ListElement{name: "EngLish"}
            ListElement{name: "USA"}
            ListElement{name: "VietNam"}
            ListElement{name: "French"}
            ListElement{name: "Russia"}
        }
        ListView{
            id: listview
            model: listmodel
            width: 180; height: 300
            delegate: Combobo{
                id: rec
                width: 200; height: 50
                color: "#d9d9d9"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        text.text = model.name
                        listview.currentIndex = index
                        rect5.visible = !rect5.visible
                        rect3.color = "#3399ff"
                    }
                    hoverEnabled: true
                    onEntered: rec.color = "#81BEF7"
                    onExited: rec.color = "#d9d9d9"
                }

            }

        }
    }
}

