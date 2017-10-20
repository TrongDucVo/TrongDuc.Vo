import QtQuick 2.6
import QtQuick.Window 2.2

Rectangle{
    id:back_gnd
    width:2000;height:20000
    ClickableImageV3 {
        id: sun
        y: sun.height-height
        property int r: 400
        property int  sun_cen_x: x+300
        property int  sun_cen_y: y+220
        anchors.centerIn: back_gnd
        source: "sun.png"
        text: sun.y
        RotationAnimation on rotation {
            from:0
            to: 360
            duration: 10000
            loops: Animation.Infinite
        }
    }
    ClickableImageV3 {
        id: earth
        property int  earth_cen_x: x+100
        property int  earth_cen_y: x+100
        property int  r: 200
        source: "earth.jpg"
        text: earth.y
        RotationAnimation on rotation {
            from:0
            to: 360
            duration: 6000
            loops: Animation.Infinite
        }
        NumberAnimation on x{
            from:sun.sun_cen_x-sun.r-100
            to: sun.sun_cen_x+sun.r-100
            duration:10000
            loops: Animation.Infinite
        }

        y : sun.sun_cen_y-Math.sqrt(sun.r*sun.r-(earth_cen_x-sun.sun_cen_x)*(earth_cen_x-sun.sun_cen_x))-100
    }
    ClickableImageV3 {
        id: rocket
        property int  rocket_cen_x: x+100
        property int  rocket_cen_y: x+200
        property int  r: 300
        source: "rocket.png"
        text: Math.sqrt(sun.r*sun.r-(rocket_cen_x-sun.sun_cen_x)*(rocket_cen_x-sun.sun_cen_x))
        RotationAnimation on rotation {
            from:180
            to: 360
            duration: 10000
            loops: Animation.Infinite
        }
        NumberAnimation on x{
            from:sun.sun_cen_x+sun.r-100
            to: sun.sun_cen_x-sun.r-100
            duration:10000
            loops: Animation.Infinite
        }

        y : sun.sun_cen_y+Math.sqrt(sun.r*sun.r-(rocket_cen_x-sun.sun_cen_x)*(rocket_cen_x-sun.sun_cen_x))-200
    }
}



