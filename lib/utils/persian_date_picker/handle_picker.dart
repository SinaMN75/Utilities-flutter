import 'package:flutter/material.dart';
import 'package:utilities/utils/shamsi_date/shamsi_date.dart';

import 'date_picker.dart';
import 'month_picker.dart';
import 'time_picker.dart';
import 'utils/consts.dart';
import 'utils/date.dart';
import 'year_picker.dart';

class HandlePicker extends StatefulWidget {
  final bool? isRangeDate;
  final initDateTime;
  final PickerType? type;
  final Function(String)? onSelect;

  HandlePicker({this.isRangeDate, this.initDateTime, this.type, this.onSelect});

  @override
  _HandlePickerState createState() => _HandlePickerState();
}

class _HandlePickerState extends State<HandlePicker> with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  var startSelectedInitDate;
  var startSelectedInitTime;
  var endSelectedInitDate;
  var endSelectedInitTime;
  var initDateTime;

  late bool isSecondSelect;
  PickerType pickerType = PickerType.date;

  String outPutFormat(Date d) {
    final f = d.formatter;

    return '${f.yyyy}/${f.mm}/${f.dd}';
  }

  @override
  void initState() {
    super.initState();
    initDateTime = widget.initDateTime;
    if (initDateTime == null) {
      Jalali now = Jalali.now();
      switch (widget.type) {
        case PickerType.rangedate:
          initDateTime = '${PersianDateUtils.jalaliToString(now)} # ${PersianDateUtils.jalaliToString(now)}';
          break;
        case PickerType.datetime:
          initDateTime = '${PersianDateUtils.jalaliToString(now)} 00:00';
          break;
        case PickerType.date:
          initDateTime = '${PersianDateUtils.jalaliToString(now)}';
          break;
        case PickerType.time:
          initDateTime = '00:00';
          break;
        case PickerType.year:
          initDateTime = '${now.formatter.yyyy}';

          break;
        case PickerType.month:
          initDateTime = '${now.formatter.mm}';
          break;
        default:
      }
    }
    isSecondSelect = false;
    if (widget.type == PickerType.rangedate) {
      if (initDateTime != null) {
        var splitInitDateTimes = initDateTime.split('#');
        var splitStartDateTime = splitInitDateTimes[0].split(' ');
        var splitEndDateTime = splitInitDateTimes[1].split(' ');
        startSelectedInitDate = splitStartDateTime.length > 0 ? splitStartDateTime[0] : null;
        startSelectedInitTime = splitStartDateTime.length > 1 ? splitStartDateTime[1] : null;

        endSelectedInitDate = splitEndDateTime.length > 0 ? splitEndDateTime[0] : null;
        endSelectedInitTime = splitEndDateTime.length > 1 ? splitEndDateTime[1] : null;
      } else {
        startSelectedInitDate = '${Jalali.now()}';
        endSelectedInitDate = '${Jalali.now()}';
        startSelectedInitTime = "${DateTime.now().hour}:${DateTime.now().minute}";
        endSelectedInitTime = "${DateTime.now().hour}:${DateTime.now().minute}";
      }
    } else {
      if (initDateTime != null) {
        var splitDateTime = initDateTime.split(' ');
        startSelectedInitDate = splitDateTime.length > 0 ? splitDateTime[0] : null;
        endSelectedInitDate = splitDateTime.length > 0 ? splitDateTime[0] : null;
        endSelectedInitTime = splitDateTime.length > 1 ? splitDateTime[1] : null;
      } else {
        startSelectedInitDate = '${Jalali.now()}';
        endSelectedInitDate = '${Jalali.now()}';
        startSelectedInitTime = "${DateTime.now().hour}:${DateTime.now().minute}";
        endSelectedInitTime = "${DateTime.now().hour}:${DateTime.now().minute}";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget picker;

    switch (widget.type) {
      case PickerType.datetime:
        Widget? picked;

        switch (pickerType) {
          case PickerType.date:
            picked = DatePicker(
              startSelectedDate: startSelectedInitDate,
              endSelectedDate: endSelectedInitDate,
              isRangeDate: false,
              onChangePicker: (picker) {
                setState(() {
                  pickerType = PickerType.year;
                });
              },
              onSelectDate: (date) {
                setState(() {
                  startSelectedInitDate = outPutFormat(date);
                  endSelectedInitDate = outPutFormat(date);
                });
              },
              onConfirmedDate: (date) {
                setState(() {
                  startSelectedInitDate = date;
                  pickerType = PickerType.time;
                });
              },
            );
            break;
          case PickerType.time:
            picked = TimePicker(
              initTime: startSelectedInitTime,
              onSelectDate: (time) {
                widget.onSelect!('$startSelectedInitDate $time');
                Navigator.of(context).pop();
              },
            );
            break;
          case PickerType.year:
            picked = PersianYearPicker(
              initDate: startSelectedInitDate,
              onSelectYear: (date) {
                setState(() {
                  startSelectedInitDate = outPutFormat(date!);
                  endSelectedInitDate = outPutFormat(date);
                  pickerType = PickerType.date;
                });
              },
            );
            break;
          default:
        }
        picker = Container(child: picked);
        break;
      case PickerType.rangedate:
        Widget? picked;
        switch (pickerType) {
          case PickerType.date:
            picked = DatePicker(
              startSelectedDate: startSelectedInitDate,
              endSelectedDate: endSelectedInitDate,
              onChangePicker: (picker) {
                setState(() {
                  pickerType = PickerType.year;
                });
              },
              isRangeDate: true,
              onConfirmedDate: (date) {
                widget.onSelect!(date);
                Navigator.of(context).pop();
              },
              onSelectDate: (date) {
                var splitStartDate = startSelectedInitDate.split('/');
                var startSelectedDate = Jalali(int.parse(splitStartDate[0]), int.parse(splitStartDate[1]), int.parse(splitStartDate[2]));
                setState(() {
                  if (!isSecondSelect) {
                    startSelectedInitDate = outPutFormat(date);
                    endSelectedInitDate = outPutFormat(date);
                    isSecondSelect = !isSecondSelect;
                  } else if (isSecondSelect && date >= startSelectedDate) {
                    endSelectedInitDate = outPutFormat(date);
                    isSecondSelect = !isSecondSelect;
                  } else if (isSecondSelect && date < startSelectedDate) {
                  } else {
                    startSelectedInitDate = outPutFormat(date);
                    endSelectedInitDate = outPutFormat(date);
                  }
                });
              },
            );
            break;
          case PickerType.time:
            picked = TimePicker(
              initTime: startSelectedInitTime,
              onSelectDate: (time) {
                widget.onSelect!('$startSelectedInitDate $time');
                Navigator.of(context).pop();
              },
            );
            break;
          case PickerType.year:
            picked = PersianYearPicker(
              initDate: startSelectedInitDate,
              onSelectYear: (date) {
                setState(() {
                  if (isSecondSelect) {
                    endSelectedInitDate = outPutFormat(date!);
                  } else {
                    startSelectedInitDate = outPutFormat(date!);
                  }
                  pickerType = PickerType.date;
                });
              },
            );
            break;
          default:
        }
        picker = Container(child: picked);
        break;
      case PickerType.time:
        setState(() {
          startSelectedInitTime = initDateTime;
        });
        picker = Container(
            child: TimePicker(
          initTime: startSelectedInitTime,
          onSelectDate: (time) {
            widget.onSelect!('$time');
            Navigator.pop(context);
          },
        ));
        break;
      case PickerType.date:
        Widget? picked;

        switch (pickerType) {
          case PickerType.date:
            picked = DatePicker(
              startSelectedDate: startSelectedInitDate,
              endSelectedDate: endSelectedInitDate,
              isRangeDate: false,
              onConfirmedDate: (date) {
                startSelectedInitDate = date;
                widget.onSelect!(date);
                Navigator.pop(context);
              },
              onSelectDate: (date) {
                setState(() {
                  startSelectedInitDate = outPutFormat(date);
                  endSelectedInitDate = outPutFormat(date);
                });
              },
              onChangePicker: (picker) {
                setState(() {
                  pickerType = PickerType.year;
                });
              },
            );
            break;
          case PickerType.year:
            picked = PersianYearPicker(
              initDate: startSelectedInitDate,
              onSelectYear: (date) {
                setState(() {
                  startSelectedInitDate = outPutFormat(date!);
                  endSelectedInitDate = outPutFormat(date);
                  startSelectedInitDate = outPutFormat(date);
                  pickerType = PickerType.date;
                });
              },
              onChangePicker: (picker) {
                setState(() {
                  pickerType = PickerType.month;
                });
              },
            );
            break;
          case PickerType.month:
            picked = PersianMonthPicker(
              initDate: startSelectedInitDate,
              onSelectMonth: (date) {
                setState(() {
                  startSelectedInitDate = outPutFormat(date!);
                  endSelectedInitDate = outPutFormat(date);
                  startSelectedInitDate = outPutFormat(date);
                  pickerType = PickerType.date;
                });
              },
            );
            break;
          default:
        }
        picker = Container(child: picked);
        break;
      case PickerType.year:
        picker = Container(
            child: PersianYearPicker(
          initDate: PersianDateUtils.jalaliToString(Jalali.now().copy(year: int.parse(startSelectedInitDate))),
          onSelectYear: (date) {
            startSelectedInitDate = outPutFormat(date!);
            widget.onSelect!('${date.formatter.yyyy}');
            Navigator.pop(context);
          },
        ));
        break;
      case PickerType.month:
        picker = PersianMonthPicker(
          initDate: PersianDateUtils.jalaliToString(Jalali.now().copy(month: int.parse(startSelectedInitDate))),
          onSelectMonth: (date) {
            startSelectedInitDate = outPutFormat(date!);
            widget.onSelect!('${date.formatter.mm}');
            Navigator.pop(context);
          },
        );
        break;
      default:
        Widget? picked;

        switch (pickerType) {
          case PickerType.date:
            picked = DatePicker(
              startSelectedDate: startSelectedInitDate,
              endSelectedDate: endSelectedInitDate,
              isRangeDate: false,
              onConfirmedDate: (date) {
                startSelectedInitDate = date;
                widget.onSelect!('$startSelectedInitDate');
                Navigator.pop(context);
              },
              onSelectDate: (date) {
                setState(() {
                  startSelectedInitDate = outPutFormat(date);
                  endSelectedInitDate = outPutFormat(date);
                });
              },
              onChangePicker: (picker) {
                setState(() {
                  pickerType = PickerType.year;
                });
              },
            );
            break;
          case PickerType.year:
            picked = PersianYearPicker(
              initDate: startSelectedInitDate,
              onSelectYear: (date) {
                setState(() {
                  startSelectedInitDate = outPutFormat(date!);
                  endSelectedInitDate = outPutFormat(date);
                  startSelectedInitDate = outPutFormat(date);
                  pickerType = PickerType.date;
                });
              },
              onChangePicker: (picker) {
                setState(() {
                  pickerType = PickerType.month;
                });
              },
            );
            break;
          case PickerType.month:
            picked = PersianMonthPicker(
              initDate: startSelectedInitDate,
              onSelectMonth: (date) {
                setState(() {
                  startSelectedInitDate = outPutFormat(date!);
                  endSelectedInitDate = outPutFormat(date);
                  startSelectedInitDate = outPutFormat(date);
                  pickerType = PickerType.date;
                });
              },
            );
            break;
          default:
        }
        picker = Container(child: picked);
        break;
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: picker,
    );
  }
}
