import QtQuick 2.6
import QtQuick.Window 2.2
Rectangle {
    id: root
    width:1500;height:800
    color:"white"
    Row{
        anchors.centerIn: root
        spacing: 100
        Clock{city:"USA";shift:-5}
        Clock{city:"Viet Nam";shift:7}
        Clock{city:"France";shift:-10}
    }

}
