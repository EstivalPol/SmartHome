import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/components/device_info_header.dart';
import 'package:smart_house/generated/l10n.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'dart:math' as math;

import 'package:timer_count_down/timer_count_down.dart';

import '../../../../utils/constants.dart';

class SpeakerInfoScreen extends StatefulWidget {
  const SpeakerInfoScreen({Key? key}) : super(key: key);

  @override
  State<SpeakerInfoScreen> createState() => _SpeakerInfoScreenState();
}

const SizedBox heightSpace40 = SizedBox(height: 40);

class _SpeakerInfoScreenState extends State<SpeakerInfoScreen> {
  bool isPaused = true;
  bool isMusicPlaying = true;
  final CountdownController _controller = CountdownController(autoStart: true);
  double _volumeLvl = 50;

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
            image: 'assets/devices/blutooth.png',
            title: s.bluetooth_speaker,
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
          heightSpace40,
          Stack(
            alignment: Alignment.center,
            children: [
              const CircleAvatar(
                radius: 78,
                backgroundColor: Color.fromRGBO(2, 2, 2, 0.298),
                backgroundImage: AssetImage(singer),
              ),
              SleekCircularSlider(
                initialValue: 113,
                min: 0,
                max: 240,
                appearance: CircularSliderAppearance(
                  size: 200,
                  startAngle: 270,
                  angleRange: 360,
                  infoProperties: InfoProperties(
                    mainLabelStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 156, 106, 248),
                        fontFamily: 'M'),
                    modifier: (percentage) {
                      return '0${(percentage / 60).truncate()}:${(percentage % 60).truncate()}';
                    },
                  ),
                  customWidths: CustomSliderWidths(
                    trackWidth: 12,
                    progressBarWidth: 12,
                    handlerSize: 5,
                  ),
                  customColors: CustomSliderColors(
                    dotColor: Colors.white,
                    progressBarColors: [
                      const Color.fromARGB(255, 89, 0, 255),
                      const Color.fromARGB(255, 89, 0, 255),
                      const Color.fromARGB(255, 117, 187, 245),
                      const Color.fromARGB(255, 117, 187, 245),
                    ],
                    trackColor: const Color(0xffE5EBF3),
                    hideShadow: true,
                  ),
                ),
                onChange: (double value) {},
              ),
            ],
          ),
          heightSpace30,
          Text(
            'Until Last Breath',
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
          ),
          heightSpace10,
          Text(
            'Bruno Luice',
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
          ),
          heightSpace10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${s.vol}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 17),
                ),
                Text(
                  '${_volumeLvl.toStringAsFixed(0)}%',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 17),
                ),
              ],
            ),
          ),
          SliderTheme(
            data: const SliderThemeData(
              trackHeight: 7,
            ),
            child: Slider(
              activeColor: Color.fromARGB(255, 0, 68, 255),
              inactiveColor: Color.fromARGB(248, 136, 167, 255),
              value: _volumeLvl,
              onChanged: (value) {
                setState(() {});
                _volumeLvl = value;
              },
              min: 0,
              max: 100,
            ),
          ),
          heightSpace15,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: -math.pi,
                child: GestureDetector(
                  onTap: () {
                    _controller.restart();
                  },
                  child: Icon(
                    Icons.double_arrow,
                    size: 50,
                    color: white,
                  ),
                ),
              ),
              widthSpace30,
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Color.fromARGB(255, 0, 68, 255), white],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                  GestureDetector(
                    onTap: isMusicPlaying
                        ? () {
                            setState(() {
                              isMusicPlaying = !isMusicPlaying;
                            });
                            _controller.pause();
                          }
                        : () {
                            setState(() {
                              isMusicPlaying = !isMusicPlaying;
                            });
                            _controller.start();
                          },
                    child: Icon(
                      isMusicPlaying ? Icons.pause : Icons.play_arrow,
                      color: white,
                    ),
                  )
                ],
              ),
              widthSpace30,
              GestureDetector(
                onTap: () {
                  _controller.restart();
                },
                child: Icon(
                  Icons.double_arrow,
                  size: 50,
                  color: white,
                ),
              )
            ],
          ),
          heightSpace25,
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
        ],
      ),
    );
  }

  void launch(String s) {}
}
