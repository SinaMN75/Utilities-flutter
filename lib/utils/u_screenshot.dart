import "package:u/utilities.dart";

abstract class UScreenshot {
  static final NoScreenshot _instance = NoScreenshot.instance;

  static Future<bool> disable() async => _instance.screenshotWithBlur();

  static Future<void> disableStrict() async {
    await _instance.screenshotWithBlur();
    _instance.onScreenshotDetected = (_) => exit(0);
    _instance.onScreenRecordingStarted = (_) => exit(0);
    _instance.startCallbacks();
    await _instance.startScreenshotListening();
    await _instance.startScreenRecordingListening();
  }
}