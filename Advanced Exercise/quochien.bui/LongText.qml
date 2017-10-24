import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    visible: true
    width: 450
    height: 600
    color: "#2EFEF7"
    property int valid: 0
    Flickable{
        id: flickable
        contentHeight: text.height
        anchors.fill: parent
        clip: true
        Rectangle{
            id: rect
            anchors.fill: parent
            color: "#2EFEF7"
            Text{
                id: text
                font.pointSize: 15
                width: 440
                anchors.centerIn: parent
                wrapMode: Text.Wrap
                text:"Bad Romance

Oh-oh-oh-oh-oh-oh-oh-oh-oh-oh-oh-oh!
Caught in a bad romance
Oh-oh-oh-oh-oh-oh-oh-oh-oh-oh-oh-oh!
Caught in a bad romance

Rah-rah-ah-ah-ah-ah!
Roma-roma-mamaa!
Ga-ga-ooh-la-la!
Want your bad romance

Rah-rah-ah-ah-ah-ah!
Roma-roma-mamaa!
Ga-ga-ooh-la-la!
Want your bad romance

I want your ugly
I want your disease
I want your everything
As long as it's free
I want your love
(Love-love-love I want your love)

I want your drama
The touch of your hand
I want your leather-studded kiss in the sand
I want your love
Love-love-love
I want your love
(Love-love-love I want your love)

You know that I want you
And you know that I need you
I want it bad, your bad romance

I want your love and
I want your revenge
You and me could write a bad romance
(Oh-oh-oh--oh-oh!)
I want your love and
All your lover's revenge
You and me could write a bad romance

Oh-oh-oh-oh-oh-oh-oh-oh-oh-oh-oh-oh!
Caught in a bad romance
Oh-oh-oh-oh-oh-oh-oh-oh-oh-oh-oh-oh!
Caught in a bad romance

Rah-rah-ah-ah-ah-ah!
Roma-roma-mamaa!
Ga-ga-ooh-la-la!
Want your bad romance

I want your horror
I want your design
‘Cause you're a criminal
As long as you're mine
I want your love
(Love-love-love I want your love-uuhh)

I want your psycho
Your vertigo shtick
Want you in my rear window
Baby you're sick
I want your love
Love-love-love
I want your love
(Love-love-love I want your love)

You know that I want you
('Cause I'm a free bitch baby!)
And you know that I need you
I want it bad, bad romance

I want your love and
I want your revenge
You and me could write a bad romance
(Oh-oh-oh-oh-oh!)
I want your love and
All your lover's revenge
You and me could write a bad romance

Oh-oh-oh-oh-oh-oh-oh-oh-oh-oh-oh-oh!
Caught in a bad romance
Oh-oh-oh-oh-oh-oh-oh-oh-oh-oh-oh-oh!
Caught in a bad romance

Rah-rah-ah-ah-ah-ah!
Roma-roma-mamaa!
Ga-ga-ooh-la-la!
Want your bad romance

Rah-rah-ah-ah-ah-ah!
Roma-roma-mamaa!
Ga-ga-ooh-la-la!
Want your bad romance

Walk, walk fashion baby
Work it
Move that bitch crazy

Walk, walk fashion baby
Work it
Move that bitch crazy

Walk, walk fashion baby
Work it
Move that bitch crazy

Walk, walk passion baby
Work it
I'm a free bitch, baby

I want your love and
I want your revenge
I want your love
I don't wanna be friends

Je veux ton amour
Et je veux ta revenge
Je veux ton amour
I don't wanna be friends
Oh-oh-oh-oh-oooh!
I don't wanna be friends
(Caught in a bad romance)
I don't wanna be friends
Oh-oh-oh-oh-oooh!
Want your bad romance
(Caught in a bad romance)
Want your bad romance!

I want your love and
I want your revenge
You and me could write a bad romance
Oh-oh-oh-oh-oooh!
I want your love and
All your lover's revenge
You and me could write a bad romance

Oh-oh-oh-oh-oooh-oh-oh-oooh-oh-oh-oh-oh!
Want your bad romance
(Caught in a bad romance)
Want your bad romance

Oh-oh-oh-oh-oooh-oh-oh-oooh-oh-oh-oh-oh!
Want your bad romance
(Caught in a bad romance)

Rah-rah-ah-ah-ah-ah!
Roma-roma-mamaa!
Ga-ga-ooh-la-la!
Want your bad romance"
            }

        }
        onFlickEnded: {
            valid = 1
            timer.running = true
        }

        onContentYChanged: {
            if(!mouse.drag.active){
                scrollbar.y = flickable.visibleArea.yPosition * flickable.height;
            }
            valid = 1
            rect2.visible = true
        }
        Timer{
            id: timer
            interval: 10
            running: true
            repeat: true
            onTriggered:{
                valid = 0
            }
        }
        Timer{
            id: timer2
            repeat: true
            interval: (valid)? 0 : 2000
            running: true
            onTriggered:{
                if(valid == 0){
                    rect2.visible = false
                }
            }
        }
    }
    Rectangle{
        visible: false
        id: rect2
        width: 10; height: flickable.height
        anchors.right: flickable.right
        color: "#2EFEF7"
        Rectangle{
            id: scrollbar
            anchors.right: parent.right
            //y: flickable.visibleArea.yPosition * flickable.height
            width: 10
            height: 100
            color: "black"
            onYChanged: {
                if(mouse.drag.active){
                    valid = 1
                    rect2.visible = true
                    flickable.contentY = scrollbar.y/flickable.height*flickable.contentHeight;
                    timer.running = true
                }
            }
            MouseArea{
                id: mouse
                anchors.fill: parent
                drag.target: scrollbar
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: rect2.height
                onReleased: {
                    timer.restart()
                }
            }
        }
    }
}
