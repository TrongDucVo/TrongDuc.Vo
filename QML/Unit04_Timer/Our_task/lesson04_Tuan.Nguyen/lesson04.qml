import QtQuick 2.6
import QtQuick.Window 2.2
Item {
    id: root
    width:2000;height:1000
    Row{
        anchors.centerIn: root
        spacing: 100
        Clock{city:"USA";shift:-6}
        Clock{city:"Viet Nam";shift:7}
        Clock{city:"France";shift:-10}
    }

}
