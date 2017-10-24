import QtQuick 2.0

Item{
    id:root
    width:500
    height: 500
    //    Rectangle{
    //        id:root
    //        anchors.fill: parent
    Flickable{
        id:window
        //            anchors.fill: parent
        property real yPosition: window.visibleArea.yPosition
        property real heightRatio:window.visibleArea.heightRatio
        anchors.fill: parent
        anchors.margins: 10
        clip : true
//        anchors.horizontalCenter: root.horizontalCenter
        contentHeight: text2.height+text1.height
        contentWidth: text2.width
        flickableDirection: Flickable.VerticalFlick
//        Rectangle{
//            id:sheet
        Text {
            id: text1
            width:window.width
            text: qsTr("Dick Whittington and his Cat")
            color: "black"
            wrapMode:Text.Wrap
            font.pixelSize:40
        }
        Text {
            id: text2
            width:window.width
            anchors.top: text1.bottom
            text: qsTr("A long time ago there was once a poor boy called Dick Whittington who had no Mummy and Daddy to look after him so he was often very hungry.  He lived in a little village in the country. He’d often heard stories about a far away place called London where everybody was rich and the streets were paved with gold.

Dick Whittington was determined that he would go there and dig up enough gold from the streets to make his fortune.  One day he met a friendly waggoner who was going to London who said he would give him a lift there, so off they went.  When they reached the big city Dick couldn’t believe his eyes, he could see horses, carriages, hundreds of people, great tall buildings, lots of mud, but nowhere could he see any gold.  What a disappointment, how was he going to make his fortune? How was he even going to buy food?

After a few days he was so hungry that he collapsed in a ragged heap on the doorstep of a rich merchant’s house.  Out of the house came a cook:

“Be off with you” she shouted “you dirty ragamuffin” and she tried to sweep him off the step with a broom.

At that moment the merchant arrived back at his house and, being a kindly man, took pity on poor Dick.

“Carry him into the house” he ordered his groom.

Dick WhittingtonWhen he was fed and rested, Dick was given a job working in the kitchen.  He was very grateful to the Merchant but, alas, the cook was always very bad tempered and, when no one was looking, used to beat and pinch him. The other thing that made Dick sad was that he had to sleep in a tiny room at the very top of the house and it was full of rats and mice that crawled all over his face and tried to bite his nose.

He was so desperate that he saved up all his pennies and bought a cat.  The cat was a very special cat, she was the best cat in all of London at catching mice and rats.  After a few weeks Dick’s life was much easier because of his clever cat who had eaten all the rats and mice and he was able to sleep in peace.

Dick WhittingtonNot long after, Dick heard the merchant asking everyone in the house if they wanted to send anything on board his ship they thought they could sell.  The ship was going on a long voyage to the other side of the world and the captain would sell everything on the ship so they could all make some money.  Poor Dick, what could he sell?

Suddenly, a thought came to him

“Please sir, will you take my cat?”

Everyone burst out laughing, but the merchant smiled and said:

“Yes Dick, I will, and all the money from her sale will go to you”.

After the merchant had left from the city Dick was on his own again with the mice and rats crawling over him by night and the cook being even nastier in the day because there was no-one to stop her.  Dick decided to run away.

As he walked away the bells of all the churches rang out and seemed to say:

“Turn again Dick Whittington
Three times Lord Mayor of London”

“Goodness, gracious, gosh” thought Dick astonished.  “If I’m going to be Lord Mayor I’d better stay.  I’ll put up with cook and the scurrying mice and rats, and when I’m mayor I’ll show her!”

So back he went.

Across the other side of the world, the merchant and his ship had arrived at their destination.  The people were so pleased to see them and were so welcoming that the merchant decided to send some presents to their king and queen.  The king and queen were so delighted that they invited them all to a feast.  But, believe it or not, as soon as the food was brought in hundreds of rats appeared as if by magic and gobbled it all up before they had a chance to eat.

“Oh dear” said the king “this is always happening – I never get a chance to eat my apple pie.  What can I do?”

“I have an idea” said the merchant “I have a very special cat which has travelled with me all the way from London, and she will gobble up your rats faster than they gobbled up your feast.”

Sure enough, to the king and queen’s joy, the next time a feast was prepared and the rats appeared, the cat pounced and killed all the rats as quick as lightening.

The king and queen danced for joy and gave the merchant a ship full of gold in return for the very special cat.

When the ship returned to London Dick was overwhelmed with the amount of gold the merchant gave him for his cat.  Over the years he used his money so wisely, and did so much good for all the people around him and who worked for him, that he was elected Lord Mayor of the City of London three times.  But he never forgot his kind friend the merchant, who had been so honest in giving him all the money that the cat had earned and kept nothing for himself. When Dick grew up he fell in love with Alice, the merchant’s beautiful daughter, and married her.  They lived happily ever after as people do in stories.")
            color: "black"
            wrapMode:Text.Wrap
            font.pixelSize:20
        }

        onMovementStarted:
        {
            scroll.visible=true
//            scroll.timer_active=true
            timer.restart()

        }
        //flickable effect scroll y position
        property int maxY: window.height-scroll.height
        property double realy: maxY*window.yPosition/(1-window.heightRatio)
        onContentYChanged: {
            if(realy<-40) scroll.y=-40
            else if(realy>window.height+10) scroll.y=window.height+10
            else scroll.y=realy

        }
    }

    Rectangle{
        property int maxY: window.height-scroll.height
        property double realy: maxY*window.yPosition/(1-window.heightRatio)
        property alias timer_active:timer.running
        id:scroll
        width:20
        height:50
        anchors.right: window.right
        anchors.rightMargin: -0
        color:"blue"
        visible: false
        //drag scroll y positon effect flickable content area
        onYChanged: {
            if(dragArea.drag.active||dragArea.pressed)
            window.contentY=scroll.y/maxY*(text2.height+text1.height-window.height)
            timer.restart()

        }

        MouseArea{
            id:dragArea
            anchors.fill: parent
            drag.target: scroll
            //                drag.axis: y
            drag.minimumY: 0
            drag.maximumY: scroll.maxY//window.height-scroll.height
            hoverEnabled: true

            onEntered: scroll.color="lightblue"
            onExited: scroll.color="blue"
        }
        Timer{
            id:timer
            interval: 2000
            onTriggered:
            {scroll.visible=false
//                timer.running=false
            }
        }

    }

}
