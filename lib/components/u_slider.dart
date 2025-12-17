import "package:syncfusion_flutter_sliders/sliders.dart";
import "package:u/utilities.dart";

class USlider extends StatefulWidget {
  const USlider({
    required this.onValueChanged,
    required this.max,
    required this.min,
    super.key,
  });

  final double min;
  final double max;
  final Function(double, double) onValueChanged;

  @override
  State<USlider> createState() => _USliderState();
}

class _USliderState extends State<USlider> {
  late SfRangeValues _values;

  @override
  void initState() {
    _values = SfRangeValues(widget.min, widget.max);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SfRangeSlider(
    min: widget.min,
    max: widget.max,
    values: _values,
    interval: 20,
    showTicks: true,
    showLabels: true,
    enableTooltip: true,
    minorTicksPerInterval: 1,
    onChanged: (SfRangeValues values) {
      setState(() => _values = values);
      widget.onValueChanged(values.start, values.end);
    },
  );
}
