import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:zoomnshoplatest/notifier/utils.dart';
import '../../notifier/configuration.dart';
import '../../notifier/notification/myNotification.dart';
import '../../notifier/themeNotifier.dart';
import '../../utils/sizeLocal.dart';
import 'Appointment.dart';
import '../HomePage/LandingPage.dart';
import '../HomePage/Notification.dart';
import '../Pofile/ViewProfile.dart';
import '../Product/AddUserDetails.dart';
import '../Product/ProductDetails.dart';
import '../myOrder/myOrderDetails.dart';
import '../settings/settingsHomePage.dart';
import 'customerCartAppointment.dart';
import 'customerLogin.dart';
var username="".obs;
int menuSel=1;
class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);
  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> /*implements MyNotificationCallBack*/{



  void getUserData() async{
    username.value=await getSharedPrefString(SP_USERNAME);
  }

  GlobalKey <ScaffoldState> scaffoldkey=new GlobalKey<ScaffoldState>();

  late  double width,height,width2;
  late MyNotification myNotification;

  @override
  void initState(){
    getUserData;
/*    myNotification=MyNotification();
    myNotification.setMyCallBack(this);
    myNotification.registerNotification();
    myNotification.checkForInitialMessage();*/
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    width2=width-16;
    SizeConfig().init(context);
    getUserData();
    return SafeArea(
      child: Consumer<ThemeNotifier>(
        builder:(ctx,tn,child)=> Scaffold(
          key: scaffoldkey,
          drawer: Container(
            height: height,
            width: width,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color:tn.primaryColor,
            //    borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
            ),

            child:Column(
             children: [
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 30,top: 30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: IconButton(onPressed: (){
                        scaffoldkey.currentState!.openEndDrawer();
                        // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>ThemeSettings()));
                      }, icon: Icon(Icons.arrow_back_ios_sharp,color:tn.primaryColor,size: 20,),),
                    ),
                  ],
                ),
                Column(
                 children: [
                    Container(
                      height: 150,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                         shape: BoxShape.circle
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProfile(),));
                        },
                        child: Container(
                          height: 145,
                          width: 145,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/images/landingPage/avatar-01.jpg")
                        ),
                      )
                    ),
                   SizedBox(height: 20,),
                   Container(
                     child: Obx(() =>  Text(username.value
                       ,style: TextStyle(fontFamily: 'RR',fontSize: 20,color: Colors.white,letterSpacing: 0.1),),)
                   ),
                   SizedBox(height: 5,),
                   /*Container(
                     width: SizeConfig.screenWidth!*0.40,
                      padding: EdgeInsets.all(5),
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                           color: Color(0xffFE4E82),
                           borderRadius: BorderRadius.circular(5)
                           // shape: BoxShape.circle
                       ),
                       child:  Text('Gold SubScribe'
                         ,style: TextStyle(fontFamily: 'RR',fontSize: 16,color:Colors.white,letterSpacing: 0.1),),
                   ),*/
                  ],
                ),
                SizedBox(height: 5,),
               DrawerContent(
                 title: 'Home Page',
                 ontap: (){
                   setState(() {
                     menuSel=1;
                   });
                   scaffoldkey.currentState!.openEndDrawer();
                 },
               ),
                DrawerContent(
                    title: 'Appointment',
                    ontap: (){
                      setState(() {
                        menuSel=2;
                      });
                      scaffoldkey.currentState!.openEndDrawer();
                    },
                ),

                DrawerContent(
                    title: 'Cart',
                    ontap: (){
                      setState(() {
                        menuSel=3;
                      });
                      scaffoldkey.currentState!.openEndDrawer();
                    },
                ),

               DrawerContent(
                 title: 'Orders History',
                 ontap: (){
                   setState(() {
                     menuSel=4;
                   });
                   scaffoldkey.currentState!.openEndDrawer();
                 },
               ),
               /*DrawerContent(
                 title: 'Settings',
                 ontap: (){
                   setState(() {
                     menuSel=7;
                   });
                   scaffoldkey.currentState!.openEndDrawer();
                 },
               ),*/

            /*   DrawerContent(
                 title: 'Notifications',
                 ontap: (){
                   setState(() {
                     menuSel=6;
                   });
                   scaffoldkey.currentState!.openEndDrawer();
                 },
               ),*/

                 Spacer(),
                DrawerContent(
                  title: 'LogOut',
                  ontap: (){
                    onLogout();
                    Get.off(CutomerLogin());
                  },
                ),
                // Divider(color: Color(0xff099FAF),thickness: 0.1,),
              ],
            ),
          ),
          body:menuSel==1?HomePage(
            voidCallback:(){
              scaffoldkey.currentState!.openDrawer();
            },
            changePage: (){
              setState((){
                menuSel=2;
              });
            },
          ) :menuSel==2?AppointmentDetails (
            voidCallback:(){

              scaffoldkey.currentState!.openDrawer();
            },
          ):menuSel==3?CartAppointment (
            voidCallback:(){

              scaffoldkey.currentState!.openDrawer();
            },
          ) :menuSel==4?MYOrderDetails (
            voidCallback:(){

              scaffoldkey.currentState!.openDrawer();
            },
          ):menuSel==5?ProductAddView (
            voidCallback:(){

              scaffoldkey.currentState!.openDrawer();
            },
          ):menuSel==6?NotificationBar (
            voidCallback:(){

              scaffoldkey.currentState!.openDrawer();
            },
          ): menuSel==7?SettingsHomePage (
            voidCallback:(){

              scaffoldkey.currentState!.openDrawer();
            },
          ):Container(),
        ),
      ),



    );
  }

  /*@override
  void onNotificationReceived(List<dynamic> valueArray) {
    log("onNotificationReceived $valueArray");
  }*/
}

class DrawerContent extends StatelessWidget {
  String title;
  VoidCallback ontap;
  DrawerContent({required this.title,required this.ontap});
  late double width;

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    return Consumer<ThemeNotifier>(
      builder:(ctx,tn,child)=>  GestureDetector(
        onTap: ontap,
        child: Container(
          height: 40,
          width: width,
          color: Colors.transparent,
          margin: EdgeInsets.only(top: 5,bottom: 5,left:20 ),
          child: Row(
            children: [
              SizedBox(width: 20,),
              // Container(
              //   height: 40,
              //   width: 40,
              //   decoration: BoxDecoration(
              //       color: tn.primaryColor3,
              //       borderRadius: BorderRadius.circular(10)
              //   ),
              // ),
              // SizedBox(width: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$title",
                    style: TextStyle(fontFamily: 'RR',fontSize: 18,color: Colors.white,letterSpacing: 0.1),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

