import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 1.2
ApplicationWindow{
    id:root
    visible: true
    width: 600
    height: 600
    title: qsTr("Demo List Model")
    ListModel{
        id:pitch
        ListElement{name:"a"}
        ListElement{name:"s"}
        ListElement{name:"d"}
        ListElement{name:"f"}
        ListElement{name:"g"}
    }
    Column{
        id:column
        spacing: 2
        Repeater{
            model: pitch
            //            onItemRemoved: {
            //                console.log(index+"id"+item.toString())
            //            }

            Rectangle{

                id:rect
                color:"red"
                width:root.width/4
                height: 40
                Text {
                    id: text1
                    text: model.name
                    width: parent.height
                    height: 50
                    color:"black"
                }
                //Add and Dele Row
                Rectangle{
                    id:button
                    width: 60
                    height: parent.height
                    color:"gray"
                    anchors.left: text1.right
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {pitch.remove(model.index)
                        }

                        Text {
                            id: name1
                            anchors.horizontalCenter: parent.width
                            text: "dele"


                        }

                    }

//Add Row
                    Rectangle{
                        id:add
                        x:100
                        width: 60
                        height: parent.height
                        color:"gray"
                        anchors.left: text1.right
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {pitch.append({name:"5"})
                            }

                            Text {
                                id: name2
                                anchors.horizontalCenter: parent.width
                                text: "add++"


                            }

                        }



                    }




            }
        }
    }
}
}
