import 'package:flutter/material.dart';

class RoomItem {
  final String image;
  final String title;
  final String subtitle;
  bool isPowerOn;
  final Color powerColor;

  RoomItem(
      this.image, this.title, this.subtitle, this.isPowerOn, this.powerColor);
}
