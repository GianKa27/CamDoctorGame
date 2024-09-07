import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // variables para cambiar el color de toda la app
  static const Color primaryColor = Colors.indigo;
  static const Color primaryExtendedColor = Color.fromARGB(255, 37, 150, 255);

  static Color primaryColor5 = primaryColor.withOpacity(0.8);
  static Color primaryColor4 = primaryColor.withOpacity(0.6);
  static Color primaryColor3 = primaryColor.withOpacity(0.4);
  static Color primaryColor2 = primaryColor.withOpacity(0.2);
  static Color primaryColor1 = primaryColor.withOpacity(0.1);

  static const Color grayColor = Colors.black12;

  //colors
  static const Color successColor = Color(0xff28c76f);
  static const Color infoColor = Color(0xff00cfe8);
  static const Color secondaryColor = Color(0xff82868b);
  static const Color warningColor = Color(0xffff9f43);
  static const Color dangerColor = Color(0xffea5455);
  static const Color lightColor = Color(0xfff6f6f6);
  static const Color darkColor = Color(0xff4b4b4b);

  //text
  static const Color currentTextColor = Colors.black54;
  static const Color blackTextColor = Colors.white70;

  //background
  static const Color backgroundColorGeneral =
      Color.fromARGB(255, 255, 255, 255);

  static const Color backgroundColorGeneralDark =
      Color.fromARGB(255, 35, 36, 39);

  static const Color inputBackgroundColorDark = Color.fromARGB(255, 40, 46, 63);

/*
 .----------------. .----------------. .----------------. .----------------. .----------------. 
| .--------------. | .--------------. | .--------------. | .--------------. | .--------------. |
| |   _____      | | |     _____    | | |    ______    | | |  ____  ____  | | |  _________   | |
| |  |_   _|     | | |    |_   _|   | | |  .' ___  |   | | | |_   ||   _| | | | |  _   _  |  | |
| |    | |       | | |      | |     | | | / .'   \_|   | | |   | |__| |   | | | |_/ | | \_|  | |
| |    | |   _   | | |      | |     | | | | |    ____  | | |   |  __  |   | | |     | |      | |
| |   _| |__/ |  | | |     _| |_    | | | \ `.___]  _| | | |  _| |  | |_  | | |    _| |_     | |
| |  |________|  | | |    |_____|   | | |  `._____.'   | | | |____||____| | | |   |_____|    | |
| |              | | |              | | |              | | |              | | |              | |
| '--------------' | '--------------' | '--------------' | '--------------' | '--------------' |
 '----------------' '----------------' '----------------' '----------------' '----------------' 
*/

  static final ThemeData light = ThemeData.light().copyWith(
      primaryColor: primaryColor,
      // useMaterial3: true,
      colorScheme: const ColorScheme.light(primary: primaryExtendedColor),
      canvasColor: Colors.transparent,
      shadowColor: Colors.transparent,
      //SCAFFOLD
      scaffoldBackgroundColor: backgroundColorGeneral,
      // primaryIconTheme: const IconThemeData(color: Colors.white),
      // APPBAR
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actionsIconTheme:
            const IconThemeData(color: currentTextColor, size: 30),
        iconTheme: const IconThemeData(color: currentTextColor, size: 30),
        // shape: const RoundedRectangleBorder(
        //   side: BorderSide(color: primaryExtendedColor),
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.elliptical(30, 20),
        //   ),
        // ),
        toolbarTextStyle: GoogleFonts.roboto(
            color: currentTextColor, fontWeight: FontWeight.bold, fontSize: 18),
        titleTextStyle: GoogleFonts.roboto(
            color: currentTextColor, fontWeight: FontWeight.bold, fontSize: 21),
        centerTitle: true,
      ),
      drawerTheme:
          const DrawerThemeData(backgroundColor: backgroundColorGeneral),

      //TEXTOS
      textTheme: GoogleFonts.robotoTextTheme()
          .copyWith(
            //headlines
            displayLarge: const TextStyle(
                color: currentTextColor,
                fontSize: 60,
                fontWeight: FontWeight.bold),
            displayMedium: const TextStyle(
                color: currentTextColor,
                fontSize: 50,
                fontWeight: FontWeight.w900),
            displaySmall: const TextStyle(
                color: currentTextColor,
                fontSize: 40,
                fontWeight: FontWeight.w800),
            headlineMedium: const TextStyle(
                color: currentTextColor,
                fontSize: 30,
                fontWeight: FontWeight.w700),
            headlineSmall: const TextStyle(
              color: currentTextColor,
              fontSize: 20,
            ),
            titleLarge: const TextStyle(
              color: currentTextColor,
              fontSize: 10,
            ),
            //normal texts
            bodySmall: const TextStyle(color: currentTextColor),
          )
          .apply(bodyColor: currentTextColor),

      //INPUT
      inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          fillColor: Colors.white,
          filled: true,
          hoverColor: primaryColor,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.dangerColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: OutlineInputBorder(
              // activar borders cambiar width
              borderSide: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          labelStyle: TextStyle(fontSize: 15),
          focusColor: primaryColor),
      //CHECKBOX
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      //CARGANDO
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppTheme.primaryColor,
          linearMinHeight: 40,
          linearTrackColor: AppTheme.primaryColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          selectedIconTheme: IconThemeData(size: 30, shadows: [
            Shadow(blurRadius: 10, color: primaryColor.withOpacity(0.8))
          ])),
      //CARD
      cardTheme: const CardTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          surfaceTintColor: Colors.white,
          elevation: 0.2,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
      //BOTONS
      //FLOATING ACTION BUTTON
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        extendedTextStyle:
            TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
      ),
      iconTheme: const IconThemeData(color: currentTextColor),
      //ELEVATED BUTTON
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith(
            (states) => const TextStyle(color: Colors.white, fontSize: 20)),
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => darkColor),
        padding: MaterialStateProperty.resolveWith(
          (states) => const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        ),
        shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              padding: MaterialStateProperty.resolveWith((states) =>
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
              shape: MaterialStateProperty.resolveWith((states) =>
                  const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              side: MaterialStateProperty.resolveWith((states) =>
                  const BorderSide(color: Colors.white, width: 2)))),
      // DIALOG
      dialogTheme: const DialogTheme(
        backgroundColor: AppTheme.backgroundColorGeneral,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      // DATE PICKER
      timePickerTheme: const TimePickerThemeData(),
      // MODAL BOTTOM SHEET
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: backgroundColorGeneral,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.white,
        labelPadding: EdgeInsets.symmetric(horizontal: 10),
        labelStyle: TextStyle(fontSize: 20),
      ),
      dividerTheme: const DividerThemeData(color: currentTextColor));
}
