import 'package:demo_tata_insurance/insurance/home.dart';
import 'package:demo_tata_insurance/insurance/nominee.dart';
import 'package:demo_tata_insurance/insurance/plan_addons.dart';
import 'package:demo_tata_insurance/insurance/proposal.dart';
import 'package:demo_tata_insurance/insurance/self.dart';
import 'package:flutter/material.dart';

import 'insurance/login.dart';
import 'insurance/term_selection.dart';
import 'utils/prefs_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final PrefsService _prefsService = PrefsService();
  // @override
  // void initState() {
  //   super.initState();
  //   clearPrefs();
  // }

  Future<void> clearPrefs() async {
    await _prefsService.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: TataLogin(),
      // home: TermSelection(),
      home: HomePage(),

      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        fontFamily: 'openSans',

        // AppBar theme
        // primarySwatch: buildMaterialColor(Color(0xFFF7B61A)),
        primaryColor: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF13a8e1),
          centerTitle: false,
        ),

// Elevated Button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF13a8e1),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            // side: const BorderSide(color: Color.fromRGBO(251, 25, 41, 1)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
        ),

// textformfield
        textButtonTheme: TextButtonThemeData(
          style: ElevatedButton.styleFrom(foregroundColor: Color(0xFF13a8e1)),
        ),

// Text Button
        // textButtonTheme: TextButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //       foregroundColor: Color.fromRGBO(255, 31, 41, 1)),
        // ),

        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF2B62AA),
          foregroundColor: Colors.white,
          elevation: 6,
        ),

// checkbox theme
        unselectedWidgetColor: Colors.white,
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          checkColor: WidgetStateProperty.all(Colors.white),
          fillColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return Color(0xFF2B62AA);
              }
              return null;
            },
          ),
        ),

        // title and subtitle fontSize and color
        listTileTheme: const ListTileThemeData(
          // titleTextStyle: TextStyle(fontSize: 20),
          // subtitleTextStyle: TextStyle(fontSize: 14),
          textColor: Colors.black,
        ),

        // text box outline color
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(10, 18, 10, 18),
          filled: false,
          labelStyle: TextStyle(
            color: Color(0xFFBABABA),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor:
              WidgetStateColor.resolveWith((states) => Color(0xFF13a8e1)),
        ), //
// cursor color
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
        ),
      ),
    );
  }
}
