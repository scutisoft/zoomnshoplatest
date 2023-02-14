
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoomnshoplatest/HappyExtension/extensionHelper.dart';
import '../../HappyExtension/utilWidgets.dart';
import '../../api/ApiManager.dart';
import '../../constants/sp.dart';
import '../../model/parameterMode.dart';
import '../../notifier/configuration.dart';
import '../../notifier/utils.dart';
import '../../styles/constants.dart';
import '../../utils/colorUtil.dart';
import '../../utils/sizeLocal.dart';
import '../../widgets/alertDialog.dart';
import 'customerLogin.dart';

class CustomerSignUp extends StatefulWidget {
  const CustomerSignUp({Key? key}) : super(key: key);

  @override
  State<CustomerSignUp> createState() => _CustomerSignUpState();
}

class _CustomerSignUpState extends State<CustomerSignUp>  with SingleTickerProviderStateMixin,HappyExtensionHelper implements HappyExtensionHelperCallback{

  List<dynamic> widgets=[];
  var volunteerType=UserType.customer.index.obs;
  var isAccept=false.obs;
  BorderRadius borderRadius=BorderRadius.circular(10);
  BoxDecoration inActiveDec=BoxDecoration(
    shape:BoxShape.circle,
    color: ColorUtil.primaryColor.withOpacity(0.2),
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
        backgroundColor: const Color(0XFFF7F8FA),
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
                      padding:const EdgeInsets.only(top:10 ) ,
                      child: Image.asset('assets/images/loginpages/Homelogin.png',fit: BoxFit.cover,height: 200,),
                    ),
                    const SizedBox(height: 10,),
                    const Text('Welcome to',style: TextStyle(fontSize: 16,fontFamily: 'RB',color: Color(0XFF000000)),),
                    const SizedBox(height: 10,),
                    const Text('Zoom & Shop',style: TextStyle(fontSize: 20,fontFamily: 'RB',color: Color(0XFFFE316C)),),
                    const SizedBox(height: 10,),
                    widgets[0],
                    widgets[1],
                    widgets[2],
                    widgets[3],
                    widgets[4],
                    widgets[5],
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 10,bottom: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap:(){
                              volunteerType.value=UserType.customer.index;
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
                                      decoration: volunteerType.value==UserType.customer.index?activeDec:inActiveDec,
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
                              volunteerType.value=UserType.shopKeeper.index;
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
                                      decoration: volunteerType.value==UserType.shopKeeper.index?activeDec:inActiveDec,
                                    )),
                                  ),
                                  const SizedBox(width: 10,),
                                  Text('Shop Keeper',style: TextStyle(fontSize: 15,color: ColorUtil.black,fontFamily: 'RM'),),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.off(()=>const CutomerLogin());
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
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>Masterpage()),);
                        sysSubmit(widgets,needCustomValidation: true,onCustomValidation: (){
                          foundWidgetByKey(widgets, "UserGroupId",needSetValue: true,value: volunteerType.value);
                          if(widgets[4].getValue()!=widgets[5].getValue()){
                            CustomAlert().cupertinoAlert("Password Doesn't match...");
                            return false;
                          }
                          return true;
                        },traditionalParam: TraditionalParam(getByIdSp: "", insertSp: Sp.signUpSp, updateSp: ""));
                      },
                      child: Container(
                        height: 50,
                        width: SizeConfig.screenWidth!*0.8,
                        decoration: BoxDecoration(
                          borderRadius: borderRadius,
                          color: const Color(0XFFFE316C),
                        ),
                        alignment: Alignment.center,
                        child: Text("Sign Up",style: whiteRM20,),
                      ),
                    ),
                    const SizedBox(height: 20,),
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
      dataname: 'UserName',
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
      dataname: 'ContactNumber',
      hasInput: true,
      required: true,
      labelText: "Mobile Number",
      textInputType: TextInputType.number,
      textLength: 10,
      regExp: MyConstants.digitRegEx,
      onEditComplete: (){
        node.unfocus();
      },
      onChange: (v){
        if(v.length==10){
          widgets[3].isEnabled=true;
          widgets[3].reload.value=!widgets[3].reload.value;
          requestOtp(v);
          Timer(const Duration(milliseconds: 300), () {
            node.nextFocus();
          });
        }
        else{
          widgets[3].isEnabled=false;
          widgets[3].reload.value=!widgets[3].reload.value;
          widgets[3].clearValues();
        }
      },
    ));//2
    widgets.add(HE_AddNewLabelTextField(
      dataname: 'OTP',
      hasInput: true,
      required: true,
      isEnabled: false,
      labelText: "OTP",
      textInputType: TextInputType.number,
      textLength: 6,
      regExp: MyConstants.digitRegEx,
      onChange: (v){

      },
      onEditComplete: (){
        node.unfocus();
      },
    ));//3
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
    ));//4
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
    ));//5
    widgets.add(HiddenController(dataname: "UserGroupId"));
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
    widgets[5].suffixIcon= GestureDetector(
      onTap: (){
        widgets[5].isObscure=!widgets[5].isObscure;
        widgets[5].reload.value=!widgets[5].reload.value;
      },
      child: Container(
          height: 30,
          width: 30,
          alignment: Alignment.center,
          color: Colors.transparent,
          child: Obx(()=>Icon(! widgets[5].isObscure?Icons.visibility_off_outlined:Icons.visibility_outlined,color:widgets[5].reload.value? ColorUtil.primaryColor:ColorUtil.primaryColor,))
      ),
    );

    setState(() {});

    // await parseJson(widgets, getPageIdentifier(),dataJson: widget.dataJson);
  }


  void requestOtp(contactNumber){
    List<ParameterModel> params=[];
    params.add(ParameterModel(Key: "SpName", Type: "String", Value: Sp.insertOTP));
    params.add(ParameterModel(Key: "ContactNumber", Type: "String", Value: contactNumber));
    ApiManager().GetInvoke(params).then((value){
      if(value[0]){
        console(value);
        //print(parsed);
      }
    });
  }
}
