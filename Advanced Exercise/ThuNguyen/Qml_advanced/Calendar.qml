//Calendar.qml
import QtQuick 2.4

Rectangle {
    visible: true
    width: parent.width
    height: parent.height
    property int day2:2;
    property int month2:2;
    property int year2:1971;
    property int n: 0;
    onYear2Changed: year.myindex = year2-1970-1;
    onMonth2Changed: month.myindex = month2-2;
    onDay2Changed: day.myindex = day2-2;
    Row{
        id: row
        spacing: 3
        width: parent.width/4
        height: parent.height
        CalendarObject{
            id: year
            object: 2
            mymodel: 50
            startNumber: 1970
            xStart: 90; yStart: 50;
            xEnd: 90; yEnd: 5300
            onMyindexChanged: year2 = myindex+1970+1
        }
        CalendarObject{
            id:month
            object: 1
            mymodel:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
            startNumber: 1
            xStart: 90; yStart: 50;
            xEnd: 90; yEnd: 1310
            onCurIndexChanged: month2 = curIndex+1
        }
        CalendarObject{
            id: day
            object: 0
            mymodel: {if(month2 ==2){
                    if((year2%4==0 && year2%100!=0)|| year2%400==0) return 29
                    else return 28
                }else if (month2 == 4|| month2==6 || month2==9||month2==11) return 30
                else return 31
            }
            startNumber: 1
            xStart: 90; yStart: 50;
            xEnd: 90; yEnd: 3300
            onCurIndexChanged: day2=curIndex+1
        }
    }
    Rectangle{
        id: table
        width: parent.width/2
        height: parent.height-100
        anchors.right: parent.right
        anchors.rightMargin: 30
        border.color: "black"
        Column{
            anchors.top: parent.top
            anchors.margins: 20
            anchors.fill: parent
            spacing: 4
            Row{
                id: tab
                height: 50
                width: parent.width
                spacing: 27
                Rectangle{
                    id: previousYear
                    height: parent.height
                    width: parent.width/5
                    Text{ text:"<<"; font.pointSize: 16}
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(year2>1970){
                                year2 = year2-1;
                                n = (day2+2*month2+Math.floor((3*(month2+1))/5) + year2 + Math.floor(year2/4)) % 7;
                                console.log(day2 +"/" +month2 +"/" +year2)
                            }
                        }
                    }
                }
                Rectangle{
                    id: previousMonth
                    height: parent.height
                    width: parent.width/5
                    Text{ text:"<"; font.pointSize: 16}
                    MouseArea{
                        anchors.fill: parent
                        onClicked: if(month2>0){
                                       month2 = month2-1;
                                       n = (day2+2*month2+Math.floor((3*(month2+1))/5) + year2 + Math.floor(year2/4)) % 7;
                                       console.log(day2 +"/" +month2 +"/" +year2)
                                   }
                    }
                }
                Rectangle{
                    id: status
                    height: parent.height
                    width: parent.width/5
                    Text{
                        text: day2+"/ "+month2 +"/ "+year2
                        font.pointSize: 16
                    }
                }
                Rectangle{
                    id: nextMonth
                    height: parent.height
                    width: parent.width/5
                    Text{ text:">"; font.pointSize: 16}
                    MouseArea{
                        anchors.fill: parent
                        onClicked: if(month2<12){
                                       month2 = month2+1;
                                       n = (day2+2*month2+Math.floor((3*(month2+1))/5) + year2 + Math.floor(year2/4)) % 7;
                                       console.log(day2 +"/" +month2 +"/" +year2);
                                   }
                    }
                }
                Rectangle{
                    id: nextYear
                    height: parent.height
                    width: parent.width/5
                    Text{ text:">>"; font.pointSize: 16}
                    MouseArea{
                        anchors.fill: parent
                        onClicked: if(year2<2020){
                                       year2 = year2+1;
                                       n = (day2+2*month2+Math.floor((3*(month2+1))/5) + year2 + Math.floor(year2/4)) % 7;
                                       console.log(day2 +"/" +month2 +"/" +year2);
                                   }
                    }
                }
            }
            Rectangle{
                height: 400
                width: parent.width
                border.color: "green"
                Row{
                    id: date
                    height: 70;
                    width: grid.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    spacing: 1
                    Repeater{
                        model: ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
                        Rectangle{
                            width: 70
                            height: 70
                            border.color: "black"
                            Text{
                                text:modelData
                                font.pointSize: 12
                            }
                        }

                    }
                }
                Grid{
                    id: grid
                    height: parent.height
                    width: parent.width*2/3
                    anchors.top: date.bottom
                    anchors.margins: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    rows:6; columns: 7
                    spacing: 1
                    Repeater{
                        model: day.mymodel+n
                        Rectangle{
                            width: 70
                            height: 70
                            border.color: "yellow"
                            color: if((index-n+1)==day.myindex+2) return "green"; else return "white";
                            Text {
                                text: (index-n+1)
                                font.pointSize: 12
                                color: (index-n+1>0)?"black":"white"
                            }
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    day2= index-n+1;
                                    day.myindex = day2-2;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
//n = (ngày+2*tháng+(3*(tháng+1)) div 5 + năm + (năm div 4)) mod 7
