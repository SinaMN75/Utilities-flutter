import "package:u/utilities.dart";

abstract class UScreenshot {
  static final NoScreenshot _instance = NoScreenshot.instance;

  static Future<bool> disable() async => _instance.screenshotOff();

  static Future<bool> enable() async => _instance.screenshotOn();

  static Future<bool> toggle() async => _instance.toggleScreenshot();

  // Single switch for maximum protection: blur overlay blocks capture + hides the app-switcher
  // thumbnail, while recording monitoring is toggled alongside for full coverage on every platform.
  static Future<bool> secure(final bool enable, {final double blurRadius = 30.0}) async {
    if (enable) {
      final bool result = await _instance.screenshotWithBlur(blurRadius: blurRadius);
      await _instance.startScreenRecordingListening();
      return result;
    }
    await _instance.stopScreenRecordingListening();
    return _instance.screenshotOn();
  }

  static Future<bool> withBlur({final double blurRadius = 30.0}) async => _instance.toggleScreenshotWithBlur(blurRadius: blurRadius);

  static Future<bool> withColor({final int color = 0xFF000000}) async => _instance.toggleScreenshotWithColor(color: color);

  static Future<bool> withImage() async => _instance.toggleScreenshotWithImage();

  static Stream<ScreenshotSnapshot> get stream => _instance.screenshotStream;

  static Future<void> startListening() async => _instance.startScreenshotListening();

  static Future<void> stopListening() async => _instance.stopScreenshotListening();

  static Future<void> startRecordingListening() async => _instance.startScreenRecordingListening();

  static Future<void> stopRecordingListening() async => _instance.stopScreenRecordingListening();

  static Future<void> onScreenshot(final ScreenshotEventCallback callback) async {
    _instance.onScreenshotDetected = callback;
    await _instance.startScreenshotListening();
    _instance.startCallbacks();
  }

  static Future<void> onScreenRecording({
    required final ScreenshotEventCallback onStart,
    final ScreenshotEventCallback? onStop,
  }) async {
    _instance.onScreenRecordingStarted = onStart;
    if (onStop != null) _instance.onScreenRecordingStopped = onStop;
    await _instance.startScreenRecordingListening();
    _instance.startCallbacks();
  }

  static void removeCallbacks() => _instance.removeAllCallbacks();
}
