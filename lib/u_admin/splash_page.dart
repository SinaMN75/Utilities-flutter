import "package:u/utilities.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({
    required this.logo,
    required this.onError,
    required this.onFinish,
    super.key,
  });

  final VoidCallback onFinish;
  final VoidCallback onError;
  final String logo;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final UAdminSplashController c = UAdminSplashController();

  @override
  void initState() {
    c.init(
      // onFinish: () =>  UNavigator.offAll(const MainPage()),
      onFinish: widget.onFinish,
      onError: () async {
        await ULocalStorage.clear();
        // await delay(100, () => UNavigator.offAll(const LoginPage()));
        widget.onError();
      },
    );
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => UScaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            UImage(widget.logo, width: 200, height: 200),
            const CircularProgressIndicator(),
          ],
        ).alignAtCenter(),
      );
}
