import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/generated/l10n.dart';
import 'package:smart_house/models/move_device.dart';

class MoveDeviceScreen extends StatefulWidget {
  const MoveDeviceScreen({Key? key}) : super(key: key);

  @override
  State<MoveDeviceScreen> createState() => _MoveDeviceScreenState();
}

class _MoveDeviceScreenState extends State<MoveDeviceScreen> {
  final List<MoveLocation> locationOptions = [];

  @override
  void didChangeDependencies() {
    final s = S.of(context);
    locationOptions.addAll([
      MoveLocation(s.bedroom, false),
      MoveLocation(s.living_room, true),
      MoveLocation(s.kitchen, false),
      MoveLocation(s.parking, false),
      MoveLocation(s.front_yard, false),
    ]);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final List<MoveDevice> deviceOptions = [
      MoveDevice('assets/devices/ac.png', s.air_conditioner, s.living_room),
      MoveDevice('assets/devices/speaker.png', s.smart_speaker, s.dining_room),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Theme.of(context).primaryColorDark,
          centerTitle: true,
          title: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                s.move_devices,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '2 ${s.devices} ${s.selected}',
                style:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              itemCount: deviceOptions.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      deviceOptions[index].image,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          deviceOptions[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          deviceOptions[index].subtitle,
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 14),
              padding: const EdgeInsets.only(
                left: 38,
                right: 38,
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    s.select_where_to_move,
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: locationOptions.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: CustomButton(
                        onTap: () {
                          setState(() {
                            for (var element in locationOptions) {
                              element.isSelected = false;
                            }
                            locationOptions[index].isSelected =
                                !locationOptions[index].isSelected;
                          });
                        },
                        boxDecoration: locationOptions[index].isSelected
                            ? AppTheme.insetDecoration()
                            : null,
                        label: "  ${locationOptions[index].title}",
                        labelStyle: Theme.of(context).textTheme.bodyText2,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
