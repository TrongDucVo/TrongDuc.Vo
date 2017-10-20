import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
Window {
    visible: true
    width: 1600
    height: 700
    Student{
        identity1:"Student ID"
        name1: "Name"
        math1: "Math"
        literature1: "Literature"
        english1: "English"
        anchors.top: parent.top
    }
    ListModel{
        id: datamodel
        ListElement {identity:"0001"; name: "John"; math: "10"; literature: "7"; english: "7"}
        ListElement {identity:"0010"; name: "Smith"; math: "9"; literature: "8"; english: "10"}
        ListElement {identity:"0011"; name: "Sam"; math: "8"; literature: "9"; english: "9"}
        ListElement {identity:"0100"; name: "Julie"; math: "7"; literature: "10"; english: "8"}

    }
    ListView{
        id: listview
        model: datamodel
        y: 33
        height: 400
        width: parent.width
        spacing: 3
        delegate: StudentList{
            width: parent.width
            height: 30
            onSignal_remove: {
                datamodel.remove(index)
            }
        }
    }

    Rectangle{
        id: addnew
        width: parent.width
        height: 63
        anchors.bottom: parent.bottom
        color: "white"
        Student{
            identity1: "Student ID"
            name1: "Name"
            math1: "Math"
            literature1: "Literature"
            english1: "English"
            anchors.top: parent.top
        }
        StudentInput{
            id: newstudent
            anchors.bottom: parent.bottom
        }

        Button{
            id: addbtn
            width: 90
            height: 30
            anchors.left: newstudent.right
            anchors.bottom: parent.bottom
            text: "Add new student"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    datamodel.append({  identity: newstudent.identity2,
                                         name:newstudent.name2,
                                         math:newstudent.math2,
                                         literature:newstudent.literature2,
                                         english:newstudent.english2})
                    newstudent.identity2= ""
                    newstudent.name2 = ""
                    newstudent.math2 = ""
                    newstudent.literature2 = ""
                    newstudent.english2 = ""
                    //console.log(datamodel)
                }
            }
        }
    }
}
