
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'popOver/src/popover.dart';
import 'popOver/src/popover_direction.dart';


class CustomPopup extends StatelessWidget {
  List<dynamic>? data;
  Function(String)? onSelect;

  String hintText;
  double width;
  double leftMargin;
  EdgeInsets edgeInsets;
  Color color;
  CustomPopup({this.data,this.onSelect,required this.hintText,
    required this.width,this.leftMargin=20,this.edgeInsets=const EdgeInsets.only(left:20,),this.color=Colors.white,
  required this.showKey});

  String showKey;

  var selectedValue="".obs;
  Rxn sv=Rxn();
  @override
  Widget build(BuildContext context) {
    return
      // Builder(
      // builder: (BuildContext ctx1) =>
          GestureDetector(
            onTap: (){
              showPopover(
                barrierColor: Colors.transparent,
                context: context,
                transitionDuration: const Duration(milliseconds: 150),
                bodyBuilder: (c) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  
                   /* AddNewLabelTextField(
                        margin: EdgeInsets.only(left: 0),
                        scrollPadding: 500,
                    ),*/
                    Expanded(
                      child: ListView.builder(
                        itemCount: data!.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (ctx,index){
                          return   InkWell(
                            onTap: () {
                              log("${data![index]}");
                              sv.value=data![index];
                              Navigator.pop(ctx);
                            },
                            child: Container(
                              height: 50,
                              width:width,
                              padding: EdgeInsets.only(left: 20,),
                              //  margin: EdgeInsets.only(bottom: 3),
                              alignment: Alignment.centerLeft,
                              // color:selectedValue==data![index]?AppTheme.red: Color(0xFFf6f6f6),
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child:  Text(showKey.isEmpty?"${data![index]}":"${data![index][showKey]}",
                                style: TextStyle(fontFamily: 'RR',fontSize: 16,color: Color(0xFF505050)
                                  // color:selectedValue==data![index]?Colors.white: Color(0xFF555555),letterSpacing: 0.1
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                onPop: () => print('Popover was popped!'),
                direction: PopoverDirection.bottom,
               // width: 245,
                width: width+leftMargin,
                height: data!.length*50.0,
                arrowHeight: 0,
                arrowWidth: 0,
                //  backgroundColor: Color(0xFFf6f6f6),
                backgroundColor: Colors.red,
                contentDyOffset: 5,
                //isAttachRight: false,
                shadow:[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: Offset(0,0)
                  )
                ],
                margin: 0,
                isCustom: true,
                leftMargin: leftMargin,
                constraints: BoxConstraints(
                    maxHeight: 180
                ),
              );
            },
            child: Container(
              height: 50,
              width: width,
              margin: edgeInsets,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.red),
                color:color,
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Obx(
                        () =>Text(sv.value==null?hintText:showKey.isEmpty?"${sv.value}":"${sv.value[showKey]}",
                        style: TextStyle(color: Color(0xFF2E2E2E),fontSize: 16,fontFamily: selectedValue.isEmpty?'RL':'RR'),
                      ),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_down,size: 30,color:Colors.blue,),
                  SizedBox(width: 15,)
                ],
              ),
            ),
          );
    //);
  }
}
