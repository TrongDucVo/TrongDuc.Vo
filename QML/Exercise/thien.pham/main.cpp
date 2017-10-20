
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFile>
#include <QTextStream>
#include <QQuickView>
#include <QQmlContext>
#include "FuelModel.h"
#include "fuelinterface.h"
#include "velocitymodel.h"
#include "velocityinterface.h"

/*
void setQMLObjectProperty(QQuickView &view, const QString objectName, const char *property, QVariant value)
{
    QList<QObject*> _uiObjects = view.findChildren<QObject*>(objectName);
    foreach (QObject* _uiObject, _uiObjects) {
        if (_uiObject) {
            _uiObject->setProperty(property, value);
        }
        else {
            qDebug("I3L::ScreenAdapter:Warning: Cannot find objectId: %s", objectName.toStdString().c_str());
        }
    }
}*/

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<FuelModel>("org.example", 1, 0, "FuelModel");
    qmlRegisterType<VelocityModel>("org.example", 1, 0, "VelocityModel");

    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl("qrc:main.qml"));

    FuelInterface fuelInterface(&view);
    view.rootContext()->setContextProperty("fuelInterface", &fuelInterface);
    fuelInterface.onLoadFuelModel();

    VelocityInterface veloInterface(&view);
    view.rootContext()->setContextProperty("veloInterface", &veloInterface);
    //veloInterface.onLoadVeloModel();

//    QQmlContext* ctxt = view.rootContext();
//    ctxt->setContextProperty("fuelModel", &model);
    view.show();
    return app.exec();
}
