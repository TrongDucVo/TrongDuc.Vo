import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import "Test.js" as Test
Window {
    visible: true
    width: 700
    height: 500
    title: qsTr("Hello World")
    property var count: 0
//Clock 1
    Rectangle {
           id:monthAndYear
           x:40; y: 30
           height: 30; width: 420
           Text {
               anchors.centerIn: parent
               text: Test.gMonth(new Date(1506186000000+(count+1)*1000*60*60*24*30))
           }
           Rectangle {
               id: button1
               anchors.right: monthAndYear.right
               height: 20; width: 20
               radius: 10
               color: "black"
               MouseArea {
                   anchors.fill: parent
                   onClicked: count +=1;
               }
           }
           Rectangle {
               id: button2
               anchors.left: monthAndYear.left
               height: 20; width: 20
               radius: 10
               color: "red"
               MouseArea {
                   anchors.fill: parent
                   onClicked: count -=1;
               }
           }
       }
    Row {
           id: dayOfWeek
           property var day: ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
           x:40; y:50
           Repeater {
               model: dayOfWeek.day
               Rectangle {
                   width: 60; height: 25
                   border.width: 1
                   color: "blue"
                   Text {
                       anchors.centerIn: parent
                       text: modelData
                   }
               }
           }
       }
    Grid {
           id: dateOfMonth
           anchors.top: dayOfWeek.bottom
           x: 40
           columns: 7
           Repeater {
               model: 42
               Rectangle {
                   width: 60; height: 25
                   border.width: 1
                   color: "yellow"
                   Text {
                       anchors.centerIn: parent
                       text: Test.gDate(new Date (1506186000000+(index+35*count)*1000*60*60*24))
                   }
                   MouseArea {
                       anchors.fill: parent
                       onPressAndHold: {
                           color: "green"
                           console.log(Test.gDate(new Date (1506186000000+(index+35*count)*1000*60*60*24)))
                       }
                   }
               }
           }
       }
//Clock 2
    Rectangle {
        id: day
        x: 500; y: 40
        width: 60; height: 180;
        color: "blue"
        Text {
            anchors.centerIn: parent
            text: Test.gDate(new Date())
        }
    }
    Rectangle {
        id: month
        x: 560; y: 40
        width: 60; height: 180;
        color: "red"
        Text {
            anchors.centerIn: parent
            text: Test.gMonth(new Date())
        }
    }
    Rectangle {
        id: year
        x: 620; y: 40
        width: 70; height: 180;
        color: "green"
        Text {
            anchors.centerIn: parent
            text: Test.gYear(new Date())
        }
    }
}
