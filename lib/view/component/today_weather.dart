import 'package:flutter/material.dart';
class TodayWeather extends StatelessWidget {
  const TodayWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Today",style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              Text("7 Days",style: TextStyle(fontSize: 18.0, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
