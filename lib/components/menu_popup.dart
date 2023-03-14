import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/generated/l10n.dart';
import 'package:smart_house/routes/routes.dart';
import '../../../utils/widgets.dart';
import '../../../utils/constants.dart';
import '../features/language/language_constant.dart';
import 'package:sizer/sizer.dart';

class RoomOption {
  String title;
  bool isSelected;

  RoomOption(this.title, this.isSelected);
}

class BottomBarMenuPopup extends StatefulWidget {
  const BottomBarMenuPopup({Key? key}) : super(key: key);

  @override
  State<BottomBarMenuPopup> createState() => _BottomBarMenuPopupState();
}

class _BottomBarMenuPopupState extends State<BottomBarMenuPopup> {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    final List<RoomOption> rooms = [
      RoomOption(s.bedroom, true),
      RoomOption(s.living_room, true),
      RoomOption(s.kitchen, true),
      RoomOption(s.parking, true),
      RoomOption(s.backyard, true),
      RoomOption('+ ${s.add_room}', true),
    ];
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      alignment: AlignmentDirectional.bottomStart,
      backgroundColor: const Color(0xff181c23),
      insetPadding: EdgeInsets.only(
        left: 20,
        right: MediaQuery.of(context).size.width * 0.4,
        bottom: 20,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ImageIcon(
                  const AssetImage('assets/footer/ic_rooms.png'),
                  color: AppTheme.whiteTextColor,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 18.0,
                    end: 24.0,
                  ),
                  child: Text(
                    s.rooms,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ...List.generate(
              rooms.length,
              (index) => menuTile(
                rooms[index].title,
                isSelected: rooms[index].isSelected,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuTile(
    String title, {
    VoidCallback? onTap,
    bool isSelected = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 10,
        ),
        decoration: isSelected ? AppTheme.poppedDecoration() : null,
        child: Text(
          title,
        ),
      ),
    );
  }
}

//   Widget menuTile(BuildContext context,
//       {required bool isSelected, required Null Function() onTap}) {
//     var s = S.of(context);
//     final List<RoomOption> rooms = [
//       RoomOption(s.bedroom, true),
//       RoomOption(s.living_room, true),
//       RoomOption(s.kitchen, true),
//       RoomOption(s.parking, true),
//       RoomOption(s.backyard, true),
//       RoomOption('+ ${s.add_room}', true),
//     ];
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(translation(context).add, style: blackSemiBold18),
//           heightSpace15,
//           Column(
//               children: rooms
//                   .map(
//                     (e) => GestureDetector(
//                       onTap: rooms.indexOf(e) == 0
//                           ? () {
//                               setState(() {
//                                 selectedAddIndex = rooms.indexOf(e);
//                               });
//                               Navigator.popAndPushNamed(
//                                   context, '/AddRoomPage');
//                             }
//                           : () {
//                               setState(() {
//                                 selectedAddIndex = rooms.indexOf(e);
//                               });
//                               Navigator.pop(context);
//                               showModalBottomSheet(
//                                   isScrollControlled: true,
//                                   shape: const RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.only(
//                                     topLeft: Radius.circular(10),
//                                     topRight: Radius.circular(10),
//                                   )),
//                                   context: context,
//                                   builder: (context) => const AddDevice());
//                             },
//                       child: MyContainerWithChild(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 15, vertical: 2),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 MyContainerWithChild(
//                                   height: 3.5.h,
//                                   padding: rooms.indexOf(e) == 1
//                                       ? const EdgeInsets.all(6.5)
//                                       : const EdgeInsets.all(4),
//                                   borderRadius: 5,
//                                   child: Image.asset(
//                                       'assets/icons/ic_setting.png'),
//                                 ),
//                                 widthSpace15,
//                                 Text(e.title, style: blackMedium16),
//                               ],
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   selectedAddIndex = rooms.indexOf(e);
//                                 });
//                                 onTap;
//                               },
//                               child: selectedAddIndex == rooms.indexOf(e)
//                                   ? Container(
//                                       padding: const EdgeInsets.all(8.5),
//                                       height: 3.h,
//                                       width: 3.h,
//                                       decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: primaryColor,
//                                           boxShadow: [
//                                             BoxShadow(
//                                                 blurRadius: 8,
//                                                 color: const Color(0xffAE835B)
//                                                     .withOpacity(.25))
//                                           ]),
//                                       child: Container(
//                                           decoration: const BoxDecoration(
//                                               color: white,
//                                               shape: BoxShape.circle)),
//                                     )
//                                   : MyContainerWithChild(
//                                       height: 2.8.h,
//                                       width: 2.8.h,
//                                       borderRadius: 30,
//                                     ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                   .toList())
//         ],
//       ),
//     );
//   }
// }

// class AddDevice extends StatelessWidget {
//   const AddDevice({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         heightSpace25,
//         Text(
//           translation(context).searchNearByDevice,
//           style: blackMedium18,
//         ),
//         heightSpace50,
//         Stack(
//           children: [
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 Container(
//                   height: 43.h,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: colorB4.withOpacity(.50)),
//                       shape: BoxShape.circle),
//                 ),
//                 Container(
//                   height: 35.h,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: colorB4.withOpacity(.50)),
//                       shape: BoxShape.circle),
//                 ),
//                 Container(
//                   height: 27.h,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: colorB4.withOpacity(.50)),
//                       shape: BoxShape.circle),
//                 ),
//                 Container(
//                   height: 19.h,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: colorB4.withOpacity(.50)),
//                       shape: BoxShape.circle),
//                 ),
//                 Container(
//                   height: 11.h,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: colorB4.withOpacity(.50)),
//                       shape: BoxShape.circle),
//                 ),
//                 Container(
//                   height: 5.h,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: colorB4.withOpacity(.50)),
//                       shape: BoxShape.circle),
//                 ),
//                 Container(
//                   height: 1.5.h,
//                   decoration: BoxDecoration(
//                       color: colorB4.withOpacity(.50),
//                       border: Border.all(color: colorB4.withOpacity(.50)),
//                       shape: BoxShape.circle),
//                 ),
//               ],
//             ),
//             Positioned(
//               right: 55,
//               child: Row(
//                 children: [
//                   Column(
//                     children: [
//                       MyContainerWithChild(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 10, vertical: 4),
//                         height: 7.h,
//                         child: Image.asset(searchedDevice),
//                       ),
//                       heightSpace2,
//                       Text('Mi cam', style: blackMedium16)
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//         heightSpace40,
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: PrimaryTextButton(
//             text: translation(context).add,
//             onTap: () {
//               Navigator.popUntil(context, (route) => route.isFirst);
//               Navigator.pushReplacementNamed(
//                   context, '/SucessfullyAddedDevicePage');
//             },
//           ),
//         )
//       ],
//     );
//   }
// }

class SettingsMenuPopup extends StatefulWidget {
  const SettingsMenuPopup({Key? key}) : super(key: key);

  @override
  State<SettingsMenuPopup> createState() => _SettingsMenuPopupState();
}

class _SettingsMenuPopupState extends State<SettingsMenuPopup> {
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      alignment: AlignmentDirectional.topEnd,
      backgroundColor: const Color(0xff7d8698).withOpacity(0.4),
      insetPadding: const EdgeInsets.only(
        right: 20,
        top: 100,
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
            buildMenuItem(
              s.edit_profile,
              onTap: () =>
                  Navigator.pushNamed(context, PageRoutes.profileScreen),
            ),
            buildMenuItem(
              s.settings,
              onTap: () =>
                  Navigator.pushNamed(context, PageRoutes.settingsScreen),
            ),
            buildMenuItem(
              s.faqs,
              onTap: () => Navigator.pushNamed(context, PageRoutes.faqScreen),
            ),
            buildMenuItem(
              s.terms_conditions,
              onTap: () => Navigator.pushNamed(context, PageRoutes.tncScreen),
            ),
            buildMenuItem(
              s.privacy_policy,
              onTap: () =>
                  Navigator.pushNamed(context, PageRoutes.privacyPolicyScreen),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(String text, {void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 12,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
        ),
      ),
    );
  }
}
