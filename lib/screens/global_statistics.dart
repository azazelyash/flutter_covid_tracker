import 'package:covid_tracker/models/global_summary.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/utils/constants.dart';
import 'package:timeago/timeago.dart' as timeago;

class GlobalStatistics extends StatelessWidget {
  final GlobalSummaryModel? summary;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  GlobalStatistics({@required this.summary});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildCard(
          "Confirmed",
          summary!.totalConfirmed,
          summary!.newConfirmed,
          kConfirmedColor,
        ),
        buildCard(
          "Active",
          summary!.totalConfirmed -
              summary!.totalDeaths -
              summary!.totalRecovered,
          summary!.newConfirmed - summary!.newDeaths - summary!.newRecovered,
          kActiveColor,
        ),
        buildCard(
          "Recovered",
          summary!.totalRecovered,
          summary!.newRecovered,
          kRecoveredColor,
        ),
        buildCard(
          "Deaths",
          summary!.totalDeaths,
          summary!.newDeaths,
          kDeathColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            'Statistics updated ${timeago.format(summary!.date)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount, Color color) {
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      totalCount.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Today',
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      todayCount.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
