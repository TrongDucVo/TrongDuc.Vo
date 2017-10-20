import QtQuick 2.0

Rectangle{
    id:root

    signal signal_remove(int index)
    signal signal_add(string name)
   signal signal_update(string id , string name , string toan , string van , string eng)

    Rectangle
    {
        id:recmsv
        width: 70
        height: parent.height
        color : "white "
        border.color: "green"
        border.width: 2


        Text {

            text: model.masv
            font.pointSize: 20
             anchors.centerIn: parent
            color: "#770000"

        }



}





Text {
    id: txt
    width: 250
    height: parent.height
    color: "#770000"
    text:  model.name
    font.pointSize: 20
    x: 120
    y:15



}



Rectangle
{
    id:btnRemove
    width: 150
    height: parent.height
    color: "#FF6699"
    anchors.right: parent.right
    radius: 15
    border.color: "green"
    border.width: 2

    Text {
        id:del
        text: qsTr("Delete")
        font.pointSize: 20
        anchors.centerIn: parent
        color: "white"

    }



    MouseArea{

        anchors.fill: parent

        onClicked: {

            signal_remove(model.index)

        }



    }




}



Rectangle
{
    id:btnAppend
    width: 150
    height: parent.height

    anchors.right : btnRemove.left
    color: "#33FFFF"
    radius: 15
    border.color: "green"
    border.width: 2



    Text {

        text: qsTr("Update")
        font.pointSize: 20
        anchors.centerIn: parent
        color: "white"

    }



    MouseArea{

        anchors.fill: parent

        onClicked: {

            signal_append("")
            signal_update("","","","","")




        }



    }




}

Rectangle
{
    id:rectoan
    width: 150
    height: parent.height
    color: "white"
    anchors.left: txt.right
    border.color: "green"
    border.width: 2


    Text {

        text: model.math
        font.pointSize: 20
        anchors.centerIn: parent
        color: "#770000"

    }



    }


    Rectangle
    {
        id:recvan
        width: 150
        height: parent.height
        anchors.left: rectoan.right
        color: "white"
        border.color: "green"
        border.width: 2



        Text {

            text: model.van
            font.pointSize: 20
            anchors.centerIn: parent
            color: "#770000"

        }




    }


    Rectangle
    {
        id:receng
        width: 150

        height: parent.height
        anchors.left: recvan.right
        color : "white "
        border.color: "green"
        border.width: 2



        Text {

            text: model.eng
            font.pointSize: 20
            anchors.centerIn: parent
            color: "#770000"

        }



    }



}
