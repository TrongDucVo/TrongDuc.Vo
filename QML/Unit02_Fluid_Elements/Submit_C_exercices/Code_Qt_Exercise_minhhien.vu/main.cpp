#include <QtCore/QCoreApplication>
#include <QTextStream>
#include <QList>
#include <QString>
#include <QFile>
#include <QVector>


void exe1();

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    exe1();

    return a.exec();
}

void exe1()
{
    QTextStream out(stdout);     // output consol
    out << "" << endl;

    // QString
    QString first = "Minh";
    QString last = "Hien";
    QString fullName = first + "." + last;
    QString fullName2 = QString("%1.%2").arg(first).arg(last);

    QString numbers = "1,2,54,23,7 ";
    QStringList nums = numbers.split(',');
    int sum = 0;
    foreach(QString num, nums)
    {
        sum += num.toInt();
    }

    QString name = "   Minh Hien\n";
    QString strimmedName = name.trimmed();

    // QFile
    QString fileName = "c:/Users/minhhien.vu/Documents/Task2/Exercise_fileInput.txt";
    QFile file(fileName);
    QTextStream in(&file);

    if (!file.open(QIODevice::ReadOnly)) {
        qWarning("Cannot open file for reading");
        return;
    }

    QString line = in.readAll();

    QMap<int, QVector<QString>> map;
    QMap<int, QVector<QString>>::iterator it;
    QMap<int, QVector<QString>>::iterator it1;

    QStringList strList = line.split(',');
    foreach(QString str, strList)
    {
        QStringList lst = str.split(':');
        it = map.find(lst[0].toInt());
        if (it == map.end())
        {
            QVector<QString> vect;
            vect.push_back(lst[1]);
            map.insert(lst[0].toInt(), vect);
        }
        else
        {
            it.value().push_back(lst[1]);
        }
    }

    for (it = map.begin(); it != map.end(); it++)
    {
        out << it.key() << "s print ";
        foreach (QString str, it.value())
        {
            out << str << ", ";
        }

        for (it1 = map.begin(); it1 != it; it1++)
        {
            if (it.key() % it1.key() == 0)
            {
                foreach(QString val, it1.value())
                {
                    out << val << ", ";
                }
            }
        }


        out << endl;
    }

    file.close();

    QList<QString> qList;
    qList << "" << "";
    qList.append("");
    qList.push_back("");

    QList<QString> list2 = qList;

    foreach(const QString &str, list2)
    {
        out << str;
    }

    out << endl;

    for (int i = 0; i < qList.size(); i++)
    {
        out << qList[i];
    }

}
