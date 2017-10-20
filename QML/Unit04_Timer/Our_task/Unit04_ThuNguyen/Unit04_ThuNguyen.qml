import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 1200
    height: 800
    title: "Time zone"
    property int h: 1
    property int m: 1
    property int s: 1
    Test2{
        id: vietnam
        x: 100
        y: 50
        background: "image/vietnam3.jpg"
        country: "Hanoi, Viet Nam (UTC +7)"
    }
    Test2{
        id: france
        x: 450
        y:50
        background: "image/france.jpg"
        country:"Paris, France (UTC +1)"
    }
    Test2{
        id: usa
        x:800
        y:50
        background:"image/usa.jpg"
        country: "New York, USA (UTC -5)"
    }
    Timer{
        interval: 100
        running: true
        repeat: true
        onTriggered: {
            h = new Date().getHours();
            m = new Date().getMinutes();
            s = new Date().getSeconds();
            vietnam.time = h + ":" + m + ":" + s;
            if(h<12){
                usa.time = 24+h-12+":"+m+":"+s;
            }
            else usa.time = h-12 +":"+m+":"+s;
            if(h<6){
                france.time = 24+h-6+":"+m+":"+s;
            }
            else france.time = h-6 +":"+m+":"+s;
            //            vietnam.time = new Date().getHours()+":"+ new Date().getMinutes()+":" +new Date().getSeconds();
            //            france.time = new Date().getHours()-6+":"+ new Date().getMinutes()+":" +new Date().getSeconds();
            //            usa.time = new Date().getHours()-17+":"+ new Date().getMinutes()+":" +new Date().getSeconds();
        }
    }
}


