import QtQuick 2.0
import QtQuick.Window 2.0
Item{
    Clock {
        id: clock1
        width:  300
        height: 300
        y:300
        Text {
            id: name
            text: "USA"
            anchors.centerIn: parent


        }
    }
    Clock{
        id:clock2
        width: 300
        height: 300
        x:400
        y:300
        Text {
            id: name1
            text: "Viet Nam"
            anchors.centerIn: parent


        }
    }

    Clock{
        id:clock3
        width: 300
        height: 300
        x:800
        y:300
        Text {
            id: name2
            text: "Franch"
            anchors.centerIn: parent


        }
    }
}

