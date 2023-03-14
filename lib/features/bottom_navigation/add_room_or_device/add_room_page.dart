import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/widgets.dart';
import '../../../utils/constants.dart';
import '../../language/language_constant.dart';

class AddRoomPage extends StatefulWidget {
  const AddRoomPage({Key? key}) : super(key: key);

  @override
  State<AddRoomPage> createState() => _AddRoomPageState();
}

class _AddRoomPageState extends State<AddRoomPage> {
  List selectIconRow1 = [icon1, icon2, icon3, icon4];
  List selectIconRow2 = [icon5, icon6, icon7, icon8];
  int? _selectedRow1Icon = 0;
  int? _selectedRow2Icon;
  final TextEditingController _roomNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: MyAppBar(
            title: translation(context).createNewRoom,
          )),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Text(translation(context).enterRoomName, style: blackMedium16),
            MyContainerWithChild(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        controller: _roomNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: translation(context).enterRoomName,
                          hintStyle: color94Medium16,
                        )),
                  ),
                  widthSpace10,
                ],
              ),
            ),
            heightSpace15,
            Text(translation(context).selectIcon, style: blackMedium16),
            MyContainerWithChild(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 21.5),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: selectIconRow1
                          .map((e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedRow2Icon = null;
                                    _selectedRow1Icon =
                                        selectIconRow1.indexOf(e);
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  height: 7.h,
                                  width: 7.h,
                                  padding: const EdgeInsets.all(13.55),
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: _selectedRow1Icon ==
                                              selectIconRow1.indexOf(e)
                                          ? Border.all(color: primaryColor)
                                          : null,
                                      boxShadow: [
                                        _selectedRow1Icon ==
                                                selectIconRow1.indexOf(e)
                                            ? BoxShadow(
                                                blurRadius: 6,
                                                color: const Color(0xffAE835B)
                                                    .withOpacity(.25))
                                            : BoxShadow(
                                                blurRadius: 6,
                                                color: colorForShadow)
                                      ]),
                                  child: Image.asset(e),
                                ),
                              ))
                          .toList()),
                  heightSpace20,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: selectIconRow2
                          .map((e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedRow1Icon = null;
                                    _selectedRow2Icon =
                                        selectIconRow2.indexOf(e);
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  height: 7.h,
                                  width: 7.h,
                                  padding: const EdgeInsets.all(13.55),
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: _selectedRow2Icon ==
                                              selectIconRow2.indexOf(e)
                                          ? Border.all(color: primaryColor)
                                          : null,
                                      boxShadow: [
                                        _selectedRow2Icon ==
                                                selectIconRow2.indexOf(e)
                                            ? BoxShadow(
                                                blurRadius: 6,
                                                color: const Color(0xffAE835B)
                                                    .withOpacity(.25))
                                            : BoxShadow(
                                                blurRadius: 6,
                                                color: colorForShadow)
                                      ]),
                                  child: Image.asset(e),
                                ),
                              ))
                          .toList()),
                ],
              ),
            ),
            heightSpace50,
            PrimaryTextButton(
              text: translation(context).save,
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
