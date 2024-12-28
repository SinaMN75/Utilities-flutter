import 'dart:io';

import 'package:safe_device/safe_device.dart';
import 'package:utilities_framework_flutter/utilities.dart';

export 'dart:async';
export 'dart:convert';
export 'dart:math';

export 'package:any_link_preview/any_link_preview.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:carousel_slider/carousel_slider.dart';
export 'package:chewie/chewie.dart';
export 'package:device_info_plus/device_info_plus.dart';
export 'package:file_picker/file_picker.dart';
export 'package:firebase_analytics/firebase_analytics.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_crashlytics/firebase_crashlytics.dart';
export 'package:firebase_messaging/firebase_messaging.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart';
export 'package:flutter/rendering.dart';
export 'package:flutter/services.dart';
export 'package:flutter_easyloading/flutter_easyloading.dart';
export 'package:flutter_local_notifications/flutter_local_notifications.dart';
export 'package:flutter_map/flutter_map.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:flutter_typeahead/flutter_typeahead.dart';
export 'package:geolocator/geolocator.dart';
export 'package:get/get.dart';
export 'package:group_button/group_button.dart';
export 'package:image_cropper/image_cropper.dart';
export 'package:local_auth/local_auth.dart';
export 'package:package_info_plus/package_info_plus.dart';
export 'package:path_provider/path_provider.dart';
export 'package:screen_protector/screen_protector.dart';
export 'package:screenshot/screenshot.dart';
export 'package:share_plus/share_plus.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:slide_countdown/slide_countdown.dart';
export 'package:syncfusion_flutter_barcodes/barcodes.dart';
export 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:utilities_framework_flutter/utilities.dart';
export 'package:uuid/uuid.dart';
export 'package:video_player/video_player.dart';
export 'package:webview_flutter/webview_flutter.dart';

export 'src/components/badges.dart';
export 'src/components/barcode_qrcode.dart';
export 'src/components/bottom_sheet.dart';
export 'src/components/chart.dart';
export 'src/components/container.dart';
export 'src/components/cupertino_date_picker.dart';
export 'src/components/fdottedline.dart';
export 'src/components/flip_card.dart';
export 'src/components/flutter_tree.dart';
export 'src/components/form.dart';
export 'src/components/image.dart';
export 'src/components/link_previewer.dart';
export 'src/components/map.dart';
export 'src/components/otp_field.dart';
export 'src/components/pagination.dart';
export 'src/components/percent_indicator.dart';
export 'src/components/plus_minus.dart';
export 'src/components/rating_bar.dart';
export 'src/components/readmore.dart';
export 'src/components/scrolling_text.dart';
export 'src/components/webview.dart';
export 'src/data/data.dart';
export 'src/utils/clipboard.dart';
export 'src/utils/constants.dart';
export 'src/utils/enums.dart';
export 'src/utils/extensions/date_extension.dart';
export 'src/utils/extensions/enums_extension.dart';
export 'src/utils/extensions/file_extension.dart';
export 'src/utils/extensions/iterable_extension.dart';
export 'src/utils/extensions/number_extension.dart';
export 'src/utils/extensions/string_extension.dart';
export 'src/utils/extensions/text_extension.dart';
export 'src/utils/extensions/widget_extension.dart';
export 'src/utils/file.dart';
export 'src/utils/firebase.dart';
export 'src/utils/fonts.dart';
export 'src/utils/http_interceptor.dart';
export 'src/utils/internet_connection_checker.dart';
export 'src/utils/launch.dart';
export 'src/utils/loading.dart';
export 'src/utils/local_auth.dart';
export 'src/utils/local_storage.dart';
export 'src/utils/location.dart';
export 'src/utils/multi_formatter/flutter_multi_formatter.dart';
export 'src/utils/navigator.dart';
export 'src/utils/notification.dart';
export 'src/utils/shamsi_date/shamsi_date.dart';
export 'src/utils/u_app_utils.dart';
export 'src/utils/utils.dart';
export 'src/utils/uuid.dart';
export 'src/utils/view_models.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

abstract class UCore {
  static late String apiKey;
}

Future<void> initUtilities({
  final String? apiKey,
  final FirebaseOptions? firebaseOptions,
  final String? baseUrl,
  final bool safeDevice = false,
  final bool protectDataLeaking = false,
  final bool preventScreenShot = false,
  final EasyLoadingIndicatorType loadingType = EasyLoadingIndicatorType.dualRing,
  final EasyLoadingStyle loadingStyle = EasyLoadingStyle.custom,
  final List<DeviceOrientation> deviceOrientations = const <DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ],
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (safeDevice && !(await SafeDevice.isSafeDevice)) exit(0);
  await SystemChrome.setPreferredOrientations(deviceOrientations);
  await ULocalStorage.init();
  UApp.packageInfo = await PackageInfo.fromPlatform();
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

  UCore.apiKey = apiKey ?? "";
  if (baseUrl != null) URemoteDataSource.baseUrl = baseUrl;

  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = loadingType
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.blue
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.blue
    ..textColor = Colors.transparent
    ..maskColor = Colors.blue
    ..maskType = EasyLoadingMaskType.clear
    ..loadingStyle = loadingStyle
    ..userInteractions = false
    ..boxShadow = <BoxShadow>[]
    ..dismissOnTap = false;

  return;
}
