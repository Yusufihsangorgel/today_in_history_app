class Post {
  final String gun;
  final String ay;
  final String yil;
  final String durum;
  final String olay;
  Post({
    required this.gun,
    required this.ay,
    required this.yil,
    required this.durum,
    required this.olay,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        gun: json["Gun"],
        ay: json["Ay"],
        yil: json["Yil"],
        durum: json["Durum"],
        olay: json["Olay"],
      );
}
