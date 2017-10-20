import QtQuick 2.6
import QtQuick.Window 2.2

Rectangle {

    width: 580
    height: 400

    property date date: new Date()

    // assignment
    Column {
        spacing: 10
        anchors.fill: parent
        Rectangle {
            width: 100
            height: 100
            color: "#00000000"
            DigitalClock {
                hours: date.getHours()
                minutes: date.getMinutes()
                seconds: date.getSeconds()
                clockName: "Vietnam +7"
            }
        }

        Rectangle {
            width: 100
            height: 100
            color: "#00000000"
            DigitalClock {
                hours: date.getHours() - 7 -5
                minutes: date.getMinutes()
                seconds: date.getSeconds()
                clockName: "USA -5"
            }
        }
        Rectangle {
            width: 100
            height: 100
            color: "#00000000"
            DigitalClock {
                hours: date.getHours() - 5
                minutes: date.getMinutes()
                seconds: date.getSeconds()
                clockName: "France +2"
            }
        }
    }
}
