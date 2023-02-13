
import 'package:flutter/material.dart';

import '../utils/sizeLocal.dart';

class InnerShadowTBContainer extends StatelessWidget {

  double height;
  double width;
  Widget child;

  InnerShadowTBContainer({required this.height,required this.width,required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          child,
          Container(
            height: 15,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors:[
                  Color(0XFFF7F7FF),
                  Color(0XFFF7F7FF).withOpacity(0),
                ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),

          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 15,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors:[
                    Colors.white,
                    Colors.white.withOpacity(0),
                  ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter
                  )
              ),

            ),
          ),
        ],
      ),
    );
  }
}
