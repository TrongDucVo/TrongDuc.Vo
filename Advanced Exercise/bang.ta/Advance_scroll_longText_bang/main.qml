import QtQuick 2.6
import QtQuick.Window 2.2
Window {
    visible: true
    width: 800
    height: 480
    title: qsTr("longText_scrollableTab")
    property int key: 0
    Rectangle {
        id:txtScreen
        width:700
        height:300
        color: "yellow"
        Flickable {
            id: flick1
            anchors.fill: parent
            contentWidth: txt.width; contentHeight: txt.height
            flickableDirection: Flickable.VerticalFlick
            clip: true
            Text{
                id: txt
                wrapMode: Text.WordWrap
                width: txtScreen.width
                font.pixelSize: 40
                color: "red"
                text:  "
Break

We put the puzzle together piece
by piece, loving how one curved
notch fits so sweetly with another.
A yellow smudge becomes
the brush of a broom, and two blue arms
fill in the last of the sky.
We patch together porch swings and autumn
trees, matching gold to gold. We hold
the eyes of deer in our palms, a pair
of brown shoes. We do this as the child
circles her room, impatient
with her blossoming, tired
of the neat house, the made bed,
the good food. We let her brood
as we shuffle through the pieces,
setting each one into place with a satisfied
tap, our backs turned for a few hours
to a world that is crumbling, a sky
that is falling, the pieces
we are required to return to.

—Dorianne Laux


Immortality

In Sleeping Beauty's castle
the clock strikes one hundred years
and the girl in the tower returns to the
world.
So do the servants in the kitchen,
who don't even rub their eyes.
The cook's right hand, lifted
an exact century ago,
completes its downward arc
to the kitchen boy's left ear;
the boy's tensed vocal cords
finally let go
the trapped, enduring whimper,
and the fly, arrested mid-plunge
above the strawberry pie,
fulfills its abiding mission
and dives into the sweet, red glaze.

As a child I had a book
with a picture of that scene.
I was too young to notice
how fear persists, and how
the anger that causes fear persists,
that its trajectory can't be changed
or broken, only interrupted.
My attention was on the fly;
that this slight body
with its transparent wings
and lifespan of one human day
still craved its particular share
of sweetness, a century later.

—Lisel Mueller


"
            }
            onFlickEnded: {
                key =1
                timer2.running = true

            }
            onContentYChanged: {
                if(!keoScrollBar.drag.active){
                    rect3.y = flick1.visibleArea.yPosition*flick1.height;
                }
                key =1
                rect2.visible = true
            }


        }
    }
    Rectangle {
        id:rect2
        property int y_scrollMax: txtScreen.height - rect3.height
        property int y_scrollMin:  0
        width: 40
        height:300
        color: "steelblue"
        anchors.left: txtScreen.right
        radius: 20
        Rectangle{
            id: rect3
            width: parent.width
            height: 60
            color: "black"
            anchors.right: rect2.right
            radius: 20
//            y: flickArea.visibleArea.yPosition*flickArea.height


            onYChanged: {
               if(keoScrollBar.drag.active){
                   key =1
                   rect2.visible = true
                   flick1.contentY = rect3.y/flick1.height*flick1.contentHeight;
                   timer1.running= true
               }
            }
            MouseArea{
                id: keoScrollBar
                anchors.fill: rect3
                drag.target: rect3
                drag.axis: Drag.YAxis
                onReleased:
                {
                    timer2.restart()
                }
            }
        }
    }
//    Timer{
//        id: timer1
//        running: true
//        repeat: true
//        interval: 10
//        onTriggered: {
//            key = 0
//        }

//    }
    Timer{
        id: timer2
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            if(key===0){
                rect2.visible = false
            }
        }
    }
}
