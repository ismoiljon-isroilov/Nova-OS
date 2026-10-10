#include "systeminfo.h"
#include <QFile>
#include <QTextStream>
#include <QSysInfo>
#include <QHostInfo>
#include <QRegularExpression>
#include <QProcess>
#include <QDir>
SystemInfo::SystemInfo(QObject *p):QObject(p){}
QString SystemInfo::hostname() const { return QHostInfo::localHostName(); }
QString SystemInfo::osName() const { return readOsName(); }
QString SystemInfo::kernel() const { return QSysInfo::kernelType()+" "+QSysInfo::kernelVersion(); }
QString SystemInfo::cpu() const { QFile f("/proc/cpuinfo"); if(!f.open(QIODevice::ReadOnly|QIODevice::Text)) return "Unavailable"; QTextStream s(&f); while(!s.atEnd()){ QString l=s.readLine(); if(l.startsWith("model name")||l.startsWith("Hardware")){ auto i=l.indexOf(':'); if(i>=0) return l.mid(i+1).trimmed(); }} return QSysInfo::currentCpuArchitecture(); }
QString SystemInfo::memory() const { QFile f("/proc/meminfo"); if(!f.open(QIODevice::ReadOnly|QIODevice::Text)) return "Unavailable"; QTextStream s(&f); while(!s.atEnd()){ QString l=s.readLine(); if(l.startsWith("MemTotal:")){ auto m=QRegularExpression("[0-9]+").match(l); if(m.hasMatch()) return QString::number(m.captured().toLongLong()/1024)+" MiB RAM"; }} return "Unavailable"; }
QString SystemInfo::readOsName() const { QFile f("/etc/os-release"); if(!f.open(QIODevice::ReadOnly|QIODevice::Text)) return "Linux"; QTextStream s(&f); while(!s.atEnd()){ QString l=s.readLine(); if(l.startsWith("PRETTY_NAME=")){ QString v=l.mid(12); if(v.startsWith('"')&&v.endsWith('"')) v=v.mid(1,v.size()-2); return v; }} return "Linux"; }

void SystemInfo::launchTerminal(){ if(!QProcess::startDetached("konsole", {})) QProcess::startDetached("x-terminal-emulator", {}); }
void SystemInfo::launchFileManager(){ if(!QProcess::startDetached("dolphin", {})) QProcess::startDetached("xdg-open", {QDir::homePath()}); }
void SystemInfo::launchSystemSettings(){ if(!QProcess::startDetached("systemsettings", {})) QProcess::startDetached("kcmshell6", {}); }
