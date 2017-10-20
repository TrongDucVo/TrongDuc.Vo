import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 300
    height: 150
    color:"black"
    property bool tictac: true
    property var myHour: 00
    property var myMin: 00
    property var mySec: 00
    property var textHour: {
        if (myHour<=9) return "0"+myHour
        else return myHour
    }

    property var textMin: {
        if (myMin<=9) return "0"+myMin
        else return myMin
    }
    Row{
        spacing: 3
        anchors.centerIn: parent
        Number{myNumber: textHour}
        TicTac{myTic: tictac}
        Number{myNumber: textMin}
    }
    Timer{
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            mySec++;
            if (mySec==60) {
                mySec = 0;
                myMin++
                console.log("Hello")
                if(myMin==60){
                    myMin = 0;
                    myHour++;
                }
            }
            if(myHour==24) myHour=0
            tictac = !tictac
        }
    }
}
