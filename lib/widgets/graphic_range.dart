import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'imc_gauge_range.dart';

class GraphicRange extends StatelessWidget {
  final double imc;

  const GraphicRange({Key? key, required this.imc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          showLabels: false,
          showAxisLine: false,
          showTicks: false,
          minimum: 12.5,
          maximum: 47.9,
          ranges: <GaugeRange>[
            ImcGaugeRange(
              color: Colors.blue,
              label: 'MAGREZA',
              start: 18.5,
              end: 12.5,
            ),
            ImcGaugeRange(
              color: Colors.green,
              label: 'NORMAL',
              start: 18.5,
              end: 25.0,
            ),
            ImcGaugeRange(
              color: Colors.yellow[600]!,
              label: 'SOBREPESO',
              start: 25.0,
              end: 30.0,
            ),
            ImcGaugeRange(
              color: Colors.red[600]!,
              label: 'OBESIDADE',
              start: 30.0,
              end: 35.0,
            ),
            ImcGaugeRange(
              color: Colors.red[900]!,
              label: 'OBESIDADE GRAVE',
              start: 35.0,
              end: 48.5,
            ),
          ],
          pointers: [
            NeedlePointer(
              value: imc,
              enableAnimation: true,
            ),
          ],
        ),
      ],
    );
  }
}
