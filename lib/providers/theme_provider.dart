import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const themeKey = "theme";

class ThemeProvider with ChangeNotifier {
  bool _isLightTheme = true;

  AppColors _colors = _ColorsLight();

  AppColors get colors => _colors;

  ThemeProvider() {
    loadTheme();
  }

  static ThemeProvider of(BuildContext context, {bool listen = false}) {
    return Provider.of<ThemeProvider>(context, listen: listen);
  }

  void changeTheme(bool isLightTheme) async {
    _isLightTheme = isLightTheme;
    _colors = _isLightTheme ? _ColorsLight() : _ColorsDark();

    var pref = await SharedPreferences.getInstance();
    pref.setBool(themeKey, _isLightTheme);
    notifyListeners();
  }

  void loadTheme() async {
    var pref = await SharedPreferences.getInstance();

    _isLightTheme = pref.getBool(themeKey) ?? true;
    _colors = _isLightTheme ? _ColorsLight() : _ColorsDark();

    notifyListeners();
  }
}

const Map<TargetPlatform, PageTransitionsBuilder> _defaultBuilders =
<TargetPlatform, PageTransitionsBuilder>{
  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
};

/// **************** ABSTRACT AppColors *********************** ///

abstract class AppColors {
  ThemeData get themeData;

  Color get chatCardBackgroundColor;

  /// Theme-wise common colors goes here
  Color get unreadNotificationIconColor => const Color(0xFFC53131);
}

/// **************** LIGHT THEME *********************** ///

class _ColorsLight extends AppColors {
  @override
  ThemeData get themeData => ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Color(0xff4692CE),
      selectionColor: Color(0xff4692CE),
      selectionHandleColor: Color(0xff4692CE),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0xff1B1B1B),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      headline4: TextStyle(
        color: Color(0xff1B1B1B),
        fontSize: 14,
      ),
      headline3: TextStyle(
        color: Color(0xff4692CE),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Color(0xffDAE4ED)),
        backgroundColor: MaterialStateProperty.all(Color(0xffCBE8FE)),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.lightBlue,
      foregroundColor: Color(0xff022350),
      shadowColor: Colors.transparent,
    ),
    canvasColor: Color(0xffECF0F3),
    primaryColor: Color(0xff022350),
    cardColor: Colors.white,
    highlightColor: Color(0xffF5F5F5),
    dialogBackgroundColor: Color(0xffFFFFFF),
    backgroundColor: Color(0xff333333),
    colorScheme: ColorScheme.light(secondary: Color(0xff4692CE)),
    pageTransitionsTheme: PageTransitionsTheme(builders: _defaultBuilders),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFFFFFFFF),
      unselectedItemColor: Color(0xFFE1ECF5),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Color(0xff4692CE),
    ),
  );

  @override
  Color get chatCardBackgroundColor => Colors.grey;
}

/// **************** DARK THEME *********************** ///

class _ColorsDark extends AppColors {
  @override
  ThemeData get themeData => ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Color(0xff4692CE),
      selectionColor: Color(0xff4692CE),
      selectionHandleColor: Color(0xff4692CE),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      headline4: TextStyle(
        color: Color(0xff4692CE),
        fontSize: 14,
      ),
      headline3: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Color(0xffDAE4ED)),
        backgroundColor: MaterialStateProperty.all(Color(0xff424242)),
      ),
    ),
    canvasColor: Colors.black,
    backgroundColor: Color(0xffD0D0D0),
    cardColor: Color(0xff2C2C2C),
    dialogBackgroundColor: Color(0xff424242),
    highlightColor: Color(0xff141414),
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(secondary: Color(0xff4692CE)),
    pageTransitionsTheme: PageTransitionsTheme(builders: _defaultBuilders),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.white,
    ),
  );

  @override
  Color get chatCardBackgroundColor => Colors.white;
}
