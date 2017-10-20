import QtQuick 2.6


 import QtQuick.Window 2.2





 Item{


     id: root


     width: 1000; height: 1000


     Rectangle{


         id: rec


         width:300;height:300


         anchors.horizontalCenter:  root.horizontalCenter


         anchors.verticalCenter: root.verticalCenter


         color: "red"


         signal click1()





         signal press()





         signal pressandhold()


         function click_act(){


             console.log("Mouse is clicked")


             rec.color = "green"


             rec.scale = 2


         }


         function press_act(){


             console.log("Mouse is pressed")


             rec.color = "blue"


         }


         function pressandhold_act(){


             console.log("Mouse is pressed and hold")


             rec.color = "yellow"

             rec.scale = 0.5




         }


         Component.onCompleted: {


             rec.click1.connect(click_act)


             rec.press.connect(press_act)


             rec.pressandhold.connect(pressandhold_act)


         }


         MouseArea{


             id:mousearea


             anchors.fill: rec


             onClicked: rec.click1()


             onPressed: rec.press()


             onPressAndHold: {
                 rec.pressandhold()
                 Drag.target = rec
             }


         }


     }


     Text{


         text: "Sample about connection"


         y:50


         anchors.horizontalCenter: root.horizontalCenter


         font.pixelSize: 20


         font.family: "Ubuntu"


     }


     Text{


         text: "Click:color will be changed to green and scale is 2 times compare to initial"


         y:70


         anchors.horizontalCenter: root.horizontalCenter


         font.pixelSize: 20


         font.family: "Ubuntu"


     }


     Text{


         text: "Press:color will be changed to blue"


         y:90


         anchors.horizontalCenter: root.horizontalCenter


         font.pixelSize: 20


         font.family: "Ubuntu"


     }


     Text{


         text: "Press and hold: color will be changed to yellow and scale is 0.5 times compare to initial"


         y:110


         anchors.horizontalCenter: root.horizontalCenter


         font.pixelSize: 20


         font.family: "Ubuntu"


     }


 }




