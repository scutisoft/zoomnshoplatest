import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:zoomnshoplatest/pages/shopKeeper/shopKeeperAppointment.dart';
import '../../notifier/configuration.dart';
import '../../notifier/themeNotifier.dart';
import '../../notifier/utils.dart';
import '../../utils/sizeLocal.dart';
import '../customer/Cartpage.dart';
import '../HomePage/LandingPage.dart';
import '../HomePage/Notification.dart';
import '../Pofile/ViewProfile.dart';
import '../Product/AddUserDetails.dart';
import '../Product/ProductDetails.dart';
import '../customer/customerLogin.dart';
import '../customer/navHomeScreen.dart';
import '../myOrder/myOrderDetails.dart';
import '../settings/settingsHomePage.dart';
import 'shopKeeperCartAppointment.dart';
import 'shopKeeperProductMaster.dart';

class ShopKeeperHomeScreen extends StatefulWidget {
  const ShopKeeperHomeScreen({Key? key}) : super(key: key);
  @override
  _ShopKeeperHomeScreenState createState() => _ShopKeeperHomeScreenState();
}

class _ShopKeeperHomeScreenState extends State<ShopKeeperHomeScreen> {

  var username="".obs;
  @override
  void initState(){
    getUserData;
    super.initState();
  }

  void getUserData() async{
    username.value=await getSharedPrefString(SP_USERNAME);
  }

  GlobalKey <ScaffoldState> scaffoldkey=new GlobalKey<ScaffoldState>();
  int menuSel=1;
  late  double width,height,width2;
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
                  title: 'Appointment',
                  ontap: (){
                    setState(() {
                      menuSel=1;
                    });
                    scaffoldkey.currentState!.openEndDrawer();
                  },
                ),
                DrawerContent(
                  title: 'Product Detail',
                  ontap: (){
                    setState(() {
                      menuSel=3;
                    });
                    scaffoldkey.currentState!.openEndDrawer();
                  },
                ),
              /*
*/
            /*    DrawerContent(
                  title: 'Orders History',
                  ontap: (){
                    setState(() {
                      menuSel=4;
                    });
                    scaffoldkey.currentState!.openEndDrawer();
                  },
                ),

                DrawerContent(
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
          body: menuSel==1?ShopKeeperAppointmentDetail(voidCallback: (){
            scaffoldkey.currentState!.openDrawer();
          }):menuSel==2?SkCartAppointment(voidCallback: (){
            scaffoldkey.currentState!.openDrawer();
          }):menuSel==3?ProductMaster(voidCallback: (){
            scaffoldkey.currentState!.openDrawer();
          })
              :Container(),
        ),
      ),



    );
  }
}