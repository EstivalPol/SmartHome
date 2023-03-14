import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/widgets.dart';
import '../../../utils/constants.dart';
import '../../language/language_constant.dart';

class SucessfullyAddedDevicePage extends StatelessWidget {
  const SucessfullyAddedDevicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: DoubleBackToCloseApp(
        snackBar: SnackBar(
          duration: const Duration(seconds: 1),
          backgroundColor: primaryColor,
          content: Text(
            translation(context).pressBackAgain,
            style: whiteSemiBold14,
          ),
        ),
        child: Container(
          color: white,
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, '/BottomNavigation');
                  },
                  child: Text(translation(context).backToHome,
                      style: blackMedium16)),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 43.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: colorB4.withOpacity(.50)),
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 35.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: colorB4.withOpacity(.50)),
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 27.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: colorB4.withOpacity(.50)),
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 19.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: colorB4.withOpacity(.50)),
                        shape: BoxShape.circle),
                  ),
                  Container(
                    height: 11.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: colorB4.withOpacity(.50)),
                        shape: BoxShape.circle),
                  ),
                  Icon(
                    Icons.check,
                    size: 5.h,
                    color: primaryColor,
                  )
                ],
              ),
              Positioned(
                right: 55,
                child: Row(
                  children: [
                    Column(
                      children: [
                        MyContainerWithChild(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          height: 7.h,
                          child: Image.asset(searchedDevice),
                        ),
                        // heightSpace2,
                        Text('Mi cam', style: blackMedium16)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          heightSpace30,
          Text(translation(context).deviceAddSuccess, style: primarySemiBold18)
        ],
      ),
    );
  }
}
