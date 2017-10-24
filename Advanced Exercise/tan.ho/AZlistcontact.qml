import QtQuick 2.0

Rectangle {
    visible: true
    width: 400
    height: 540

    Rectangle{
        id: screen
        width: parent.width
        height: parent.height
        ListView {
            id: listview
            height: parent.height
            width: parent.width
            clip:true
            section.property: "alpha"
            section.delegate: sectionDelegate
            model: listModel
            delegate: humanDelegate

        }

        Component {
            id: humanDelegate
            Item{
                width: 400
                height: 20
                Text {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 8
                    text: model.name

                }
            }
        }

        Component {
            id: sectionDelegate
            Rectangle {
                width: 400
                height: 20
                color: "lightsteelblue"
                Text {
                    id: sectionTxt
                    text: section
                }
            }
        }
    }
    Column{
        width: 30
        height: parent.height
        anchors.right: parent.right
        Repeater{
            model : ['A','B','C','D',  'E','F', 'G','H', 'K', 'L', 'M', 'N', 'P', 'Q', 'T', 'S', 'X', 'Y', 'Z']
            //      ['0','5','9','12','17','0','18','25','28','0','35','0','0','0','0','0','0','35','0']
            Rectangle{
                id: rectmodel
                width: 30
                height: 20
                color: "transparent"
                radius: 5
                Text {
                    anchors.centerIn: parent
                    font.pointSize: 12
                    text: modelData
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        var pos = ['0','5','9','12','17','0','18','25','28','0','35','0','0','0','0','0','0','35','0'] // position of alpha
                        listview.positionViewAtIndex(pos[index],ListView.Beginning)

                        console.log(index+" "+pos[index])
                    }
                    onEntered: {
                        rectmodel.color = "#3498db"
                        console.log("entered")
                    }
                    onExited: {
                         rectmodel.color = "transparent"
                    }
                }
            }
        }
    }

    ListModel{
        id: listModel
        ListElement{name:"Tran Van A" ; alpha:"A"}
        ListElement{name:"Nguyen Van An" ; alpha:"A"}
        ListElement{name:"Hoang Duc Anh" ; alpha:"A"}
        ListElement{name:"Tran Trong Anh" ; alpha:"A"}
        ListElement{name:"Tran Duc Anh" ; alpha:"A"}
        ListElement{name:"Hoang Ngoc Bao" ; alpha:"B"}
        ListElement{name:"Ho Van Ban" ; alpha:"B"}
        ListElement{name:"Nguyen Ha Ba" ; alpha:"B"}
        ListElement{name:"Cao Thi Bai" ; alpha:"B"}
        ListElement{name:"Nguyen Quoc Cuong" ; alpha:"C"}
        ListElement{name:"Ho Van Cuong" ; alpha:"C"}
        ListElement{name:"Tran Van Cuong" ; alpha:"C"}
        ListElement{name:"Hoang Ngoc Duc" ; alpha:"D"}
        ListElement{name:"Nguyen Dam Duc" ; alpha:"D"}
        ListElement{name:"Ngo Van Dong" ; alpha:"D"}
        ListElement{name:"Nguyen Van Do" ; alpha:"D"}
        ListElement{name:"Ho Van Doi" ; alpha:"D"}
        ListElement{name:"Nguyen Van Tai Em" ; alpha:"E"}
        ListElement{name:"Tran Thi Giang" ; alpha:"G"}
        ListElement{name:"Nguyen Thanh Giong" ; alpha:"G"}
        ListElement{name:"Ho Ngoc Hoang" ; alpha:"H"}
        ListElement{name:"Tran Van Hoang" ; alpha:"H"}
        ListElement{name:"Nong Van Hy" ; alpha:"H"}
        ListElement{name:"Tran Duc Ho" ; alpha:"H"}
        ListElement{name:"Luu Van Hoai" ; alpha:"H"}
        ListElement{name:"Hoang Trong Ha" ; alpha:"H"}
        ListElement{name:"Lo Van Kim" ; alpha:"K"}
        ListElement{name:"No Thi Kieu" ; alpha:"K"}
        ListElement{name:"Toure Koulou" ; alpha:"K"}
        ListElement{name:"Lionel Messi" ; alpha:"M"}
        ListElement{name:"Lionel Jr Messi " ; alpha:"M"}
        ListElement{name:"Lionel F Messi" ; alpha:"M"}
        ListElement{name:"Lionel Phan Van Messi" ; alpha:"M"}
        ListElement{name:"Ho Thi Yen" ; alpha:"Y"}
        ListElement{name:"Ho Thi Yen" ; alpha:"Y"}
        ListElement{name:"Ho Thi Yen" ; alpha:"Y"}
        ListElement{name:"Ho Thi Yen" ; alpha:"Y"}
        ListElement{name:"Ho Thi Yen" ; alpha:"Y"}
    }




}
