import QtQuick 2.0

Item {
    id: root
    width: 250
    height: 150
    property string myTime: ""+currentYear+":"+currentMonth+":"+currentDay
    property int currentDay: 24
    property int currentMonth: 10
    property int currentYear: 2017
    property var countDayOfMonth: [31,((currentYear%4===0)&&(currentYear%100!=0))||((currentYear%100===0)&&(currentYear%400===0))?29:28,31,30,31,30,31,31,30,31,30,31]
    ///control change when current date time change from out site
    onCurrentDayChanged: {
        day.currentIndex = currentDay-1
    }
    onCurrentMonthChanged: {
        month.currentIndex = currentMonth-1
    }
    onCurrentYearChanged: {
        year.currentIndex = currentYear-1970
    }

    Row{ //row contain 3 rolls
        anchors.fill: parent
        MyRollDateTime{//Day
            id:day
            currentIndex: 0
            width: parent.width/3
            height: parent.height
            myModel: countDayOfMonth[month.dataDateTime-1]
            typeModel: 0
            onCurrentIndexChanged: {
                currentDay = currentIndex+1
            }
        }
        MyRollDateTime{//Month
            id:month
            currentIndex: 0
            width: parent.width/3
            height: parent.height
            myModel: ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
            typeModel: 1
            onCurrentIndexChanged: {
                currentMonth = currentIndex+1
            }
        }
        MyRollDateTime{//Year
            id:year
            currentIndex: 0
            width: parent.width/3
            height: parent.height
            myModel: 100
            typeModel: 2
            onCurrentIndexChanged: {
                currentYear = currentIndex+1970
            }
        }
        Component.onCompleted: { //Load current date time when completed load
            day.currentIndex = currentDay-1
            month.currentIndex = currentMonth-1
            year.currentIndex = currentYear-1970
        }
    }
}
