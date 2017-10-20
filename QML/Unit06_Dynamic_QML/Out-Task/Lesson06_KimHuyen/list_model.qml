import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Item{
    id: root
    visible: true

    width: 500
    height:500

    property int cout: 0


    Text {
        y : 65
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("Student Mark Management ")
        font.pointSize: 30
        font.bold: true

        color: "red"

    }


    ListModel{
        id: dataModel

        ListElement{
            masv:"ID";
            name:"Full Name";
            math:"Math" ;
            van:" Literature";
            eng:"English"

        }



        ListElement{
            masv:"1";
            name:"Pham Van Thanh";
            math:"10" ;
            van:"7";
            eng:"9.5"

        }

        ListElement{

            masv:"2";
            name:"Tran Van Nam";
            math:"9" ;
            van:"8.5";
            eng:"10"

        }

        ListElement{

            masv:"3";
            name:"LPRCS Kim Huyen";
            math:"9.7" ;
            van:"7.2";
            eng:"8"

        }

        ListElement{
            masv:"4";
            name:"Pham Quynh Nhung";
            math:"10" ;
            van:"7";
            eng:"10"


        }


        ListElement{

            masv:"5" ;
            name:"ancnd";
            math:"10" ;
            van:"7";
            eng:"10"

        }
    }

    /*   Column{
        id:col
        spacing: 4
        Repeater{

            model: dataModel

            onItemRemoved: {



            }
            Rectangle{

                id:rec1
                width: root.width/2
                height: 100
                color: "red"

                Text {
                    id: name
                    width: 200
                    height:parent.height
                    font.pointSize: 20
                    color:"green"
                    text: model.name
                    Component.onCompleted: console.log(index)
                }

                Rectangle{

                    id: remove
                    width: 150
                    height: parent.height
                    color: "green"
                    anchors.left: name.right


                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Delete")
                        color:"white"
                        font.pointSize: 14
                        font.bold: true
                    }

                    MouseArea{

                        anchors.fill: parent

                        onClicked: {
                            dataModel.remove(model.index)

                        }



                    }


                }

                Rectangle{

                    id: append
                    width: 300
                    height: parent.height
                    color: "yellow"
                    anchors.left: remove.right

                    Text {
                        anchors.centerIn: parent
                        color: "white"
                        text: qsTr("Append(Double click)")
                        font.pointSize: 14
                        font.bold: true

                    }
                    MouseArea{

                        anchors.fill: parent


                        onDoubleClicked: {


                            dataModel.append({name:"Appended"})

                        }


                    }


                }


                Rectangle{

                    id: update
                    width: 200
                    height: parent.height
                    color: "blue"
                    anchors.left: append.right

                    Text {
                        anchors.centerIn: parent
                        color: "white"
                        text: qsTr("Update")
                        font.pointSize: 14
                        font.bold: true

                    }
                    MouseArea{

                        anchors.fill: parent


                        onClicked: {


                            dataModel.setProperty(index,"name","val ")


                        }


                    }


                }







            }












        }





    }

    */

    ListView{

        id:listview
        model:dataModel
        x:30
        y: 200
        width:parent.width
        height: 500
        spacing:4


        delegate: CustomRow{

            width: parent.width
            height: 70
            color: "white "
            border.color: "green"
            border.width: 2


            onSignal_remove: {

                console.log(index)
                dataModel.remove(index)


            }

            onSignal_add: {

                dataModel.append({masv:"6",name:"Add",math:"8.5",van:"6.5",eng:"10"})

            }

            onSignal_update: {

                inputid.text = "1"

            }


        }



    }



    Rectangle{
        id:recthem
        width: root.width + 150
        height: 100
        x: 10
        y: 700
        border.color: "red"
        border.width: 2

        Text {

            text: qsTr("ID : ")
            x : 50
            y:30

        }

        Rectangle{
            id:recthemid
            x : 80
            y:30
            border.color: "blue"
            width: 50
            height: 40

            TextInput{

                id:inputid
                width: 50
                focus:true
                anchors.centerIn: parent

                font.pointSize: 14
                color: "blue"


            }


        }

        Text {

            text: qsTr("Name : ")
            x : 200
            y:30

        }

        Rectangle{
            id:recthemname
            x : 250
            y:30
            border.color: "blue"
            width: 150
            height: 40

            TextInput{

                id:inputname
                width: 60
                focus:true
                anchors.centerIn: parent

                font.pointSize: 14
                color: "blue"


            }

        }

        Text {

            text: qsTr("Toan : ")
            x : 420
            y:30

        }

        Rectangle{
            id:recthemtoan
            x : 500
            y:30
            border.color: "blue"
            width: 100
            height: 40

            TextInput{

                id:inputtoan
                width: 60
                focus:true
                anchors.centerIn: parent

                font.pointSize: 14
                color: "blue"


            }

        }

        Text {

            text: qsTr("Van : ")
            x : 670
            y:30

        }

        Rectangle{
            id:recthemvan
            x : 750
            y:30
            border.color: "blue"
            width: 100
            height: 40

            TextInput{

                id:inputvan
                width: 60
                focus:true
         //       anchors.centerIn: parent
                   anchors.fill:parent
                font.pointSize: 14
                color: "blue"


            }

        }

        Text {

            text: qsTr("Tieng Anh : ")
            x : 900
            y:30

        }

        Rectangle{
            id:recthemeng
            x : 1000
            y:30
            border.color: "blue"
            width: 100
            height: 40

            TextInput{

                id:inputeng
                width: 150
                focus:true
            //    anchors.centerIn: parent
                anchors.fill:parent
                font.pointSize: 14
                color: "blue"


            }

        }

        Button{
            id: btnadd2
            x:1200
            y:30
            width: 100
            height: 40

            Text {

                text: qsTr("Add")
                color: "red"
                font.pointSize: 18
                anchors.centerIn: parent
            }

            MouseArea{
        anchors.fill: parent
            onClicked: {

              dataModel.append({masv:inputid.text,name:inputname.text,math:inputtoan.text,van:inputvan.text,eng:inputeng.text})


            }


            }





        }



    }





/*

    Rectangle{


        id:input
        anchors.bottom: parent.bottom
        width: parent.width
        border.color: "red"
        border.width: 3
        height: 50

        TextInput{

            id:inputText
            width: 400
            focus:true
            anchors.left: parent.left
            font.bold: true
            font.pointSize: 14
            color: "blue"


        }






        Rectangle
        {
            id:buttonadd
            width: 100
            height: parent.height
            anchors.right: parent.right
            color: "green"
            Text {
                id: add2
                text: qsTr("Add")
                font.bold: true
                font.pointSize: 14
                color: "white"
                anchors.centerIn: parent
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked: {



                    cout ++ ;
                    if(cout %2 ==1)
                    {
                        add.text = "OK"
                        buttonadd.color = "red"

                    }
                    else{

                        add.text = "Add"
                        buttonadd.color = "green"
                    }

                    onSignal_add: {

                        dataModel.append({name:inputText.text})

                    }


                    inputText.text =" "



                }

            }





        }





    } */


}

