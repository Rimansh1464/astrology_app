
class AstrologyData {
  String date;
  String description;

  AstrologyData({
    required this.date,
    required this.description,
  });

  factory AstrologyData.fromMap(Map data) {
    return AstrologyData(
      date: data["current_date"],
      description: data['description'],
    );
  }
}
