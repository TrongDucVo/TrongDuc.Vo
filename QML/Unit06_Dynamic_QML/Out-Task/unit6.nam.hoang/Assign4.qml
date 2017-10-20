import QtQuick 2.6
import QtQuick.Window 2.2

Item {

    visible: true
    width: 1200
    height: 600

    property date currentDate: new Date()

    Row{
        spacing: 50
        width: 700
        anchors.fill: parent
        anchors.margins: 50

        Rectangle{
            id: rec1
            width: 350
            height: 350

            Clock{hour:currentDate.getHours();min:currentDate.getMinutes();sec:currentDate.getSeconds()}
            Text{
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: rec1.horizontalCenter
                text: "VietNam"
                color:"black"
                font.pointSize: 20
            }
        }
        Rectangle{
            width: 350
            height: 350

            Clock{hour:currentDate.getHours()-7-5;min:currentDate.getMinutes()}
            Text{

                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "USA"
                color:"blue"
                font.pointSize: 20
            }
        }
        Rectangle{
            width: 350
            height: 350

            Clock{hour:currentDate.getHours()-5;min:currentDate.getMinutes()}
            Text{
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "France"
                color:"green"
                font.pointSize: 20
            }
        }
    }
}
