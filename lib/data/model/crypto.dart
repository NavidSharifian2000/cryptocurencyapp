class crypto {
  String? key;
  String? name;
  dynamic? volume_24h;
  dynamic? percent_change_24h;
  dynamic? price;
  dynamic? urlimage;
  crypto(this.key, this.name, this.volume_24h, this.percent_change_24h,
      this.price, this.urlimage);
  factory crypto.fromjson(Map<dynamic, dynamic> jsonobject) {
    return crypto(
      jsonobject["key"],
      jsonobject["name"],
      jsonobject["volume_24h"],
      jsonobject["percent_change_24h"],
      jsonobject["price"],
      "https://wallex.ir/_next/image?url=https://api.wallex.ir/coins/" +
          jsonobject["key"] +
          "/icon/svg&w=32&q=75.png",
    );
  }
}
