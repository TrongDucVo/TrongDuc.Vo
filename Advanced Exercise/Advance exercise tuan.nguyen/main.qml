import QtQuick 2.6
import QtQuick.Window 2.2


Window {
    title: qsTr("Hello world")
    width:500
    height: 570
    Item {
        id: root
        anchors.fill:parent
//        Loader{
//            id:pageload
//            anchors.top: base.bottom
//        }
        Flickable{
            property int preY
            id:pageroot
//            color:"red"
            width:500
            height:570
            anchors.top: base.bottom
            contentWidth: pageload1.width+pageload2.width+pageload3.width+pageload4.width
            contentHeight: pageload2.width
//            opacity: 0.5
            flickableDirection:Flickable.HorizontalFlick

//            onContentYChanged: {
////                if(Math.abs(pageroot.contentY-pageroot.preY)>750) pageroot.cancelFlick();
//                console.log(pageroot.contentY);
//            }
            onMovementEnded: {
                    pageroot.state='idle'
                console.log(pageroot.state)
                    if(pageroot.contentX<250)
                    {
                        base.curIndex=0
//                        pageroot.contentX=0;
                        pageroot.state='toComboBox'
                    }
                    else if(750>=pageroot.contentX&&pageroot.contentX>250)
                    {
                        console.log(pageroot.contentX)
//                        pageroot.contentX=500;
                        pageroot.state='toLongText'
                        base.curIndex=1
                    }
                    else if(1250>=pageroot.contentX&&pageroot.contentX>750)
                    {
                        console.log(pageroot.contentX);
//                        pageroot.contentX=1000;
                        pageroot.state='toContact'
                        base.curIndex=2
                    }
                    else if(pageroot.contentX>1250) {
                        console.log(pageroot.contentX);
//                        pageroot.contentX=1500;
                        pageroot.state='toCalender'
                        base.curIndex=3
                    }
                    console.log(pageroot.contentX)
                    console.log(pageroot.state)
//                    theTimer.running=true
//                    pageroot.state='idle'
                    preY=contentY;

            }
            Timer{
                id:theTimer
                interval:1
                repeat:true
                onTriggered:
                {
                    if(theTransition.running==false)
                    {
                        theTimer.running=false
                        if(pageroot.state=='toComboBox') pageroot.state="idle"
                        else if(pageroot.state=='toComboBox') pageroot.state="idleLongtext"
                        else if(pageroot.state=='toComboBox') pageroot.state="idleContact"
                        else if(pageroot.state=='toComboBox') pageroot.state="idleCalender"
                    }
                    console.log(pageroot.state)

                }
            }

            Loader{
                id:pageload1
                anchors.top: parent.top
            }
            Loader{
                id:pageload2
                anchors.left: pageload1.right
            }
            Loader{
                id:pageload3
                anchors.left: pageload2.right
            }
            Loader{
                id:pageload4
                anchors.left: pageload3.right
            }
            state:"idle"
            states:[
                State {
                    name: "idle"
                    PropertyChanges {target: pageroot}
                },
                State {
                    name: "toComboBox"
                    PropertyChanges {target: pageroot;contentX:0}
                },
                State {
                    name: "toLongText"
                    PropertyChanges {target: pageroot;contentX:500}
                },
                State {
                    name: "toContact"
                    PropertyChanges {target: pageroot;contentX:1000}
                },
                State {
                    name: "toCalender"
                    PropertyChanges {target: pageroot;contentX:1500}
                }
            ]

            transitions:
                Transition {
                        id:theTransition

                     NumberAnimation { properties: "contentX"; duration: 200 }

                }
        }

        Rectangle{
            id:base
            width:root.width
            height: 50
            anchors.top: root.top
            anchors.topMargin: 20
            color:"lightgreen"
            property alias curIndex: list.currentIndex
            ListView{
                id:list
                model: theModel
                anchors.fill: parent
                delegate: component1
                spacing: 5
                focus: true
                orientation: ListView.Horizontal
                highlight: Rectangle {

                    color: 'lightblue'
                }
                highlightMoveDuration: 100
//                onCurrentItemChanged: {
////                    pageroot.contentX=theModel.get(currentIndex).url
////                    list.currentIndex=index
//                }

            }
            ListModel{
                id:theModel
                ListElement{text1:"ComboBox";url:0}//"ComboBox.qml"}
                ListElement{text1:"LongText";url:500}//"LongText.qml"}
                ListElement{text1:"Contact";url:1000}//"Contact.qml"}
                ListElement{text1:"Calendar";url:1500}//"Calendar.qml"}


            }
            Component{
                id:component1

                Item{
                    width:base.width/4
                    height: base.height
                    Text {
                        anchors.centerIn:parent
                        id: text_header
                        text: text1
                        font.pixelSize: 25
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            pageroot.contentX=url
                            list.currentIndex=index
                        }
                    }

                }
            }
        }
    }
    Component.onCompleted: {
        pageload1.setSource("ComboBox.qml")
        pageload2.setSource("LongText.qml")
        pageload3.setSource("Contact.qml")
        pageload4.setSource("Calendar.qml")
    }
}
