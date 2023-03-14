import 'package:flutter/material.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/models/camera_item.dart';

class DetectionTile extends StatelessWidget {
  final CameraItem cameraItem;

  const DetectionTile({Key? key, required this.cameraItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).primaryColorLight,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            cameraItem.image,
            width: 52,
            alignment: Alignment.bottomLeft,
          ),
          const SizedBox(
            width: 22,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 22,
              ),
              Text(
                cameraItem.title,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '09:38:25',
                style:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
              ),
              const SizedBox(
                height: 22,
              ),
            ],
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0),
            child: CustomButton(
              icon: 'assets/icons/ic_playicon.png',
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              iconSize: 14,
              iconGap: 0,
              label: '',
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
