import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: 800
    height: 600
    ListModel{
        id:studentMarkModel
        ListElement{idstudent:"1";name:"PHAM TIEN THANH";mark:"100"}
        ListElement{idstudent:"2";name:"NGUYEN THI THU";mark:"100"}
        ListElement{idstudent:"3";name:"NGUYEN VAN MANH";mark:"100"}
        ListElement{idstudent:"4";name:"TRAN VAN TUAN";mark:"100"}
        ListElement{idstudent:"5";name:"CAO VAN MANH";mark:"100"}
        ListElement{idstudent:"6";name:"NGUYEN THI HOAI THU";mark:"100"}
        ListElement{idstudent:"7";name:"VO TRONG DUC";mark:"100"}
        ListElement{idstudent:"8";name:"NGUYEN DUC TUAN";mark:"100"}
        ListElement{idstudent:"9";name:"HO DINH TAN";mark:"100"}
        ListElement{idstudent:"10";name:"LUU THI KIM HUYEN";mark:"100"}
        ListElement{idstudent:"11";name:"VU PHAM MINH HIEN";mark:"100"}
        ListElement{idstudent:"12";name:"TRAN VAN TUAN";mark:"100"}
    }
    Component {
        id: highlightBar
        Rectangle {
            z:2
            color: "#FFFF88"
            opacity: 0.5
        }
    }
    Column{
        spacing: 2
        Rectangle{
            id: rec1
            width: root.width
            height: root.height/5
            radius: 5
            anchors.top: root.top
            anchors.topMargin: 10
            color: "#3498db"
            Text {
                text: "MANAGER LG'S STUDENT MARK"
                font.pointSize: 30
                font.bold: true
                color: "white"
                anchors.centerIn: parent
            }
        }
        Rectangle{
            id: rec2
            width: root.width
            height: root.height-rec1.height
            Row{
                spacing: 2
                ManagerClass{
                    id: rec3
                    width: rec2.width/5
                    height: rec2.height
                    radius: 5
                    color: "#3498db"
                }
                Rectangle{
                    id: rec4
                    width: rec2.width-rec3.width
                    height: rec2.height
                    Column{
                        spacing: 2
                        StudentMark{
                            id: recx
                            width: rec2.width-rec3.width-5
                            height: 50
                            color: "#3498db"
                            idSt: "ID"
                            name: "Name of Student"
                            mark: "Student mark"
                        }

                        Rectangle{
                            id: rec5
                            width: rec2.width-rec3.width-5
                            height: rec2.height*4/5-50-5
                            radius: 5
                            color: "#3498db"
                            ListView{
                                id: listStudentView
                                width: rec2.width-rec3.width-5
                                height: rec2.height*4/5-100
                                anchors.centerIn: parent
                                anchors.fill: parent
                                model: studentMarkModel
                                spacing: 3
                                highlight: highlightBar
                                focus: true
                                delegate: StudentMark{
                                    width: rec2.width-rec3.width
                                    height: 50
                                    idSt: model.idstudent
                                    name: model.name
                                    mark: model.mark
                                    focus:true
                                }
                                onCurrentItemChanged: {
                                }
                            }
                        }
                        AddStudent{
                        }
                    }
                }
            }
        }
    }
}
