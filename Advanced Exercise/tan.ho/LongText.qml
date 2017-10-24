import QtQuick 2.0

Rectangle{
    id: recLongText
    width: 400
    height: 600

    property  var contenttext: 1500
    property var  sidebarlength: 850
    property  var ratiomove: contenttext/sidebarlength
    property var isOnVisible : true

    Flickable{
        id: leftLongText
        height: 600
        width: 370
        smooth: true
        contentHeight: contenttext
        Text {
            id:txt
            text: "SHAPE OF YOU
[Verse 1]
The club isn't the best place to find a lover
So the bar is where I go
Me and my friends at the table doing shots
Drinking fast and then we talk slow
And you come over and start up a conversation with just me
And trust me I'll give it a chance now
Take my hand, stop, put Van the Man on the jukebox
And then we start to dance, and now I'm singing like

[Pre-Chorus]
Girl, you know I want your love
Your love was handmade for somebody like me
Come on now, follow my lead
I may be crazy, don't mind me
Say, boy, let's not talk too much
Grab on my waist and put that body on me
Come on now, follow my lead
Come, come on now, follow my lead

[Chorus]
I'm in love with the shape of you
We push and pull like a magnet do
Although my heart is falling too
I'm in love with your body
And last night you were in my room
And now my bedsheets smell like you
Every day discovering something brand new
I'm in love with your body
Oh—I—oh—I—oh—I—oh—I
I'm in love with your body
Oh—I—oh—I—oh—I—oh—I
I'm in love with your body
Oh—I—oh—I—oh—I—oh—I
I'm in love with your body
Every day discovering something brand new
I'm in love with the shape of you


[Verse 2]
One week in we let the story begin
We're going out on our first date
You and me are thrifty, so go all you can eat
Fill up your bag and I fill up a plate
We talk for hours and hours about the sweet and the sour
And how your family is doing okay
Leave and get in a taxi, then kiss in the backseat
Tell the driver make the radio play, and I'm singing like

[Pre-Chorus]
Girl, you know I want your love
Your love was handmade for somebody like me
Come on now, follow my lead
I may be crazy, don't mind me
Say, boy, let's not talk too much
Grab on my waist and put that body on me
Come on now, follow my lead
Come, come on now, follow my lead

[Chorus]
I'm in love with the shape of you
We push and pull like a magnet do
Although my heart is falling too
I'm in love with your body
And last night you were in my room
And now my bedsheets smell like you
Every day discovering something brand new
I'm in love with your body
Oh—I—oh—I—oh—I—oh—I
I'm in love with your body
Oh—I—oh—I—oh—I—oh—I
I'm in love with your body
Oh—I—oh—I—oh—I—oh—I
I'm in love with your body
Every day discovering something brand new
I'm in love with the shape of you


[Bridge]
Come on, be my baby, come on
Come on, be my baby, come on
Come on, be my baby, come on
Come on, be my baby, come on
Come on, be my baby, come on
Come on, be my baby, come on
Come on, be my baby, come on
Come on, be my baby, come on

[Chorus]
I'm in love with the shape of you
We push and pull like a magnet do
Although my heart is falling too
I'm in love with your body
Last night you were in my room
And now my bedsheets smell like you
Every day discovering something brand new
I'm in love with your body
Come on, be my baby, come on
Come on, be my baby, come on
I'm in love with your body
Come on, be my baby, come on
Come on, be my baby, come on
I'm in love with your body
Come on, be my baby, come on
Come on, be my baby, come on
I'm in love with your body
Every day discovering something brand new
I'm in love with the shape of you"
            wrapMode: Text.Wrap
        }

        onContentYChanged  :{
            timer.running = true
            isOnVisible = true
            scrollBarLongText.y = leftLongText.contentY/ratiomove
            if (scrollBarLongText.y<0) {
                leftLongText.contentY=0;
                scrollBarLongText.y=0;
            }
            if (scrollBarLongText.y>sidebarlength) {
                scrollBarLongText.y=sidebarlength;
                leftLongText.contentY = contenttext;
            }
            console.log(leftLongText.contentY+ " "+ leftLongText.contentY/ratiomove)
        }
    }


    //timer
    Timer{
        id: timer
        interval: 1000
        running: true
        onTriggered: {
            if (isOnVisible === true) scrollBarLongText.visible = true
            else  scrollBarLongText.visible = false
        }
    }

    //scroll bar
    Flickable{
        id: rightBarLongText
        height: parent.height-50
        width: 30
        smooth: true
        anchors.left: leftLongText.right
        Rectangle{
            id:scrollBarLongText
            width: 28
            height: 30
            color: "lightsteelblue"
            visible: false
            radius: 8
            Image{
                width: parent.width
                height: parent.height
                source: "scroll-bar-arrows.png"
            }
            MouseArea{
                anchors.fill: parent
                onPositionChanged: {
                    drag.target = scrollBarLongText
                    drag.axis = Drag.YAxis
                    leftLongText.contentY = scrollBarLongText.y*ratiomove

                    if (scrollBarLongText.y<0) {
                        leftLongText.contentY=0;
                        scrollBarLongText.y=0;
                    }
                    if (scrollBarLongText.y>510) {
                        scrollBarLongText.y=510;
                        leftLongText.contentY = scrollBarLongText.y*ratiomove
                    }

                    console.log("dragging"+ leftLongText.contentY)
                }
                onReleased: {
                     isOnVisible = false
                    timer.running = true

                    console.log("leave")
                }

            }

        }
    }
}
