import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Text {
        y: 50
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr(" LIST INTERSHIP SOFTWARE DEVERLOPER")
       font.pointSize:  24
       color: "red"
       font.bold: font.bold


    }


    Rectangle {
       x : 1500
       y : 100
      id:rect2
      width: 250
      height: 40

      color: "linen"
      border.color: "#660000"
      border.width: 4





     TextInput {
        id: input3
       x: 10 ; y: 10
       width: 100; height: 20
      focus: true
      text: " Type text.... "
        color: "blue"
       font.pointSize: 14
      KeyNavigation.tab: input3


     }





   }

// Button

    Rectangle { // size controlled by height
        id: root

        x : 1750
        y : 100

    // public
        property string text: 'Search'
        signal clicked(); // onClicked: print('onClicked')

    // private
        width: 100;  height: 40 // default size
        border.width: 0.05 * root.height
        radius:       0.5  * root.height
        opacity:      enabled? 1: 0.3 // disabled state
       color: "#00FFFF"
        Text {
            text: root.text
            font.pixelSize: 0.5 * root.height
            anchors.centerIn: parent
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            onPressed:  parent.opacity = 0.5 // down state
            onReleased: parent.opacity = 1
            onCanceled: parent.opacity = 1
            onClicked:  root.clicked() // emit
        }

        onClicked:{

            print('button clicked ')
            root.text = "Finding ..."
            root.color = "blue"




        }


    }





    Rectangle {

         x:900
         y:150


        Grid {


            anchors.horizontalCenter: parent.horizontalCenter
            columns: 5
            rows: 8
            spacing: 2


            //1
            Rectangle { color: "green"; width: 70; height: 70

                Text {
                   text:"ID"
                   font.underline: font.underline
                   font.pointSize: 18
                   anchors.centerIn: parent
                   color:"white"

                }



            }
            Rectangle { color: "red"; width: 250; height: 70

                Text {
                   text:"Full Name "
                   font.underline: font.underline
                   font.pointSize: 18
                   anchors.centerIn: parent
                   color: "white"

                }




            }
            Rectangle { color: "#9999aa"; width: 100; height: 70


                Text {
                   text:"Sex"
                   font.underline: font.underline
                   font.pointSize: 18
                   anchors.centerIn: parent
                   color:"white"

                }





            }
            Rectangle { color: "#6666aa"; width: 250; height: 70

                Text {
                   text:"Shool"
                   font.underline: font.underline
                   font.pointSize: 18
                   anchors.centerIn: parent
                   color:"white"

                }


            }
            Rectangle { color: "#6666aa"; width: 250; height: 70

                Text {
                   text:"Phone number"
                   font.underline: font.underline
                   font.pointSize: 18
                   anchors.centerIn: parent
                   color: "white"

                }



            }





//2

            Rectangle { color: "green"; width: 70; height: 50


                Text {
                   text:"SD3 "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }




            }
            Rectangle { color: "red"; width: 250; height: 50

                Text {
                   text:"LPRCS Kim Huyen "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }


            }
            Rectangle { color: "#9999aa"; width: 100; height: 50

                Text {
                   text:"Female "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }
            Rectangle { color: "#6666aa"; width: 250; height: 50

                Text {
                   text:" FIT.UTC.EDU.VN "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }
            Rectangle { color: "#6666aa"; width: 250; height: 50

                Text {
                   text:"0982 295 610 "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }


//3
            Rectangle { color: "green"; width: 70; height: 50


                Text {
                   text:"01 "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }




            }
            Rectangle { color: "red"; width: 250; height: 50

                Text {
                   text:"Vforum "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }


            }
            Rectangle { color: "#9999aa"; width: 100; height: 50

                Text {
                   text:"Male "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }
            Rectangle { color: "#6666aa"; width: 250; height: 50

                Text {
                   text:" FIT.UTC.EDU.VN "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }
            Rectangle { color: "#6666aa"; width: 250; height: 50

                Text {
                   text:"0982 295 610 "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }

//4

            Rectangle { color: "green"; width: 70; height: 50


                Text {
                   text:"03 "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }




            }
            Rectangle { color: "red"; width: 250; height: 50

                Text {
                   text:"Tap lam Hacker "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }


            }
            Rectangle { color: "#9999aa"; width: 100; height: 50

                Text {
                   text:"Male "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }
            Rectangle { color: "#6666aa"; width: 250; height: 50

                Text {
                   text:" DHQG TP.HCM "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }
            Rectangle { color: "#6666aa"; width: 250; height: 50

                Text {
                   text:"0982 295 610 "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }



//5
            Rectangle { color: "green"; width: 70; height: 50


                Text {
                   text:"04 "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }




            }
            Rectangle { color: "red"; width: 250; height: 50

                Text {
                   text:"Roll "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }


            }
            Rectangle { color: "#9999aa"; width: 100; height: 50

                Text {
                   text:"Female "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }
            Rectangle { color: "#6666aa"; width: 250; height: 50

                Text {
                   text:" FIT.UTC.EDU.VN "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }
            Rectangle { color: "#6666aa"; width: 250; height: 50

                Text {
                   text:"0982 295 610 "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }


//6
            Rectangle { color: "green"; width: 70; height: 50


                Text {
                   text:"05 "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }




            }
            Rectangle { color: "red"; width: 250; height: 50

                Text {
                   text:"Lisa "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }


            }
            Rectangle { color: "#9999aa"; width: 100; height: 50

                Text {
                   text:"Female "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }
            Rectangle { color: "#6666aa"; width: 250; height: 50

                Text {
                   text:" FIT.UTC.EDU.VN "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }
            Rectangle { color: "#6666aa"; width: 250; height: 50

                Text {
                   text:"0982 295 610 "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }


//7
            Rectangle { color: "green"; width: 70; height: 50


                Text {
                   text:"14 "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }




            }
            Rectangle { color: "red"; width: 250; height: 50

                Text {
                   text:" Chicharito "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }


            }
            Rectangle { color: "#9999aa"; width: 100; height: 50

                Text {
                   text:"Female "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }
            Rectangle { color: "#6666aa"; width: 250; height: 50

                Text {
                   text:" FIT.UTC.EDU.VN "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }
            Rectangle { color: "#6666aa"; width: 250; height: 50

                Text {
                   text:"0982 295 610 "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }



//8
            Rectangle { color: "green"; width: 70; height: 50


                Text {
                   text:"07 "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }




            }
            Rectangle { color: "red"; width: 250; height: 50

                Text {
                   text:" Alexander "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }


            }
            Rectangle { color: "#9999aa"; width: 100; height: 50

                Text {
                   text:"Female "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }
            Rectangle { color: "#6666aa"; width: 250; height: 50

                Text {
                   text:" FIT.UTC.EDU.VN "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }
            Rectangle { color: "#6666aa"; width: 250; height: 50

                Text {
                   text:"0982 295 610 "
                   font.italic: font.italic
                   font.pointSize: 14
                   anchors.centerIn: parent

                }

            }






        }
    }
}
