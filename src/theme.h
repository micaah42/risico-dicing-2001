#ifndef THEME_H
#define THEME_H

#include <QObject>
#include <QColor>
#include <QQmlEngine>


class Theme : public QObject
{
    Q_OBJECT

    // Palette
    Q_PROPERTY(QColor attackerColor READ attackerColor NOTIFY attackerColorChanged)
    Q_PROPERTY(QColor defenderColor READ defenderColor NOTIFY defenderColorChanged)

    Q_PROPERTY(QColor orangeAccent READ orangeAccent NOTIFY orangeAccentChanged)
    Q_PROPERTY(QColor turquoAccent READ turquoAccent NOTIFY turquoAccentChanged)
    Q_PROPERTY(QColor yellowAccent READ yellowAccent NOTIFY yellowAccentChanged)


public:
    explicit Theme(QObject *parent = nullptr);

    const QColor &attackerColor() const;
    void setAttackerColor(const QColor &newAttackerColor);
    const QColor &defenderColor() const;
    void setDefenderColor(const QColor &newDefenderColor);

    const QColor &orangeAccent() const;
    void setOrangeAccent(const QColor &newOrangeAccent);

    const QColor &turquoAccent() const;
    void setTurquoAccent(const QColor &newTurquoAccent);

    const QColor &yellowAccent() const;
    void setYellowAccent(const QColor &newYellowAccent);

signals:
    void attackerColorChanged();
    void defenderColorChanged();
    void orangeAccentChanged();
    void turquoAccentChanged();
    void yellowAccentChanged();

private:
    QColor m_attackerColor;
    QColor m_defenderColor;
    QColor m_orangeAccent;
    QColor m_turquoAccent;
    QColor m_yellowAccent;

};




// ++++ ++++ ++++ ++++ ++++ ++++ ++++ ++++ ++++ ++++ ++++ ++++ ++++ ++++ ++++ ++++
// Define the singleton type provider function (callback).
static QObject *themeSingletonProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    Theme* singletonTheme = new Theme();
    return singletonTheme;
}

#endif // THEME_H
