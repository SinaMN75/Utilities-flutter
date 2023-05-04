import 'dart:io';
import 'package:flutter/material.dart';
import 'package:utilities/data/dto/form_filed.dart';
import 'package:utilities/utilities.dart';

class FormBuilder extends StatefulWidget {
  const FormBuilder({
    required this.formFields,
    required this.onFormChanged,
    this.isScrollable = false,
    this.textFieldFillColor = Colors.transparent,
    this.enabledBorder,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.groupButtonOptions,
    this.uploadFileWidget,
    this.selectedFileWidget,
    this.uploadImageWidget,
    this.labelStyle,
    this.spaceBetween,
    this.textFieldPadding = const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    this.requiredText = "* This field is required",
    this.childrenText = "Children: ",
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.selectDialogDecoration,
    final Key? key,
    this.selectDialogText,
    this.selectDateDecoration,
    this.selectDateText,
    this.selectTimeText,
    this.selectDateTimeTextColor,
  }) : super(key: key);
  final List<FormFieldReadDto> formFields;
  final Function(List<FormReadDto> forms) onFormChanged;
  final bool isScrollable;
  final Color textFieldFillColor;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final GroupButtonOptions? groupButtonOptions;
  final Widget? uploadFileWidget;
  final Widget? uploadImageWidget;
  final Widget? selectedFileWidget;
  final TextStyle? labelStyle;
  final double? spaceBetween;
  final EdgeInsets textFieldPadding;
  final String requiredText;
  final String childrenText;
  final CrossAxisAlignment crossAxisAlignment;
  final BoxDecoration? selectDialogDecoration;
  final String? selectDialogText;
  final String? selectDateText;
  final String? selectTimeText;
  final BoxDecoration? selectDateDecoration;
  final Color? selectDateTimeTextColor;

  @override
  _FormBuilderState createState() => _FormBuilderState();
}

class _FormBuilderState extends State<FormBuilder> {
  List<FormReadDto> forms = <FormReadDto>[];

  @override
  Widget build(final BuildContext context) => _itemSwitcher(items: widget.formFields, isChildren: false);

  Widget _itemSwitcher({
    required final List<FormFieldReadDto> items,
    final bool isScrollable = false,
    final bool isChildren = true,
  }) =>
      column(
        isScrollable: isScrollable,
        crossAxisAlignment: widget.crossAxisAlignment,
        children: items.map((final FormFieldReadDto field) {
          switch (field.type) {
            case 0:
              return _textField(field: field, isChildren: isChildren).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 1:
              return _textField(field: field, maxLine: 5, isChildren: isChildren).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 2:
              return _selectDialog(field: field, isChildren: isChildren).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 3:
              return _selectDialog(field: field, isChildren: isChildren).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 4:
              return _radio(field: field, isChildren: isChildren).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 5:
              return _textField(field: field, isChildren: isChildren).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 6:
              return _filePicker(field: field, isChildren: isChildren).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 7:
              return _imagePicker(field: field, isChildren: isChildren).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 8:
              return _textField(field: field, isChildren: isChildren).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 9:
              return _textField(field: field, isChildren: isChildren).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 10:
              return _textField(field: field, isChildren: isChildren, obscureText: true).marginSymmetric(vertical: widget.spaceBetween ?? 4);
            case 11:
              return _dateTimePicker(field: field, isChildren: isChildren);
            case 12:
              return _dateTimePicker(field: field, isChildren: isChildren);
            case 13:
              return _dateTimePicker(field: field, isChildren: isChildren);
            default:
              return const SizedBox();
          }
        }).toList(),
      );

  Widget _dateTimePicker({required final FormFieldReadDto field, final bool isChildren = true}) {
    List<FormReadDto> children = forms.isNotEmpty ? forms.singleWhere((e) => e.id == field.id).children : [];
    String dateText = widget.selectDateText ?? "Select Date";
    String timeText = widget.selectTimeText ?? "Select Time";
    String dateTimeText = widget.selectTimeText ?? "Select Date Time";
    DateTime? date = DateTime.now();
    TimeOfDay? time = TimeOfDay(hour: 12, minute: 00);
    return iconTextVertical(
      crossAxisAlignment: widget.crossAxisAlignment,
      leading: Text(field.label!, style: widget.labelStyle),
      trailing: StatefulBuilder(
        builder: (final _, final StateSetter setter) => Container(
          width: screenWidth,
          height: 55,
          decoration: widget.selectDateDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: context.theme.primaryColor,
              ),
          child: Center(
            child: Text(
              field.type == 11
                  ? dateText
                  : field.type == 12
                      ? timeText
                      : dateTimeText,
              style: widget.labelStyle?.copyWith(color: widget.selectDateTimeTextColor),
            ),
          ),
        ).onTap(() async {
          if (field.type == 11) {
            date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 5),
            );
            setter(() => dateText = "${date!.day} / ${date!.month} / ${date!.year}");
            if (isChildren) {
              children.removeWhere((e) => e.id == field.id);
              children.add(FormReadDto(id: field.id, title: dateText, formField: field));
              forms.singleWhere((e) => e.id == field.id).children = children;
            } else {
              forms.removeWhere((final FormReadDto e) => e.id == field.id);
              forms.add(FormReadDto(id: field.id, title: dateText, formField: field));
            }
            widget.onFormChanged(forms);
          } else if (field.type == 12) {
            time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay(hour: 12, minute: 00),
            );
            setter(() => timeText = "${time!.minute} : ${time!.hour}");
            if (isChildren) {
              children.removeWhere((e) => e.id == field.id);
              children.add(FormReadDto(id: field.id, title: timeText, formField: field));
              forms.singleWhere((e) => e.id == field.id).children = children;
            } else {
              forms.removeWhere((final FormReadDto e) => e.id == field.id);
              forms.add(FormReadDto(id: field.id, title: timeText, formField: field));
            }
            widget.onFormChanged(forms);
          }
        }),
      ),
    );
  }

  Widget _filePicker({
    required final FormFieldReadDto field,
    final bool isChildren = true,
  }) {
    File selectedFile = File("");
    return StatefulBuilder(
      builder: (final _, final StateSetter setter) => iconTextVertical(
        crossAxisAlignment: widget.crossAxisAlignment,
        leading: Text(field.label!, style: widget.labelStyle),
        trailing: selectedFile == File("")
            ? GestureDetector(
                onTap: () => showFilePicker(action: (final List<File> files) => selectedFile = files.first),
                child: widget.uploadFileWidget ?? const Icon(Icons.add_circle, size: 30),
              )
            : Stack(
                children: <Widget>[
                  widget.selectedFileWidget ?? const Icon(Icons.file_copy, size: 30),
                  const Icon(Icons.clear, size: 15).onTap(() => setter(() => selectedFile = File(""))),
                ],
              ),
      ),
    );
  }

  Widget _imagePicker({
    required final FormFieldReadDto field,
    final bool isChildren = true,
  }) {
    File selectedFile = File("");
    return StatefulBuilder(
      builder: (final _, final StateSetter setter) => iconTextVertical(
        crossAxisAlignment: widget.crossAxisAlignment,
        leading: Text(field.label!, style: widget.labelStyle),
        trailing: selectedFile == File("")
            ? GestureDetector(
                onTap: () => showFilePicker(action: (final List<File> files) => selectedFile = files.first),
                child: widget.uploadImageWidget ?? const Icon(Icons.add_circle, size: 30),
              )
            : Stack(
                children: <Widget>[
                  imageFile(selectedFile, width: 70, height: 70, borderRadius: 7),
                  const Icon(Icons.clear, size: 15).onTap(() => setter(() => selectedFile = File(""))),
                ],
              ),
      ),
    );
  }

  Widget _radio({
    required final FormFieldReadDto field,
    final bool isChildren = true,
  }) {
    List<FormReadDto> children = forms.isNotEmpty ? forms.singleWhere((e) => e.id == field.id).children : [];
    final RxBool radioValue = false.obs;
    return Obx(
      () => iconTextHorizontal(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        leading: Text(field.label!, style: widget.labelStyle),
        trailing: Checkbox(
          value: radioValue.value,
          onChanged: (final bool? value) {
            radioValue.value = value!;
            if (radioValue.value) {
              if (isChildren) {
                forms.singleWhere((element) => element.id == field.id).children.removeWhere((e) => e.id == field.id);
                children.add(FormReadDto(id: field.id, title: "true", formField: field));
              } else {
                forms.removeWhere((final FormReadDto e) => e.id == field.id);
                forms.add(FormReadDto(id: field.id, title: "true", formField: field));
              }
            } else {
              if (isChildren) {
                children.removeWhere((e) => e.id == field.id);
                children.add(FormReadDto(id: field.id, title: "false", formField: field));
              } else {
                forms.removeWhere((final FormReadDto e) => e.id == field.id);
                forms.add(FormReadDto(id: field.id, title: "false", formField: field));
              }
            }
          },
        ),
      ),
    );
  }

  Widget _selectDialog({
    required final FormFieldReadDto field,
    final bool isChildren = true,
  }) {
    final List<String> items = field.optionList!.split(",");
    final List<String> selectedItems = <String>[];
    List<FormReadDto> children = forms.isNotEmpty ? forms.singleWhere((e) => e.id == field.id).children : [];
    String result = "";
    return iconTextVertical(
      leading: Text(field.label!, style: widget.labelStyle),
      trailing: StatefulBuilder(
        builder: (final _, StateSetter setter) => iconTextVertical(
          leading: GestureDetector(
            onTap: () => showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              clipBehavior: Clip.hardEdge,
              backgroundColor: Colors.transparent,
              builder: (final BuildContext context) => Container(
                margin: MediaQuery.of(context).viewInsets,
                height: 300,
                decoration: BoxDecoration(
                  color: context.theme.backgroundColor.withOpacity(0.9),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (final _, final int index) => TextButton(
                    onPressed: () {
                      back();
                      setter(() {
                        if (field.type == 3) {
                          selectedItems.clear();
                          selectedItems.add(items[index]);
                        } else {
                          selectedItems.add(items[index]);
                        }
                      });
                      // update forms:
                      result = selectedItems.join(",");
                      if (selectedItems.isNotEmpty) {
                        if (isChildren) {
                          children.removeWhere((final FormReadDto e) => e.id == field.id);
                          children.add(FormReadDto(id: field.id, title: result, formField: field));
                        } else {
                          forms.removeWhere((final FormReadDto e) => e.id == field.id);
                          forms.add(FormReadDto(id: field.id, title: result, formField: field));
                        }
                      } else {
                        if (isChildren) {
                          children.removeWhere((final FormReadDto e) => e.id == field.id);
                        } else {
                          forms.removeWhere((final FormReadDto e) => e.id == field.id);
                        }
                      }
                      forms.singleWhere((e) => e.id == field.id).children = children;
                      // finish
                      widget.onFormChanged(forms);
                    },
                    child: Text(items[index], style: widget.labelStyle),
                  ).alignAtCenter().marginSymmetric(vertical: 10, horizontal: 15),
                ),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              width: screenWidth,
              height: 70,
              decoration: widget.selectDialogDecoration ??
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: context.theme.primaryColor),
                  ),
              child: iconTextHorizontal(
                leading: Text(widget.selectDialogText ?? "Select item", style: widget.labelStyle).alignAtCenterLeft().expanded(),
                trailing: Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ),
          trailing: SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: selectedItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (final _, final int index) => Container(
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: iconTextHorizontal(
                  spaceBetween: 4,
                  leading: Text(selectedItems[index], style: widget.labelStyle),
                  trailing: Icon(Icons.clear),
                ),
              ).onTap(
                () {
                  if (selectedItems.isNotEmpty) setter(() => selectedItems.removeAt(index));
                  // update forms:
                  result = selectedItems.join(",");
                  if (selectedItems.isNotEmpty) {
                    if (isChildren) {
                      children.removeWhere((final FormReadDto e) => e.id == field.id);
                      children.add(FormReadDto(id: field.id, title: result, formField: field));
                    } else {
                      forms.removeWhere((final FormReadDto e) => e.id == field.id);
                      forms.add(FormReadDto(id: field.id, title: result, formField: field));
                    }
                  } else {
                    if (isChildren) {
                      children.removeWhere((final FormReadDto e) => e.id == field.id);
                    } else {
                      forms.removeWhere((final FormReadDto e) => e.id == field.id);
                    }
                  }
                  forms.singleWhere((e) => e.id == field.id).children = children;
                  // finish
                  widget.onFormChanged(forms);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _groupButton({
    required final FormFieldReadDto field,
    final bool isChildren = true,
  }) {
    List<FormReadDto> children = forms.isNotEmpty ? forms.singleWhere((e) => e.id == field.id).children : [];
    final GroupButtonController controller = GroupButtonController();
    final List<String> items = field.optionList!.split(",");
    final List<String> selectedItems = <String>[];
    String result = "";
    return iconTextVertical(
        crossAxisAlignment: widget.crossAxisAlignment,
        leading: Text(field.label!, style: widget.labelStyle),
        trailing: GroupButton<String>(
          controller: controller,
          enableDeselect: true,
          onSelected: (final String value, final int index, final bool isSelected) {
            if (field.type! == 3) {
              if (isSelected) {
                selectedItems.clear();
                selectedItems.add(value);
              } else {
                selectedItems.clear();
              }
            } else {
              if (isSelected)
                selectedItems.add(value);
              else
                selectedItems.remove(value);
            }
            result = selectedItems.join(",");
            if (selectedItems.isNotEmpty) {
              if (isChildren) {
                children.removeWhere((final FormReadDto e) => e.id == field.id);
                children.add(FormReadDto(id: field.id, title: result, formField: field));
              } else {
                forms.removeWhere((final FormReadDto e) => e.id == field.id);
                forms.add(FormReadDto(id: field.id, title: result, formField: field));
              }
            } else {
              if (isChildren) {
                children.removeWhere((final FormReadDto e) => e.id == field.id);
              } else {
                forms.removeWhere((final FormReadDto e) => e.id == field.id);
              }
            }
            forms.singleWhere((e) => e.id == field.id).children = children;
            widget.onFormChanged(forms);
          },
          buttons: items,
          isRadio: field.type! == 3 ? true : false,
          options: widget.groupButtonOptions ?? const GroupButtonOptions(),
        ));
  }

  Widget _textField({
    required final FormFieldReadDto field,
    final int maxLine = 1,
    final bool isChildren = true,
    final bool obscureText = false,
  }) {
    List<FormReadDto> children = forms.isNotEmpty ? forms.singleWhere((e) => e.id == field.id).children : [];
    return Column(
      crossAxisAlignment: widget.crossAxisAlignment,
      children: <Widget>[
        iconTextVertical(
          crossAxisAlignment: widget.crossAxisAlignment,
          leading: Text(field.label ?? "--", style: widget.labelStyle),
          trailing: TextFormField(
            keyboardType: field.type == 5
                ? TextInputType.number
                : field.type == 9
                    ? TextInputType.phone
                    : TextInputType.text,
            validator: field.isRequired ?? false ? validateNotEmpty() : null,
            onChanged: (final String value) {
              if (value != "") {
                if (isChildren) {
                  if (children.isNotEmpty) children.removeWhere((final FormReadDto e) => e.id == field.id);
                  children.add(FormReadDto(id: field.id, title: value, formField: field));
                } else {
                  forms.removeWhere((final FormReadDto e) => e.id == field.id);
                  forms.add(FormReadDto(id: field.id, title: value, formField: field));
                }
                forms.singleWhere((e) => e.id == field.id).children = children;
                widget.onFormChanged(forms);
              } else {
                if (isChildren) {
                  if (children.isNotEmpty) children.removeWhere((final FormReadDto e) => e.id == field.id);
                } else {
                  forms.removeWhere((final FormReadDto e) => e.id == field.id);
                }
                forms.singleWhere((e) => e.id == field.id).children = children;
                widget.onFormChanged(forms);
              }
            },
            obscureText: obscureText,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: maxLine,
            decoration: InputDecoration(
              counter: const SizedBox(),
              fillColor: widget.textFieldFillColor,
              hintStyle: context.textTheme.subtitle2!.copyWith(color: context.theme.hintColor),
              filled: true,
              contentPadding: widget.textFieldPadding,
              focusedBorder: widget.focusedBorder,
              enabledBorder: widget.enabledBorder,
              errorBorder: widget.errorBorder,
              focusedErrorBorder: widget.focusedErrorBorder,
            ),
          ),
        ),
        field.children != null && field.children!.isNotEmpty
            ? Text(
                widget.childrenText,
                style: widget.labelStyle,
              )
            : const SizedBox(),
        field.children != null && field.children!.isNotEmpty
            ? _itemSwitcher(
                items: field.children!,
                isChildren: true,
              ).marginSymmetric(horizontal: 10)
            : const SizedBox()
      ],
    );
  }

  void validateForm({required final GlobalKey<FormState> key, required final VoidCallback action}) {
    if (key.currentState!.validate()) action();
  }

  FormFieldValidator<String> validateNotEmpty() => (final String? value) {
        if (value!.isEmpty) return widget.requiredText;
        return null;
      };
}
