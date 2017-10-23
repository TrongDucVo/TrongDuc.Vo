import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    id:rec1
    property var position1
    width: 670
    height: 480
    color : "#ffff99"
    Flickable{
        id:flick1
        anchors.fill: parent
        contentHeight: textmain.height
        Text {
            id: textmain
            width: 620
            wrapMode: Text.Wrap
            x :20
            font.pointSize: 15
            text: "
Whoa oh oh hm

You've been runnin' 'round, runnin' 'round, runnin' 'round throwin' that dirt all on my name
'Cause you knew that I, knew that I, knew that I'd call you up
You've been going 'round, going 'round, going 'round every party in LA
'Cause you knew that I, knew that I, knew that I'd be at one, oh

I know that dress is karma, perfume regret
You got me thinking 'bout when you were mine, oh
You just want attention

And now I'm all up on ya, what you expect?
But you're not coming home with me tonight

You just want attention
You don't want my heart
You just want attention

You just want attention
You just want attention

You just want attention
Maybe you just hate the thought of me with someone new
Yeah, you just want attention
I knew from the start
You're just making sure I'm never gettin' over you, oh

You've been runnin' round, runnin' round, runnin' round throwing that dirt all on my name
'Cause you knew that I, knew that I, knew that I'd call you up
Baby, now that we're, now that we're, now that we're right here standing face to face
You already know, 'ready know, 'ready know that you won, oh

I know that dress is karma (dress is karma), perfume regret, yeah
You got me thinking 'bout when you were mine, oh
(You got me thinking 'bout when you were mine)

And now I'm all up on ya (all up on ya), what you expect?
(Oh, baby)
But you're not coming home with me tonight, oh no

You just want attention
You don't want my heart
Maybe you just hate the thought of me with someone new, someone new
Yeah, you just want attention, oh

I knew from the start, the start
You're just making sure I'm never gettin' over you, over you, oh

What are you doin' to me?
What are you doin', huh? (What are you doin'?)
What are you doin' to me?
You just want attention

What are you doin', huh? (What are you doin'?)
What are you doin' to me?

What are you doin', huh? (What are you doin'?)
What are you doin' to me?
What are you doin', huh?

I know that dress is karma, perfume regret

You got me thinking 'bout when you were mine

And now I'm all up on ya, what you expect?
But you're not coming home with me tonight

You just want attention
You don't want my heart
Maybe you just hate the thought of me with someone new

Yeah, you just want attention
I knew from the start
You're just making sure I'm never gettin' over you, over you

What are you doin' to me? (hey)
What are you doin', huh? (what are you doin', what?)
What are you doin' to me?

What are you doin', huh? (yeah, you just want attention)
What are you doin' to me? (I knew from the start)

What are you doin', huh?
You just want attention

You just want attention
(You're just making sure I'm never gettin' over you)
What are you doin' to me?
What are you doin', huh?
   "
        }
        Timer{
            id:timer1
            interval: 2000
            running: true
            repeat: true
            onTriggered: {
                background.visible = false
            }
        }
        onContentYChanged: {
            scrollbar.y = flick1.visibleArea.yPosition*flick1.height
            background.visible = true
            timer1.restart()
        }
    }
    Rectangle{
        id : background
        color: "gray"
        visible: false
        width: 15
        height: 480
        anchors.right: flick1.right
        Rectangle {
            id:scrollbar
            property var position
            width: 15
            height: 100
            radius: 10
            color: "#1f1f14"
            onYChanged: {
                if(scroll.drag.active){
                    flick1.contentY = scrollbar.y/flick1.height*flick1.contentHeight;
                }
            }
            MouseArea{
                id: scroll
                anchors.fill: parent
                drag.target: scrollbar
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: rec1.height-100
                hoverEnabled: true
                onEntered: scrollbar.color = "#3d3d29"
                onExited: scrollbar.color = "#1f1f14"
            }
        }
    }
}



