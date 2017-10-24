import QtQuick 2.4
import QtQuick.Window 2.2
import "qrc:/constant.js" as Constants

Window {
    visible: true
    width: Constants.HomeWidth
    height: Constants.HomeHeight
    color: "white"
    MyTabView{

    }
//    MyCalendarV2{
//        anchors.fill: parent
//        currentDay: 24
//        currentYear: 2017
//        currentMonth: 10

//        onCurrentMonthChanged: {
//            console.log(countDayOfMonth[currentMonth-1])
//        }
//    }
}
