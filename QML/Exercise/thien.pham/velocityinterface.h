
#ifndef VELOCITYINTERFACE_H
#define VELOCITYINTERFACE_H

#include <QObject>
#include <QQuickView>
#include <QQuickItem>

class VelocityModel;

class VelocityInterface : public QObject
{
    Q_OBJECT
public:
    VelocityInterface(QQuickView *mView);
    virtual ~VelocityInterface();
public:
    Q_INVOKABLE void onLoadVeloModel();
private:
    VelocityModel* m_model;
    QQuickView* m_view;
    QObject* m_rootObject;
};

#endif // VELOCITYINTERFACE_H
