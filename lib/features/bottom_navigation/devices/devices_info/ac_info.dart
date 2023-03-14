import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/components/device_info_header.dart';
import 'package:smart_house/generated/l10n.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ACInfoScreen extends StatefulWidget {
  const ACInfoScreen({Key? key}) : super(key: key);

  @override
  State<ACInfoScreen> createState() => _ACInfoScreenState();
}

class _ACInfoScreenState extends State<ACInfoScreen> {
  int tempValue = 20;

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
            image: 'assets/devices/ac.png',
            title: s.air_condition,
            subTitle: s.living_room,
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
            alignment: Alignment.topCenter,
            children: [
              Center(
                child: Container(
                  width: 400,
                  height: 230,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(200),
                      topRight: Radius.circular(200),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.lightGreyColor,
                        offset: const Offset(0, 1),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        spreadRadius: -0.0,
                        blurRadius: 1,
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.black.withOpacity(0.4),
                        AppTheme.textFieldBackgroundColor,
                      ],
                      stops: const [0.0, 0.2, 0.95],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 24,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      startAngle: 180,
                      endAngle: 360,
                      showLabels: false,
                      showAxisLine: false,
                      showTicks: false,
                      minimum: 0,
                      maximum: 180,
                      ranges: List.generate(
                        15,
                        (index) => index < tempValue / 4
                            ? GaugeRange(
                                startValue: index * 16,
                                endValue: (8 + (16 * index)).toDouble(),
                                color: const Color(0xFF10b3ff)
                                    .withOpacity(1 - (index / 10)),
                                sizeUnit: GaugeSizeUnit.factor,
                                startWidth: 0.07,
                                endWidth: 0.07,
                              )
                            : GaugeRange(
                                startValue: index * 16,
                                endValue: (8 + (16 * index)).toDouble(),
                                color: const Color(0xFF181b21),
                                sizeUnit: GaugeSizeUnit.factor,
                                startWidth: 0.07,
                                endWidth: 0.07,
                              ),
                      ),
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          needleLength: 0.7,
                          needleEndWidth: 50,
                          value: tempValue * 4,
                          needleColor: const Color(0xff43495b),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/device_control/wheel.png',
                        width: 180,
                      ),
                      Wrap(
                        children: [
                          const SizedBox(
                            width: 14,
                          ),
                          Column(
                            children: [
                              Text(
                                tempValue.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 40,
                                    ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                s.cool,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(letterSpacing: 4),
                              ),
                            ],
                          ),
                          Text(
                            '°C',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 14,
                              fontFeatures: [const FontFeature.superscripts()],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      s.cool,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 9, letterSpacing: 4),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomButton(
                      icon: 'assets/device_control/ic_cool.png',
                      iconGap: 0,
                      borderRadius: 10,
                      label: '',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      s.mode,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 9, letterSpacing: 4),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 3,
                ),
                Column(
                  children: [
                    Text(
                      '',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 9, letterSpacing: 4),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomButton(
                          onTap: () {
                            setState(() {
                              tempValue--;
                            });
                          },
                          padding: const EdgeInsets.all(24),
                          materialIcon: Icon(
                            Icons.remove,
                            color: AppTheme.whiteTextColor,
                          ),
                          // icon: 'assets/device_control/ic_cool.png',
                          iconGap: 0,
                          borderRadius: 10,
                          label: '',
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        CustomButton(
                          onTap: () {
                            setState(() {
                              tempValue++;
                            });
                          },
                          padding: const EdgeInsets.all(24),
                          materialIcon: Icon(
                            Icons.add,
                            color: AppTheme.whiteTextColor,
                          ),
                          iconGap: 0,
                          borderRadius: 10,
                          label: '',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      s.set_temp,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 9, letterSpacing: 4),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 3,
                ),
                Column(
                  children: [
                    Text(
                      s.mid,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 9, letterSpacing: 4),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomButton(
                      icon: 'assets/device_control/ic_fan.png',
                      iconGap: 0,
                      borderRadius: 10,
                      label: '',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      s.fan,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 9, letterSpacing: 4),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 2,
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
