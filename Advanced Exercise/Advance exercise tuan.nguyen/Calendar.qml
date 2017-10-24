import QtQuick 2.0
Item{
    id:root
    width:500
    height: 500
    property int day: -1
    property int month: -1
    property int year: -1
    property string date_set
    property date cur_date: new Date()

    Rectangle{
        id:scroll_root
        width:150
        height:150
//        anchors.horizontalCenter: root.horizontalCenter
//        border.color: "blue"\
        x:25
        y:50
        CalenderColumn{
            id:dayColumn;
            dele_x: scroll_root.x;
            dele_y: scroll_root.y;
            quantity: 31
            path_init:cur_date.getDate()
            onSendMsg: {
                root.day=dayColumn.cur_val;
                console.log(root.day);
            }
        }
        CalenderColumn{
            id:monthColumn;
            dele_x: scroll_root.x+50;
            dele_y: scroll_root.y;
            quantity: 12
            isMonth: true
            path_init:cur_date.getMonth()+1
            onSendMsg: {
                root.month=monthColumn.cur_val;
                console.log(root.month);
            }
        }
        CalenderColumn{
            id:yearColumn;
            dele_x: scroll_root.x+100
            dele_y: scroll_root.y
            quantity: 50;
            path_init:cur_date.getFullYear()
            onSendMsg: {
                root.year=yearColumn.cur_val;
                console.log(root.year);
            }
            dele_offset: 1970
        }
    }

        Rectangle{
            width:100
            height: 40
            radius:10
            border.color:"red"
            y:300
            x:50
            MouseArea{
                anchors.fill:parent
                property date qDate
                onClicked: {
                    date_set=month+"/"+day+"/"+year
                    console.log(year+":"+month+":"+day)
                    qDate=new Date(date_set);
//                    console.log(qDate)
                    dateCalendar.targetDate=new Date(date_set)
//                    dateCalendar.tg_date=qDate.getDate()
                    dateCalendar.month=qDate.getMonth()
                    dateCalendar.year=qDate.getFullYear()
                    dateCalendar.createCalendar(dateCalendar.targetDate)
//                     console.log(dateCalendar.firstDate)

                }
            }
            Text {
                id: set
                text: qsTr("Apply")// This is available in all editors.
                anchors.centerIn: parent
                font.pixelSize: 20
            }
//            anchors.horizontalCenter: parent.horizontalCenter
        }
        CalendarDate{
            id:dateCalendar;
            grid_x: 250
            grid_y: 100
            targetDate: new Date("10/24/2017")
        }
        Component.onCompleted:
        {
            day=cur_date.getDate()
            month=cur_date.getMonth()+1
            year=cur_date.getFullYear()
        }
}
