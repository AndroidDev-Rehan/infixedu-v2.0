// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline5: GoogleFonts.poppins(
        textStyle: base.headline5.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: Color(0xFF415094),
        ),
      ),
      subtitle1: GoogleFonts.poppins(
        textStyle: base.subtitle1.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xFF415094),
        ),
      ),
      subtitle2: GoogleFonts.poppins(
        textStyle: base.subtitle1.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      headline6: GoogleFonts.poppins(
        textStyle: base.headline6.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xFF415094),
        ),
      ),
      headline4: GoogleFonts.poppins(
        textStyle: base.headline5.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w300,
          color: Color(0xFF727FC8),
        ),
      ),
      headline3: GoogleFonts.poppins(
        textStyle: base.headline5.copyWith(
          fontSize: 22.sp,
          color: Colors.grey,
        ),
      ),
      caption: GoogleFonts.poppins(
        textStyle: base.caption.copyWith(
          color: Color(0xFFCCC5AF),
        ),
      ),
      bodyText2: GoogleFonts.poppins(
        textStyle: base.bodyText2.copyWith(
          color: Color(0xFF807A6B),
        ),
      ),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      //textTheme: Typography().white,
      primaryColor: Colors.indigo,
      //primaryColor: Color(0xff4829b2),
      indicatorColor: Color(0xFF807A6B),
      scaffoldBackgroundColor: Color(0xFFF5F5F5),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: ScreenUtil().setSp(30.0),
      ),
      backgroundColor: Colors.white,
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: Color(0xffce107c),
        unselectedLabelColor: Colors.grey,
      ));
}
