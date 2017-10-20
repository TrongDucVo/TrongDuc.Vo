import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    id : root
    visible: true
    width:550;height:830
    title:qsTr("Phan mem quan ly diem sinh vien")
    /* Thong tin ve ho ten hoc sinh*/
    ListModel{
        id: input_data
        ListElement{name:"Cao Van Manh";toan:"10";li:"10";hoa:"10";xeploai:"Gioi"}
        ListElement{name:"Tran Hung Anh";toan:"9";li:"10";hoa:"10";xeploai:"Gioi"}
    }
    ListView{
        id:listviewten
        anchors.fill: parent
        model:input_data
        clip:true
        spacing:3
        delegate: ten_delegate
        header : headercomponent
    }
    Component{
        id:headercomponent
        Rectangle {
            id: rec01
            width: parent.width
            height: 80
            color:"#A6ED8E"
            radius: 10
            Text{
                text: "Ket qua hoc tap"
                anchors.centerIn: rec01
                font.pixelSize: 25
            }
        }
    }
    Component{
        id: ten_delegate
        Rectangle{
            id: rec_ten
            width: parent.width
            height: 100
            color:"#8fbaf3"
            radius: 10
            Text{
                id: hoten
                anchors.fill: rec_ten
                text: model.name
                clip:true
                font.pixelSize: 20
            }
            Text{
                id:diem
                anchors.centerIn:  rec_ten
                text:"Toan: "+model.toan+" - "+" Li: "+model.li+" - "+" Hoa: "+model.hoa+" - "+"  Xep loai: "+model.xeploai
                font.pixelSize: 20

            }

        }
    }
    Button{
    id: add_data
    y:560
    text: "Them hoc sinh"
    MouseArea{
        anchors.fill: parent
        onClicked: {

            input_data.append({name: i1.text,toan:i2.text,li:i3.text,hoa:i4.text,xeploai:i5.text})
        }
    }
    }
    Row {
        spacing: 2
        y:620
        Rectangle {
            id: r1
            color: "lightgrey"; width: 100; height: 80
            TextInput{
                id:i1
                focus:true
                anchors.fill: r1
                font.pixelSize: 20
                KeyNavigation.tab:i2

            }

        }
        Rectangle {
            id: r2
            color: "lightgrey"; width: 100; height: 80
            TextInput{
                id:i2
                focus:true
                anchors.fill: r2
                font.pixelSize: 20
                KeyNavigation.tab:i3

            }

        }
        Rectangle {
            id: r3
            color: "lightgrey"; width: 100; height: 80
            TextInput{
                id:i3
                focus:true
                anchors.fill: r3
                font.pixelSize: 20
                KeyNavigation.tab:i4

            }
        }
        Rectangle {
            id: r4
            color: "lightgrey"; width: 100; height: 80
            TextInput{
                id:i4
                focus:true
                anchors.fill: r4
                font.pixelSize: 20
                KeyNavigation.tab:i5

            }

        }
        Rectangle {
            id: r5
            color: "lightgrey"; width: 100; height: 80
            TextInput{
                id:i5
                focus:true
                anchors.fill: r5
                font.pixelSize: 20
                KeyNavigation.tab:add_data

            }

        }

    }
    Text{
    text:"Nhap ten"
    font.pixelSize: 15
    y:600
    }
    Text{
    text:" Diem Toan"
    font.pixelSize: 15
    x: 100;y:600
    }
    Text{
    text:"Diem Li"
    font.pixelSize: 15
    x:200;y:600
    }
    Text{
    text:"Diem Hoa"
    font.pixelSize: 15
    x:300;y:600
    }
    Text{
    text:"Xep loai"
    font.pixelSize: 15
    x:400;y:600
    }
    Button{
    id:del
    y:705
    text:"Xoa hoc sinh"
    MouseArea{
        anchors.fill: parent
        onClicked: {
        input_data.remove(i6.text-1)}
    }
    }
    Rectangle {
        id: r6
        y:750
        color: "lightgrey"; width: 100; height: 80
        TextInput{
            id:i6
            focus:true
            anchors.fill: r6
            font.pixelSize: 20
            KeyNavigation.tab:del

        }

    }
    Text{
    text:"Nhap STT"
    font.pixelSize: 15
    y:730
    }

}
