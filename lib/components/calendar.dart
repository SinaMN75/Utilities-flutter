import "package:u/utilities.dart";

class UCalendar extends StatefulWidget {
  const UCalendar({
    required this.dataSource,
    super.key,
    this.view = CalendarView.month,
    this.firstDayOfWeek = 1, // Monday
    this.initialDisplayDate,
    this.initialSelectedDate,
    this.minDate,
    this.maxDate,
    this.showNavigationArrow = true,
    this.showCurrentTimeIndicator = true,
    this.showWeekNumber = false,
    this.useJalali = false, // Toggle Jalali date support
    this.jalaliDateFormatter,
    this.monthCellBuilder,
    this.appointmentBuilder,
    this.timeSlotViewSettings = const TimeSlotViewSettings(),
    this.monthViewSettings = const MonthViewSettings(),
    this.scheduleViewSettings = const ScheduleViewSettings(),
    this.loadingIndicator,
    this.errorIndicator,
    this.showLoading = false,
    this.constraints,
    this.padding = const EdgeInsets.all(8),
    this.backgroundColor,
    this.controller,
    this.onViewChanged,
    this.onTap,
    this.onLongPress,
  });

  final CalendarDataSource dataSource;
  final CalendarView view;
  final int firstDayOfWeek;
  final DateTime? initialDisplayDate;
  final DateTime? initialSelectedDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final bool showNavigationArrow;
  final bool showCurrentTimeIndicator;
  final bool showWeekNumber;
  final bool useJalali;
  final String Function(Jalali)? jalaliDateFormatter;
  final Widget Function(BuildContext, MonthCellDetails)? monthCellBuilder;
  final Widget Function(BuildContext, CalendarAppointmentDetails)? appointmentBuilder;
  final TimeSlotViewSettings timeSlotViewSettings;
  final MonthViewSettings monthViewSettings;
  final ScheduleViewSettings scheduleViewSettings;
  final Widget? loadingIndicator;
  final Widget? errorIndicator;
  final bool showLoading;
  final BoxConstraints? constraints;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final CalendarController? controller;
  final void Function(ViewChangedDetails)? onViewChanged;
  final void Function(CalendarTapDetails)? onTap;
  final void Function(CalendarLongPressDetails)? onLongPress;

  @override
  State<UCalendar> createState() => _UCalendarState();
}

class _UCalendarState extends State<UCalendar> {
  final bool _isLoading = false;
  bool _hasError = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) => Container(
        padding: widget.padding,
        constraints: widget.constraints,
        color: widget.backgroundColor,
        child: Stack(
          children: <Widget>[
            if (_hasError && widget.errorIndicator != null)
              widget.errorIndicator!
            else if (_hasError)
              Center(
                child: Text(
                  _errorMessage ?? "Calendar error occurred",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),
                ),
              )
            else
              SfCalendar(
                view: widget.view,
                dataSource: widget.dataSource,
                firstDayOfWeek: widget.firstDayOfWeek,
                initialDisplayDate: widget.useJalali && widget.initialDisplayDate != null ? _toGregorian(widget.initialDisplayDate!) : widget.initialDisplayDate,
                initialSelectedDate: widget.useJalali && widget.initialSelectedDate != null ? _toGregorian(widget.initialSelectedDate!) : widget.initialSelectedDate,
                minDate: widget.useJalali && widget.minDate != null ? _toGregorian(widget.minDate!) : widget.minDate,
                maxDate: widget.useJalali && widget.maxDate != null ? _toGregorian(widget.maxDate!) : widget.maxDate,
                showNavigationArrow: widget.showNavigationArrow,
                showCurrentTimeIndicator: widget.showCurrentTimeIndicator,
                showWeekNumber: widget.showWeekNumber,
                headerDateFormat: widget.useJalali ? null : "MMMM yyyy",
                monthCellBuilder: widget.useJalali
                    ? (BuildContext context, MonthCellDetails details) {
                        final Jalali jalaliDate = Jalali.fromDateTime(details.date);
                        final String formattedDay = jalaliDate.formatter.d; // Day number in Jalali
                        return widget.monthCellBuilder?.call(context, details) ?? Center(child: Text(formattedDay, style: Theme.of(context).textTheme.bodySmall));
                      }
                    : widget.monthCellBuilder,
                appointmentBuilder: widget.appointmentBuilder,
                timeSlotViewSettings: widget.timeSlotViewSettings,
                monthViewSettings: widget.monthViewSettings,
                scheduleViewSettings: widget.scheduleViewSettings,
                controller: widget.controller,
                onViewChanged: widget.onViewChanged,
                onTap: widget.onTap,
                onLongPress: widget.onLongPress,
              ),
            if (widget.showLoading && _isLoading && !_hasError) widget.loadingIndicator ?? const Center(child: CircularProgressIndicator()),
          ],
        ),
      );

  // Convert Jalali date to Gregorian for internal use
  DateTime _toGregorian(DateTime jalaliDate) {
    try {
      final Jalali jalali = Jalali(jalaliDate.year, jalaliDate.month, jalaliDate.day);
      return jalali.toDateTime();
    } catch (e) {
      setState(() {
        _hasError = true;
        _errorMessage = "Invalid Jalali date: $e";
      });
      return jalaliDate;
    }
  }
}

// Helper class to unify calendar data source with Jalali support
class UCalendarDataSource extends CalendarDataSource {
  final bool useJalali;

  UCalendarDataSource({
    required List<Appointment> appointments,
    this.useJalali = false,
  }) {
    this.appointments = appointments.map((Appointment appt) {
      if (useJalali) {
        final Jalali jalaliStart = Jalali.fromDateTime(appt.startTime);
        final Jalali jalaliEnd = Jalali.fromDateTime(appt.endTime);
        return Appointment(
          startTime: jalaliStart.toDateTime(),
          endTime: jalaliEnd.toDateTime(),
          subject: appt.subject,
          color: appt.color,
          isAllDay: appt.isAllDay,
          recurrenceRule: appt.recurrenceRule,
        );
      }
      return appt;
    }).toList();
  }

  @override
  DateTime getStartTime(int index) => appointments?[index].startTime;

  @override
  DateTime getEndTime(int index) => appointments?[index].endTime;

  @override
  String getSubject(int index) => appointments?[index].subject;

  @override
  Color getColor(int index) => appointments?[index].color;

  @override
  bool isAllDay(int index) => appointments?[index].isAllDay;

  @override
  String? getRecurrenceRule(int index) => appointments?[index].recurrenceRule;
}

class CalendarDemo extends StatefulWidget {
  const CalendarDemo({super.key});

  @override
  State<CalendarDemo> createState() => _CalendarDemoState();
}

class _CalendarDemoState extends State<CalendarDemo> {
  final List<Appointment> _appointments = _getAppointments();
  CalendarView _currentView = CalendarView.month;
  bool _useJalali = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("UCalendar Demo"),
          actions: <Widget>[
            DropdownButton<CalendarView>(
              value: _currentView,
              items: const <DropdownMenuItem<CalendarView>>[
                DropdownMenuItem<CalendarView>(value: CalendarView.day, child: Text("Day")),
                DropdownMenuItem<CalendarView>(value: CalendarView.week, child: Text("Week")),
                DropdownMenuItem<CalendarView>(value: CalendarView.workWeek, child: Text("Work Week")),
                DropdownMenuItem<CalendarView>(value: CalendarView.month, child: Text("Month")),
                DropdownMenuItem<CalendarView>(value: CalendarView.schedule, child: Text("Schedule")),
                DropdownMenuItem<CalendarView>(value: CalendarView.timelineDay, child: Text("Timeline Day")),
                DropdownMenuItem<CalendarView>(value: CalendarView.timelineWeek, child: Text("Timeline Week")),
                DropdownMenuItem<CalendarView>(value: CalendarView.timelineWorkWeek, child: Text("Timeline Work Week")),
                DropdownMenuItem<CalendarView>(value: CalendarView.timelineMonth, child: Text("Timeline Month")),
              ],
              onChanged: (CalendarView? value) => setState(() => _currentView = value!),
            ),
            Switch(
              value: _useJalali,
              onChanged: (bool value) => setState(() => _useJalali = value),
              activeTrackColor: Colors.blue,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text("Jalali"),
            ),
          ],
        ),
        body: UCalendar(
          view: _currentView,
          dataSource: UCalendarDataSource(
            appointments: _appointments,
            useJalali: _useJalali,
          ),
          useJalali: _useJalali,
          jalaliDateFormatter: (Jalali jalali) => "${jalali.formatter.mN} ${jalali.year}",
          showWeekNumber: true,
          firstDayOfWeek: _useJalali ? 6 : 1,
          // Saturday for Jalali, Monday for Gregorian
          monthViewSettings: const MonthViewSettings(
            showAgenda: true,
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          ),
          timeSlotViewSettings: const TimeSlotViewSettings(
            startHour: 9,
            endHour: 17,
            nonWorkingDays: <int>[DateTime.friday, DateTime.saturday],
          ),
          scheduleViewSettings: const ScheduleViewSettings(
            appointmentItemHeight: 70,
          ),
          monthCellBuilder: (BuildContext context, MonthCellDetails details) => Center(
            child: Text(
              details.date.day.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          appointmentBuilder: (BuildContext context, CalendarAppointmentDetails details) => Container(
            decoration: BoxDecoration(
              color: details.appointments.first.color,
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.all(4),
            child: Text(
              details.appointments.first.subject,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          onTap: (CalendarTapDetails details) {
            if (details.appointments != null && details.appointments!.isNotEmpty) {
              UNavigator.snackBar(message: "Tapped: ${details.appointments!.first.subject}");
            }
          },
        ),
      );

  static List<Appointment> _getAppointments() {
    final DateTime today = DateTime.now();
    return <Appointment>[
      Appointment(
        startTime: today.add(const Duration(hours: 9)),
        endTime: today.add(const Duration(hours: 11)),
        subject: "Meeting",
        color: Colors.blue,
      ),
      Appointment(
        startTime: today.add(const Duration(days: 1, hours: 14)),
        endTime: today.add(const Duration(days: 1, hours: 16)),
        subject: "Conference",
        color: Colors.green,
        isAllDay: true,
      ),
      Appointment(
        startTime: today.add(const Duration(days: 2, hours: 10)),
        endTime: today.add(const Duration(days: 2, hours: 12)),
        subject: "Workshop",
        color: Colors.red,
        recurrenceRule: "FREQ=DAILY;COUNT=3",
      ),
    ];
  }
}
