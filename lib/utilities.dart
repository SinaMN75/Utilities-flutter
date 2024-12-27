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

export 'components/badges.dart';
export 'components/barcode_qrcode.dart';
export 'components/bottom_sheet.dart';
export 'components/chart.dart';
export 'components/container.dart';
export 'components/cupertino_date_picker.dart';
export 'components/fdottedline.dart';
export 'components/flip_card.dart';
export 'components/flutter_tree.dart';
export 'components/form.dart';
export 'components/image.dart';
export 'components/link_previewer.dart';
export 'components/map.dart';
export 'components/otp_field.dart';
export 'components/pagination.dart';
export 'components/percent_indicator.dart';
export 'components/plus_minus.dart';
export 'components/rating_bar.dart';
export 'components/readmore.dart';
export 'components/scrolling_text.dart';
export 'components/webview.dart';
export 'data/data.dart';
export 'utils/clipboard.dart';
export 'utils/constants.dart';
export 'utils/enums.dart';
export 'utils/extensions/date_extension.dart';
export 'utils/extensions/enums_extension.dart';
export 'utils/extensions/file_extension.dart';
export 'utils/extensions/iterable_extension.dart';
export 'utils/extensions/number_extension.dart';
export 'utils/extensions/string_extension.dart';
export 'utils/extensions/text_extension.dart';
export 'utils/extensions/widget_extension.dart';
export 'utils/file.dart';
export 'utils/firebase.dart';
export 'utils/fonts.dart';
export 'utils/http_interceptor.dart';
export 'utils/internet_connection_checker.dart';
export 'utils/launch.dart';
export 'utils/loading.dart';
export 'utils/local_auth.dart';
export 'utils/local_storage.dart';
export 'utils/location.dart';
export 'utils/multi_formatter/flutter_multi_formatter.dart';
export 'utils/navigator.dart';
export 'utils/notification.dart';
export 'utils/shamsi_date/shamsi_date.dart';
export 'utils/u_app_utils.dart';
export 'utils/utils.dart';
export 'utils/uuid.dart';
export 'utils/view_models.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

abstract class UCore {
  static late String apiKey;
}

Future<void> initUtilities({
  required final String apiKey,
  final FirebaseOptions? firebaseOptions,
  final String? baseUrl,
  final bool safeDevice = false,
  final bool protectDataLeaking = false,
  final bool preventScreenShot = false,
  final List<DeviceOrientation> deviceOrientations = const <DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ],
}) async {
  WidgetsFlutterBinding.ensureInitialized();
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

  UCore.apiKey = apiKey;
  if (baseUrl != null) URemoteDataSource.baseUrl = baseUrl;
  return;
}
