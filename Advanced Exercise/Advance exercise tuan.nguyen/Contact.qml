import QtQuick 2.6
import QtQuick.Window 2.2


Item{
    id:root
    width:500
    height: 500
    //    Rectangle{
    //        id:root
    //        anchors.fill: parent

    Item{
        id:window
        anchors.fill: parent
        anchors.margins: 10
        property alias curIndx: list.currentIndex
        //init component of list view in beginning
        ListModel{
            id:themodel
            ListElement{text1:"A"}
            ListElement{text1:"An"}
            ListElement{text1:"Anh"}
            ListElement{text1:"B"}
            ListElement{text1:"Bao"}
            ListElement{text1:"Binh"}
            ListElement{text1:"C"}
            ListElement{text1:"D"}
            ListElement{text1:"E"}
            ListElement{text1:"F"}
            ListElement{text1:"G"}
            ListElement{text1:"H"}
            ListElement{text1:"I"}
            ListElement{text1:"J"}
            ListElement{text1:"K"}
            ListElement{text1:"L"}
            ListElement{text1:"M"}
            ListElement{text1:"N"}
            ListElement{text1:"O"}
            ListElement{text1:"P"}
            ListElement{text1:"Q"}
            ListElement{text1:"R"}
            ListElement{text1:"S"}
            ListElement{text1:"T"}
            ListElement{text1:"U"}
            ListElement{text1:"V"}
            ListElement{text1:"W"}
            ListElement{text1:"X"}
            ListElement{text1:"Y"}
            ListElement{text1:"Z"}

        }
        ListView{
            id:list
            //            anchors.fill: parent
            width:parent.width
            height: parent.height-namebox.height
            focus: true
            model:themodel
            delegate: delegate1
            highlight: Rectangle{
                z:100
                color:'lightblue'
                opacity: 0.5
            }
            highlightMoveDuration: 100
            clip:true

        }
        Component{
            id:delegate1

            Rectangle{
                id:element
                width: window.width
                opacity: 1
                property int name_indx: index
                height: {
                    if(name.text.length==1) height:40
                    else height:80
                }

                color:{
                    if(name.text.length==1) color:"gray"
                    else color:"white"
                }
                border.color: "black"
                Text {
                    id: name
                    anchors.fill: parent
                    text: text1
                    font.pixelSize: 20
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:
                    {list.currentIndex=index
                        console.log(name_indx)
                    }
                }
            }
        }
        Rectangle{
            id:addbox
            width: list.width/5-10
            height: 50
            color:"red"
            anchors.top: list.bottom
            anchors.right: list.right
            anchors.rightMargin: 10
            property string name:namebox.text4
            //get index of head section which is contained in list of alphabet
            property int firstAl:
                if(namebox.text4.length!=0) namebox.text4[0].charCodeAt(0)-97<0?themode2.get(namebox.text4[0].charCodeAt(0)-65).indx1:themode2.get(namebox.text4[0].charCodeAt(0)-97).indx1
            //get index of letter in alphabet
            property int alpha_indx:
                if(namebox.text4.length!=0) namebox.text4[0].charCodeAt(0)-97<0?namebox.text4[0].charCodeAt(0)-65:namebox.text4[0].charCodeAt(0)-97
            radius:10
            Text {
                id: text3
                text: qsTr("Add")
                font.pixelSize: 30
            }
            MouseArea{
                anchors.fill: parent
                property int i
                onClicked: {
                    console.log(addbox.firstAl)
                    //insert from namebox to corresponding section in listview
                    themodel.insert(addbox.firstAl+1,{"text1":namebox.text4})
                    //increase index index of head section below inserted section
                    for(i=addbox.alpha_indx+1;i<25;i++)
                    {
                        themode2.get(i).indx1++
                    }
                    list.currentIndex=addbox.firstAl
                }
            }
        }
        Rectangle{
            id:namebox
            width: list.width*4/5-10
            height: 50
            color:"lightblue"
            anchors.top: list.bottom
            anchors.left: list.left
            property alias text4: text4.text
            radius:10
            TextInput {
                anchors.fill: parent
                font.pixelSize: 30
                id: text4
                text: ("Name")
                focus:true
            }
        }

        //list of letter in alphabet
        //each component content indx1 which is index of header of section in list view
        ListModel{
            property int init_offset: 4
            id:themode2
            ListElement{text2:"A";indx1:0}
            ListElement{text2:"B";indx1:3}
            ListElement{text2:"C";indx1:6}
            ListElement{text2:"D";indx1:7}
            ListElement{text2:"E";indx1:8}
            ListElement{text2:"F";indx1:9}
            ListElement{text2:"G";indx1:10}
            ListElement{text2:"H";indx1:11}
            ListElement{text2:"I";indx1:12}
            ListElement{text2:"J";indx1:13}
            ListElement{text2:"K";indx1:14}
            ListElement{text2:"L";indx1:15}
            ListElement{text2:"M";indx1:16}
            ListElement{text2:"N";indx1:17}
            ListElement{text2:"O";indx1:18}
            ListElement{text2:"P";indx1:19}
            ListElement{text2:"Q";indx1:20}
            ListElement{text2:"R";indx1:21}
            ListElement{text2:"S";indx1:22}
            ListElement{text2:"T";indx1:23}
            ListElement{text2:"U";indx1:24}
            ListElement{text2:"V";indx1:25}
            ListElement{text2:"W";indx1:26}
            ListElement{text2:"X";indx1:27}
            ListElement{text2:"Y";indx1:28}
            ListElement{text2:"Z";indx1:29}
        }

        ListView{
            id:window2
            width: 10
            height: window.height
            opacity: 1
            anchors.right: window.right
            anchors.top:window.top
            focus: true
            model:themode2
            delegate: delegate2
        }
        Component{
            id:delegate2
            Rectangle{
                id:element
                width: window2.width
                height: list.height/26
                property int indx: indx1
                property int curIndx:index
                //            border.color: "black"
                Text {
                    id: name
                    anchors.fill: parent
                    text: text2
                    font.pixelSize: 15
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked:
                    {
                        window.curIndx=element.indx             //listview current index is changed
                    }
                    hoverEnabled: true
                    onEntered:
                    {

                        window2.currentIndex=index
                        rec5.text1=themode2.get(window2.currentIndex).text2     //scale the component that contain mouse
                        rec5.visible=true
                    }
                    onExited:
                    {
                        rec5.visible=false
                    }
                }
                //the bigger size of letter is beside which will be visible when mouse points to
                Rectangle{
                    id:rec5
                    width:50
                    height: 50
                    x:element.x-60
                    y:-15
                    visible: false
                    property alias text1: text5.text
                    Text{
                        id:text5
                        anchors.centerIn: parent
                        font.pixelSize: 40
                    }
                }
            }
        }

    }
}




