
#include <QQuickView>
#include <QQmlContext>
#include <QTextStream>
#include "velocitymodel.h"

VeloElement::VeloElement(const QString &name, const QString &velo)
{
    m_name = name;
    m_velo = velo;
}

QString VeloElement::name() const
{
    return m_name;
}

QString VeloElement::velo() const
{
    return m_velo;
}
//====================================

VelocityModel::VelocityModel(QObject *parent)
{
    Q_UNUSED(parent);
    // initialize our data (QList<QString>) with a list of color names
    m_roleNames[NameRole] = "name";
    m_roleNames[VeloCRole] = "velo";
}

VelocityModel::~VelocityModel()
{

}

int VelocityModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    // return our data count
    return m_data.count();
}

QVariant VelocityModel::data(const QModelIndex &index, int role) const
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
    VeloElement s = m_data.at(row);
    switch(role) {
    case NameRole:
        // Return the color name for the particular row
        // Qt automatically converts it to the QVariant type
        return s.name();
    case VeloCRole:
        // Return the color name for the particular row
        // Qt automatically converts it to the QVariant type
        return s.velo();
    default:
        return QVariant();
    }

    // The view asked for other data, just return an empty QVariant
    return QVariant();
}

QHash<int, QByteArray> VelocityModel::roleNames() const
{
    return m_roleNames;
}

void VelocityModel::addVelo(const VeloElement &f)
{
    beginInsertRows(QModelIndex(), rowCount(QModelIndex()), rowCount(QModelIndex()));
    m_data.append(f);
    endInsertRows();
}

int VelocityModel::getMaximumElement()
{
    int max = 0;
    for (int i = 0; i < m_data.size(); i++) {
        VeloElement e = m_data.at(i);
        int velo = e.velo().toInt();
        max = max >= velo ? max : velo;
    }
    return max;
}

void VelocityModel::loadModel()
{
    m_data.clear();
    QFile inputFile("D:\\DevQt\\build-QtQuick1-Desktop_Qt_5_7_1_MinGW_32bit-Debug\\debug\\Velocity.txt");
    if (inputFile.open(QIODevice::ReadOnly)) {
        QTextStream in(&inputFile);
        while (!in.atEnd())
        {
            QString line = in.readLine();
            QStringList fields = line.split(";");
            VeloElement elem(fields.at(0), fields.at(1));
            qDebug( "line: %s, %d", line.toStdString().c_str(), fields.size());
            addVelo(elem);
        }
        inputFile.close();
    }
    else {
        qDebug( "dek doc dc");
    }
}
