import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommendation_engine/models/models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProfileScreen extends StatelessWidget {


  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: SfCircularChart(
                  title: ChartTitle(
                    textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                    text: "Your Tag Preferences",
                  ),
                  legend: Legend(
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap,
                      position: LegendPosition.bottom,
                      textStyle: const TextStyle(color: Colors.white)),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CircularSeries>[
                    PieSeries<ContentTag, String>(
                      dataSource: Provider.of<UserTagsPreferenceState>(context)
                          .userPrefs,
                      xValueMapper: (ContentTag data, _) => data.tagName,
                      yValueMapper: (ContentTag data, _) => data.tagValue,
                    )
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  width: size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () => Provider.of<UserTagsPreferenceState>(context,listen: false)
                          .resetData(),
                      child: const Text(
                        "Reset Data",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
