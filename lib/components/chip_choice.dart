import 'package:flutter/material.dart';
import 'package:u/utilities.dart';

class CustomChipChoice<T> extends StatefulWidget {
  /// List of all available options
  final List<T> options;

  /// Current selected value(s)
  final dynamic selected;

  /// Called when selection changes
  final Function(dynamic) onChanged;

  /// Chip builder function
  final Widget Function(T item, bool isSelected) chipBuilder;

  /// Whether multiple selection is allowed
  final bool isMultiChoice;

  /// Chip spacing
  final double spacing;

  /// Run alignment
  final WrapAlignment alignment;

  /// Run spacing
  final double runSpacing;

  /// Optional scroll controller for the chip list
  final ScrollController? scrollController;

  /// Whether the chips should be scrollable
  final bool scrollable;

  /// Scroll physics for the chip list
  final ScrollPhysics? scrollPhysics;

  /// Padding around the chip list
  final EdgeInsets padding;

  /// Direction of the chip list
  final Axis direction;

  const CustomChipChoice({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
    required this.chipBuilder,
    this.isMultiChoice = false,
    this.spacing = 8.0,
    this.runSpacing = 8.0,
    this.alignment = WrapAlignment.start,
    this.scrollController,
    this.scrollable = false,
    this.scrollPhysics,
    this.padding = EdgeInsets.zero,
    this.direction = Axis.horizontal,
  });

  @override
  State<CustomChipChoice<T>> createState() => _CustomChipChoiceState<T>();
}

class _CustomChipChoiceState<T> extends State<CustomChipChoice<T>> {
  bool _isSelected(T item) {
    if (widget.isMultiChoice) {
      return (widget.selected as List<T>).contains(item);
    } else {
      return widget.selected == item;
    }
  }

  void _handleSelection(T item) {
    if (widget.isMultiChoice) {
      final List<T> updatedSelection = List<T>.from(widget.selected as List<T>);
      if (updatedSelection.contains(item)) {
        updatedSelection.remove(item);
      } else {
        updatedSelection.add(item);
      }
      widget.onChanged(updatedSelection);
    } else {
      widget.onChanged(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<GestureDetector> chips = widget.options.map(
      (T item) {
        final bool isSelected = _isSelected(item);
        return GestureDetector(
          onTap: () => _handleSelection(item),
          child: widget.chipBuilder(item, isSelected),
        );
      },
    ).toList();

    if (widget.scrollable) {
      return SingleChildScrollView(
        controller: widget.scrollController,
        physics: widget.scrollPhysics,
        padding: widget.padding,
        scrollDirection: widget.direction,
        child: widget.direction == Axis.horizontal
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: chips
                    .expand(
                      (GestureDetector chip) => <Widget>[chip, SizedBox(width: widget.spacing)],
                    )
                    .toList()
                  ..removeLast(),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: chips
                    .expand(
                      (GestureDetector chip) => <Widget>[chip, SizedBox(height: widget.spacing)],
                    )
                    .toList()
                  ..removeLast(),
              ),
      );
    } else {
      return Padding(
        padding: widget.padding,
        child: Wrap(
          spacing: widget.spacing,
          runSpacing: widget.runSpacing,
          alignment: widget.alignment,
          direction: widget.direction,
          children: chips,
        ),
      );
    }
  }
}
