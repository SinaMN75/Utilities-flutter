import "package:u/utilities.dart";

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    required this.counter,
    required this.onSendAgainTap,
    super.key,
  });

  final int counter;
  final VoidCallback onSendAgainTap;

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  int counter = 0;
  late Timer timer;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => counter == 0
      ? TextButton(
          onPressed: widget.onSendAgainTap,
          child: const Text(
            "ارسال دوباره",
          ).labelLarge(color: context.theme.colorScheme.primary),
        )
      : TextButton(
          onPressed: null,
          child: Text(
            "$counter ${"ثانیه برای ارسال دوباره"}",
          ).labelLarge(color: context.theme.colorScheme.primary),
        );

  void startTimer() {
    counter = widget.counter;
    timer = Timer.periodic(const Duration(seconds: 1), (final Timer timer) {
      setState(() => counter--);
      if (counter == 0) timer.cancel();
    });
  }
}
