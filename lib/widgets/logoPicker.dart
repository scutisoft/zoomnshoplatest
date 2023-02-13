import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:zoomnshoplatest/notifier/utils.dart';
import 'package:zoomnshoplatest/utils/colorUtil.dart';

import '../HappyExtension/extensionHelper.dart';
import '../HappyExtension/utils.dart';
import '../api/apiUtils.dart';
import '../app_theme.dart';
import '../helper/helper.dart';
import '../utils/sizeLocal.dart';
import 'validationErrorText.dart';
import 'videoPlayer/src/flick_video_player.dart';
import 'videoPlayer/src/manager/flick_manager.dart';


class LogoPicker extends StatelessWidget {
  String imageUrl;
  File? imageFile;
  Function(File) onCropped;
  String description;
  String btnTitle;
  bool isEnable;
  LogoPicker({required this.imageUrl,this.imageFile,required this.onCropped,this.description="Upload Your Company Logo",
    this.btnTitle="Choose File",this.isEnable=true});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LogoAvatar(imageUrl: imageUrl, imageFile: imageFile,radius: 100,),
        SizedBox(height: 20,),
        Align(
          alignment: Alignment.center,
          child: Text(description,
            style: TextStyle(fontFamily: 'RR',fontSize: 14,color: AppTheme.gridTextColor),
          ),
        ),
        SizedBox(height: 10,),
        GestureDetector(
          onTap:isEnable?  (){
            getImage(onCropped);
          }:null,
          child:  Align(
            alignment: Alignment.center,
            child: Container(
              width: 150,
              height:45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: ColorUtil.primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: ColorUtil.primaryColor.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(1, 8), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                  child: Text(btnTitle,style: TextStyle(color:Colors.white,fontSize:16,fontFamily: 'RM'),
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LogoAvatar extends StatelessWidget {
  String imageUrl;
  File? imageFile;
  double radius;
  double height;
  LogoAvatar({Key? key,required this.imageUrl,required this.imageFile,this.radius=100,this.height=100}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: radius,
      decoration: BoxDecoration(
        color: AppTheme.avatarBorderColor,
        //shape: BoxShape.circle
      ),
      alignment: Alignment.center,
      child: Container(
        height: height-3,
        width: radius-3,
        decoration: BoxDecoration(
          //shape: BoxShape.circle,
            color: Colors.white
        ),
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        child: imageFile!=null?Image.file(imageFile!,):
        Image.network(imageUrl,
            errorBuilder: (a,b,c){
              return SvgPicture.asset("assets/icon/upload.svg",height: height-3,width: radius-3,fit: BoxFit.cover,color: ColorUtil.primaryColor,);
            },
            fit: BoxFit.contain,
            height: height-3, width: radius-3
        ),
      ),
    );
  }
}

Future getImage( Function(File) onCropped) async
{
  XFile? temp=await (ImagePicker().pickImage(source: ImageSource.gallery));
  if(temp==null)return;
  File tempImage = File(temp.path);
  _cropImage(tempImage,onCropped);
}

_cropImage(File picked,Function(File) onCropped) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: picked.path,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,

    ],
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.red,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          showCropGrid: false,
        hideBottomControls: true
      ),
      IOSUiSettings(
        title: 'Crop Image',
      ),
    ],
    cropStyle: CropStyle.circle,
    maxWidth: 400
  );
  if (croppedFile != null) {
    onCropped(File(croppedFile.path));
  }
  // CroppedFile? cropped = await ImageCropper().cropImage(
  //   uiSettings: AndroidUiSettings(
  //       statusBarColor: Colors.red,
  //       toolbarColor: Colors.red,
  //       toolbarTitle: "Crop Image",
  //       toolbarWidgetColor: Colors.white,
  //       showCropGrid: false,
  //       hideBottomControls: true
  //   ),
  //   sourcePath: picked.path,
  //   aspectRatioPresets: [
  //     CropAspectRatioPreset.square
  //   ],
  //   maxWidth: 400,
  //   cropStyle: CropStyle.circle,
  // );
  // if (cropped != null) {
  //   onCropped(cropped);
  // }
}


Future getVideo( Function(File,XFile) onCropped) async
{
  XFile? temp=await (ImagePicker().pickVideo(source: ImageSource.gallery,maxDuration: const Duration(minutes: 5)));
  if(temp==null)return;
  File tempImage = File(temp.path);
  onCropped(tempImage,temp);

}


class SingleVideoPicker extends StatelessWidget implements ExtensionCallback{
  bool hasInput;
  bool required;
  String dataname;
  String folder;
  bool enabled;
  String description;
  String btnTitle;
  SingleVideoPicker({required this.dataname,this.hasInput=false,this.required=false,required this.folder,this.enabled=true,
    this.description="Upload Your Video", this.btnTitle="Choose File"});

  Rxn<File> imageFile=Rxn<File>();
  Rxn<String> imageName=Rxn<String>();
  Rxn<String> videoUrl=Rxn<String>();
  VideoPlayerController? _controller;

  var orderBy=1.obs;
  var isValid=true.obs;
  var errorText="* Required".obs;

  FlickManager? flickManager;

  Future<void> _playVideo(XFile? file) async {
    if (file != null) {
      videoUrl.value=null;
      if(flickManager!=null){
        flickManager!.dispose();
      }
      flickManager=null;
      flickManager= FlickManager(
        videoPlayerController:
        VideoPlayerController.file(File(file.path))
      );
      return;

    //  await _disposeVideoController();

      /*if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {*/
      _controller = VideoPlayerController.file(File(file.path));
     // }

      // In web, most browsers won't honor a programmatic call to .play
      // if the video has a sound track (and is not muted).
      // Mute the video so it auto-plays in web!
      // This is not needed if the call to .play is the result of user
      // interaction (clicking on a "play" button, for example).
      const double volume = 1.0;
      //_controller!.
      await _controller!.setVolume(volume);
      await _controller!.initialize();
      await _controller!.setLooping(false);
      await _controller!.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Obx(() => LogoAvatar(imageUrl: "${GetImageBaseUrl()}$folder/${imageName.value??""}", imageFile: imageFile.value,radius: 100,)),
       // Obx(() =>imageFile.value==null ?Container(): AspectRatioVideo(_controller)),
        Obx(() =>imageFile.value==null ?Container(): Container(
          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
          child: FlickVideoPlayer(
              flickManager: flickManager!
          ),
        )),
        Obx(() =>videoUrl.value==null && videoUrl.value!="" ?Container(): Container(
          margin: EdgeInsets.only(left: 20,right: 20,top: 15),
          child: FlickVideoPlayer(
              flickManager: flickManager!
          ),
        )),
        //AspectRatioVideo(_controller),
        const SizedBox(height: 20,),
        Align(
          alignment: Alignment.center,
          child: Text(description,
            style: TextStyle(fontFamily: 'RR',fontSize: 14,color: ColorUtil.text1),
          ),
        ),
        Obx(
                ()=>isValid.value?Container():ValidationErrorText(title: errorText.value/*,alignment: Alignment.center*/,leftPadding: 0,)
        ),
        const SizedBox(height: 10,),
        Visibility(
          visible: enabled,
          child: GestureDetector(
            onTap:enabled?  (){
              getVideo((file,xFile){
                imageFile.value=file;
                _playVideo(xFile);
              });
            }:null,
            child:  Align(
              alignment: Alignment.center,
              child: Container(
                width: 150,
                height:45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: ColorUtil.primary,
                  boxShadow: [
                    BoxShadow(
                      color: ColorUtil.primary.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(1, 8), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                    child: Text(btnTitle,style: TextStyle(color:Colors.white,fontSize:16,fontFamily: 'RM'),
                    )
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void clearValues() {
    imageFile.value=null;
    if(_controller!=null){
      _controller!.dispose();
    }
    if(flickManager!=null){
      flickManager!.dispose();
    }
    videoUrl.value=null;
  }

  @override
  String getDataName() {
    return dataname;
  }

  @override
  int getOrderBy() {
    return orderBy.value;
  }

  @override
  String getType() {
    return 'singleVideoPicker';
  }

  @override
  getValue() async{
    if(imageFile.value!=null){
      imageName.value=await MyHelper.uploadFile(folder, imageFile.value!);
    }
    return imageName.value;
  }

  @override
  setOrderBy(int oBy) {
    orderBy.value=oBy;
  }

  @override
  setValue(value) {
    if(value.runtimeType.toString()=="String"){
      //imageName.value=value;
      videoUrl.value=GetImageBaseUrl()+value;
      console("videoUrl.value ${videoUrl.value}");
      if(flickManager!=null){
        flickManager!.dispose();
      }
      flickManager= FlickManager(
          videoPlayerController:
          VideoPlayerController.network(videoUrl.value!)
      );
    }
  }

  @override
  bool validate() {
    isValid.value=(imageName.value != null && imageName.value!.isNotEmpty) || imageFile.value != null;
    return isValid.value;
  }
}
class AspectRatioVideo extends StatefulWidget {
  const AspectRatioVideo(this.controller, {Key? key}) : super(key: key);

  final VideoPlayerController? controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController? get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller!.value.isInitialized) {
      initialized = controller!.value.isInitialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller!.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller!.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
      );
    } else {
      return Container();
    }
  }
}


class MultiImagePicker extends StatelessWidget implements ExtensionCallback{
  bool hasInput;
  bool required;
  String dataname;
  String folder;

  MultiImagePicker({required this.dataname,this.hasInput=false,this.required=false,required this.folder});

  /*MultiImagePicker({});*/
  RxList<XFile> imageFileList=RxList<XFile>();
  RxList<dynamic> imagesList=RxList<dynamic>();
  double imgWidth=0.0;

  var orderBy=1.obs;
  var isValid=true.obs;
  var errorText="* Required".obs;

  @override
  Widget build(BuildContext context) {
    imgWidth=SizeConfig.screenWidth!-60;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: ()async{
            var _image = await ImagePicker().pickMultiImage();
            if(_image!=null && _image.isNotEmpty){
              imageFileList.addAll(_image);
            }
            //console("imageFileList ${imageFileList.value}");
          },
          child: Container(
            margin: EdgeInsets.only(right: 15,left: 15,top: 10),
            width: SizeConfig.screenWidth,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: ColorUtil.primary),
              color: ColorUtil.primary.withOpacity(0.3),
            ),
            child:Center(child: Text('Upload Image',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: ColorUtil.primary,fontFamily:'RR'), )
            ) ,
          ),
        ),
        Obx(
                ()=>isValid.value?Container():ValidationErrorText(title: errorText.value,)
        ),
        Obx(() => Container(
          margin: EdgeInsets.only(top: 10),
          child: Wrap(
            runSpacing: 0,
            spacing: 10,
            children: [
              for(int i=0;i<imagesList.length;i++)
                SizedBox(
                  height: 120,
                  width: imgWidth*0.33,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      LogoAvatar(imageUrl: GetImageBaseUrl()+imagesList[i]["ImagePath"], imageFile: null,height: 100,radius: (imgWidth*0.33)-20),
                      Positioned(
                          top: 0,
                          right: 0,
                          child:  GestureDetector(
                            onTap: (){
                              imagesList.removeAt(i);
                            },
                            child: Container(
                                height: 25,
                                width: 25 ,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle
                                ),
                                child: Center(
                                  child: Icon(Icons.remove,color: Colors.white,size: 20,),
                                )
                            ),
                          )
                      )
                    ],
                  ),
                ),
              for(int i=0;i<imageFileList.length;i++)
                SizedBox(
                  height: 120,
                  width: imgWidth*0.33,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      LogoAvatar(imageUrl: "", imageFile: File(imageFileList[i].path),height: 100,radius: (imgWidth*0.33)-20),
                      Positioned(
                          top: 0,
                          right: 0,
                          child:  GestureDetector(
                            onTap: (){
                              imageFileList.removeAt(i);
                            },
                            child: Container(
                                height: 25,
                                width: 25 ,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle
                                ),
                                child: Center(
                                  child: Icon(Icons.remove,color: Colors.white,size: 20,),
                                )
                            ),
                          )
                      )
                    ],
                  ),
                ),
            ],
          ),
        ))
      ],
    );
  }

  @override
  void clearValues() {
    imageFileList.clear();
  }

  @override
  String getDataName() {
    return dataname;
  }

  @override
  int getOrderBy() {
    return orderBy.value;
  }

  @override
  String getType() {
    return "multiImage";
  }

  @override
  getValue() async{
    List<dynamic> images=[];
    if(imageFileList.isNotEmpty){
      String files=await MyHelper.uploadMultiFile(folder, imageFileList.value);
      files.split(",").forEach((element) {
        images.add({"FolderName":folder,"ImageFileName":element,"ImagePath":"$folder/$element"});
      });
    }
    if(imagesList.isNotEmpty){
      images.addAll(imagesList);
    }
    return images;
  }

  @override
  setOrderBy(int oBy) {
    orderBy.value=oBy;
  }

  @override
  setValue(value) {
    //console("mutiImageSset $value ${HE_IsList(value)}");
    if(HE_IsList(value)){
      imagesList.value=value;
    }
  }

  @override
  bool validate() {
    isValid.value=imageFileList.isNotEmpty || imagesList.isNotEmpty;
    return isValid.value;
  }
}