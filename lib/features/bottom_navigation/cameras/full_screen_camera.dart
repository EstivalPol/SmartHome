import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/detection_tile.dart';
import 'package:smart_house/generated/l10n.dart';
import 'package:smart_house/models/camera_item.dart';

class FullScreenCamera extends StatefulWidget {
  const FullScreenCamera({Key? key}) : super(key: key);

  @override
  State<FullScreenCamera> createState() => _FullScreenCameraState();
}

class _FullScreenCameraState extends State<FullScreenCamera> {
  final DateFormat formattedDate = DateFormat('k:mm');

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final List<CameraItem> cameras = [
      CameraItem(s.motion_detected, 'assets/icons/ic_motion.png'),
      CameraItem(s.sound_detected, 'assets/icons/ic_sound.png'),
    ];
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/cameras/thief.png',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.black.withOpacity(0.5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
            actions: [
              buildActionsItem(
                child: Image.asset(
                  'assets/icons/ic_motion_white.png',
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              buildActionsItem(
                child: Image.asset(
                  'assets/icons/ic_camera.png',
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              buildActionsItem(
                padding: 14,
                child: const CircleAvatar(
                  backgroundColor: Colors.red,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
          Positioned(
            top: AppBar().preferredSize.height,
            right: 0,
            left: MediaQuery.of(context).size.width / 2,
            bottom: 140,
            child: ListView.builder(
              itemCount: cameras.length,
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => DetectionTile(
                cameraItem: cameras[index],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 40,
            right: 40,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppTheme.whiteTextColor.withOpacity(0.3),
                  child: Image.asset(
                    'assets/icons/ic_prev.png',
                    height: 15,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                CircleAvatar(
                  backgroundColor: AppTheme.whiteTextColor.withOpacity(0.3),
                  child: Image.asset(
                    'assets/device_control/ic_pause.png',
                    height: 15,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                CircleAvatar(
                  backgroundColor: AppTheme.whiteTextColor.withOpacity(0.3),
                  child: Image.asset(
                    'assets/icons/ic_next.png',
                    height: 15,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  'assets/icons/ic_setting.png',
                  height: 20,
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    'assets/icons/ic_half.png',
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Column(
              children: [
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
                  value: 0.4,
                  backgroundColor: Theme.of(context).primaryColorLight,
                  color: AppTheme.whiteTextColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildActionsItem({required Widget child, double? padding}) {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all(padding ?? 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.whiteTextColor.withOpacity(0.4),
      ),
      child: child,
    );
  }
}
