class CountrySummaryModel {
  final String country;
  final int confirmed;
  final int death;
  final int recovered;
  final int active;
  final DateTime date;

  CountrySummaryModel(this.country, this.active, this.confirmed, this.date,
      this.death, this.recovered);

  factory CountrySummaryModel.fromJson(Map<String, dynamic> json) {
    return CountrySummaryModel(
      json["country"],
      json["active"],
      json["confirmed"],
      DateTime.parse(json["date"]),
      json["death"],
      json["recovered"],
    );
  }
}
