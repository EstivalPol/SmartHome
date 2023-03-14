import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/change_scene_header.dart';
import 'package:smart_house/components/common_header.dart';
import 'package:smart_house/generated/l10n.dart';
import 'package:smart_house/models/camera_item.dart';
import 'package:smart_house/routes/routes.dart';

class CamerasScreen extends StatefulWidget {
  const CamerasScreen({Key? key}) : super(key: key);

  @override
  State<CamerasScreen> createState() => _CamerasScreenState();
}

class _CamerasScreenState extends State<CamerasScreen> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.jumpTo(controller.position.maxScrollExtent);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final List<CameraItem> cameraDevices = [
      CameraItem(s.living_room, 'assets/cameras/thief.png'),
      CameraItem(s.dining_room, 'assets/cameras/scene1.png'),
      CameraItem(s.front_yard, 'assets/cameras/scene2.png'),
      CameraItem(s.back_yard, 'assets/cameras/scene3.png'),
    ];
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
            FadedSlideAnimation(
              fadeDuration: const Duration(milliseconds: 300),
              slideDuration: const Duration(milliseconds: 150),
              beginOffset: const Offset(0, 0.3),
              endOffset: const Offset(0, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 205,
                child: ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  itemCount: cameraDevices.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      PageRoutes.cameraInfoScreen,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            cameraDevices[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 17),
                          ),
                          subtitle: Text(
                            s.click_to_play,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: AppTheme.insetDecoration(),
                            child: Image.asset(
                              'assets/icons/ic_setting.png',
                              height: 20,
                            ),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                cameraDevices[index].image,
                                width: double.infinity,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppTheme.whiteTextColor, width: 2),
                                shape: BoxShape.circle,
                                color: AppTheme.whiteTextColor.withOpacity(0.3),
                              ),
                              child: Icon(
                                Icons.play_arrow_rounded,
                                color: AppTheme.whiteTextColor,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
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
