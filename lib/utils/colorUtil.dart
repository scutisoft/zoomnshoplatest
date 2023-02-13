import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorUtil{
  static Color themeWhite=Color(0xffFFFFFF);
  static Color primaryColor=Color(0xffE7476E);
  static Color primaryColor2=Color(0xFFF5CAB6);
  static Color primaryTextColor1=Color(0xFF8C8C8C);
  static Color primaryTextColor2=Color(0xFF383838);
  static Color primaryTextColor3=Color(0xFF717171);
  static Color textFieldBorderColor=Color(0xFFC8C8C8);
  static Color errorTextColor=Color(0xFFF44336);
  static Color rating=Color(0xFFE4BE49);
  static Color grey1=Color(0xFFB9B9B9);
  static Color grey2=Color(0xFF838CA2);
  static Color secondaryBg=Color(0xFFF7F8FA);
  static Color ternaryBg=Color(0xFFEFEFEF);
  static Color red=Colors.red;
  static Color black=Colors.black;
  static TextStyle primaryText=TextStyle(fontFamily: 'RR',fontSize: 14,color: Colors.black,letterSpacing: 0.1);

  static Color text1=const Color(0xff979797);
  static Color text2=const Color(0xff452800);
  static Color text3=const Color(0xff828282);
  static Color text4=const Color(0xffA6A6A6);
  static Color text5=const Color(0xff6E6E6E);

  static Color chkBoxText=const Color(0xff452800);
  static Color disableColor=Color(0xFFe8e8e8);
  static Color avatarBorderColor=Color(0xFFC7D0D8);

  //Animated Search Bar
  static Color asbColor=primaryColor;
  static bool asbBoxShadow=false;
  static bool asbCloseSearchOnSuffixTap=true;
  static Color asbSearchIconColor=themeWhite;
  static Icon getASBSuffix(){
    return const Icon(Icons.clear,color: Colors.white,);
  }

  //rawScrollBar Properties
  static const Color scrollBarColor=Colors.grey;
  static const double scrollBarRadius=5.0;
  static const double scrollBarThickness=4.0;
}