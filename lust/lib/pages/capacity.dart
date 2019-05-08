import 'package:flutter/material.dart';
import 'package:lust/widgets/capacityPage/capacityGraph.dart';
import 'package:lust/widgets/capacityPage/capacityInfo.dart';

class CapacityWidget extends StatefulWidget {
  @override
  _CapacityWidgetState createState() => new _CapacityWidgetState();
}

class _CapacityWidgetState extends State<CapacityWidget> {
  final _title = "Capacity";

  @override
  Widget build(BuildContext context) {

    var _height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: _height*0.60,
                  child: CapacityGraph.withSampleData(),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(10.0),
                  child: CapacityInfo(),
                )
              ]),
        ));
  } // build

}
