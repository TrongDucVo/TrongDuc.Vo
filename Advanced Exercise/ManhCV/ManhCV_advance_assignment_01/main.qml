import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    height:400
    width: 600
    title: qsTr("ComboBox")
    Rectangle{
        id:recfather
        width:500
        height:300
        anchors.fill: parent
        color: "lightgrey"
        Text{
            id:tittle
            x: 25
            text: "ComboBox"
            font.pixelSize: 30

        }
        Rectangle{
        id:recson
        width:550;height: 350
        x:25;y:35
        Text{
        text: "Default State"
        font.pixelSize: 20
        x:10;y:10
        }
        Text{
        text: "Pressed State"
        font.pixelSize: 20
        x:275;y:10
        }
        Rectangle{
            id:combobox
            width:250;height:40
            x:10;y:45
            border.color: "black"
            radius:8
            Image{
                id:btndown1
                source:"images.png"
                //anchors.fill: parent
                anchors.right: parent.right
                width:35
                height:40
            }
            Text{
                text: "ComboBox"
                font.pixelSize: 20
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10
            }
        }
        Rectangle{
            id: pressbox
            width:250;height:40
            border.color: "black"
            radius: 8
            x:275;y:45
            Image{
            id:btndown_press
            source:"images.png"
            anchors.right: parent.right
            width:35;height:40
            MouseArea{
                id:mouse1
                anchors.fill: parent
                onPressed:  {
                    btndown_press.source="images02.png"
                    rec1.visible=true
                }
                onReleased: {
                btndown_press.source="images.png"}
            }
            }
            Text{
                id:coboBox_Tex
                text: "ComboBox"
                font.pixelSize: 20
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10
            }

        }
        Rectangle{
            id:rec1
            width:pressbox.width
            height:230
            anchors.left:  pressbox.left
            anchors.top:pressbox.bottom
            visible: false
            Column{
                spacing:3
                anchors.fill: parent
                Repeater{
                    model: ListModel{
                        ListElement{name:"ComboBox Item1"}
                        ListElement{name:"ComboBox Item2"}
                        ListElement{name:"ComboBox Item3"}
                        ListElement{name:"ComboBox Item4"}
                        ListElement{name:"ComboBox Item5"}
                    }
                    Rectangle{
                        id:rec2
                        width: pressbox.width;height:pressbox.height
                        color: "lightgrey"
                        radius:5
                        Text{
                            text: model.name
                            font.pixelSize: 20
                            anchors.centerIn: parent
                        }
                        MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: rec2.color = "red"
                        onExited: rec2.color = "lightgrey"
                        onClicked: {
                            coboBox_Tex.text= model.name
                            rec1.visible = false
                            console.log(model.name)
                        }
                        }
                    }
                }
            }
        }
    }
        }



}

