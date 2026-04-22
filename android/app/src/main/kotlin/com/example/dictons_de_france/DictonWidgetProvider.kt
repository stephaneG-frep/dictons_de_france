package com.example.dictons_de_france

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetPlugin

class DictonWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
    ) {
        val widgetData = HomeWidgetPlugin.getData(context)
        for (appWidgetId in appWidgetIds) {
            val text = widgetData.getString(
                "dicton_text",
                "Ouvrez l'application pour charger le dicton du jour",
            ) ?: "Ouvrez l'application"
            val meaning = widgetData.getString("dicton_meaning", "") ?: ""

            val views = RemoteViews(context.packageName, R.layout.dicton_widget).apply {
                setTextViewText(R.id.widget_text, text)
                setTextViewText(R.id.widget_meaning, meaning)
            }
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
