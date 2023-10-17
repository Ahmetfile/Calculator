#ifndef ADCALCULATOR_H
#define ADCALCULATOR_H

#include <QObject>
#include <string>

class AdCalculator : public QObject
{
    Q_OBJECT

    Q_PROPERTY(double firstnumber READ firstnumber WRITE setFirstnumber NOTIFY firstnumberChanged FINAL)
    Q_PROPERTY(double secondnumber READ secondnumber WRITE setSecondnumber NOTIFY secondnumberChanged FINAL)
    Q_PROPERTY(double resultnumber READ resultnumber WRITE setResultnumber NOTIFY resultnumberChanged FINAL)
    Q_PROPERTY(QString firstnumber_string READ firstnumber_string WRITE setFirstnumber_string NOTIFY firstnumber_stringChanged FINAL)
    Q_PROPERTY(QString secondnumber_string READ secondnumber_string WRITE setSecondnumber_string NOTIFY secondnumber_stringChanged FINAL)
    Q_PROPERTY(QString resultnumber_string READ resultnumber_string WRITE setResultnumber_string NOTIFY resultnumber_stringChanged FINAL)
    Q_PROPERTY(QString operationtype READ operationtype WRITE setOperationtype NOTIFY operationtypeChanged FINAL)

public:
    explicit AdCalculator(QObject *parent = nullptr);

    double firstnumber() const;
    void setFirstnumber(double newFirstnumber);

    double secondnumber() const;
    void setSecondnumber(double newSecondnumber);

    double resultnumber() const;
    void setResultnumber(double newResultnumber);

    QString firstnumber_string() const;
    void setFirstnumber_string(const QString &newFirstnumber_string);

    QString secondnumber_string() const;
    void setSecondnumber_string(const QString &newSecondnumber_string);

    QString resultnumber_string() const;
    void setResultnumber_string(const QString &newResultnumber_string);

    QString operationtype() const;
    void setOperationtype(const QString &newOperationtype);


      Q_INVOKABLE QString calculate(QString a, QString b, QString c);

signals:

    void firstnumberChanged();
    void secondnumberChanged();

    void resultnumberChanged();

    void firstnumber_stringChanged();

    void secondnumber_stringChanged();

    void resultnumber_stringChanged();

    void operationtypeChanged();

private:
    double m_firstnumber=0;
    double m_secondnumber=0;
    double m_resultnumber=0;
    QString m_firstnumber_string="0";
    QString m_secondnumber_string="0";
    QString m_resultnumber_string="0";
    QString m_operationtype="0";
};

#endif // ADCALCULATOR_H
