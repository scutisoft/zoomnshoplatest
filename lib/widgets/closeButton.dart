import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../utils/colorUtil.dart';


class CloseBtn extends StatelessWidget {

  VoidCallback? onTap;
  double height;
  IconData icon;
  double iconSize;
  Color? bgClr;
  BoxDecoration? boxDecoration;
  CloseBtn({this.onTap,this.height=40,this.icon=Icons.clear,this.iconSize=25,this.bgClr,this.boxDecoration});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: height,
        decoration: boxDecoration?? BoxDecoration(
          shape: BoxShape.circle,
          color: bgClr??ColorUtil.primaryColor
        ),
        child: Center(
          child: Icon(icon,color: Colors.white,size: iconSize,),
        ),
      ),
    );
  }
}


class EditIcon extends StatelessWidget {

  VoidCallback? onTap;
  double height;
  double width;
  double? imageheight;
  Color imgColor;

  EditIcon({this.onTap,this.height=50,this.width=50,this.imageheight,this.imgColor=Colors.white});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          //shape: BoxShape.circle,
          color: Colors.transparent
        ),
        child: Center(
          child: SvgPicture.asset("assets/expenses/edit.svg",height: imageheight!,color:imgColor,),
        ),
      ),
    );
  }
}

class ArrowBack extends StatelessWidget {

  VoidCallback? onTap;
  double height;
  double width;
  double? imageheight;

  ArrowBack({this.onTap,this.height=50,this.width=50,this.imageheight});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
        child: Container(
            height: height,
            width: width ,
            color: Colors.transparent,
            child: Center(
                child: SvgPicture.asset("assets/icon/arrow-back.svg",width: 30,height: 30,color: Colors.white,)
            )
         ),
        );
  }
}


class ArrowLeft extends StatelessWidget {
  VoidCallback? ontap;
  ArrowLeft({this.ontap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap,
      child: Container(
          height: 60,
          width: 60,
          alignment:Alignment.center,
          padding: EdgeInsets.only(right: 3),
          margin: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle
          ),
          child:SvgPicture.asset("assets/functionPopUp/left-arrow.svg",height:25, color: Colors.white,)
      ),
    );
  }
}

class RefreshBtn extends StatelessWidget {
  VoidCallback ontap;
  RefreshBtn({required this.ontap});
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed:ontap,
        icon: Icon(Icons.refresh,color: ColorUtil.grey1,size: 27,)
    );
  }
}