 import 'package:flutter/material.dart';

import '../HappyExtension/extensionHelper.dart';
import '../HappyExtension/utilWidgets.dart';



 class MyConstants{
  MyConstants._();
  static String appName="TreeDonate";
  //static String appName="RadiantECS_Dev";
  static String appVersion="1.0.4";
  static String appId="com.scutisoft.nammaramnamkadamai";
  static String appPlayStoreUrl="https://play.google.com/store/apps/details?id=com.scutisoft.nammaramnamkadamai";
  static bool isLive=false;
  static bool fromUrl=false;
  static bool hasAppVersionController=false;
  static bool bottomSafeArea=true;
  static const DevelopmentMode developmentMode=DevelopmentMode.traditional;

  static Duration animeDuration = const Duration(milliseconds: 300);
  static Cubic animeCurve=Curves.easeIn;

  static String dbDateFormat="yyyy-MM-dd";
  static String decimalReg=r'^\d+\.?\d{0,3}';
  static int phoneNoLength=10;
  static int zipcodeLength=6;
  static String digitRegEx='[0-9]';
  static String digitDecimalRegEx=r'^\d+\.?\d{0,30}';
  static String alphaSpaceRegEx='[A-Za-z ]';
  static String alphaSpaceRegEx2="/[அ-ஔ]+|[க-னௌ]+|[ァ-ヴー]+|[a-zA-Z ]+|[々〆〤ヶ]+/u";
  static String addressRegEx='[A-Za-z0-9-,_/*+()@. ]';
 }

 String decimalReg=r'^\d+\.?\d{0,2}';

 int phoneNoLength=10;
 int zipcodeLength=6;
 String digitRegEx='[0-9]';
 String alphaSpaceRegEx='[A-Za-z ]';
 String addressRegEx='[A-Za-z0-9-,_/*+()@. ]';
 //String currentDate=DateFormat("dd-MM-yyyy").format(DateTime.now());
 String dbDateFormat="yyyy-MM-dd";

 //var formatCurrency = NumberFormat.currency(locale: 'HI',name: "");


Color yellowColor=Color(0xFF158BCC);
Color bgColor=Color(0xFF4267F6);
Color gridBodyBgColor=Color(0xFFFFFFFF);
Color grey=Color(0xFF787878);
Color lightGrey=Color(0xffF8F8FA);
/* Color addNewTextFieldBorder=Color(0xFFF7F8FA);
 Color addNewTextFieldText=Color(0XFF808080);
const Color addNewTextFieldFocusBorder=Color(0xFF6B6B6B);
 Color disableColor=Color(0xFFe8e8e8);*/
 Color uploadColor=Color(0xFFC7D0D8);
 Color indicatorColor=Color(0xFF1C1C1C);
 Color text1=Color(0xFF464646);
 Color text2=Color(0xFFFFFFFF);
 Color grey2=Color(0xFFEBEBEB);
 Color trackColor=Color(0xffEFBD55);
 Color trackTextColor=Color(0xffACACAC);
 Color borderColor=Color(0xffE7E7E7);

 Border gridBottomborder= Border(bottom: BorderSide(color: addNewTextFieldBorder.withOpacity(0.5)));
 TextStyle bgColorTS14=TextStyle(fontFamily: 'RR',color: bgColor,fontSize: 14);
 TextStyle gridHeaderTS=TextStyle(fontFamily: 'RM',color: grey,fontSize: 16);
 TextStyle gridTextColor14=TextStyle(fontFamily: 'RR',color: grey,fontSize: 14);
 TextStyle gridTextColor15=TextStyle(fontFamily: 'RR',color:Colors.black,fontSize: 14);
 TextStyle TSWhite166=TextStyle(fontFamily: 'RR',fontSize: 16,color: Colors.white,letterSpacing: 0.1);
 TextStyle hintText=TextStyle(fontFamily: 'RR',fontSize: 16,color: grey.withOpacity(0.5));
 TextStyle whiteRM20=TextStyle(fontFamily: 'RM',color: Colors.white,fontSize: 20);


 late String prefEmail;
 late String prefPassword;



 const kPrimaryColor = Color(0xFFFF7643);
 const kTextColor = Color(0xFF757575);

 final headingStyle = TextStyle(
  fontSize:28,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
 );

 final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
 );

 OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: kTextColor),
  );
 }
 //rawScrollBar Properties
  const Color srollBarColor=Colors.grey;
  const double scrollBarRadius=5.0;
  const double scrollBarThickness=4.0;


 double attWidth=10;
 double textFieldBR=10;

 Duration animeDuration=Duration(milliseconds: 300);
 Cubic animeCurve=Curves.easeIn;

 const int BOTTOMSHEET_DELAY=800;
double topPadding=0.0;
