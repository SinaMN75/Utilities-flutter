import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:safe_device/safe_device.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:utilities/utilities.dart';

export 'dart:async';
export 'dart:convert';

export 'package:cached_network_image/cached_network_image.dart';
export 'package:file_picker/file_picker.dart';
export 'package:firebase_analytics/firebase_analytics.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_crashlytics/firebase_crashlytics.dart';
export 'package:firebase_messaging/firebase_messaging.dart';
export 'package:flutter/material.dart';
export 'package:flutter_colorpicker/flutter_colorpicker.dart';
export 'package:flutter_contacts/contact.dart';
export 'package:flutter_easyloading/flutter_easyloading.dart';
export 'package:flutter_local_notifications/flutter_local_notifications.dart';
export 'package:flutter_map/flutter_map.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:get/get.dart';
export 'package:get_storage/get_storage.dart';
export 'package:google_sign_in/google_sign_in.dart';
export 'package:group_button/group_button.dart';
export 'package:image_cropper/image_cropper.dart';
export 'package:just_audio/just_audio.dart';
export 'package:local_auth/local_auth.dart';
export 'package:location/location.dart';
export 'package:mobile_scanner/mobile_scanner.dart';
export 'package:path_provider/path_provider.dart';
export 'package:persian_datetime_picker/persian_datetime_picker.dart';
export 'package:persian_tools/persian_tools.dart';
export 'package:screenshot/screenshot.dart';
export 'package:share_plus/share_plus.dart';
export 'package:syncfusion_flutter_barcodes/barcodes.dart';
export 'package:syncfusion_flutter_charts/charts.dart';
export 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:video_box/video_box.dart';
export 'package:webviewx_plus/webviewx_plus.dart';

export 'components/components.dart';
export 'components/fdottedline.dart';
export 'components/percent_indicator.dart';
export 'data/data.dart';
export 'utils/utils.dart';

Future<void> initUtilities({
  final FirebaseOptions? firebaseOptions,
  final bool safeDevice = false,
  final bool protectDataLeaking = false,
  final bool preventScreenShot = false,
  final List<DeviceOrientation> deviceOrientations = const <DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(deviceOrientations);
  await GetStorage.init();
  if (firebaseOptions != null) {
    await Firebase.initializeApp(options: firebaseOptions);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (final Object error, final StackTrace stack) {
      FirebaseCrashlytics.instance.recordError(error, stack);
      return true;
    };
  }
  if (safeDevice && await SafeDevice.isSafeDevice) exit(0);
  if (protectDataLeaking) await ScreenProtector.protectDataLeakageWithColor(Colors.white);
  if (preventScreenShot) await ScreenProtector.preventScreenshotOn();
  return;
}
