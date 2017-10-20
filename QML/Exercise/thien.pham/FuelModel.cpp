#include <QQuickView>
#include <QQmlContext>
#include <QTextStream>
#include "FuelModel.h"

FuelElement::FuelElement()
{

}

FuelElement::FuelElement(const QString &n, const QString &t)
    : m_name(n), m_type(t)
{
}

QString FuelElement::name() const
{
    return m_name;
}

QString FuelElement::type() const
{
    return m_type;
}
//===========================================
FuelModel::FuelModel(QObject *parent)
    : QAbstractListModel(parent)
{
    // initialize our data (QList<QString>) with a list of color names
    m_roleNames[NameRole] = "name";
    m_roleNames[TypeRole] = "type";
}

FuelModel::~FuelModel()
{
}

int FuelModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    // return our data count
    return m_data.count();
}

QHash<int, QByteArray> FuelModel::roleNames() const
{
    return m_roleNames;
}

void FuelModel::addFuel(const FuelElement &f)
{
    beginInsertRows(QModelIndex(), rowCount(QModelIndex()), rowCount(QModelIndex()));
    m_data.append(f);
    endInsertRows();
}

QVariant FuelModel::data(const QModelIndex &index, int role) const
{
    // the index returns the requested row and column information.
    // we ignore the column and only use the row information
    int row = index.row();

    // boundary check for the row
    if(row < 0 || row >= m_data.count()) {
        return QVariant();
    }

    // A model can return data for different roles.
    // The default role is the display role.
    // it can be accesses in QML with "model.display"
    FuelElement s = m_data.at(row);
    switch(role) {
    case NameRole:
        // Return the color name for the particular row
        // Qt automatically converts it to the QVariant type
        return s.name();
    case TypeRole:
        // Return the color name for the particular row
        // Qt automatically converts it to the QVariant type
        return s.type();
    default:
        return QVariant();
    }

    // The view asked for other data, just return an empty QVariant
    return QVariant();
}

int FuelModel::getMaximumElement()
{
    int max = 0;
    for (int i = 0; i < m_data.size(); i++) {
        FuelElement e = m_data.at(i);
        int fuel = e.type().toInt();
        max = max >= fuel ? max : fuel;
    }
    return max;
}

void FuelModel::loadFuelModel()
{
    m_data.clear();
    QFile inputFile("D:\\DevQt\\build-QtQuick1-Desktop_Qt_5_7_1_MinGW_32bit-Debug\\debug\\Fuel.txt");
    if (inputFile.open(QIODevice::ReadOnly)) {
        QTextStream in(&inputFile);
        while (!in.atEnd())
        {
            QString line = in.readLine();
            QStringList fields = line.split(";");
            FuelElement elem(fields.at(0), fields.at(1));
            qDebug( "line: %s, %d", line.toStdString().c_str(), fields.size());
            addFuel(elem);
        }
        inputFile.close();
    }
    else {
        qDebug( "dek doc dc");
    }
}
