import QtQuick 2.0
import QtQuick.Controls 1.4

Button{

id: btnname



Text {
  text: model.name
  color: "red"
  font.pointSize: 14
  anchors.centerIn: parent

}

onClicked: {

mainComponent.setSource(model.url)


}



}
