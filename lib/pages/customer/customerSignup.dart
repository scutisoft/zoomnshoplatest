import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:zoomnshoplatest/HappyExtension/utilWidgets.dart';

import '../../api/ApiManager.dart';
import '../../constants/sp.dart';
import '../../model/parameterMode.dart';
import '../../notifier/configuration.dart';
import '../../notifier/netConnectivityNotifier.dart';
import '../../styles/constants.dart';
import '../../utils/colorUtil.dart';
import '../../utils/sizeLocal.dart';
import '../../widgets/alertDialog.dart';
import '../../widgets/loader.dart';
import '../../widgets/validationErrorText.dart';
import '../settings/pinScreenSettings.dart';
import 'customerLogin.dart';

class CustomerSignUp extends StatefulWidget {
  const CustomerSignUp({Key? key}) : super(key: key);

  @override
  State<CustomerSignUp> createState() => _CustomerSignUpState();
}

class _CustomerSignUpState extends State<CustomerSignUp>  with SingleTickerProviderStateMixin{
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  List<dynamic> widgets=[];
  var volunteerType=1.obs;
  var isAccept=false.obs;
  BorderRadius borderRadius=BorderRadius.circular(10);
  BoxDecoration inActiveDec=BoxDecoration(
    shape:BoxShape.circle,
    color: ColorUtil.primaryColor.withOpacity(0.5),
    border:Border.all(color:Colors.white,width: 3.0),
  );
  BoxDecoration activeDec=BoxDecoration(
    shape:BoxShape.circle,
    color: ColorUtil.primaryColor,
    border:Border.all(color:Colors.white,width: 3.0),
  );


  @override
  void initState() {
    assignWidgets();
    super.initState();
  }

  var node;
  @override
  Widget build(BuildContext context) {
    node=FocusScope.of(context);
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFF7F8FA),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding:EdgeInsets.only(top:10 ) ,
                      child: Image.asset('assets/images/loginpages/Homelogin.png',fit: BoxFit.cover,height: 200,),
                    ),
                    SizedBox(height: 10,),
                    Container(
                        child: Text('Welcome to',style: TextStyle(fontSize: 16,fontFamily: 'RB',color: Color(0XFF000000)),)
                    ),
                    SizedBox(height: 10,),
                    Container(
                        child: Text('Zoom & Shop',style: TextStyle(fontSize: 20,fontFamily: 'RB',color: Color(0XFFFE316C)),)
                    ),
                    SizedBox(height: 10,),
                    widgets[0],
                    widgets[1],
                    widgets[2],
                    widgets[3],
                    widgets[4],
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap:(){
                              volunteerType.value=1;
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        border:Border.all(color: ColorUtil.primaryColor,width: 1.0),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Obx(() => AnimatedContainer(
                                      duration: MyConstants.animeDuration,
                                      padding: const EdgeInsets.all(10),
                                      width: 10,
                                      height: 10,
                                      decoration: volunteerType.value==1?activeDec:inActiveDec,
                                    )),
                                  ),
                                  const SizedBox(width: 10,),
                                  Text('Customer',style: TextStyle(fontSize: 15,color: ColorUtil.black,fontFamily: 'RM'),),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 30,),
                          GestureDetector(
                            onTap:(){
                              volunteerType.value=2;
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        border:Border.all(color: ColorUtil.primaryColor.withOpacity(0.5),width: 1.0),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: Obx(() => AnimatedContainer(
                                      duration: MyConstants.animeDuration,
                                      padding: const EdgeInsets.all(10),
                                      width: 10,
                                      height: 10,
                                      decoration: volunteerType.value==2?activeDec:inActiveDec,
                                    )),
                                  ),
                                  SizedBox(width: 10,),
                                  Text('Shop Keeper',style: TextStyle(fontSize: 15,color: ColorUtil.black,fontFamily: 'RM'),),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CutomerLogin()),);

                              },
                              child: RichText(
                                text: TextSpan(text: 'Already have an account ? ',style: TextStyle(color:ColorUtil.text1,fontFamily: 'RR',fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(text: 'Sign In', style: TextStyle(color:ColorUtil.primaryColor,fontFamily: 'RB',fontSize: 15)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>Masterpage()),);

                      },
                      child: Container(
                        height: 50,
                        width: SizeConfig.screenWidth!*0.8,
                        decoration: BoxDecoration(
                          borderRadius: borderRadius,
                          color: Color(0XFFFE316C),
                        ),
                        alignment: Alignment.center,
                        child: Text("Sign Up",style: whiteRM20,),
                      ),
                    ),
                    // SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
            //Loader(value: isLoading,)
          ],
        ),
      ),
    );
  }
  double scrollPadding=10;

  @override
  void assignWidgets() async{
    widgets.add(HE_AddNewLabelTextField(
      dataname: 'Name',
      hasInput: true,
      required: true,
      labelText: "User Name",
      scrollPadding: scrollPadding,
      regExp: null,
      onChange: (v){},
      onEditComplete: (){
        node.unfocus();
      },
    ));//0
    widgets.add(HE_AddNewLabelTextField(
      dataname: 'Email',
      hasInput: true,
      required: true,
      labelText: "E-mail",
      scrollPadding: scrollPadding,
      regExp: null,
      onChange: (v){},
      onEditComplete: (){
        node.unfocus();
      },
    ));//1
    widgets.add(HE_AddNewLabelTextField(
      dataname: 'PhoneNumber',
      hasInput: true,
      required: true,
      labelText: "Mobile Number",
      textInputType: TextInputType.number,
      textLength: 10,
      regExp: MyConstants.digitRegEx,
      onEditComplete: (){
        node.unfocus();
      },
    ));//2
    widgets.add(HE_AddNewLabelTextField(
      dataname: 'Password',
      hasInput: true,
      required: true,
      isObscure: true,
      labelText: "New Password",
      scrollPadding: scrollPadding,
      regExp: null,
      onChange: (v){},
      onEditComplete: (){
        node.unfocus();
      },
    ));//3
    widgets.add(HE_AddNewLabelTextField(
      dataname: 'ConfirmPassword',
      hasInput: true,
      required: true,
      isObscure: true,
      labelText: "Confirm Password",
      scrollPadding: scrollPadding,
      regExp: null,
      onChange: (v){},
      onEditComplete: (){
        node.unfocus();
      },
    ));//4

    widgets[3].suffixIcon= GestureDetector(
      onTap: (){
        widgets[3].isObscure=!widgets[3].isObscure;
        widgets[3].reload.value=!widgets[3].reload.value;
      },
      child: Container(
          height: 30,
          width: 30,
          alignment: Alignment.center,
          color: Colors.transparent,
          child: Obx(()=>Icon(! widgets[3].isObscure?Icons.visibility_off_outlined:Icons.visibility_outlined,color:widgets[3].reload.value? ColorUtil.primaryColor:ColorUtil.primaryColor,))
      ),
    );
    widgets[4].suffixIcon= GestureDetector(
      onTap: (){
        widgets[4].isObscure=!widgets[4].isObscure;
        widgets[4].reload.value=!widgets[4].reload.value;
      },
      child: Container(
          height: 30,
          width: 30,
          alignment: Alignment.center,
          color: Colors.transparent,
          child: Obx(()=>Icon(! widgets[4].isObscure?Icons.visibility_off_outlined:Icons.visibility_outlined,color:widgets[4].reload.value? ColorUtil.primaryColor:ColorUtil.primaryColor,))
      ),
    );

    setState(() {});

    // await parseJson(widgets, getPageIdentifier(),dataJson: widget.dataJson);
  }
}
