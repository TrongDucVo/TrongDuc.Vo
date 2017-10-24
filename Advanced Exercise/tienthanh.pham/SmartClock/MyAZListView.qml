import QtQuick 2.0
import "constant.js" as Constants

Item {
    width: 200
    height: 300
//    anchors.fill: parent
    Rectangle{
        id: rec1
        anchors.fill: parent
        color: "white"
        Flickable{ //Using this to control action of contact
            id: myFlick
            anchors.fill: parent
            contentHeight: myColumn.height
            boundsBehavior: Flickable.StopAtBounds
            focus:true
            clip:true
            Column{ //contain big Rectangle, big Rectangle contain 26 character A->Z and the space to contain contact
                id:myColumn
                Repeater{
                    model: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
                    Component{
                        Rectangle{ //Big Rectangle using to contain single text and contact data
                            width: rec1.width
                            height: rec3.height+myRepeater.count*20
                            color: "#ecf0f1"
                            Rectangle{ //contain character
                                id: rec3
                                width: rec1.width
                                height: 18
                                Text {
                                    id: textIndex
                                    text: modelData
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                }
                                color: "#7f8c8d"
                            }
                            Column{//column using to show contact
                                id:rec4
                                anchors.top: rec3.bottom
                                width: rec1.width
                                height: myRepeater.count*20
                                Repeater{
                                    id: myRepeater
                                    model:{
                                        Constants.MyContact[textIndex.text.charCodeAt(0)-65]
                                    }
                                    Rectangle{//this Rectangle contain contact
                                        width: rec3.width
                                        height: 20
                                        Text{
                                            text: modelData
                                            anchors.verticalCenter: parent.verticalCenter
                                        }
                                        MouseArea{
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            onEntered: parent.color = "blue"
                                            onExited: parent.color = "white"
                                            onClicked: {
                                            }
                                        }
                                    }

                                }
                            }
                        }
                    }
                }
            }
        }
        Rectangle{
            id: rec2
            height: parent.height
            width: 20
            anchors.right: parent.right
            opacity: 0.5
            Column{
                Repeater{
                    model: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
                    Rectangle{
                        width: 20
                        height: rec2.height/26
                        radius: 10
                        color: "#00000000"
                        opacity: 1
                        Text{
                            text:modelData
                            font.pointSize: 10
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {parent.scale = 4}
                            onExited: {parent.scale = 1}
                            onClicked: {
                                var n = 0;
                                for (var i=0;i<modelData.charCodeAt(0)-65;i++){
                                    n += Constants.MyContact[i].length;
                                }
                                myFlick.contentY = n*20+i*18
                            }
                        }
                    }
                }
            }
        }
    }
}
