#include "theme.h"

Theme::Theme(QObject *parent) : QObject(parent)
{
    m_attackerColor = "#F5310C";
    m_defenderColor = "#1861F5";

    m_orangeAccent = "#F56E00";
    m_turquoAccent = "#18F59B";
    m_yellowAccent = "#F5AD0C";
}


const QColor &Theme::attackerColor() const
{
    return m_attackerColor;
}

void Theme::setAttackerColor(const QColor &newAttackerColor)
{
    if (m_attackerColor == newAttackerColor)
        return;
    m_attackerColor = newAttackerColor;
    emit attackerColorChanged();
}

const QColor &Theme::defenderColor() const
{
    return m_defenderColor;
}

void Theme::setDefenderColor(const QColor &newDefenderColor)
{
    if (m_defenderColor == newDefenderColor)
        return;
    m_defenderColor = newDefenderColor;
    emit defenderColorChanged();
}

const QColor &Theme::orangeAccent() const
{
    return m_orangeAccent;
}

void Theme::setOrangeAccent(const QColor &newOrangeAccent)
{
    if (m_orangeAccent == newOrangeAccent)
        return;
    m_orangeAccent = newOrangeAccent;
    emit orangeAccentChanged();
}

const QColor &Theme::turquoAccent() const
{
    return m_turquoAccent;
}

void Theme::setTurquoAccent(const QColor &newTurquoAccent)
{
    if (m_turquoAccent == newTurquoAccent)
        return;
    m_turquoAccent = newTurquoAccent;
    emit turquoAccentChanged();
}

const QColor &Theme::yellowAccent() const
{
    return m_yellowAccent;
}

void Theme::setYellowAccent(const QColor &newYellowAccent)
{
    if (m_yellowAccent == newYellowAccent)
        return;
    m_yellowAccent = newYellowAccent;
    emit yellowAccentChanged();
}
