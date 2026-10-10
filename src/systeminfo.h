#pragma once
#include <QObject>
#include <QString>
class SystemInfo : public QObject { Q_OBJECT
    Q_PROPERTY(QString hostname READ hostname CONSTANT)
    Q_PROPERTY(QString osName READ osName CONSTANT)
    Q_PROPERTY(QString kernel READ kernel CONSTANT)
    Q_PROPERTY(QString cpu READ cpu CONSTANT)
    Q_PROPERTY(QString memory READ memory CONSTANT)
public: explicit SystemInfo(QObject *parent=nullptr);
    Q_INVOKABLE void launchTerminal(); Q_INVOKABLE void launchFileManager(); Q_INVOKABLE void launchSystemSettings();
    QString hostname() const; QString osName() const; QString kernel() const; QString cpu() const; QString memory() const;
private: QString readOsName() const;
};
