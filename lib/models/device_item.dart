class DeviceItem {
  String image;
  String name;
  String location;
  bool isConnected;
  String powerConsumption;
  bool isLongPressed;
  String pageRoute;

  DeviceItem(this.image, this.name, this.location, this.isConnected,
      this.powerConsumption,
      {this.isLongPressed = false, this.pageRoute = ''});
}
