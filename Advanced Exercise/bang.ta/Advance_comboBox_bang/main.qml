import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("ComboBox")
    Rectangle{
        width: parent.width
        height: parent.height
        border.width:  3
        border.color: "brown"
        color: "lightpink"

        Rectangle{
            id: rect1
            x: 10
            y: 40
            height: 50
            width: 200
            color: "#ffffaa"
            border.color: "black"
            gradient: Gradient {
                GradientStop {
                    position: 0.10;
                    color: "#ffffaa";
                }
            }



        }
        Rectangle{
            id: rect2
            x: 300
            y: 40
            height: 50
            width: 200
            color: "#ffffdd"
            border.color: "black"
            gradient: Gradient {
                GradientStop {
                    position: 0.10;
                    color: "#ffffdd";
                }
            }
            TextInput{
                id: txtIn
                height: rect2.height
                width: rect2.width

                anchors.centerIn: parent
                anchors.fill: parent
                font.pixelSize: 20
                font.bold: false
                font.italic: true
                font.family: "Helvetica"
                text: "Input some thing"
                MouseArea {
                    id: txtMouseArea
                    anchors.fill: parent
                    onClicked: {
                        txtIn.clear()
                        //                        txtIn.focus = true


                        /*function displayItem(){
                            if(txtIn.text == "tap 1"){
                                txt3_1.visible = true
                                txt3_2.visible = false
                                txt3_3.visible = false
                            }
                            if(txtIn.text == "tap 2"){
                                txt3_1.visible = false
                                txt3_2.visible = true
                                txt3_3.visible = false
                            }
                            if(txtIn.text == "tap 3"){
                                txt3_1.visible = false
                                txt3_2.visible = false
                                txt3_3.visible = true
                            }
                        }*/
                    }
                }


            }

        }
        Rectangle{
            id: rect3
            x: 300
            y: 90
            height: 150
            width: 200
            visible: false
            color: "#ffffdd"
            border.color: "black"
            gradient: Gradient {
                GradientStop {
                    position: 0.10;
                    color: "#ffffdd";
                }
            }
            ListModel{
                id: dataModel
                ListElement{name: "tap 1"}
                ListElement{name: "tap 2"}
                ListElement{name: "tap 3"}
            }
            Component {
                id: disItem
                Text {
                    id: t1
                    width: 200
                    height: 30
                    text: model.name + " --- "
                    MouseArea{
                        hoverEnabled: true
                        anchors.fill: parent
                        onEntered: {
                            color = "red"
                        }
                        onExited: {
                            color = "black"
                        }
                        onClicked: {
                            txtIn.text = model.name
                            lV.currentIndex = index

                        }

                    }

                }
            }


            ListView{
                id: lV
                model: dataModel
                height: parent.height
                width: parent.width
                //focus: true
                delegate: disItem
                highlight: Rectangle {
                    z:2
                    color: "#FFFF88"
                    opacity: 0.5
                }
                highlightFollowsCurrentItem: true;
                //keyNavigationEnable:
            }

        }
        Rectangle{
            id: rect4
            x: 500
            y: 40
            height: 50
            width: 50
            color: "#ffffdd"
            border.color: "black"
            gradient: Gradient {
                GradientStop {
                    position: 0.10;
                    color: "#ffffdd";
                }
            }
            Image {
                id: img1
                height: rect4.height
                width: rect4.width
                source: "qrc:/imageFile/downbutton.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(rect3.visible == false)
                            rect3.visible = true
                        else rect3.visible = false
                    }

                }
            }

        }
        //        Component.onCompleted: {
        //            rect3.displayItem().connect(txtIn.text)
        //            rect3.displayItem()
        //        }





    }
}
