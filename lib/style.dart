import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class TSC {
  static const Color base = Color(0xffEC7E31);
  static const Color baseLigt = Color(0xffFE9D59);
  static const Color baseLigt2 = Color(0xffF78B40);
  // static const TextStyle boldTitle = GoogleFonts.sacramento(fontWeight: FontWeight.w700, fontSize: 20,);
  static TextStyle boldTitle = GoogleFonts.inter(
      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20));


  static TextStyle boldh2 = GoogleFonts.inter(
      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16));


  static TextStyle boldh3 = GoogleFonts.inter(
      textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14));

  static TextStyle boldTitlePhone = GoogleFonts.inter(
      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black));

  static TextStyle boldTitleD = GoogleFonts.inter(
      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black26));
}
