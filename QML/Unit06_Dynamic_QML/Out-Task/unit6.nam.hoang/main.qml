import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

ApplicationWindow{
    id:root
    visible: true
    width: 2000
    height: 1000
    title: qsTr("Dynamic")
    Image {
        id: image1
        source: "Background.png"
        width: root.width
        height: root.height
    }
    Item{
        Loader{
            id:mainc
            active: true
            width: 1000
            height: 1000

            x:500

        }
    }
    Item {
        id: mainlistview
        width: 250
        height: 250
        anchors.bottom: parent.bottom
        anchors.right:parent.right
        anchors.bottomMargin: 200
        anchors.rightMargin: 200

        ListModel{
            id:pitch


            ListElement{name:"Signal Assign"}
            ListElement{name:"Clock"}
            ListElement{name:"Manager Mark"}


        }
        ListView{
            id:listviewxxx
            model: pitch
            height: parent.height
            width: parent.width
            spacing: 5
            delegate: pullview


            }

        }
        Component{
            id:pullview
            Rectangle{
                id:rec1
                width: parent.width
                height: 50
                color: "Green"
                Text {
                    id: txt
                    color: "Yellow"
                    text:model.name
                    font.family: "Arial"
                    font.pointSize: 24
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 10


                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:
                    {


                        if (index == 0) {
                            mainc.setSource("qrc:/SignalAssign.qml")
                        }
                        if (index == 1) {
                            mainc.setSource("qrc:/Assign4.qml")
                        }
                        if (index == 2) {
                            mainc.setSource("qrc:/MangerMark.qml")
                        }
                    }

                }
            }
        }
    }
