import 'package:design_system/design_system.dart';
import 'package:design_system/src/style/colors/colors_interface.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData themeGenerator(ColorsInterface colors) => ThemeData(
        primaryColor: colors.kcPrimary,
        primaryColorLight: const Color(0xff9e9e9e),
        brightness: Brightness.light,
        primaryColorDark: Colors.black,
        canvasColor: const Color(0xff303030),
        scaffoldBackgroundColor: colors.kcScafoldBackground,
        bottomAppBarColor: colors.kcCardBackground,
        cardColor: colors.kcCardBackground,
        fontFamily: GoogleFonts.lato().fontFamily,
        dividerColor: colors.kcGrey,
        highlightColor: const Color(0x40cccccc),
        splashColor: const Color(0x40cccccc),
        selectedRowColor: const Color(0xfff5f5f5),
        unselectedWidgetColor: colors.kcLightGrey,
        disabledColor: colors.kcMediumGrey,
        toggleableActiveColor: colors.kcSecondary,
        appBarTheme: AppBarTheme(
          backgroundColor: colors.kcPrimary,
          elevation: 0,
          titleTextStyle: const TextStyle(color: Colors.white),
        ),
        secondaryHeaderColor: colors.kcSecondary,
        backgroundColor: colors.kcScafoldBackground,
        dialogBackgroundColor: colors.kcCardBackground,
        indicatorColor: LightColors().kcBlue,
        hintColor: const Color(0x80ffffff),
        errorColor: colors.kcError,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(colors.kcSecondary),
            shadowColor: MaterialStateProperty.all(colors.kcLightGrey),
            overlayColor: MaterialStateProperty.all(colors.kcLightGrey),
          ),
        ),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
          minWidth: 88,
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black,
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
          alignedDropdown: false,
          buttonColor: colors.kcSecondary,
          disabledColor: const Color(0x61ffffff),
          highlightColor: const Color(0x29ffffff),
          splashColor: const Color(0x1fffffff),
          focusColor: const Color(0x1fffffff),
          hoverColor: const Color(0x0affffff),
          colorScheme: ColorScheme(
            primary: const Color(0xfff37421),
            primaryContainer: Colors.black,
            secondary: const Color.fromRGBO(105, 121, 248, 1),
            secondaryContainer: const Color(0xff00bfa5),
            surface: colors.kcCardBackground,
            background: const Color(0xff616161),
            error: colors.kcError,
            onPrimary: Colors.white,
            onSecondary: Colors.black,
            onSurface: Colors.white,
            onBackground: Colors.white,
            onError: Colors.black,
            brightness: Brightness.light,
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline2: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline3: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline4: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline5: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline6: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle1: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText1: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText2: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          caption: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          button: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle2: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          overline: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        primaryTextTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline2: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline3: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline4: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline5: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          headline6: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle1: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText1: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          bodyText2: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          caption: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          button: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          subtitle2: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          overline: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcTextColor,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcBlack2,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          helperStyle: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcError,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          hintStyle: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcSecondary,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
          ),
          errorStyle: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcError,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          errorMaxLines: null,
          isDense: false,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 20,
          ),
          isCollapsed: false,
          prefixStyle: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcSecondary,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          suffixStyle: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcSecondary,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          counterStyle: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: colors.kcSecondary,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.kcError,
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.kcSecondary,
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.kcSecondary,
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.kcTextFieldBackground,
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.kcSecondary,
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.kcTextFieldBackground,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
          opacity: 1,
          size: 24,
        ),
        primaryIconTheme: const IconThemeData(
          color: Colors.white,
          opacity: 1,
          size: 24,
        ),
        sliderTheme: SliderThemeData(
          valueIndicatorTextStyle: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.white,
          unselectedLabelColor: Color(0xb2ffffff),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: Colors.white,
          brightness: Brightness.dark,
          deleteIconColor: const Color(0xdeffffff),
          disabledColor: const Color(0x0cffffff),
          labelPadding:
              const EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
          labelStyle: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: const Color(0xdeffffff),
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          padding: const EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
          secondaryLabelStyle: TextStyle(
            fontFamily: GoogleFonts.lato().fontFamily,
            color: const Color(0x3dffffff),
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          secondarySelectedColor: colors.kcSecondary,
          selectedColor: const Color(0x3dffffff),
          shape: const StadiumBorder(
              // ignore: unnecessary_const
              side: const BorderSide(
            color: Colors.black,
            width: 0,
            style: BorderStyle.none,
          )),
        ),
        dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black,
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xff4285f4),
          selectionColor: Color(0xffff5722),
          selectionHandleColor: Color(0xffff5722),
        ),
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: const MaterialColor(
          4280361249,
          {
            50: Color(0xfff2f2f2),
            100: Color(0xffe6e6e6),
            200: Color(0xffcccccc),
            300: Color(0xffb3b3b3),
            400: Color(0xff999999),
            500: Color(0xff808080),
            600: Color(0xff666666),
            700: Color(0xff4d4d4d),
            800: Color(0xff333333),
            900: Color(0xff191919)
          },
        )).copyWith(secondary: Colors.white),
      );
}
