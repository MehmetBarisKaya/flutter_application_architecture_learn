// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RangePriceSlider extends StatefulWidget {
  const RangePriceSlider({
    Key? key,
    required this.min,
    required this.max,
    required this.onCompleted,
  }) : super(key: key);
  final double min;
  final double max;
  final void Function(RangeValues values) onCompleted;

  @override
  State<RangePriceSlider> createState() => _RangePriceSliderState();
}

class _RangePriceSliderState extends State<RangePriceSlider> {
  late RangeValues _rangeValues;
  @override
  void initState() {
    super.initState();
    _rangeValues = RangeValues(widget.min, widget.max);
  }

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _rangeValues,
      min: widget.min,
      max: widget.max,
      onChanged: (value) {
        setState(() {
          _rangeValues = value;
        });
        widget.onCompleted(_rangeValues);
      },
    );
  }
}
