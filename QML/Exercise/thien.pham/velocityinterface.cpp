
#include "velocityinterface.h"
#include <QTextStream>
#include "velocitymodel.h"

VelocityInterface::VelocityInterface(QQuickView *view)
    : m_view(view)
{
    m_model = new VelocityModel();
}

VelocityInterface::~VelocityInterface()
{
    delete m_model;
    m_model = nullptr;
}

void VelocityInterface::onLoadVeloModel()
{
    m_model->loadModel();
    m_rootObject = m_view->rootObject()->findChild<QObject*>("VelocityInterface");
    if (m_rootObject != nullptr) {
        m_rootObject->setProperty("modelll", QVariant::fromValue(m_model));
        QString text = "Max: ";
        text += QString::number(m_model->getMaximumElement());
        m_rootObject->setProperty("textMaxVelo", text);
    }
}
