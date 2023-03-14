import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/device_info_header.dart';
import 'package:smart_house/generated/l10n.dart';

import 'package:flutter_switch/flutter_switch.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/widgets.dart';

class TelevisionInfoScreen extends StatefulWidget {
  const TelevisionInfoScreen({Key? key}) : super(key: key);

  @override
  State<TelevisionInfoScreen> createState() => _TelevisionInfoScreenState();
}

class _TelevisionInfoScreenState extends State<TelevisionInfoScreen> {
  bool isPaused = true;
  bool _isVolumeOff = false;
  bool _channelSwitch = false;

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
            image: 'assets/devices/ic_television.png',
            title: s.television,
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
          heightSpace80,
          MyContainerWithChild(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 183,
                      width: 60,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 120,
                            width: 40,
                            color: const Color(0xffD9D9D9),
                            child: Text('Vol',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 16)),
                          ),
                          const Positioned(
                            top: 0,
                            child: MyContainerWithChild(
                              padding: EdgeInsets.all(10),
                              borderRadius: 30,
                              child: Icon(Icons.add, color: secondaryColor),
                            ),
                          ),
                          const Positioned(
                            bottom: 0,
                            child: MyContainerWithChild(
                              padding: EdgeInsets.all(10),
                              borderRadius: 30,
                              child: Icon(Icons.remove, color: secondaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _isVolumeOff = !_isVolumeOff;
                          });
                        },
                        child: Icon(Icons.volume_off_outlined,
                            size: 30,
                            color: _isVolumeOff ? secondaryColor : color94))
                  ],
                ),
                widthSpace40,
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 20, child: Image.asset(source)),
                            heightSpace5,
                            Text('Source',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 16, color: black)),
                          ],
                        ),
                        const Icon(Icons.mic_none_sharp, color: color94)
                      ],
                    ),
                  ),
                ),
                widthSpace40,
                Column(
                  children: [
                    SizedBox(
                      height: 183,
                      width: 60,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 120,
                            width: 40,
                            color: const Color(0xffD9D9D9),
                            child: Text('Ch',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 16)),
                          ),
                          const Positioned(
                            top: 0,
                            child: MyContainerWithChild(
                              padding: EdgeInsets.all(10),
                              borderRadius: 30,
                              child: Icon(Icons.keyboard_arrow_up,
                                  color: secondaryColor),
                            ),
                          ),
                          const Positioned(
                            bottom: 0,
                            child: MyContainerWithChild(
                              padding: EdgeInsets.all(10),
                              borderRadius: 30,
                              child: Icon(Icons.keyboard_arrow_down,
                                  color: secondaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isVolumeOff = !_isVolumeOff;
                        });
                      },
                      child: FlutterSwitch(
                        activeColor: secondaryColor,
                        width: 48.0,
                        height: 23.5,
                        valueFontSize: 12.0,
                        activeTextFontWeight: FontWeight.w500,
                        activeTextColor: white,
                        inactiveTextFontWeight: FontWeight.w500,
                        toggleSize: 15.0,
                        value: _channelSwitch,
                        showOnOff: true,
                        inactiveText: '123',
                        activeText: '123',
                        // inactiveTextColor: white,

                        onToggle: (val) {
                          setState(() {
                            _channelSwitch = val;
                          });
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
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

  Column buildColumn(BuildContext context, String title, String subtitle) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
        ),
      ],
    );
  }
}
