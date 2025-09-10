import 'package:flutter/material.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

enum IconType { like, bookmark, watch }

class TDeviceUtility {
  TDeviceUtility._(); // приватный конструктор, чтобы нельзя было создать объект

  // ------------------- Размеры экрана -------------------
  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  // ------------------- Ориентация экрана -------------------
  static bool isPortrait(BuildContext context) => MediaQuery.of(context).orientation == Orientation.portrait;
  static bool isLandscape(BuildContext context) => MediaQuery.of(context).orientation == Orientation.landscape;

  // ------------------- Платформа -------------------
  static bool isAndroid() => Platform.isAndroid;
  static bool isIOS() => Platform.isIOS;

  // ------------------- Адаптивные размеры шрифта -------------------
  static double responsiveFont(BuildContext context, double fontSize) {
    return fontSize * MediaQuery.of(context).textScaleFactor;
  }

  // ------------------- Размер экрана -------------------
  static bool isSmallScreen(BuildContext context) => screenWidth(context) < 360;
  static bool isMediumScreen(BuildContext context) => screenWidth(context) >= 360 && screenWidth(context) < 720;
  static bool isLargeScreen(BuildContext context) => screenWidth(context) >= 720;

  // ------------------- Карточки фильмов -------------------
  static double movieCardWidth(BuildContext context) {
    if (isSmallScreen(context)) return 120;
    if (isMediumScreen(context)) return 160;
    return 200;
  }

  static double movieCardHeight(BuildContext context) {
    if (isSmallScreen(context)) return 180;
    if (isMediumScreen(context)) return 240;
    return 300;
  }

  // ------------------- Универсальные размеры иконок и кнопок -------------------
  static double iconSize(BuildContext context, IconType type) {
    switch (type) {
      case IconType.like:
        if (isSmallScreen(context)) return 20;
        if (isMediumScreen(context)) return 25;
        return 30;
      case IconType.bookmark:
        if (isSmallScreen(context)) return 18;
        if (isMediumScreen(context)) return 22;
        return 28;
      case IconType.watch:
        if (isSmallScreen(context)) return 30;
        if (isMediumScreen(context)) return 40;
        return 50;
    }
  }

  static double watchButtonHeight(BuildContext context) {
    if (isSmallScreen(context)) return 40;
    if (isMediumScreen(context)) return 50;
    return 60;
  }

  // ------------------- URL / Внешние ссылки -------------------
  static Future<void> launchUrlString(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Не удалось открыть ссылку: $url';
    }
  }

  // ------------------- Цвета -------------------
  static Color colorWithOpacity(Color color, double opacity) {
    return color.withValues(alpha: opacity);
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }
}
