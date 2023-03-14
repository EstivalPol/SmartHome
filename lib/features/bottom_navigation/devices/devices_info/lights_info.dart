import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/device_info_header.dart';
import 'package:smart_house/generated/l10n.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/constants.dart';

class LightsInfoScreen extends StatefulWidget {
  const LightsInfoScreen({Key? key}) : super(key: key);

  @override
  State<LightsInfoScreen> createState() => _LightsInfoScreenState();
}

// Lights text style
// ignore: prefer_const_constructors
TextStyle primaryMedium22 = TextStyle(
  fontFamily: 'M',
  fontSize: 15.5,
  color: const Color(0xffAE835B),
);
// ignore: prefer_const_constructors
TextStyle primaryMedium12 = TextStyle(
  fontFamily: 'M',
  fontSize: 8.4,
  color: const Color(0xffAE835B),
);

bool isSmartLampOn = true;

class _LightsInfoScreenState extends State<LightsInfoScreen> {
  double sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Column(
        children: [
          DeviceInfoHeader(
            image: 'assets/devices/light.png',
            title: s.study_light,
            subTitle: s.bedroom,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 20,
                  top: 20,
                ),
                padding: const EdgeInsets.all(10),
                decoration: AppTheme.insetDecoration(),
                child: Image.asset(
                  'assets/icons/ic_setting.png',
                  height: 20,
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              ColorPicker(
                // showLabel: ,
                pickerColor: const Color(0xff443a49),
                onColorChanged: (value) {},
                labelTypes: const [],
                onHsvColorChanged: (value) {},
                paletteType: PaletteType.hueWheel,
                // portraitOnly:,
                colorPickerWidth: 300,
                // colorHistory: [amber],
                pickerAreaHeightPercent: 1,
                enableAlpha: false,
                displayThumbColor: true,
                hexInputBar: true,
              ),
              Positioned(
                top: 90,
                child: Container(
                  alignment: Alignment.center,
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 54, 49, 56),
                    shape: BoxShape.circle,
                  ),
                  child: Text.rich(
                    TextSpan(text: '45', style: primaryMedium22, children: [
                      TextSpan(
                        text: '\u33d0',
                        style: primaryMedium12,
                      )
                    ]),
                  ),
                ),
              )
            ],
          ),
          // Flexible(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 48.0),
          //     child: Image.asset(
          //       'assets/device_control/color_wheel.png',
          //       // width: 256,
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 32,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
          //   child: Row(
          //     children: [
          //       Text(
          //         '1%',
          //         style: Theme.of(context)
          //             .textTheme
          //             .caption!
          //             .copyWith(letterSpacing: 4),
          //       ),
          //       const Spacer(),
          //       Text(
          //         '100%',
          //         style: Theme.of(context)
          //             .textTheme
          //             .caption!
          //             .copyWith(letterSpacing: 4),
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   height: 12,
          // ),
          // Stack(
          //   children: [
          //     Container(
          //       decoration: AppTheme.poppedDecoration(),
          //       height: 48,
          //       margin: const EdgeInsets.symmetric(horizontal: 22),
          //     ),
          //     SliderTheme(
          //       data: SliderThemeData(
          //         overlayShape: SliderComponentShape.noThumb,
          //         trackHeight: 48,
          //         activeTrackColor: AppTheme.whiteTextColor,
          //         thumbColor: AppTheme.whiteTextColor,
          //         inactiveTrackColor: Colors.transparent,
          //         thumbShape: const RoundSliderThumbShape(
          //             enabledThumbRadius: 25, elevation: 0),
          //       ),
          //       child: Slider(
          //         value: sliderValue,
          //         onChanged: (val) {
          //           setState(() {
          //             sliderValue = val;
          //           });
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 18,
          // ),
          // Text(
          //   s.set_brightness,
          //   style:
          //       Theme.of(context).textTheme.caption!.copyWith(letterSpacing: 4),
          // ),
          heightSpace20,
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: AppTheme.insetDecoration(
                borderRadius: 10,
              ),
              child: Image.asset(
                'assets/icons/ic_poweron.png',
                width: 40,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
