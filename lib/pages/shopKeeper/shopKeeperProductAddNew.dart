import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zoomnshoplatest/app_theme.dart';
import 'package:zoomnshoplatest/notifier/shopKeeper/skProductNotifier.dart';
import 'package:zoomnshoplatest/notifier/utils.dart';
import 'package:zoomnshoplatest/styles/style.dart';
import 'package:zoomnshoplatest/widgets/loader.dart';

import '../../HappyExtension/utilWidgets.dart';
import '../../api/ApiManager.dart';
import '../../styles/constants.dart';
import '../../utils/colorUtil.dart';
import '../../utils/sizeLocal.dart';
import '../../widgets/customWidgetsForDynamicParser/searchDrp2.dart';
import '../../widgets/logoPicker.dart';
import '../../widgets/searchDropdown/search2.dart';
import '../../widgets/videoPlayer/src/flick_video_player.dart';
import '../../widgets/videoPlayer/src/manager/flick_manager.dart';

class ProductAddNew extends StatefulWidget {
  bool isEdit;
  int? editId;
  ProductAddNew({required this.isEdit,this.editId});

  @override
  State<ProductAddNew> createState() => _ProductAddNewState();
}

class _ProductAddNewState extends State<ProductAddNew> {
  var node;
  AddNewLabelTextField addNewLabelTextField= AddNewLabelTextField(
      labelText: 'Product Name',
      dataname: "ProductName",
      onChange: (v){},
      onEditComplete: (){},
      ontap: (){},
      required: true,
  );
  AddNewLabelTextField addNewLabelTextField2= AddNewLabelTextField(
    labelText: 'Product Price',
    dataname: "Price",
    onChange: (v){},
    onEditComplete: (){},
    ontap: (){},
    textInputType: TextInputType.numberWithOptions(),
    regExp: decimalReg,
  );
  AddNewLabelTextField addNewLabelTextField3= AddNewLabelTextField(
      labelText: 'Description',
      dataname: "Description",
      onChange: (v){},
      onEditComplete: (){},
      ontap: (){}
  );
  Search2 categoryDrp=Search2(
    dataName: "ProductCategoryId",
    width: SizeConfig.screenWidth,
    dialogWidth: SizeConfig.screenWidth!,
    selectWidgetHeight: 50,
    hinttext: "Select Category",
    data: [],
    propertyId: "Id",
    propertyName: "Text",
    showSearch: false,
    onitemTap: (i){},
    selectedValueFunc: (e){},
    scrollTap: (){},
    isToJson: true,
    margin: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 0),
    dialogMargin:  const EdgeInsets.only(left: 20,right: 20,top: 0),
    required: true,
    labelTopPosition: 8,
    labelText: "Category",
    selectWidgetBoxDecoration: BoxDecoration(
        border: Border.all(color: addNewTextFieldBorder),
        color: Colors.white
    ),
  );
  HiddenController productId=HiddenController(hasInput: true,dataname: "ProductId",);


  @override
  void initState(){
    addNewLabelTextField.onEditComplete=(){node.unfocus();};
    addNewLabelTextField2.onEditComplete=(){node.unfocus();};
    addNewLabelTextField3.onEditComplete=(){node.unfocus();};
    assign();
    super.initState();
  }

  Future<void> assign() async {
    skProductController.addNewWidgets.clear();
    skProductController.addNewWidgets.add(addNewLabelTextField);
    skProductController.addNewWidgets.add(categoryDrp);
    skProductController.addNewWidgets.add(addNewLabelTextField2);
    skProductController.addNewWidgets.add(addNewLabelTextField3);
    skProductController.addNewWidgets.add(productId);
    skProductController.addNewWidgets.add(SingleVideoPicker(dataname: "ProductVideoFileName", folder: "ProductVideo",hasInput: true,btnTitle: "Choose Video",));


    setState((){ });
    await skProductController.fillOI_Drp();
    if(widget.isEdit){
      skProductController.getProductDetail(productId: widget.editId);
    }
  }

  @override
  void dispose(){
    skProductController.addNewWidgets[5].clearValues();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    node=FocusScope.of(context);
    return Scaffold(
        backgroundColor: Color(0XFFffffff),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 25,),
                        decoration: BoxDecoration(
                            color: ColorUtil.primaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: ColorUtil.primaryColor.withOpacity(0.9),
                                blurRadius: 10.0, // soften the shadow
                                spreadRadius: 0.0, //extend the shadow
                                offset: Offset(
                                  0.0,// Move to right 10  horizontally
                                  5.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: IconButton(onPressed: (){
                          Get.back();
                          //cartController.cartProductList.clear();
                        }, icon: Icon(Icons.arrow_back_ios_sharp,color:Colors.white,size: 20,),),
                      ),
                      SizedBox(width: 30,),
                      Text("Product Detail / ${widget.isEdit?"Edit":"Add New"}",style: ts16(ColorUtil.primaryTextColor1),)
                    ],
                  ),
                ),


                for(int i=0;i<skProductController.addNewWidgets.length;i++)
                  skProductController.addNewWidgets[i],
                const SizedBox(height: 20,),
                Obx(() => LogoPicker(
                    imageUrl: skProductController.customerLogoUrl.value,
                    imageFile: skProductController.logoFile,
                    description: "Upload Product",
                    onCropped: (file){
                      setState(() {
                        skProductController.logoFile=file;
                        skProductController.customerLogoUrl.value="";
                        skProductController.customerLogoFileName="";
                      });
                    }
                )),


                GestureDetector(
                  onTap: (){
                    skProductController.onOpenItemSave(widget.isEdit);
                  },
                  child: Container(
                    height: 60,
                    width: SizeConfig.screenWidth!*0.75,
                    margin: EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0XFFFE316C),
                    ),
                    alignment: Alignment.center,
                    child: Text("${widget.isEdit?"Update":"Add"} Product",style: whiteRM20,),
                  ),
                ),
              ],
            ),
          ),
          Obx(() => Loader(value: showLoader.value,))
        ],
      )
    );
  }
}
