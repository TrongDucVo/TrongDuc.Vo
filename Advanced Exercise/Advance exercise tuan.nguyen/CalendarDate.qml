import QtQuick 2.6
import QtQuick.Window 2.2
Item{
    id:root
    width:500
    height: 500
    //declare origin date 1/1/1970
    property date date1: new Date("1/1/1970")
    //declare global date
    property date date2
    //declare target date
    property date targetDate
    property int tg_date
    property int month
    property int year
    //cal next month and last month
    property int lastMonth:month==0? 11:month-1
    property int nextMonth:month==11? 0:month+1
    property int firstDate
    property variant allsquare:[0,0,0]  //content to display in all 42 spots inside grid
    //declare number of days in each month 28,29,30 or 31 day alterlatively
    property variant dateMonth: {
        if(year%4==0&&year%1000!=0)
            [31,29,31,30,31,30,31,31,30,31,30,31]
            else [31,28,31,30,31,30,31,31,30,31,30,31]
    }
    property variant monthNameofYear: ["January","February","March","April","May","June","July","August","September","October","November","December"]
        //set top left  position of grid
        property alias grid_x: theGrid.x
        property alias grid_y: theGrid.y
        //display name of day in week
        Row{
            id:theDayofWeek
            anchors.bottom: theGrid.top
            anchors.left: theGrid.left
            Repeater{
                id:theColRepeat
                model: ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
                delegate: Rectangle{
                    width:30;height:30
                    border.color:"#ecf0f1"
                    Text {
                        id: dayofWeek
                        anchors.centerIn: parent
                        text: modelData
                        font.pixelSize: 12
                    }
                }
            }
        }
        Row{
            id:theColumn
            anchors.bottom: theDayofWeek.top
            anchors.left: theDayofWeek.left

            Rectangle{
                id:leftArrowArea
                width:30;height:30
                Text {
                    id: leftArrow
                    text: "<"
                    anchors.centerIn: leftArrowArea
                    font.pixelSize: 30
                }
            }
            //the area displays target month
            Rectangle{
                id:monthArea
                width:90;height:30
//                Text {
//                    id: monthName
//                    text: monthNameofYear[0]
//                    anchors.centerIn: parent
//                    font.pixelSize: 15
//                }
                ComboBox{
                    id:monthComboBox
                    property date newdate
                    property string newdate_str
                    property int i:0
                    combox_width:90;
                    combox_height:30;
                    header_name: monthNameofYear[targetDate.getMonth()];
                    comboBox_list:monthNameofYear
                    combox_x:0
                    combox_y:0
                    onCur_itemChanged: {
                        if(i++>1)
                        {
                        newdate_str=cur_item+"/"+targetDate.getDate()+"/"+targetDate.getFullYear()
                        newdate=new Date(newdate_str)
                        createCalendar(newdate);
                        }
                    }
                }
            }
            //the area displays target year
            Rectangle{
                id:yearArea
                width:60;height:30
                ComboBox{
                    combox_width:60;
                    combox_height:30;
                    header_name: targetDate.getFullYear()
                    property int i:0
                    property date newdate
                    property string newdate_str
                    comboBox_list:["2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020"]
                    combox_x:0
                    combox_y:0
                    onCur_itemChanged: {
                        if(i++>1)
                        {
                        newdate_str=targetDate.getMonth()+"/"+targetDate.getDate()+"/"+comboBox_list[cur_item]
                        newdate=new Date(newdate_str)
                        createCalendar(newdate);
                        }
                    }
                }
            }
            //the > arrow in top of calendar
            Rectangle{
                id:rightArrowArea
                width:30;height:30
                Text {
                    width:30;
                    id: rightArrow
                    text: ">"
                    anchors.centerIn: rightArrowArea
                    font.pixelSize: 30
                }
            }
        }

        //grid contain 42 members
        Grid{
            id:theGrid
            columns:7
            rows:6
            z:-1
            Repeater{
                id:theRepeat
                //            model: ["theModel","b"]
                delegate: theCom
            }
        }
        Component{
            id:theCom
            Rectangle{
                id:theComponent
                width:30;height:30
                border.color: "#e67e22"
                Text {
                    id: text1
                    text: modelData
                    anchors.centerIn: parent
                    //fade at spots which are out side of target month
                    opacity: index<firstDate||index>(firstDate+dateMonth[month]-1)?0.5:1
                }
                //color target date in grid
                color: (firstDate+tg_date-1==index)? "red":"white"
                MouseArea{
                    id:theMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    //hightlight date which is point by mouse
                    onExited: theComponent.color=(firstDate+tg_date-1==index)?"red":"white"
                    onEntered: theComponent.color="#E57373"
                    //                   onDoubleClicked:
                }
            }
        }
        Rectangle{
            width:50
            height:50
            color:"red"
            y:400;x:200
            visible: false
            MouseArea{
                anchors.fill: parent
                onClicked: {
                }
            }
        }
        Component.onCompleted: {
            createCalendar(targetDate)


        }
        function createCalendar(tagetdate)
        {
            date2= tagetdate
            firstDate=(((3+(date2.getTime()-date1.getTime())/8.64e+7)-date2.getDate()+1)%42)%7
            //miliseconds of target date - miliseconds of origin date / miliseconds of a day /42/7 to get column of target date in grid

            tg_date=date2.getDate()
            month=date2.getMonth()
            year=date2.getFullYear()
            //fill grid from index 0 to first in target month
            for(var i=0;i<firstDate;i++)
            {
                allsquare[i]=dateMonth[lastMonth]-firstDate+i+1;
            }

            //fill grid number of target month
            for(var i=0;i<dateMonth[month];i++)
            {
                allsquare[firstDate+i]=i+1
            }
            //fill grid in left spots for next month
            for(var i=0;i<42-firstDate-dateMonth[month];i++)
            {
                allsquare[firstDate+dateMonth[month]+i]=i+1
            }
            theRepeat.model=allsquare

        }
//        onTargetDateChanged: createCalendar(targetDate)
    }
