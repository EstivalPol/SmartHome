import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/change_scene_header.dart';
import 'package:smart_house/components/common_header.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/generated/l10n.dart';
import 'package:smart_house/models/room_item.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({Key? key}) : super(key: key);

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  bool isSettingsOpen = false;
  final ScrollController controller = ScrollController();
  final List<RoomItem> roomItems = [];

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
    roomItems.addAll([
      RoomItem('assets/devices/ic_ac.png', s.air_conditioner, s.connected, true,
          AppTheme.powerOnColor1),
      RoomItem('assets/devices/ic_light.png', s.study_light, s.connected, true,
          AppTheme.powerOnColor2),
      RoomItem('assets/devices/ic_speaker.png', s.music, s.disconnected, false,
          AppTheme.powerOnColor3),
      RoomItem('assets/devices/ic_television.png', s.television, s.disconnected,
          false, AppTheme.powerOnColor4),
      RoomItem('assets/devices/ic_smartspeaker.png', s.amazon_alexa,
          s.connected, true, AppTheme.powerOnColor5),
      RoomItem('assets/devices/ic_cleaner.png', s.floor_cleaner, s.disconnected,
          false, AppTheme.powerOnColor6),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.living_room,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 17,
                            ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        '8 ${s.devices}',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSettingsOpen = true;
                      });
                      showDialog(
                        context: context,
                        builder: (context) => buildSettingsDialog(context),
                      ).then((value) {
                        setState(() {
                          isSettingsOpen = false;
                        });
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: AppTheme.insetDecoration(),
                      child: isSettingsOpen
                          ? Icon(
                              Icons.close,
                              color: AppTheme.whiteTextColor,
                              size: 20,
                            )
                          : Image.asset(
                              'assets/icons/ic_setting.png',
                              height: 20,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadedSlideAnimation(
              fadeDuration: const Duration(milliseconds: 300),
              slideDuration: const Duration(milliseconds: 150),
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 270,
                child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  itemCount: roomItems.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 7,
                    crossAxisSpacing: 7,
                  ),
                  itemBuilder: (context, index) =>
                      buildRoomItem(index, context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Dialog buildSettingsDialog(BuildContext context) {
    final s = S.of(context);
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      alignment: AlignmentDirectional.topEnd,
      backgroundColor: const Color(0xff7d8698).withOpacity(0.4),
      insetPadding: const EdgeInsets.only(
        right: 20,
        top: 160,
      ),
      child: Container(
        width: 220,
        height: 290,
        padding: const EdgeInsets.all(12.0),
      ).blurred(
        borderRadius: BorderRadius.circular(24),
        blur: 10,
        blurColor: const Color(0xff7d8698),
        colorOpacity: 0.2,
        overlay: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildMenuItem(s.switch_off_all_devices),
            buildMenuItem(s.edit_room),
            buildMenuItem(s.add_remove_device),
            buildMenuItem(s.add_room),
            buildMenuItem(s.remove_room),
          ],
        ),
      ),
    );
  }

  Padding buildMenuItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 12,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
      ),
    );
  }

  ///builds item in grid
  Stack buildRoomItem(int index, BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(roomItems[index].image)),
            borderRadius: BorderRadius.circular(4),
            color: roomItems[index].isPowerOn
                ? roomItems[index].powerColor
                : Theme.of(context).primaryColorLight,
          ),
          duration: const Duration(milliseconds: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                roomItems[index].title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 13),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                roomItems[index].subtitle,
                style: Theme.of(context).textTheme.caption,
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  onTap: () => setState(() {
                    roomItems[index].isPowerOn = !roomItems[index].isPowerOn;
                  }),
                  icon: roomItems[index].isPowerOn
                      ? 'assets/icons/ic_poweron.png'
                      : 'assets/icons/ic_power.png',
                  label: '',
                  isOnlyIcon: true,
                  borderRadius: 10,
                  width: 60,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  iconSize: 40,
                  boxDecoration: roomItems[index].isPowerOn
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.textFieldBackgroundColor
                                  .withOpacity(0.6),
                              offset: const Offset(0, -1),
                            ),
                            BoxShadow(
                              color:
                                  roomItems[index].powerColor.withOpacity(0.7),
                              spreadRadius: -0.0,
                              blurRadius: 1,
                            ),
                          ],
                        )
                      : null,
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            roomItems[index].isPowerOn = !roomItems[index].isPowerOn;
          }),
          child: Container(
            decoration: BoxDecoration(
              gradient: roomItems[index].isPowerOn
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      colors: [
                        AppTheme.whiteTextColor.withOpacity(0.2),
                        AppTheme.whiteTextColor.withOpacity(0.08),
                        // Colors.transparent,
                      ],
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
