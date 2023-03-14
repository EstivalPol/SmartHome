import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/components/detection_tile.dart';
import 'package:smart_house/generated/l10n.dart';
import 'package:smart_house/models/camera_item.dart';
import 'package:smart_house/routes/routes.dart';
// import 'package:smart_house/utils/widgets.dart';
// import 'package:screenshot/screenshot.dart';
// import 'package:video_player/video_player.dart';

// import '../../../utils/video_player_widget.dart';

class CameraInfoScreen extends StatefulWidget {
  const CameraInfoScreen({Key? key}) : super(key: key);

  @override
  State<CameraInfoScreen> createState() => _CameraInfoScreenState();
}

class _CameraInfoScreenState extends State<CameraInfoScreen> {
  bool isPaused = true;
  double loaderValue = 0.4;
  final DateFormat formattedDate = DateFormat('k:mm');

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final List<CameraItem> cameras = [
      CameraItem(s.motion_detected, 'assets/icons/ic_motion.png'),
      CameraItem(s.sound_detected, 'assets/icons/ic_sound.png'),
      CameraItem(s.motion_detected, 'assets/icons/ic_motion.png'),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              s.living_room_cam,
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              s.click_to_change_camera,
              style:
                  Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
            ),
          ],
        ),
        actions: [
          Container(
            width: 35,
            height: 35,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: AppTheme.poppedDecoration(
              borderRadius: 10,
            ),
            child: Icon(
              Icons.keyboard_arrow_down,
              color: AppTheme.whiteTextColor,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Image.asset(
                'assets/cameras/thief.png',
                width: double.infinity,
              ),
              Positioned(
                left: 14,
                top: 14,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 4,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        s.live,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 10),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 32,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/ic_setting.png',
                      height: 20,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        PageRoutes.fullScreenCamera,
                      ),
                      child: Image.asset(
                        'assets/icons/ic_full.png',
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              const Spacer(),
              CustomButton(
                onTap: () {
                  setState(() {
                    loaderValue -= 0.1;
                  });
                },
                icon: 'assets/icons/ic_prev.png',
                iconSize: 15,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                label: '',
                iconGap: 0,
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  setState(() {
                    isPaused = !isPaused;
                  });
                },
                icon: isPaused
                    ? 'assets/icons/ic_pause.png'
                    : 'assets/icons/ic_playicon.png',
                iconSize: 15,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                label: '',
                iconGap: 0,
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  setState(() {
                    loaderValue += 0.1;
                  });
                },
                icon: 'assets/icons/ic_next.png',
                iconSize: 15,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                label: '',
                iconGap: 0,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, bottom: 8, top: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(40),
                  ),
                  color: Theme.of(context).primaryColorDark,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomButton(
                      icon: 'assets/icons/ic_camera.png',
                      iconSize: 15,
                      padding: EdgeInsets.all(14),
                      label: '',
                      iconGap: 0,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: const [
                        CustomButton(
                          width: 44,
                          padding: EdgeInsets.all(14),
                          label: '',
                          iconGap: 0,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 6,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppTheme.whiteTextColor,
                      size: 12,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 22),
            decoration: AppTheme.insetDecoration(borderRadius: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => Text(
                  formattedDate.format(
                    DateTime.now().add(
                      Duration(minutes: index * 5),
                    ),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 14),
                ),
              ),
            ),
          ),
          LinearProgressIndicator(
            value: loaderValue,
            backgroundColor: Theme.of(context).primaryColorLight,
            color: AppTheme.whiteTextColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 34,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: AppTheme.whiteTextColor,
                  size: 12,
                ),
                Text(
                  '16 June 2022',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                      ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.whiteTextColor,
                  size: 12,
                ),
              ],
            ),
          ),
          ListView.builder(
            itemCount: cameras.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => DetectionTile(
              cameraItem: cameras[index],
            ),
          ),
        ],
      ),
    );
  }
}

// class AssetPlayerWidget extends StatefulWidget {
//   @override
//   _AssetPlayerWidgetState createState() => _AssetPlayerWidgetState();
// }

// class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
//   final asset = 'assets/video.mp4';
//   late VideoPlayerController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = VideoPlayerController.asset(asset)
//       ..addListener(() => setState(() {}))
//       ..setLooping(true)
//       ..initialize().then((_) => controller.play());
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isMuted = controller.value.volume == 0;

//     return Column(
//       children: [
//         VideoPlayerWidget(controller: controller),
//         const SizedBox(height: 32),
//         if (controller != null && controller.value.isInitialized)
//           CircleAvatar(
//             radius: 30,
//             backgroundColor: Colors.red,
//             child: IconButton(
//               icon: Icon(
//                 isMuted ? Icons.volume_mute : Icons.volume_up,
//                 color: Colors.white,
//               ),
//               onPressed: () => controller.setVolume(isMuted ? 1 : 0),
//             ),
//           )
//       ],
//     );
//   }
// }
