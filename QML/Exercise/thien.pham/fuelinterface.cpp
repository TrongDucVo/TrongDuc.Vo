
#include "fuelinterface.h"
#include <QTextStream>
#include "FuelModel.h"

FuelInterface::FuelInterface(QQuickView *view)
    : m_view(view)
{
    m_model = new FuelModel();
}

FuelInterface::~FuelInterface()
{
    qDebug() << "huy";
    delete m_model;
    m_model = nullptr;
}

void FuelInterface::onLoadFuelModel()
{
    m_model->loadFuelModel();
    m_rootObject = m_view->rootObject()->findChild<QObject*>("FuelInterface");
    if (m_rootObject != nullptr)
    {
        m_rootObject->setProperty("model", QVariant::fromValue(m_model));
        QString text = "Max: ";
        text += QString::number(m_model->getMaximumElement());
        m_rootObject->setProperty("textMaxfuel", text);
    }
}
