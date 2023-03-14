import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/menu_popup.dart';
import 'package:smart_house/features/bottom_navigation/account/account_screen.dart';
import 'package:smart_house/features/bottom_navigation/cameras/cameras_screen.dart';
import 'package:smart_house/features/bottom_navigation/devices/devices_screen.dart';
import 'package:smart_house/features/bottom_navigation/rooms/rooms_screen.dart';
import 'package:smart_house/generated/l10n.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  static String bottomIconRooms = 'assets/footer/ic_rooms.png';

  static String bottomIconDevices = 'assets/footer/ic_devices.png';

  static String bottomIconCamera = 'assets/footer/ic_camera.png';

  static String bottomIconAccount = 'assets/footer/ic_account.png';

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    final List<BarItem> barItems = [
      BarItem(
        text: s.rooms,
        image: bottomIconRooms,
      ),
      BarItem(
        text: s.devices,
        image: bottomIconDevices,
      ),
      BarItem(
        text: s.cameras,
        image: bottomIconCamera,
      ),
      BarItem(
        text: s.account,
        image: bottomIconAccount,
      ),
    ];

    final List<Widget> children = [
      const RoomsScreen(),
      const DevicesScreen(),
      const CamerasScreen(),
      const AccountScreen(),
    ];
    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: AnimatedBottomBar(
          barItems: barItems,
          onBarTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem>? barItems;
  final Function? onBarTap;

  const AnimatedBottomBar({
    Key? key,
    this.barItems,
    this.onBarTap,
  }) : super(key: key);

  @override
  AnimatedBottomBarState createState() => AnimatedBottomBarState();
}

class AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 0;
  Duration duration = const Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> barItems = [];
    for (int i = 0; i < widget.barItems!.length; i++) {
      BarItem item = widget.barItems![i];
      bool isSelected = selectedBarIndex == i;
      barItems.add(
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            isSelected && i == 0
                ? showDialog(
                    context: context,
                    builder: (context) => const BottomBarMenuPopup())
                : null;
            setState(() {
              selectedBarIndex = i;
              widget.onBarTap!(selectedBarIndex);
            });
          },
          child: AnimatedContainer(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
            duration: duration,
            decoration: isSelected
                ? AppTheme.insetDecoration()
                : AppTheme.poppedDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageIcon(
                  AssetImage(item.image!),
                  color: isSelected
                      ? AppTheme.whiteTextColor
                      : Theme.of(context).secondaryHeaderColor,
                ),
                AnimatedSize(
                  duration: duration,
                  curve: Curves.easeInOut,
                  // vsync: this,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: isSelected ? 18.0 : 0),
                    child: Text(
                      isSelected ? item.text! : "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                if (isSelected && i == 0)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8.0),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppTheme.whiteTextColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    }
    return barItems;
  }
}

class BarItem {
  String? text;
  String? image;

  BarItem({this.text, this.image});
}
