import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/components/device_info_header.dart';
import 'package:smart_house/generated/l10n.dart';

class DishwasherInfoScreen extends StatefulWidget {
  const DishwasherInfoScreen({Key? key}) : super(key: key);

  @override
  State<DishwasherInfoScreen> createState() => _DishwasherInfoScreenState();
}

class _DishwasherInfoScreenState extends State<DishwasherInfoScreen> {
  bool isPaused = true;
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
            image: 'assets/devices/washer.png',
            title: s.dishwasher,
            subTitle: s.kitchen,
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
          Flexible(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: 230,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 230,
                  width: 230,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        decoration: AppTheme.insetDecoration(borderRadius: 150),
                      ),
                      Positioned(
                        left: 14,
                        right: 14,
                        top: 14,
                        bottom: 14,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff65ce25),
                                Color(0xff36a3ff),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        right: 20,
                        top: 20,
                        bottom: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          height: 150,
                          width: 150,
                          padding: const EdgeInsets.all(8),
                        ),
                      ),
                      Positioned(
                        left: 34,
                        right: 34,
                        top: 34,
                        bottom: 34,
                        child: Container(
                          decoration:
                              AppTheme.poppedDecoration(borderRadius: 150),
                          height: 150,
                          width: 150,
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '3:26',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 40),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                'SANI RISE',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      fontSize: 10,
                                      letterSpacing: 4,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 9,
                        child: CircleAvatar(
                          backgroundColor: AppTheme.whiteTextColor,
                          radius: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  child: SizedBox(
                    height: 60,
                    child: CustomButton(
                      onTap: () {
                        setState(() {
                          isPaused = !isPaused;
                        });
                      },
                      icon: isPaused
                          ? 'assets/device_control/ic_pause.png'
                          : 'assets/icons/ic_playicon.png',
                      iconGap: 0,
                      label: '',
                      width: 110,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onTap: () {
                  setState(() {
                    isPaused = false;
                  });
                },
                borderRadius: 10,
                label: s.light_wash,
                width: 140,
              ),
              const SizedBox(
                width: 14,
              ),
              CustomButton(
                onTap: () {
                  setState(() {
                    isPaused = false;
                  });
                },
                borderRadius: 10,
                label: s.normal_wash,
                width: 140,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onTap: () {
                  setState(() {
                    isPaused = false;
                  });
                },
                borderRadius: 10,
                label: s.hi_temp_wash,
                width: 140,
              ),
              const SizedBox(
                width: 14,
              ),
              CustomButton(
                onTap: () {
                  setState(() {
                    isPaused = false;
                  });
                },
                borderRadius: 10,
                label: s.rinse_only,
                width: 140,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
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
