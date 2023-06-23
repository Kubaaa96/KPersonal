#include <qtest.h>


class ExampleQtTest : public QObject {
    Q_OBJECT
private slots:
    void toUpper() {
        // Given & When
        QString str = "Hello";
        
        // Then
        QCOMPARE(str.toUpper(), QString("HELLO"));
    }

    void toLower() {
        // Given & When
        QString str = "HELLO";

        // Then
        QCOMPARE(str.toLower(), QString("hello"));
    }
};

QTEST_MAIN(ExampleQtTest)
#include "ExampleQtTest.moc"
