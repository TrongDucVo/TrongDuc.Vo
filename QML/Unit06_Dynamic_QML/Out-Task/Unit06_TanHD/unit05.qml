import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Rectangle {

    width: 580
    height: 400

    ListModel {
        id: dataModel

        ListElement{
            ms:1
            name:"Ho Tan"
            address:"Nghe An"
            score: "8"
        }
        ListElement{
            ms:2
            name:"Pham Bui"
            address:"Ha Noi"
            score: "9"
        }
        ListElement{
            ms:3
            name:"Bui Viet"
            address:"Yen Bai"
            phone:"0123456789"
            //email:"viet.bui@lgepartner.com"
            score:"10"
        }
    }

    ListView{
        id: listview
        model: dataModel
        height: parent.height
        width: parent.width
        spacing: 3

        delegate: Student{
            width: parent.width
            height: 100

            onSignal_remove: {
                dataModel.remove(model.index,1)
                console.log("remove 1")
            }
        }
        //header
        header: Rectangle{
            height: 50
            width: parent.width
            Text {
                anchors.centerIn: parent
                font.pointSize: 20
                color: "#d35400"
                text: "Scoreboard"

            }
        }
        //footer
        footer: Rectangle{
            height: 50
            width: parent.width
            Text {
                color: "gray"
                text: "Click on red side to delete "

            }
            Text {
                anchors.centerIn: parent
                color: "gray"
                text: "designed by tan.ho@lgepartner.com"

            }
        }
        //Add more information
        Rectangle {
            id: add
            width: parent.width
            height: 80
            anchors.bottom: parent.bottom


            Column{
                id:column

                Rectangle{
                    width: 30
                    height:30
                    Text {
                        id: txtName
                        font.pointSize: 12
                        anchors.left: parent.left

                        text: "Address: "
                    }
                    TextInput{
                        id:inputName
                        height: parent.height
                        anchors.left: txtName.right
                        font.pointSize: 12
                        focus: true
                        text:"    "
                    }
                }
                Rectangle {
                    width: 30
                    height: 30
                    Text {
                        id: txtScore
                        font.pointSize: 12
                        anchors.left: parent.left

                        text: "Score: "
                    }
                    TextInput{
                        id:inputScore
                        height: parent.height
                        anchors.left: txtScore.right
                        font.pointSize: 12
                        focus: true
                        text:"    "
                    }
                }
                Rectangle {
                    width: 30
                    height: 30
                    Text {
                        id: txtAdress
                        font.pointSize: 12
                        anchors.left: parent.left

                        text: "Address: "
                    }
                    TextInput{
                        id:inputAdress
                        anchors.left: txtAdress.right
                        height: parent.height
                        font.pointSize: 12
                        focus: true
                        text:"    "
                    }
                }
            }

            //button
            Button {
                id: addBtn
                width: 100
                anchors.bottomMargin: 5
                anchors.right: parent.right
                text: "ADD"

                onClicked: {
                    dataModel.append({"name":inputName.text, "score":inputScore.text,"address":inputAdress.text})
                }
            }
        }
    }
}
