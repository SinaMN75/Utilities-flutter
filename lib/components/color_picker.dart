part of 'components.dart';

void showColorPickerBottomSheet({
  required final Color pickerColor,
  required final Function(Color) onColorChanged,
}) {
  Color color = pickerColor;
  bottomSheet(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ColorPicker(
          pickerColor: pickerColor,
          onColorChanged: (final Color selectedColor) {
            color = selectedColor;
          },
        ),
        SizedBox(height: 8),
        button(
            title: "ثبت",
            onTap: () {
              onColorChanged(color);
              back(closeOverlays: false);
            }),
      ],
    ),
  );
}
