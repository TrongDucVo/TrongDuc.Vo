import QtQuick 2.0

Item {
    id: root
    property int currentDay: 1
    property int currentMonth: 1
    property int currentYear: 1970
    property int monthShow: 1
    property int yearShow: 1970
    property var countDayOfMonth: [31,((yearShow%4===0)&&(yearShow%100!=0))||((yearShow%100===0)&&(yearShow%400===0))?29:28,31,30,31,30,31,31,30,31,30,31]
    property int startDate: (1+2*monthShow+(3*(monthShow+1)/5)+yearShow+(yearShow/4))%7
    property var monthInYear: ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    Component.onCompleted: {
        monthShow = currentMonth
        yearShow = currentYear
    }
    onCurrentMonthChanged: {
        monthShow = currentMonth
    }
    onCurrentYearChanged: {
        yearShow = currentYear
    }

    Rectangle{//Show year and month
        width: root.width
        height: 30
        border.width: 1
        Text{
            text: monthInYear[monthShow-1]+" "+yearShow
            anchors.centerIn: parent
            font.pointSize: 15
        }
        Rectangle{
            width:25;height:30
            anchors.left: parent.left
            Text{
                text: "<"
                anchors.centerIn: parent
                font.pointSize: 15
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = "#f39c12"
                onExited: parent.color = "white"
                onClicked: {
                    if(monthShow>1)monthShow--
                    else{monthShow=12;if(yearShow>1970)yearShow--}
                }
            }
        }
        Rectangle{
            width:25;height:30
            anchors.right: parent.right
            Text{
                text: ">"
                anchors.centerIn: parent
                font.pointSize: 15
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.color = "#f39c12"
                onExited: parent.color = "white"
                onClicked: {
                    if(monthShow<12)monthShow++
                    else {monthShow = 1;yearShow++}
                }
            }
        }
    }
    Row{
        y:30
        Repeater{
            model: ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
            Rectangle{
                height: 30
                width: root.width/7
                Text{
                    text: modelData
                    anchors.centerIn: parent
                }
            }

        }
    }
    Grid{
        columns: 7
        y:60
        Repeater{
            model:{
                if(startDate===0) return countDayOfMonth[monthShow-1]+6
                else return countDayOfMonth[monthShow-1]+startDate-1
            }
            Rectangle{
                height: 30
                width: root.width/7
                border.color: (myday.text==="")?"white":"#f1c40f"
                Text{
                    id: myday
                    text: {
                        if(startDate===0){
                            if(index-5<=0)return ""
                            else return index-5
                        }
                        else if(index-startDate+1<0)return ""
                        else return index-startDate+2
                    }
                    anchors.centerIn: parent
                    scale: (currentDay===Number(myday.text)&&currentMonth===monthShow&&currentYear===yearShow)?1.5:1
                    color: (currentDay===Number(myday.text)&&currentMonth===monthShow&&currentYear===yearShow)?"#e67e22":"black"
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: parent.color = "#f39c12"
                    onExited: parent.color = "white"
                    onDoubleClicked: {
                        currentDay = Number(myday.text)
                        currentMonth = monthShow
                        currentYear = yearShow
                    }
                }
            }
        }
    }

}
