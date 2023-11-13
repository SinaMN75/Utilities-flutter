part of 'components.dart';

Widget numericRangeSlider({
  required final double min,
  required final double max,
  required final Function(int min, int max) onChanged,
}) {
  final Rx<SfRangeValues> _values = SfRangeValues(min, max).obs;
  return SfRangeSlider(
      showLabels: true,
      interval: 20,
      max: 100.0,
      stepSize: 20,
      showTicks: true,
      enableIntervalSelection: true,
      values: _values.value,
      onChanged: (final SfRangeValues values) {
        _values(values);
        onChanged(values.start, values.end);
      },
      enableTooltip: true);
}
