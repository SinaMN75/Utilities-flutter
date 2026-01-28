import "package:u/utilities.dart";

class USendAgainCountDown extends StatefulWidget {
  const USendAgainCountDown({
    required this.counter,
    required this.onSendAgainTap,
    required this.buttonTitle,
    required this.counterDescription,
    super.key,
  });

  final int counter;
  final VoidCallback onSendAgainTap;
  final String buttonTitle;
  final String counterDescription;

  @override
  State<USendAgainCountDown> createState() => _USendAgainCountDownState();
}

class _USendAgainCountDownState extends State<USendAgainCountDown> {
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
          child: Text(
            widget.buttonTitle,
          ).labelLarge(color: context.theme.colorScheme.primary),
        )
      : TextButton(
          onPressed: null,
          child: Text(
            "$counter ${widget.counterDescription}",
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
