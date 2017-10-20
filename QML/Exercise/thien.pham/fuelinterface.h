
#ifndef FUELINTERFACE_H
#define FUELINTERFACE_H

#include <QObject>
#include <QQuickView>
#include <QQuickItem>

class FuelModel;

class FuelInterface : public QObject
{
    Q_OBJECT
public:
    FuelInterface(QQuickView *mView);
    virtual ~FuelInterface();

public:
    Q_INVOKABLE void onLoadFuelModel();

private:
    FuelModel *m_model;
    QQuickView *m_view;
    QObject *m_rootObject;

};

#endif // FUELINTERFACE_H
