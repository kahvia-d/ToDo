import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/TodosData.dart';

class MapCalender extends StatelessWidget {
  const MapCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<DateTime,int> finishedStatus=context.watch<TodosData>().finishedStatus;
    return HeatMap(
      startDate: DateTime(2022,10,27),
      size: 30,
      textColor: Colors.white,
      datasets: finishedStatus,
      colorMode: ColorMode.color,
      showText: true,
      showColorTip: false,
      scrollable: true,
      colorsets: {
        1: Colors.green.shade100,
        2: Colors.green.shade200,
        3: Colors.green.shade300,
        4: Colors.green.shade400,
        5: Colors.green.shade500,
        6: Colors.green.shade600,
        7: Colors.green.shade700,
      },
      onClick: (value) {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
      },
    );
  }
}
