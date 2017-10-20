import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1000
    height: 500
    color: "#ecf0f1"
    property date currentDate: new Date()
    title: "World Clock - designer TienThanh.Pham"
    Row{
        spacing: 50
        width: 700
        anchors.fill: parent
        anchors.margins: 50
        //VietNam+7,USA-5,Franch+2
        Rectangle{
            id: rec1
            width: 250
            height: 350
            color: "#00000000"
            Clock{hour:currentDate.getHours();min:currentDate.getMinutes()}
            Text{
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: rec1.horizontalCenter
                text: "VietNam(+7)"
                color:"black"
                font.pointSize: 24
            }
        }
        Rectangle{
            width: 250
            height: 350
            color: "#00000000"
            Clock{hour:currentDate.getHours()-7-5;min:currentDate.getMinutes()}
            Text{

                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "USA(-5)"
                color:"black"
                font.pointSize: 24
            }
        }
        Rectangle{
            width: 250
            height: 350
            color: "#00000000"
            Clock{hour:currentDate.getHours()-5;min:currentDate.getMinutes()}
            Text{
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Franch(+2)"
                color:"black"
                font.pointSize: 24
            }
        }
    }
}
