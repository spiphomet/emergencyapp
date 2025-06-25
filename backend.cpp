#include "backend.h"
#include <QVariantMap>
#include <QDateTime>

Backend::Backend(QObject *parent) : QObject(parent) {}

void Backend::refreshData() {
    QVariantList data;

    QVariantMap h1;
    h1["name"] = "Kathmandu Hospital";
    h1["beds"] = 5;
    h1["updated"] = QDateTime::currentDateTime().toString();

    QVariantMap h2;
    h2["name"] = "Lalitpur General";
    h2["beds"] = 0;
    h2["updated"] = QDateTime::currentDateTime().toString();

    data << h1 << h2;

    emit dataUpdated(data);
}
