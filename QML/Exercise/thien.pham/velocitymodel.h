
#ifndef VELOCITYMODEL_H
#define VELOCITYMODEL_H

#include "QString"
#include <QAbstractListModel>
#include <QDebug>

class VeloElement
{
public:
    VeloElement(const QString &name, const QString &velo);

    QString name() const;
    QString velo() const;

private:
    QString m_name;
    QString m_velo;
};
//=================================
class VelocityModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum VeloRole {
        NameRole = Qt::UserRole + 1,
        VeloCRole
    };
    explicit VelocityModel(QObject *parent = 0);
    virtual ~VelocityModel();
    Q_INVOKABLE void loadModel();

public:
    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    virtual QHash<int, QByteArray> roleNames() const override;
private:
    QList<VeloElement> m_data;
    QHash<int, QByteArray> m_roleNames;
public:
    void addVelo(const VeloElement &f);
    int getMaximumElement();
    void setName(QString n) { name = n; }
    void setVelo(int vl) { velo = vl; }
private:
    QString name;
    int velo;
    QVariant m_modelVeloData;
};

#endif // VELOCITYMODEL_H
