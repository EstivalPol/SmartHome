import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/change_scene_header.dart';
import 'package:smart_house/components/common_header.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/generated/l10n.dart';
import 'package:smart_house/models/device_item.dart';
import 'package:smart_house/routes/routes.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({Key? key}) : super(key: key);

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  final ScrollController controller = ScrollController();

  int isLongPressDeviceSelected = 0;
  List<DeviceItem> devices = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.jumpTo(controller.position.maxScrollExtent);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final s = S.of(context);
    devices.addAll([
      DeviceItem(
        'assets/devices/ac.png',
        s.air_condition,
        s.living_room,
        true,
        '22',
        pageRoute: PageRoutes.acInfoScreen,
      ),
      DeviceItem(
        'assets/devices/light.png',
        s.study_light,
        s.bedroom,
        false,
        '05',
        pageRoute: PageRoutes.lightsInfoScreen,
      ),
      DeviceItem(
        'assets/devices/blutooth.png',
        s.music_speaker,
        s.living_room,
        true,
        '22',
        pageRoute: PageRoutes.speakerInfoScreen,
      ),
      DeviceItem(
        'assets/devices/washer.png',
        s.dishwasher,
        s.kitchen,
        false,
        '12',
        pageRoute: PageRoutes.dishwasherInfoScreen,
      ),
      DeviceItem(
        'assets/devices/ic_cleaner.png',
        s.floor_cleaner,
        s.kitchen,
        true,
        '04',
        pageRoute: PageRoutes.cleanerInfoScreen,
      ),
      DeviceItem(
        'assets/devices/ic_television.png',
        s.television,
        s.living_room,
        true,
        '10',
        pageRoute: PageRoutes.televisionInfoScreen,
      ),
    ]);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const ChangeSceneHeader(),
            CommonHeader(controller: controller),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isLongPressDeviceSelected > 0
                              ? '$isLongPressDeviceSelected ${s.selected}'
                              : '16 ${s.devices}',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 17,
                                  ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          isLongPressDeviceSelected > 0
                              ? s.tap_on_device_selected
                              : s.long_press_to_manage,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  if (isLongPressDeviceSelected < 1)
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, PageRoutes.searchDevices),
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        decoration: AppTheme.insetDecoration(),
                        child: ImageIcon(
                          const AssetImage('assets/icons/ic_search.png'),
                          color: AppTheme.whiteTextColor,
                          size: 18,
                        ),
                      ),
                    )
                  else
                    CustomButton(
                      onTap: () => Navigator.pushNamed(
                        context,
                        PageRoutes.removeDevicesScreen,
                      ),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 10),
                      padding: const EdgeInsets.only(
                          top: 14, bottom: 14, left: 18, right: 18),
                      icon: 'assets/icons/ic_remove.png',
                      iconSize: 16,
                      iconGap: 10,
                      label: s.remove,
                    ),
                  const SizedBox(
                    width: 12,
                  ),
                  if (isLongPressDeviceSelected < 1)
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, PageRoutes.searchDevices),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: AppTheme.insetDecoration(),
                        child: Icon(
                          Icons.add,
                          color: AppTheme.whiteTextColor,
                          size: 20,
                        ),
                      ),
                    )
                  else
                    CustomButton(
                      onTap: () => Navigator.pushNamed(
                          context, PageRoutes.moveDevicesScreen),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 10),
                      padding: const EdgeInsets.only(
                          top: 14, bottom: 14, left: 18, right: 18),
                      icon: 'assets/icons/ic_move.png',
                      iconSize: 16,
                      iconGap: 10,
                      label: s.move,
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            FadedSlideAnimation(
              fadeDuration: const Duration(milliseconds: 300),
              slideDuration: const Duration(milliseconds: 150),
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 265,
                child: ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  itemCount: devices.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onLongPress: () => setState(() {
                      devices[index].isLongPressed =
                          !devices[index].isLongPressed;
                      devices[index].isLongPressed
                          ? isLongPressDeviceSelected++
                          : isLongPressDeviceSelected--;
                    }),
                    onTap: () => setState(() {
                      if (isLongPressDeviceSelected > 0) {
                        devices[index].isLongPressed =
                            !devices[index].isLongPressed;
                        devices[index].isLongPressed
                            ? isLongPressDeviceSelected++
                            : isLongPressDeviceSelected--;
                      } else {
                        Navigator.pushNamed(context, devices[index].pageRoute);
                      }
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Theme.of(context).primaryColorLight,
                      ),
                      padding: const EdgeInsetsDirectional.only(
                        end: 20,
                      ),
                      margin: const EdgeInsetsDirectional.only(top: 7),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Image.asset(
                              devices[index].image,
                              height: 100,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                devices[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 14),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                devices[index].location,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(fontSize: 10),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.wifi,
                                    color: const Color(0x4cffffff).withOpacity(
                                        devices[index].isConnected ? 1 : 0.5),
                                    size: 10,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    devices[index].isConnected
                                        ? s.connected
                                        : s.disconnected,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          fontSize: 10,
                                          color: AppTheme.whiteTextColor
                                              .withOpacity(
                                                  devices[index].isConnected
                                                      ? 1
                                                      : 0.5),
                                        ),
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  const Icon(
                                    Icons.bolt,
                                    color: Color(0x4cffffff),
                                    size: 10,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${devices[index].powerConsumption} kWh',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          devices[index].isLongPressed
                              ? Container(
                                  padding: const EdgeInsets.all(18),
                                  decoration: AppTheme.insetDecoration(
                                      borderRadius: 10),
                                  child: const Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: Color(0xff17bb96),
                                  ),
                                )
                              : isLongPressDeviceSelected > 0
                                  ? const CustomButton(
                                      isOnlyIcon: true,
                                      icon: 'assets/icons/circle.png',
                                      borderRadius: 10,
                                      width: 60,
                                      padding: EdgeInsets.all(20),
                                      iconSize: 20,
                                      iconColor: Color(0x33ffffff),
                                    )
                                  : const CustomButton(
                                      isOnlyIcon: true,
                                      icon: 'assets/icons/ic_power.png',
                                      borderRadius: 10,
                                      width: 60,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 10,
                                      ),
                                      iconSize: 40,
                                    ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
