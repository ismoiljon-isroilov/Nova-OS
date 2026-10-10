#include <QtTest>
#include "../src/systeminfo.h"
class SystemInfoTest: public QObject { Q_OBJECT private slots: void hasHost(); void hasKernel(); void hasMemoryOrUnavailable(); };
void SystemInfoTest::hasHost(){ SystemInfo i; QVERIFY(!i.hostname().trimmed().isEmpty()); }
void SystemInfoTest::hasKernel(){ SystemInfo i; QVERIFY(!i.kernel().trimmed().isEmpty()); }
void SystemInfoTest::hasMemoryOrUnavailable(){ SystemInfo i; QVERIFY(!i.memory().trimmed().isEmpty()); }
QTEST_MAIN(SystemInfoTest)
#include "systeminfo_test.moc"
