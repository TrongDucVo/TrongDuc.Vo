import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Window 2.0
Window {
    id:root
    width: 630
    height: 880
    Rectangle{
        id:list
        width: 210
        height: 50
        color: "blue"
        border.width: 1
        border.color: "white"
        Text {
            id: text1
            text: "List"
            anchors.centerIn: parent
            font.pointSize: 15
            color: "white"
        }
        MouseArea{
            anchors.fill: list
            onClicked: {
                list.color = "blue"
                form.color = "gray"
                empty.color = "gray"
                view.currentIndex = 0

            }
        }

    }
    Rectangle{
        id:form
        width: 210
        height: 50
        color: "gray"
        anchors.left: list.right
        border.width: 1
        border.color: "white"
        Text {
            id: text2
            text: "Form"
            anchors.centerIn: parent
            font.pointSize: 15
            color: "white"
        }
        MouseArea{
            anchors.fill: form
            onClicked: {
                list.color = "gray"
                form.color = "blue"
                empty.color = "gray"

                view.currentIndex = 1

            }
        }

    }
    Rectangle{
        id:empty
        width: 210
        height: 50
        color: "gray"
        anchors.left: form.right
        border.width: 1
        border.color: "white"
        Text {
            id: text3
            text: "Empty"
            anchors.centerIn: parent
            font.pointSize: 15
            color: "white"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                list.color = "gray"
                form.color = "gray"
                empty.color = "blue"

                view.currentIndex = 2
            }
        }
    }

    Rectangle{
        id :main
        width: 630
        height: 830
        anchors.top: list.bottom
        SwipeView{
            id : view
            currentIndex: 0
            anchors.fill : parent

            Rectangle{
                id:contain1
                width: 630
                height: 830

                border.width: 1
                border.color: "white"
                Image {
                    id: image1
                    source: "List.PNG"
                    height: 830
                }

            }

            Rectangle{
                id:contain2
                width: 630
                height: 830

                border.width: 1
                border.color: "white"
                anchors.left: contain1.right
                Image {
                    id: image2
                    width: 630
                    height: 830
                    source: "Form.jpg"
                }
            }

            Rectangle{
                id:contain3
                width: 630
                height: 830
                color: "white"
                border.width: 1
                border.color: "white"
                anchors.left: contain2.right
                Rectangle {
                    id : child
                    color: "gray"
                    width: 200
                    height: 100
                    anchors.centerIn: parent
                }

            }

            onCurrentIndexChanged: {
                if(view.currentIndex==0)
                {
                    list.color = "blue"
                    form.color = "gray"

                }
                if(view.currentIndex==1)
                {
                    list.color = "gray"
                    form.color = "blue"
                    empty.color = "gray"
                }
                if(view.currentIndex==2)
                {

                    form.color = "gray"
                    empty.color = "blue"
                }
            }

        }
    }
}



