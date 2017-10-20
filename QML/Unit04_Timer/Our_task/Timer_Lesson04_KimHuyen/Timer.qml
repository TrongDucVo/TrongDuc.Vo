import QtQuick 2.6
import QtQuick.Window 2.2

Window {

    width: 1000
    height: 500
    visible: true

    property int cout: 0

    property int gio: 0
    property int phut: 0
    property int giay: 0

    Lesson04_KimHuyen {
        id :txt1
        y: 200
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle{

        width: 400
        height: 300
        x : 300
        y: 300
        border.width: 2

        border.color: "red"
        Image{
            anchors.centerIn: parent
            id:img1
            source: "VN.jpg"
        }

        Text {
            id : txt2
            anchors.bottom: parent.bottom
            x : 20
            text: qsTr(" Time in VN :  ")

            font.pointSize: 20
        }


    }


    Rectangle{

        width: 400
        height: 300
        x : 850
        y: 300
        border.width: 2
        border.color: "red"
        Image{
            anchors.centerIn: parent
            id:img2
            source: "p2.jpg"
        }

        Text {
            id : txt3
            x:20
            anchors.bottom: parent.bottom
            text: qsTr(" Time in Franch :  ")

            font.pointSize: 20
        }


    }


    Rectangle{

        width: 400
        height: 300
        x : 1400
        y: 300

        border.color: "red"
        border.width: 2
        Image{
            anchors.centerIn: parent
            id:img3
            source: "usa.jpg"
        }

        Text {
            id : txt4
            x: 20
            anchors.bottom: parent.bottom
            text: qsTr(" Time in USA :  ")

            font.pointSize: 20
        }


    }





    Timer{

        interval: 1000
        repeat: true
        running: true
        onTriggered: {


            cout++ ;

           gio = new  Date().getHours()


            phut = new Date().getMinutes()
            giay = new Date().getSeconds()
            if( gio > 12)
                     txt2.text = "Vietnam (GMT +7)  " + gio.toString() +":"+phut.toString()+":"+giay.toString()
            else{
                txt2.text = "Vietnam (GMT +7)  " + gio.toString() +":"+phut.toString()+":"+giay.toString()

            }
            if(gio >= 12 )
            {
                   txt4.text = "USA (GMT -12)  " + (gio -12).toString() +":"+phut.toString()+":"+giay.toString()+" AM"
            }
            else{

               txt4.text = "USA (GMT -12)  " + (gio + 12).toString() +":"+phut.toString()+":"+giay.toString() +" PM"

            }

            if(gio >= 6 )
            {
                  txt3.text = "France (GMT +1)  " + (gio - 6).toString() +":"+phut.toString()+":"+giay.toString()
            }
            else
            {

                 txt3.text = "France (GMT +1)  " + (gio + 6).toString() +":"+phut.toString()+":"+giay.toString() +" PM "

            }
            if(cout > 1 )
            {
                txt1.text = " TIMER CLOCK  "

            }


        }


    }

}
