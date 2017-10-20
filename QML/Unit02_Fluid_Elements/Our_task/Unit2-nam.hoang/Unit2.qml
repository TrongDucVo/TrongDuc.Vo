// parallelanimation.qml
import QtQuick 2.0
BrightSquare {
id: root
width: 800
height: 600
property alias ufo: ufo
property int duration: 3000
Image {
anchors.fill: parent
source: "assets/background.png"
}
ClickableImageV3 {
id: rocket
x: 200; y: 400

z: 1
source: "assets/rocket.png"

}


NumberAnimation {
    id: rot
    target: rocket
    property: "rotation"
    from: 0; to: 360
    duration: anim.duration*2
    loops: Animation.Infinite
}


SequentialAnimation {
    id: anim
    property int duration: 1000
    loops: Animation.Infinite

ParallelAnimation {
    NumberAnimation {
            target: rocket
            property: "x"
            to: 305 - rocket.width/2
            duration: anim.duration
        }

    NumberAnimation {
            target: rocket
            property: "y"
            to: 90.5 - rocket.height/2
            duration: anim.duration
        }
    }
ParallelAnimation {
    NumberAnimation {
            target: rocket
            property: "x"
            to: 500 - rocket.width/2
            duration: anim.duration
        }

    NumberAnimation {
            target: rocket
            property: "y"
            to: 190.5 - rocket.height/2
            duration: anim.duration
        }
    }

ParallelAnimation {
    NumberAnimation {
            target: rocket
            property: "x"
            to: 200
            duration: anim.duration
        }

NumberAnimation {
            target: rocket
            property: "y"
            to: 400
            duration: anim.duration
        }
    }


}

ClickableImageV3 {
id: ufo
x: 100; y: 300
opacity: 1

z: 1
source: "assets/ufo.png"
onClicked: {
    anim.start()
    rot.start()
    anim1.start()
    rot1.start()
}
}


NumberAnimation {
    id: rot1
    target: ufo
    property: "rotation"
    from: 0; to: 360
    duration: anim1.duration*4
    loops: Animation.Infinite
}


SequentialAnimation {
    id: anim1
    property int duration: 3000
    loops: Animation.Infinite

ParallelAnimation {
    NumberAnimation {
            target: ufo
            property: "x"
            to: 305 - ufo.width/2
            duration: anim1.duration
        }

    NumberAnimation {
            target: ufo
            property: "y"
            to: 90.5 - ufo.height/2
            duration: anim1.duration
        }
    }
ParallelAnimation {
    NumberAnimation {
            target: ufo
            property: "x"
            to: 500 - ufo.width/2
            duration: anim1.duration
        }

    NumberAnimation {
            target: ufo
            property: "y"
            to: 190.5 - ufo.height/2
            duration: anim1.duration
        }
    }

ParallelAnimation {
    NumberAnimation {
            target: ufo
            property: "x"
            to: 200
            duration: anim1.duration
        }

NumberAnimation {
            target: ufo
            property: "y"
            to: 400
            duration: anim1.duration
        }
    }


}


}
