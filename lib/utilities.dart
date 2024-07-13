import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:utilities/utilities.dart';

export 'dart:async';
export 'dart:convert';

export 'package:cached_network_image/cached_network_image.dart';
export 'package:chewie/chewie.dart';
export 'package:file_picker/file_picker.dart';
export 'package:firebase_analytics/firebase_analytics.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_crashlytics/firebase_crashlytics.dart';
export 'package:firebase_messaging/firebase_messaging.dart';
export 'package:flutter/material.dart';
export 'package:flutter_contacts/contact.dart';
export 'package:flutter_easyloading/flutter_easyloading.dart';
export 'package:flutter_local_notifications/flutter_local_notifications.dart';
export 'package:flutter_map/flutter_map.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:geolocator/geolocator.dart';
export 'package:get/get.dart';
export 'package:get_storage/get_storage.dart';
export 'package:group_button/group_button.dart';
export 'package:image_cropper/image_cropper.dart';
export 'package:local_auth/local_auth.dart';
export 'package:path_provider/path_provider.dart';
export 'package:persian_tools/persian_tools.dart';
export 'package:screenshot/screenshot.dart';
export 'package:share_plus/share_plus.dart';
export 'package:syncfusion_flutter_barcodes/barcodes.dart';
export 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:utilities/persian_date_picker/persian_datetime_picker.dart';
export 'package:utilities/persian_date_picker/src/date/shamsi_date.dart';
export 'package:uuid/uuid.dart';
export 'package:video_player/video_player.dart';
export 'package:webview_flutter/webview_flutter.dart';

export 'components/components.dart';
export 'components/fdottedline.dart';
export 'components/percent_indicator.dart';
export 'data/data.dart';
export 'utils/utils.dart';

abstract class UtilitiesCore {
  static late String apiKey;
}

Future<void> initUtilities({
  final FirebaseOptions? firebaseOptions,
  required final String apiKey,
  final bool safeDevice = false,
  final bool protectDataLeaking = false,
  final bool preventScreenShot = false,
  final List<DeviceOrientation> deviceOrientations = const <DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ],
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await SystemChrome.setPreferredOrientations(deviceOrientations);
  } catch (e) {}
  try {
    await GetStorage.init();
  } catch (e) {}
  if (firebaseOptions != null) {
    try {
      await Firebase.initializeApp(options: firebaseOptions);
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
      PlatformDispatcher.instance.onError = (final Object error, final StackTrace stack) {
        FirebaseCrashlytics.instance.recordError(error, stack);
        return true;
      };
    } catch (e) {}
  }
  try {
    if (protectDataLeaking) await ScreenProtector.protectDataLeakageWithColor(Colors.white);
    if (preventScreenShot) await ScreenProtector.preventScreenshotOn();
  } catch (e) {}

  UtilitiesCore.apiKey = apiKey;
  return;
}
