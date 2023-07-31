import 'package:utilities/utilities.dart';

export 'dart:async';
export 'dart:convert';

export 'package:cached_network_image/cached_network_image.dart';
export 'package:file_picker/file_picker.dart';
export 'package:flutter/material.dart';
export 'package:flutter_local_notifications/flutter_local_notifications.dart';
export 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:get/get.dart';
export 'package:get_storage/get_storage.dart';
export 'package:group_button/group_button.dart';
export 'package:image_cropper/image_cropper.dart';
export 'package:just_audio/just_audio.dart';
export 'package:local_auth/local_auth.dart';
export 'package:mobile_scanner/mobile_scanner.dart';
export 'package:path_provider/path_provider.dart';
export 'package:persian_datetime_picker/persian_datetime_picker.dart';
export 'package:persian_tools/persian_tools.dart';
export 'package:pin_code_fields/pin_code_fields.dart';
export 'package:screenshot/screenshot.dart';
export 'package:share_plus/share_plus.dart';
export 'package:syncfusion_flutter_barcodes/barcodes.dart';
export 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:video_box/video_box.dart';
export 'package:webviewx_plus/webviewx_plus.dart';

export 'components/components.dart';
export 'data/data.dart';
export 'data/dto/dto.dart';
export 'utils/enums.dart';
export 'utils/utils.dart';
export 'view_models/view_models.dart';

void initUtilities() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
}
