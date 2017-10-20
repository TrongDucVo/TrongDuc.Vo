import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id: root
    width: 640
    height: 480

    opacity:1.0
    // M1>>
    Loader {
        id: dialLoader
        objectName: "formLoader"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: fuelButton.top;
        onLoaded: {
        }
        onSourceChanged: {
            console.log("HOHO");
        }

        /*
        onSourceChanged: animation.running = true
        NumberAnimation {
            id: animation
            target: dialLoader.item
            property: "x"
            from: root.width / 2
            to: 0// - dialLoader.item.width
            duration: 1000
            easing.type: Easing.InExpo
        }*/
    }

    SequentialAnimation on opacity {
        id: opaAnim
        // Animations on properties start running by default
        running: false
        loops: Animation.stop() // The animation is set to loop indefinitely
        //NumberAnimation { from: 1.0; to: 0.5; duration: 500; easing.type: Easing.InOutQuad }
        NumberAnimation { from: 0.4; to: 1.0; duration: 500; easing.type: Easing.InOutQuad }
        //PauseAnimation { duration: 250 } // This puts a bit of time between the loop
    }
    // <<M1
    Rectangle {
        id: fuelButton
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        color: "gray"
        width: parent.width/2
        height: 100
        Text {
            anchors.centerIn: parent
            text: "Fuel"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                opaAnim.running = true;
                root.state = "fuel";
            }
        }
    }

    Rectangle {
        id: veloButton
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "gray"
        width: parent.width/2
        height: 100
        Text {
            anchors.centerIn: parent
            text: "Velocity"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                opaAnim.running = true;
                root.state = "velo";
            }
        }
    }

    state: "fuel"
    // M3>>
    states: [
        State {
            name: "fuel"
            PropertyChanges { target: fuelButton; color: "green"; }
            PropertyChanges { target: dialLoader; source: "Fuel.qml"; }
        },
        State {
            name: "velo"
            PropertyChanges { target: veloButton; color: "green"; }
            PropertyChanges { target: dialLoader; source: "Velocity.qml"; }
        }
    ]
    transitions: [
        Transition {
            from: "fuel"; to: "velo"
        },
        Transition {
            from: "velo"; to: "fuel"
            //PropertyAnimation { target: dialLoader; properties: "color"; duration: 1000 }
        }
    ]
    // <<M3
    /*
        SequentialAnimation {
            running: true
            loops: Animation.Infinite
            NumberAnimation { target: root; property: "speed"; to: 145; easing.type: Easing.InOutQuad; duration: 4000; }
            NumberAnimation { target: root; property: "speed"; to: 10; easing.type: Easing.InOutQuad; duration: 2000; }
        }*/
}
