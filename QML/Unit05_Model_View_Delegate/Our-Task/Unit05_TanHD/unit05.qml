import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    visible: true
    width: 400
    height: 600

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
                text: "design by tan.ho@lgepartner.com"

            }
        }
        //Add more information
        Rectangle {
            id: add
            width: parent.width
            height: 100
            anchors.bottom: parent.bottom


            Column{
                id:column

                Rectangle{
                    width: 30
                    height:30
                    TextInput{
                        id:inputName
                        height: parent.height
                        font.pointSize: 15
                        focus: true
                        text:"Add name  "
                    }
                }
                Rectangle {
                    width: 30
                    height: 30
                    TextInput{
                        id:inputScore
                        height: parent.height
                        font.pointSize: 15
                        focus: true
                        text:"Add Score  "
                    }
                }
                Rectangle {
                    width: 30
                    height: 30
                    TextInput{
                        id:inputAdress
                        height: parent.height
                        font.pointSize: 15
                        focus: true
                        text:"Add Adress   "
                    }
                }
            }

            //button
            Button {
                id: addBtn
                width: 100
                anchors.bottomMargin: 5
                anchors.right: parent.right
                font.pointSize: 13
                text: "ADD"

                onClicked: {
                    dataModel.append({"name":inputName.text, "score":inputScore.text,"address":inputAdress.text})
                }
            }
        }
    }
}
