import QtQuick 2.6

Item {
    id: item
    width: 500
    height: 300
    Text {
        text: "Digital clock"
        font.pointSize: 30
        font.family: "Comic Sans MS"
        color: "#2A0A0A"
        anchors.horizontalCenter: item.horizontalCenter
    }
    property int count_s: 55
    property int count_m: 12
    property int count_h: 7
    property int size: 10

    property int c_s: 60
    property int c_m: 60
    property int c_h: 24

    Timer {
        id: timer
        interval: 1000; running: true; repeat: true; triggeredOnStart: true
        onTriggered: {
            count_s++
            console.log(count_s + " " + count_m)
            if(count_s == c_s){
                count_s = 0
                count_m++
                time_m.text = count_m
                if(count_m == c_m){
                    count_m = 0
                    count_h++
                    time_h.text = count_h
                    if(count_h == c_h)
                        count_h = 0;
                }

            }

            time_m.text = (count_m < 10) ? '0' + count_m : count_m
            time_h.text = (count_h < 10) ? '0' + count_h : count_h
            time_s.text = (count_s < 10) ? '0' + count_s : count_s
        }
    }

    Row {
        id: row
        spacing: 20
        anchors.centerIn: parent
        Rectangle {
            id: rect_h
            height: 100
            width: 100
            radius: width*0.5
            color: "#2E64FE"
            border.color: "#0B610B"
            border.width: 5

            Text {
                id: time_h
                color: "white"
                anchors.centerIn: parent
                font.pointSize: 20
                font.bold: true
            }
        }

        Rectangle {
            id: rect_m
            height: 100
            width: 100
            radius: width*0.5
            color: "#2E64FE"
            border.color: "#0B610B"
            border.width: 5

            Text {
                id: time_m
                color: "white"
                anchors.centerIn: parent
                font.pointSize: 20
                font.bold: true
            }
        }
        Rectangle {
            id: rect_s
            height: 100
            width: 100
            radius: width*0.5
            color: "#2E64FE"
            border.color: "#0B610B"
            border.width: 5

            Text {
                id: time_s
                color: "white"
                anchors.centerIn: parent
                font.pointSize: 20
                font.bold: true
            }
        }
    }
}
