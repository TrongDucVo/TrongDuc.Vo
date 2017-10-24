import QtQuick 2.0
Rectangle{
    id:root
    width: 300
    height: 200
    //color: "transparent"

    property var date: new Date()
    property var cd: getDay()   // how many days in a month
    property var mth: date.getMonth()+1
    property var year: date.getFullYear()
    signal clickDay

    function getDay(){
        if ((mth===2)&&(year%4==0)&&(year%100!=0)) return 29;
        if ((mth===2)&&(year%4==0)&&(year%100==0)) return 28;
        if ((mth===4)||(mth==6)||(mth==9)||(mth==11)) return 30
        else return 31
    }

    Row{
        spacing: 10
        PathView {
            id: pathDay
            width: 100
            height: 1000
            highlight: appHighlight

            focus: true
            model: cd
            delegate: appDelegateDay
            path: Path{
                startX: 100
                startY: 100
                PathLine{x:100;y:200}
            }
            pathItemCount: 3
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5
        }
        PathView {
            id: pathMonth
            width: 100
            height: 1000
            highlight: appHighlight

            focus: true
            model: monthModel
            delegate: appDelegateMonth
            path: Path{
                startX: 100
                startY: 100
                PathLine{x:100;y:200}
            }
            pathItemCount: 3
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5
        }
        PathView {
            id: pathYear
            width: 100
            height: 1000
            highlight: appHighlight

            focus: true
            model: 200
            delegate: appDelegateYear
            path: Path{
                startX: 100
                startY: 100
                PathLine{x:100;y:200}
            }
            pathItemCount: 3
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5
        }
    }
    Component{
        id: appDelegateDay

        Item{
            width: 100
            height: 30
            visible: PathView.onPath
            Text{
                font.pointSize: 15
                text: (index+1)
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {

                }
            }
        }
    }
    Component{
        id: appDelegateMonth
        Item{
            width: 100
            height: 30
            visible: PathView.onPath
            Text{
                font.pointSize: 15
                text: name
            }
        }
    }
    Component{
        id: appDelegateYear
        Item{
            width: 100
            height: 30
            visible: PathView.onPath
            Text{
                font.pointSize: 15
                text: (index+1950)
            }
        }
    }
    Component{
        id: appHighlight
        Rectangle{
            width: 100
            height: 30
            color: "lightsteelblue"
        }
    }
    //

    //month
    ListModel{
        id: monthModel
        ListElement{name:"January"}
        ListElement{name:"February"}
        ListElement{name:"March"}
        ListElement{name:"April"}
        ListElement{name:"May"}
        ListElement{name:"June"}
        ListElement{name:"July"}
        ListElement{name:"August"}
        ListElement{name:"September"}
        ListElement{name:"October"}
        ListElement{name:"November"}
        ListElement{name:"December"}
    }
}


