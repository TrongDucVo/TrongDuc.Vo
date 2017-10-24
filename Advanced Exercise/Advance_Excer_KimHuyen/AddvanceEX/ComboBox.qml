import QtQuick 2.4
import QtQuick.Window 2.2

Item {
    visible: true

    height: parent.height
    width: parent.width


    Rectangle{

        id:combo
        x : 100
        y:150

        height: 80
        width: 300


        Rectangle{
            id:cbo1
            height: 80
            width: 250
            border.color: "gray"
            color: "#CCCCFF"

            Text {
                id:namecombo
                text: qsTr("Combobox ")
                font.pointSize: 16
                anchors.centerIn: parent
                color: "blue"


            }



        }

        Rectangle{
            id:cbo2
            height: 80
            width: 50
            color: "gray"
            anchors.left:cbo1.right

            Text {

                text: qsTr("V ")
                font.pointSize: 16
                anchors.centerIn: parent

            }
        }

        MouseArea{

            anchors.fill: combo
            hoverEnabled: true
            onEntered: {
                cbo1.color ="#99FFFF"
                cbo2.color="#AAAAAA"

            }
            onExited: {

                cbo1.color = "white"
                cbo2.color="gray"

            }

            onClicked: {

              lstModel.visible = true

            }



        }


    }



    // List Item In ComboBox


    ListModel{
        id: dataModel

        ListElement{

            name:"ComboBox 1";


        }
        ListElement{

            name:"ComboBox 2";


        }
        ListElement{

            name:"ComboBox 3";


        }
        ListElement{

            name:"ComboBox 4";


        }
    }


    Rectangle{
        id: lstModel

        visible: false
        x :100
        y:230
        width: 250
        height: 250
        border.color: "gray"

        Column{
            id:col
            spacing: 1
            Repeater{
                model:dataModel

                Rectangle
                {
                    id:rec1
                    x:parent.x+20
                    width: 210
                    height: 60
                    Text {
                        id: name
                        text: model.name
                        font.italic: true
                        font.pointSize: 16
                        anchors.centerIn: parent
                        color: "#777777"

                    }

                    MouseArea{

                        anchors.fill: rec1
                        hoverEnabled: true
                        onEntered: {
                            rec1.color ="#00CCFF"


                        }
                        onExited: {

                            rec1.color = "white"


                        }
                        onClicked: {
                            namecombo.text = name.text
                            lstModel.visible = false

                        }



                    }


                }



            }

        }




    }









}
