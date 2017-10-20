#ifndef FUELELEMENT_H
#define FUELELEMENT_H

#include "QString"
#include <QAbstractListModel>
#include <QDebug>

class FuelElement
{
public:
    FuelElement();
    FuelElement(const QString &name, const QString &type);

    QString name() const;
    QString type() const;

private:
    QString m_name;
    QString m_type;
};

//Q_DECLARE_METATYPE(FuelElement)
//============================
class FuelModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(QVariant modelFuelData READ modelFuelData WRITE setModelFuelData NOTIFY modelFuelDataChanged)
public:
    enum FuelRole {
        NameRole = Qt::UserRole + 1,
        TypeRole
    };
    explicit FuelModel(QObject *parent = 0);
    virtual ~FuelModel();

    Q_INVOKABLE void loadFuelModel();

public:
    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    virtual QHash<int, QByteArray> roleNames() const override;
private:
    QList<FuelElement> m_data;
    QHash<int, QByteArray> m_roleNames;
public:
    QVariant modelFuelData() const
    {
        qDebug() << m_modelFuelData.toList().count();
        qDebug() << m_modelFuelData;
        return m_modelFuelData;
    }

public slots:
    void setModelFuelData(QVariant modelFuelData)
    {
        if (m_modelFuelData == modelFuelData)
            return;

        m_modelFuelData = modelFuelData;
        emit modelFuelDataChanged(modelFuelData);
    }

signals:
    void modelFuelDataChanged(QVariant modelFuelData);
public:
    void addFuel(const FuelElement &f);
    int getMaximumElement();
    void setName(QString n) { name = n; }
    void setPercent(int pc) { percent = pc; }
private:
    QString name;
    int percent;
    QVariant m_modelFuelData;
};

#endif // FUELELEMENT_H
