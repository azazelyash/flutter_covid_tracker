class GlobalSummaryModel {
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;
  final DateTime date;

  GlobalSummaryModel(
    this.date,
    this.newConfirmed,
    this.newDeaths,
    this.newRecovered,
    this.totalConfirmed,
    this.totalDeaths,
    this.totalRecovered,
  );

  factory GlobalSummaryModel.fromJson(Map<String, dynamic> json) {
    return GlobalSummaryModel(
      DateTime.parse(json["Date"]),
      json["Global"]["NewConfirmed"],
      json["Global"]["NewDeaths"],
      json["Global"]["NewRecovered"],
      json["Global"]["TotalConfirmed"],
      json["Global"]["TotalDeaths"],
      json["Global"]["TotalRecovered"],
    );
  }
}
