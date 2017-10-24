import QtQuick 2.0

Rectangle{
    id: root
    x:50
    width: 280
    height: 300
    property var date: new Date()
    property var cd: getDay()   // how many days in a month
    property var mth: date.getMonth()+1 //month
    property var year: date.getFullYear()
    signal takeDay
    signal takeMonth
    signal takeYear

    Component.objectName: {
        root.onTakeDay.connect(getDay)
        root.onTakeMonth.connect(getFullNameMonth)
        root.onTakeYear.connect(getYear)
    }
    function getYear(){
        return year
    }

    function getDay(){
        if ((mth===2)&&(year%4==0)&&(year%100!=0)) return 29;
        if ((mth===2)&&(year%4==0)&&(year%100==0)) return 28;
        if ((mth===4)||(mth==6)||(mth==9)||(mth==11)) return 30
        else return 31;
    }
   function getFullNameMonth(m){
        var marray = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        return marray[m-1]
   }

    // button
    Rectangle{
        id:button
        width: 50
        height: 50
        anchors.left : output.right
        color: "red"
        MouseArea{
            id: mousearea
            anchors.fill: parent
            onClicked: {
                //got date here
            }
        }

    }
    // push signal out to text
    Rectangle{
        id: output
        width: 200
        height: 50
        anchors.top: gvCalendar.bottom
        anchors.topMargin: 10
    Row{
        Text{text: "Your Birthday: "; font.pointSize: 12}
        Text{id:txt1; font.pointSize: 12}
        Text{id:txt2; font.pointSize: 12}
        Text{id:txt3; font.pointSize: 12}
    }}
    //top bar
    Rectangle{
        id:topBarCalendar
        width: parent.width
        height: 30
        border.width: 2
        radius:2
        //arrow to left
        Text {
            id: txtDate
            anchors.centerIn: parent
            font.pointSize: 15

            text: getFullNameMonth(mth)+"-"+year
        }
        Image{
            width: 30
            height: 30
            anchors.left: parent.left
            source: "left.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                       mth--;
                    if (mth<1) mth=12;

                    txt1.text = mth
                    console.log(mth)
                }
            }
        }
        //arrow to right
        Image{
            width: 30
            height: 30
            anchors.right: parent.right
            source: "right.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mth++;
                    if(mth>12) mth = 1;

                    txt2.text = mth
                    console.log(mth)
                }
            }
        }

    }
    //day bar
    Rectangle{
        id:dayBarTop
        anchors.top : topBarCalendar.bottom
        width: parent.width
        height: 20
        color:"green"
        ListView{
            id: listview
            width: parent.width
            height: parent.height
            orientation: ListView.Horizontal
            model: dayModel
            delegate:Rectangle{
                width: 40
                height: 20

                Text{text:name; color:"blue"}
            }
        }
    }
    // gridview
    GridView{
        id: gvCalendar
        anchors.top : dayBarTop.bottom
        width: 280
        height: 200
        cellHeight: 40
        cellWidth: 40
        model: cd
        delegate: Rectangle{
            id: rectDay
            width: 40
            height: 40
            color: "lightsteelblue"
            border.width: 1
            border.color: "yellow"
            radius: 5
            Text {
                id:txtDay
                anchors.centerIn: parent
                font.pointSize: 12
                text: index+1
            }
            MouseArea{
                anchors.fill:parent
                hoverEnabled: true
                onEntered: rectDay.color = "#e67e22"
                onExited:  rectDay.color = "lightsteelblue"
            }
        }
    }

    ListModel{
        id: dayModel
        ListElement{name:"Mon"}
        ListElement{name:"Tue"}
        ListElement{name:"Wed"}
        ListElement{name:"Thur"}
        ListElement{name:"Fri"}
        ListElement{name:"Sat"}
        ListElement{name:"Sun"}

    }
    ListModel{
        id: monthModel
        ListElement{name:"January"}
        ListElement{name:"February"}
        ListElement{name:"March"}
        ListElement{name:"April"}
        ListElement{name:"May"}
        ListElement{name:"June"}
        ListElement{name:"July"}
        ListElement{name:"August"}
        ListElement{name:"September"}
        ListElement{name:"October"}
        ListElement{name:"November"}
        ListElement{name:"December"}
    }
}
