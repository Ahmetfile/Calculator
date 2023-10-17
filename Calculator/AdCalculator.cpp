#include "AdCalculator.h"
#include <cmath>

AdCalculator::AdCalculator(QObject *parent)
    : QObject{parent}
{

}

double AdCalculator::firstnumber() const
{
    return m_firstnumber;
}

void AdCalculator::setFirstnumber(double newFirstnumber)
{
    if (qFuzzyCompare(m_firstnumber, newFirstnumber))
        return;
    m_firstnumber = newFirstnumber;
    emit firstnumberChanged();
}

double AdCalculator::secondnumber() const
{
    return m_secondnumber;
}

void AdCalculator::setSecondnumber(double newSecondnumber)
{
    if (qFuzzyCompare(m_secondnumber, newSecondnumber))
        return;
    m_secondnumber = newSecondnumber;
    emit secondnumberChanged();
}

double AdCalculator::resultnumber() const
{
    return m_resultnumber;
}

void AdCalculator::setResultnumber(double newResultnumber)
{
    if (qFuzzyCompare(m_resultnumber, newResultnumber))
        return;
    m_resultnumber = newResultnumber;
    emit resultnumberChanged();
}

QString AdCalculator::firstnumber_string() const
{
    return m_firstnumber_string;
}

void AdCalculator::setFirstnumber_string(const QString &newFirstnumber_string)
{
    if (m_firstnumber_string == newFirstnumber_string)
        return;
    m_firstnumber_string = newFirstnumber_string;
    emit firstnumber_stringChanged();
}

QString AdCalculator::secondnumber_string() const
{
    return m_secondnumber_string;
}

void AdCalculator::setSecondnumber_string(const QString &newSecondnumber_string)
{
    if (m_secondnumber_string == newSecondnumber_string)
        return;
    m_secondnumber_string = newSecondnumber_string;
    emit secondnumber_stringChanged();
}

QString AdCalculator::resultnumber_string() const
{
    return m_resultnumber_string;
}

void AdCalculator::setResultnumber_string(const QString &newResultnumber_string)
{
    if (m_resultnumber_string == newResultnumber_string)
        return;
    m_resultnumber_string = newResultnumber_string;
    emit resultnumber_stringChanged();
}

QString AdCalculator::operationtype() const
{
    return m_operationtype;
}

void AdCalculator::setOperationtype(const QString &newOperationtype)
{
    if (m_operationtype == newOperationtype)
        return;
    m_operationtype = newOperationtype;
    emit operationtypeChanged();
}

QString AdCalculator::calculate(QString a, QString b, QString c)
{


    // Untersuche, ob beide Zahlen ein Komma (,) haben und wenn ja, müssen die Kommas in Punkte (.)
    // umgewandelt werden, damit damit gerechnet werden kann.
    int found_a = a.indexOf(',');
    if (found_a != -1) {
        a[found_a] = '.'; // Ersetzt das Komma durch einen Punkt
    }

    // Dasselbe jetzt nochmal für string b.

    int found_b = b.indexOf(',');
    if (found_b != -1) {
        a[found_b] = '.'; // Ersetzt das Komma durch einen Punkt
    }

    // Jetzt müssen string a und b in Zahlen umgewandelt werden, damit sie verrechnet werden können.

    setFirstnumber(a.toDouble());
    setSecondnumber(b.toDouble());


    if(c=='+'){

        m_resultnumber = m_firstnumber+m_secondnumber;

    }
    else if(c=='-'){

        m_resultnumber = m_secondnumber-m_firstnumber;

    }
    else if(c=='*'){

        m_resultnumber = m_firstnumber*m_secondnumber;

    }
    else if(c=='/'){

        m_resultnumber = m_secondnumber/m_firstnumber;


    }
    else if(c=="rep"){

        m_resultnumber = 1/m_firstnumber;
    }
    else if(c=="sq"){

        m_resultnumber = m_firstnumber*m_firstnumber;

    }
    else if(c=="rt"){

        m_resultnumber = sqrt(m_firstnumber);

    }
    else if(c=="per"){

        m_resultnumber = (m_secondnumber/100)*m_firstnumber;

    }


    m_resultnumber_string= QString::number(m_resultnumber);


    // Umwandeln der Punkte zurück in Kommas, falls welche vorlagen.
    int found_res = m_resultnumber_string.indexOf('.');
    if (found_res != -1) {
        resultnumber_string()[found_res] = ',';
    }


    return m_resultnumber_string;

}

