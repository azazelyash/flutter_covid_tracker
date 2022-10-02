import 'package:covid_tracker/screens/global_loading.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/services/covid_service.dart';
import 'package:covid_tracker/models/global_summary.dart';
import 'package:covid_tracker/screens/global_statistics.dart';

CovidService covidService = CovidService();

class Global extends StatefulWidget {
  const Global({super.key});

  @override
  State<Global> createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  Future<GlobalSummaryModel>? summary;

  @override
  void initState() {
    super.initState();
    summary = covidService.getGlobalSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Global Corona Virus Cases',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    summary = covidService.getGlobalSummary();
                  });
                },
                child: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: summary,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return GlobalLoading();
              default:
                return !snapshot.hasData
                    ? const Center(
                        child: Text('Empty'),
                      )
                    : GlobalStatistics(summary: snapshot.data);
            }
          },
        ),
      ],
    );
  }
}
