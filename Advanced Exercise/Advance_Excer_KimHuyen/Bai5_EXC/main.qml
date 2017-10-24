import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true

    title: "Calendar"
    id:root
    width: 1000
    height: 500

    property int month1: path2.currentIndex + 2
     property int year1: path3.currentIndex +1951
    property int day1: path1.currentIndex + 2
    property int n: 0

    Rectangle {

        id: recdate
        width: 100; height: 200
        x : 100
        y : 150
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#777777" }
            GradientStop { position: 0.45; color: "white" }
            GradientStop { position: 1.0; color: "#777777" }

        }

        PathView {
            id: path1
            anchors.fill: parent
            model: {
                             if(month1 ===2){
                                    if((year1%4===0 && year1%100!=0)|| year1%400===0) return 29
                                    else return 28
                                }else if (month1 === 4|| month1===6 || month1===9||month1===11) return 30
                                else return 31
                            }


            clip:true
            delegate: compo
            Component{

                id: compo
                Text {

                    id: txtdate
                    text:index+1
                    font.pointSize: 20
                    color: (path1.currentIndex === index-1)? "black" : "gray"

                }


            }
            path:Path{
                startX: recdate.width/2
                startY: 20

                PathLine { x: recdate.width/2; y: recdate.height*1.2; }
            }

            pathItemCount: 3


        }



    }

    Rectangle {

        id: recmonth
        width: 100; height: 200
        x : 250
        y : 150
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#777777" }
            GradientStop { position: 0.45; color: "white" }
            GradientStop { position: 1.0; color: "#777777" }

        }

        PathView {
            id:path2
            anchors.fill: parent
            model: ["Jan","Feb","Mar","April","May","June","July","August","Sep","Oct","Nov","Dec"]
            clip:true
            delegate:compo2
            Component{

                id: compo2


                Text {

                    id: txtdate
                    text: modelData
                    font.pointSize: 20
                      color: (path2.currentIndex === index-1)? "black" : "gray"
                }


            }
            path:Path{
                startX: recmonth.width/2
                startY: 20

                PathLine { x: recmonth.width/2; y: recmonth.height*1.2; }
            }

            pathItemCount: 3




        }



    }

    Rectangle {

        id: recyear
        width: 100; height: 200
        x : 400
        y : 150
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#777777" }
            GradientStop { position: 0.45; color: "white" }
            GradientStop { position: 1.0; color: "#777777" }

        }

        PathView {
            id: path3
            anchors.fill: parent
            model: 150
            clip:true
            delegate:compo3
            Component{

                id: compo3


                Text {

                    id: txtyear
                    text: index + 1950
                    font.pointSize: 20
                    color: (path3.currentIndex === index-1)? "black" : "gray"
                }


            }
            path:Path{
                startX: recyear.width/2
                startY: 20

                PathLine { x: recyear.width/2; y: recyear.height*1.2; }
            }

            pathItemCount: 3




        }



    }


    Rectangle{

    id:listcan
    width: parent.width/2.5
    height: 350
    border.color: "blue"
    anchors.right: parent.right
   y : 100

   Rectangle{
    id:header
    x : 20
    y: 5
    width: parent.width - 40
    height: 45
    border.color: "blue"

            Rectangle{
                id:leftarrow
                width: 40
                height: 15
                x : 20
                y:7
                Text {
                    text: qsTr("<")
                    font.pointSize: 20

                    font.bold: true
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: if(month1 > 1){
                                   month1 = month1-1;
                                   n = (day1+2*month1+Math.floor((3*(month1+1))/5) + year1 + Math.floor(year1/4)) % 7;
                                   //n = (ngày+2*tháng+(3*(tháng+1)) div 5 + năm + (năm div 4)) mod 7
                                   path2.currentIndex = month1 - 2 ;

                               }
                }

            }

            Rectangle{
                id:date
                width: 40
                height: 15
               x : 115
               y : 10
                Text {
                    text: day1+" / "+month1 +" / "+year1
                    font.pointSize: 14


                }
            }

            Rectangle{
                id:rightarrow
                width: 40
                height: 20
                y: 7
               x : 300
                Text {
                    text: qsTr(">")
                    font.pointSize: 20
                    font.bold: true
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: if(month1<12){
                                   month1 = month1+1;
                                   n = (day1+2*month1+Math.floor((3*(month1+1))/5) + year1 + Math.floor(year1/4)) % 7;

                                         path2.currentIndex = month1 - 2;
                               }
                }

            }


   }

   Row{
   y : 70
   x : 35
   spacing: 28
 Repeater{

     model:["Su","Mo","Tu","We","Th","Fr","Sa"]
     Text{

     text:modelData
     font.pointSize: 10
     color: "#003366"
     }



 }


   }

  Grid{
       height: parent.height
       width: 400
       rows:6
       columns: 7
       spacing: 1
     x: 30
     y : 100
       Repeater{
           model: {if(month1 ===2){
                   if((year1%4===0 && year1%100!=0)|| year1%400===0) return 29+n
                   else return 28+n
               }else if (month1 === 4|| month1===6 || month1===9||month1===11) return 30+n
               else return 31+n}
           Rectangle{
               width: 40
               height: 40
               border.color: "#00CCFF"
               color: index-n+1 ==path1.currentIndex+2? "#99FFFF":"white"
               Text {

                  text: index+1-n
                   font.pointSize: 12
                  color: (index+1-n>0)?"black":"white"
                   anchors.centerIn: parent
               }
               MouseArea{

                anchors.fill:parent
                onClicked: {



                    path1.currentIndex = index - n - 1


                }


               }
           }
       }
   }



    }



}
