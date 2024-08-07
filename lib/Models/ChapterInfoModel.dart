class ChapterInfoModel {
  final int id;
  final String name;
  final String arabicName;
  final int versesCount;

  ChapterInfoModel({
    required this.id,
    required this.name,
    required this.arabicName,
    required this.versesCount,
  });

  factory ChapterInfoModel.fromJson(Map<String, dynamic> json) {
    return ChapterInfoModel(
      id: json['id'],
      name: json['name'],
      arabicName: json['arabic_name'],
      versesCount: json['verses_count'],
    );
  }
}
