import QtQuick 2.0

Item {
    id: root
    anchors.fill: parent
    property int myCurrentIndex: 0
    property var myTab: ["Contact","Calendar","Blank","Info"]

    //global varible using for date time
    property int day: 24
    property int month: 10
    property int year: 2017

    Row{ //Contain the tab user using
        id: myRowTabName
        spacing: 5
        Repeater{
            id: myRepeatTabName
            model: myTab //Name of tab
            Rectangle{ //Rectangle contain tab name
                id: recTab
                //width of this Rectangle is (root width - row spacing)/number of tab
                width: (root.width-myRowTabName.spacing*(myRepeatTabName.count-1))/myRepeatTabName.count
                height: 50
                color: (myCurrentIndex===model.index)?"#3498db":"gray"
                radius: 5
                Text{ //This is tabname
                    text:modelData
                    anchors.centerIn: parent
                    color: "white"
                    font.pointSize: 12
                }

                MouseArea{ //Controll click to tab
                    anchors.fill: parent
                    onClicked: {
                        flickable.state = 'home'
                        myCurrentIndex =model.index
                        flickable.state = 'myTab'
                    }
                }
            }
        }
    }
    Rectangle{ //This is blue line over 3 tab to view bester
        width: root.width
        height: 10
        y:40
        color: "#3498db"
    }
    Flickable{ //Control movement of screen
        id: flickable
        width: root.width
        height: root.height - 50
        contentWidth: root.width*myRepeatTabName.count
        y:50
        onContentXChanged: {
            myCurrentIndex = Math.round(contentX/root.width)
        }
        onMovementEnded: { //When stop movement, we need to move to a screen nearest
            flickable.state = 'home'
            flickable.state = 'myTab'
        }

        states: [
            State { //This is current state when stop movement
                name: "home"
                PropertyChanges {
                    target: flickable
                    contentX: contentX
                }
            },
            State {//This is state we need to move
                name: "myTab"
                PropertyChanges {
                    target: flickable
                    contentX: myCurrentIndex*root.width
                }
            }
        ]
        transitions: Transition {//Control animation of contentX
            NumberAnimation{
                properties: "contentX"
                duration: 200
            }
        }
        Rectangle{ //This is big screen contain all child screen we have
            width: root.width*myRepeatTabName.count
            height: root.height - 50
            Rectangle{//This is screen 1
                width: root.width
                height: root.height - 50
                MyAZListView{
                    anchors.fill: parent
                }
            }
            Rectangle{//This is screen 2
                width: root.width
                height: root.height - 50
                x:root.width
                MyCalendarV2{
                    id:calendar1
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 250
                    height: 300
                    currentDay: day
                    currentMonth: month
                    currentYear: year
                    onCurrentDayChanged: {
                        day = currentDay
                        calendar2.currentDay = day
                    }
                    onCurrentMonthChanged: {
                        month = currentMonth
                        calendar2.currentMonth = month
                    }
                    onCurrentYearChanged: {
                        year = currentYear
                        calendar2.currentYear = year
                    }
                }
                MyCalendar{
                    id: calendar2
                    y:calendar1.height-30
                    anchors.horizontalCenter: parent.horizontalCenter
                    currentDay: day
                    currentMonth: month
                    currentYear: year
                    onCurrentDayChanged: {
                        day = currentDay
                        calendar1.currentDay = day
                    }
                    onCurrentMonthChanged: {
                        month = currentMonth
                        calendar1.currentMonth = month
                    }
                    onCurrentYearChanged: {
                        year = currentYear
                        calendar1.currentYear = year
                    }
                }
            }
            Rectangle{//This is screen 3
                width: root.width
                height: root.height - 50
                x:root.width*2
                MyComboBox{
                    width: 200
                    item: ["Pham Tien Thanh","Nguyen Thi Hoai Thu","Nguyen Duc Tuan","Cao Van Manh","Vo Trong Duc","Luu Thi Kim Huyen","Ho Dinh Tan","Vu Pham Minh Hien"]
                }
            }
            Rectangle{//This is screen 4
                width: root.width
                height: root.height - 50
                x:root.width*3
                MyLongText{
                    anchors.fill: parent
                    anchors.margins: 10
                    myLongText:"My name is Pham Tien Thanh, student in University of Engineering and Technology.
I am intershiping in SD3 - LG Vehicle Compoments Development Center Viet Nam. Our team is SD3 and our teamleader is Mr.Tuan Anh
After the training of mentors in LG (Mr.Son, Mr.Dang, Mr.Chinh, Mr.Tung). Mr.Minh Thanh give us advance exercise which we need complete after 5 days. It has 5 small exercise, some of them is very \"banana\". But we thought that we would complete!
Then we do it. Each people know little ways to do big problems. Day by day, we done each exercise. And I done 4 per 5 exercise to day (20/10). Other people done 3 per 4 or 4 per 5. We very hapy, we talk to each other so much.
I done all in (24/10) last problem is hard to me and my team. So last, we found some ways to done it.

I chalenge my self by: in all of problem, I only using simple ways to do it like Rectangle, Repeater, Flickable, Text, Timer.

This is simple application using QML to creat.
It is contain 5 lession I need to complete
1. ComboBox
    - user input MyComboBox{} to ther main file as other child item
    - we can input our item over property item: [\"\"], example: item: [\"Banana\",\"Cocconut\",\"Apple\"]
    - When index change we have signal onMyItemIndexChange
    - When item change we have signal onMyItemChange
    - We also change the width and the height of ComboBox
2. Long Text
    - user call MyLongText{} to use this item
    - user put ther long text to myLongText: \"\"
    - It has scroll bar to roll text up and down
    - after 2 seconds scroll bar will be visible
3. A-Z List View
    - user call MyAZListView{} to use this Item
    - It is the same as contact of smart phone we used to know
4. Tab View
    - user call MyTabView{} to use this Item
    - User can input their tab via property myTab: []. But they need to go to MyTabView{} to add Screen
    - when tab change we have signal onMyCurrentIndexChange
5. Calendar
    - user can call MyCalendar using roll to set date or MyCalendarV2 using pickday to set date
    - in MyCalendar user roll date and time to set date
    - in MyCalendarV2 user pick day by double click to day
"
                }
            }
        }
    }
}
