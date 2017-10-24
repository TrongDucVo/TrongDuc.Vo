import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    visible: true
    width: 450
    height: 600
    color: "#ffffe6"
    title: qsTr("ScrollBar")
    property int valid: 0

    Flickable {
        id: placeOfText
        contentHeight: myText.height
        anchors.fill: parent
        clip: true
        Rectangle {
            anchors.fill: parent
            color: "#ffffe6"
            Text {
                id: myText
                font.pointSize: 15
                width: 440
                anchors.centerIn: parent
                wrapMode: Text.Wrap
                text:"
My Love
An empty street, an empty house
 A hole inside my heart
 I'm all alone, the rooms are getting smaller.

 I wonder how, I wonder why,
 I wonder where they are
 The days we had, the songs we sang together, oh, yeah.

 And all my love, I'm holding on forever
 Reaching for the love that seems so far

[Chorus:]
 So I say a little prayer
 And hope my dreams will take me there
 Where the skies are blue to see you once again, my love.
 Over seas from coast to coast
 To find the place I love the most
 Where the fields are green to see you once again, my love.

 I try to read, I go to work
 I'm laughing with my friends
 But I can't stop to keep myself from thinking, oh, no.

 I wonder how, I wonder why,
 I wonder where they are
 The days we had, the songs we sang together, oh, yeah.

 And all my love, I'm holding on forever
 Reaching for the love that seems so far

[Chorus:]
 So I say a little prayer
 And hope my dreams will take me there
 Where the skies are blue to see you once again, my love.
 Over seas from coast to coast
 To find the place I love the most
 Where the fields are green to see you once again,

 To hold you in my arms,
 To promise you my love,
 To tell you from the heart,
 You're all I'm thinking of.

 Reaching for the love that seems so far

[Chorus:]
 So I say a little prayer
 And hope my dreams will take me there
 Where the skies are blue to see you once again, my love.
 Over seas from coast to coast
 To find the place I love the most
 Where the fields are green to see you once again, my love.

[Chorus:]
 Say a little prayer (my sweet love)
 Dreams will take me there
 Where the skies are blue (woah, yeah) to see you once again, my love. (oh, my love)
 Over seas from coast to coast
 To find the place I love the most
 Where the fields are green to see you once again, my love.
An empty street, an empty house
 A hole inside my heart
 I'm all alone, the rooms are getting smaller.

 I wonder how, I wonder why,
 I wonder where they are
 The days we had, the songs we sang together, oh, yeah.

 And all my love, I'm holding on forever
 Reaching for the love that seems so far

[Chorus:]
 So I say a little prayer
 And hope my dreams will take me there
 Where the skies are blue to see you once again, my love.
 Over seas from coast to coast
 To find the place I love the most
 Where the fields are green to see you once again, my love.

 I try to read, I go to work
 I'm laughing with my friends
 But I can't stop to keep myself from thinking, oh, no.

 I wonder how, I wonder why,
 I wonder where they are
 The days we had, the songs we sang together, oh, yeah.

 And all my love, I'm holding on forever
 Reaching for the love that seems so far

[Chorus:]
 So I say a little prayer
 And hope my dreams will take me there
 Where the skies are blue to see you once again, my love.
 Over seas from coast to coast
 To find the place I love the most
 Where the fields are green to see you once again,

 To hold you in my arms,
 To promise you my love,
 To tell you from the heart,
 You're all I'm thinking of.

 Reaching for the love that seems so far

[Chorus:]
 So I say a little prayer
 And hope my dreams will take me there
 Where the skies are blue to see you once again, my love.
 Over seas from coast to coast
 To find the place I love the most
 Where the fields are green to see you once again, my love.

[Chorus:]
 Say a little prayer (my sweet love)
 Dreams will take me there
 Where the skies are blue (woah, yeah) to see you once again, my love. (oh, my love)
 Over seas from coast to coast
 To find the place I love the most
 Where the fields are green to see you once again, my love. "
            }
            MouseArea {
                anchors.fill: parent
                onReleased: {
                    placeOfScrollBar.visible = true
                    timer.running = true
                }
            }
        }
        onContentYChanged: {
            if(!mouse.drag.active){
                myScrollbar.y = placeOfText.visibleArea.yPosition * placeOfText.height;
            }
            valid = 1
            placeOfScrollBar.visible = true
        }
        onFlickEnded: {
            valid = 1
            timer.running = true
        }
    }
    Rectangle{
        id: placeOfScrollBar
        visible: false
        width: 10; height: placeOfText.height
        anchors.right: placeOfText.right
        color: "#ffffe6"
        Rectangle{
            id: myScrollbar
            anchors.right: parent.right
            width: 10
            height: 100
            radius: 10
            color: "black"
            onYChanged: {
                if(mouse.drag.active){
                    valid = 1
                    placeOfScrollBar.visible = true
                    placeOfText.contentY = myScrollbar.y/placeOfText.height*placeOfText.contentHeight;
                }
            }
            MouseArea{
                id: mouse
                anchors.fill: parent
                drag.target: myScrollbar
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: placeOfScrollBar.height
                onReleased: {
                    timer.running =true
                }
            }
        }
    }
    Timer{
        id: timer
        interval: 10
        running: false
        repeat: true
        onTriggered:{
            valid = 0
        }
    }
    Timer{
        repeat: true
        interval: (valid)? 0 : 2000
        running: true
        onTriggered:{
            if(valid == 0){
                placeOfScrollBar.visible = false
            }
        }
    }
}
