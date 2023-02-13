
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomnshoplatest/pages/Pofile/ViewProfile.dart';
import 'package:zoomnshoplatest/pages/myOrder/OrderDeliveryDetails.dart';
import 'package:zoomnshoplatest/pages/myOrder/myOrderDetails.dart';

import '../notifier/themeNotifier.dart';
import '../pages/customer/Cartpage.dart';
import '../pages/customer/navHomeScreen.dart';
import '../utils/sizeLocal.dart';

class RPSCustomPainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.7522222,size.height*0.1546392);
    path_0.lineTo(size.width*0.7522222,size.height*0.1546392);
    path_0.cubicTo(size.width*0.6886111,size.height*0.1546392,size.width*0.6563889,size.height*0.3578792,size.width*0.6252778,size.height*0.5537555);
    path_0.cubicTo(size.width*0.5944444,size.height*0.7481591,size.width*0.5625000,size.height*0.9484536,size.width*0.5000000,size.height*0.9484536);
    path_0.cubicTo(size.width*0.4375000,size.height*0.9484536,size.width*0.4055556,size.height*0.7481591,size.width*0.3747222,size.height*0.5537555);
    path_0.cubicTo(size.width*0.3436111,size.height*0.3578792,size.width*0.3113889,size.height*0.1546392,size.width*0.2480556,size.height*0.1546392);
    path_0.lineTo(size.width*0.2480556,size.height*0.1546392);
    path_0.lineTo(size.width*0.0002777778,size.height*0.1546392);
    path_0.lineTo(size.width*0.0002777778,size.height*0.1664212);
    path_0.lineTo(size.width*0.2483333,size.height*0.1664212);
    path_0.lineTo(size.width*0.2483333,size.height*0.1664212);
    path_0.cubicTo(size.width*0.3108333,size.height*0.1664212,size.width*0.3425000,size.height*0.3681885,size.width*0.3733333,size.height*0.5611193);
    path_0.cubicTo(size.width*0.4044444,size.height*0.7569956,size.width*0.4366667,size.height*0.9602356,size.width*0.5002778,size.height*0.9602356);
    path_0.cubicTo(size.width*0.5638889,size.height*0.9602356,size.width*0.5958333,size.height*0.7569956,size.width*0.6272222,size.height*0.5611193);
    path_0.cubicTo(size.width*0.6580556,size.height*0.3667158,size.width*0.6900000,size.height*0.1664212,size.width*0.7525000,size.height*0.1664212);
    path_0.lineTo(size.width*0.7525000,size.height*0.1664212);
    path_0.lineTo(size.width*1.000556,size.height*0.1664212);
    path_0.lineTo(size.width*1.000556,size.height*0.1546392);
    path_0.lineTo(size.width*0.7522222,size.height*0.1546392);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff697B8C).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width*0.6269444,size.height*0.5611193);
    path_1.cubicTo(size.width*0.5958333,size.height*0.7569956,size.width*0.5636111,size.height*0.9602356,size.width*0.5002778,size.height*0.9602356);
    path_1.cubicTo(size.width*0.4366667,size.height*0.9602356,size.width*0.4044444,size.height*0.7569956,size.width*0.3733333,size.height*0.5611193);
    path_1.cubicTo(size.width*0.3425000,size.height*0.3667158,size.width*0.3108333,size.height*0.1664212,size.width*0.2483333,size.height*0.1664212);
    path_1.lineTo(size.width*0.0002777778,size.height*0.1664212);
    path_1.lineTo(size.width*0.0002777778,size.height);
    path_1.lineTo(size.width*1.000278,size.height);
    path_1.lineTo(size.width*1.000278,size.height*0.1664212);
    path_1.lineTo(size.width*0.7522222,size.height*0.1664212);
    path_1.cubicTo(size.width*0.6897222,size.height*0.1664212,size.width*0.6577778,size.height*0.3681885,size.width*0.6269444,size.height*0.5611193);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Color(0xffFFFFFF).withOpacity(1.0);
    canvas.drawPath(path_1,paint_1_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.5982458,size.height*0.07697246);
    path_0.arcToPoint(Offset(size.width*0.5875000,size.height*0.1417205),radius: Radius.elliptical(size.width*0.01075715, size.height*0.06619785),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.lineTo(size.width*0.5875000,size.height*0.2156769);
    path_0.arcToPoint(Offset(size.width*0.5000000,size.height*0.7541385),radius: Radius.elliptical(size.width*0.08750000, size.height*0.5384615),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.4999999,size.height*0.7541385);
    path_0.arcToPoint(Offset(size.width*0.4125000,size.height*0.2156769),radius: Radius.elliptical(size.width*0.08750000, size.height*0.5384615),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.4125000,size.height*0.1415438);
    path_0.arcToPoint(Offset(size.width*0.4017575,size.height*0.07697246),radius: Radius.elliptical(size.width*0.01075538, size.height*0.06618692),rotation: 0 ,largeArc: false,clockwise: false);
    path_0.lineTo(0,size.height*0.07697246);
    path_0.lineTo(0,size.height);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(size.width,size.height*0.07697246);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BottomNavi extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Container(
      width: SizeConfig.screenWidth!-40,
      // height:_keyboardVisible?0:  70,
      margin: EdgeInsets.only(left: 20,right: 20),
      height: 65,
      decoration: BoxDecoration(
          color: Colors.white,
          // color: Color(0xFF787878).withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF787878).withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 25,
              offset: Offset(0, 0), // changes position of shadow
            )
          ]
      ),
      child: Stack(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //   ),
          //   margin:EdgeInsets.only(top: 0),
          //   child: CustomPaint(
          //     size: Size( SizeConfig.screenWidth!, 65),
          //     painter: RPSCustomPainter(),
          //   ),
          // ),
          Container(
            width:  SizeConfig.screenWidth,
            height: 65,
            child: Container(
              alignment: Alignment.center,
              width: SizeConfig.screenHeight!*0.8,
              margin: EdgeInsets.only(left: 30,right: 30,bottom:16 ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerHomeScreen()),);
                    },
                    child: Container(
                      width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffEEF6F9),
                            shape: BoxShape.circle
                        ),
                        child: Icon(Icons.home_filled,color:Color(0xffF67D87),size: 30,))
                  ),
                  GestureDetector(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>MYOrderDetails()),);
                    },
                    child: Icon(Icons.receipt,color:Color(0xff7B869A),size: 30,)
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()),);
                    },
                    child: Icon(Icons.shopping_cart,color:Color(0xff7B869A),size: 30,)
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProfile()),);
                    },
                   child: Icon(Icons.perm_identity_rounded,color:Color(0xff7B869A),size: 30,)
                  ),
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomCenterIcon extends StatelessWidget {
  VoidCallback ontap;
  Widget widget;
  Widget widget2;
  Widget widget3;
  Widget widget4;

  BottomCenterIcon({required this.ontap,required this.widget,required this.widget2,required this.widget3,required this.widget4});
  @override
  Widget build(BuildContext context) {
    return Align(
      //alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap:ontap,
        // child: Container(
        //   width: SizeConfig.screenHeight!*0.8,
        //   margin: EdgeInsets.only(left: 30,right: 30,bottom: 15),
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       Container(
        //         child:widget ,
        //       ),
        //       Container(
        //         child:widget2 ,
        //       ),
        //       Container(
        //         child:widget3 ,
        //       ),
        //       Container(
        //         child:widget4 ,
        //       )
        //     ],
        //   //  child: Image.asset("assets/items-list/cart.png",width: 30,),
        //
        //   ),
        // ),
      ),
    );
  }
}

