import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/components/entry_field.dart';
import 'package:smart_house/generated/l10n.dart';

class AddDeviceInfo extends StatelessWidget {
  const AddDeviceInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.textFieldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).viewPadding.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  color: AppTheme.textFieldBackgroundColor,
                  child: Image.asset(
                    'assets/devices/ic_camera.png',
                    height: 150,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'PXD BX ${s.camera}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'CCTV ${s.camera}',
                style:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildConnectionStatus(
                        context,
                        '${s.connecting}...',
                        true,
                      ),
                      buildConnectionStatus(
                        context,
                        s.signal_checking,
                        false,
                      ),
                      buildConnectionStatus(
                        context,
                        s.network_setup,
                        false,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: EntryField(
                  label: s.name_this_device,
                  initialValue: s.parking_camera,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: EntryField(
                  label: s.select_room,
                  initialValue: s.front_yard,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Row(
                children: [
                  const Spacer(),
                  CustomButton(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    borderRadius: 10,
                    icon: "assets/icons/check.png",
                    label: s.done,
                    width: 140,
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildConnectionStatus(
      BuildContext context, String text, bool isCompleted) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check,
            color: isCompleted
                ? const Color(0xff64df28)
                : AppTheme.lightGreyColor.withOpacity(0.7),
            size: 14,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 10,
                  color: isCompleted
                      ? null
                      : AppTheme.lightGreyColor.withOpacity(0.7),
                ),
          )
        ],
      ),
    );
  }
}
