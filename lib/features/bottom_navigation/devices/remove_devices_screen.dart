import 'package:flutter/material.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/generated/l10n.dart';
import 'package:smart_house/models/move_device.dart';

class RemoveDevicesScreen extends StatefulWidget {
  const RemoveDevicesScreen({Key? key}) : super(key: key);

  @override
  State<RemoveDevicesScreen> createState() => _RemoveDevicesScreenState();
}

class _RemoveDevicesScreenState extends State<RemoveDevicesScreen> {
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
                s.remove_devices,
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
                  const Spacer(),
                  Text(
                    s.are_you_sure,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 17, height: 1.6),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    s.yes_you_can_add_later,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          mainAxisAlignment: MainAxisAlignment.center,
                          icon: 'assets/icons/ic_remove.png',
                          label: s.cancel,
                          labelStyle: Theme.of(context).textTheme.bodyText2,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: CustomButton(
                          mainAxisAlignment: MainAxisAlignment.center,
                          icon: 'assets/icons/ic_remove.png',
                          label: s.remove,
                          labelStyle: Theme.of(context).textTheme.bodyText2,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64.0),
                    child: Text(
                      s.instead_you_can_move,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
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
