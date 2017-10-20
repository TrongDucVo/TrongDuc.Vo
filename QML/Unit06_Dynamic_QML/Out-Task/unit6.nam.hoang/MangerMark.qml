import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Item {
    id: app
    visible: true
    width: 860
    height: 500



    Text {
        y : 65
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Mark Manager ")
        font.family: "Ubuntu"
        font.pointSize: 30
        font.bold: true

        color: "red"

    }





    Item {
        y: 120
        width: app.width
        height: app.height

        ListModel {
            id: modelList
            ListElement {number: "1"; name: "Nguyen Van A"; mark: "1"}
            ListElement {number: "2"; name: "Hoang Van B"; mark: "10"}
            ListElement {number: "3"; name: "Huynh Van C"; mark: "5"}
            ListElement {number: "4"; name: "Dang Van D"; mark: "4"}
            ListElement {number: "5"; name: "Nguyen Van E"; mark: "1"}



        }
        ListView
        {
            id: list
            anchors.fill: parent

            anchors.rightMargin: 50
            clip: true
            model: modelList

            spacing: 50

            focus: true

            delegate: Item {


                Rectangle {
                    id: recNumber
                    width: 80; height: 50; radius: 5
                    color: "blue"
                    border.width: 1


                    Text {
                        id: textNumber
                        anchors.centerIn: recNumber

                        font.pixelSize: 18
                        color: "white"
                        text: number
                    }
                }

                Rectangle {
                    id: recName
                    width: 500; height: 50; radius: 5
                    anchors.left: recNumber.right; anchors.leftMargin: 5
                    color: "blue"
                    border.width: 1


                    Text {
                        id: textName
                        anchors.centerIn: recName

                        font.pixelSize: 18
                        color: "white"
                        text: name
                    }
                }

                Rectangle {
                    id: recMark
                    width: 80; height: 50; radius: 5
                    anchors.left: recName.right; anchors.leftMargin: 5
                    color: "blue"
                    border.width: 1


                    Text {
                        id: textMark
                        anchors.centerIn: recMark

                        font.pixelSize: 18
                        color: "white"
                        text: mark
                    }
                }

                Rectangle {
                    id: recDel
                    width: 80; height: 50; radius: 5
                    anchors.left: recMark.right; anchors.leftMargin: 5
                    color: "green"
                    border.width: 1


                    Text {
                        anchors.centerIn: recDel

                        font.pixelSize: 18
                        color: "white"
                        text: "Delete"
                    }


                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            modelList.remove(model.index)
                        }
                    }
                }




            }
        }


        Rectangle{
            id:recthem
            width: app.width-200
            height: 80
            x: 50
            y: 280
            color:"blue"


            border.width: 1

            Text {



                text: qsTr("ID : ")
                x : 50
                y:40
                font.family: "Ubuntu"

            }

            Rectangle{
                id:recthemId
                x : 80
                y:30
                border.color: "blue"
                width: 70
                height: 40

                TextInput{

                    id:inputId
                    width: 60
                    focus:true
                    anchors.centerIn: parent

                    font.pointSize: 14
                    color: "blue"


                }


            }

            Text {



                text: qsTr("Name : ")
                x : 200
                y:40
                font.family: "Ubuntu"

            }

            Rectangle{
                id:recthemName
                x : 250
                y:30
                border.color: "blue"
                width: 150
                height: 40

                TextInput{

                    id:inputName
                    width: 60
                    focus:true
                    anchors.centerIn: parent

                    font.pointSize: 14
                    color: "blue"


                }

            }





            Text {



                text: qsTr("Mark : ")
                x : 450
                y:40

                font.family: "Ubuntu"
            }

            Rectangle{
                id:recthemMark
                x : 500
                y:30
                border.color: "blue"
                width: 150
                height: 40

                TextInput{

                    id:inputMark
                    width: 60
                    focus:true
                    anchors.centerIn: parent

                    font.pointSize: 14
                    color: "blue"


                }

            }



           Rectangle{
                id: btnadd2
                x:700
                y:30
                width: 80
                height: 50
                anchors.leftMargin: 5



                Text {

                    text: qsTr("Add")
                    color: "red"
                    font.pointSize: 18
                    anchors.centerIn: parent
                }

                MouseArea{
            anchors.fill: parent
                onClicked: {

               modelList.append({number:inputId.text,name:inputName.text,mark:inputMark.text})


                }


                }





            }





        }



    }
}
