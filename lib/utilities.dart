import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

export 'dart:async';
export 'dart:convert';

export 'package:collection/collection.dart';
export 'package:file_picker/file_picker.dart';
export 'package:flutter_local_notifications/flutter_local_notifications.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:get/get.dart';
export 'package:get_storage/get_storage.dart';
export 'package:group_button/group_button.dart';
export 'package:image_cropper/image_cropper.dart';
export 'package:intl/intl.dart';
export 'package:just_audio/just_audio.dart';
export 'package:path_provider/path_provider.dart';
export 'package:persian_tools/persian_tools.dart';
export 'package:pin_code_fields/pin_code_fields.dart';
export 'package:share_plus/share_plus.dart';
export 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:video_player/video_player.dart';
export 'package:webviewx/webviewx.dart';
export 'package:cached_network_image/cached_network_image.dart';

export 'components/components.dart';
export 'data/data.dart';
export 'data/dto/dto.dart';
export 'utils/utils.dart';
export 'utils/validators.dart';
export 'components/sound_player/sound_player.dart';
export 'view_models/view_models.dart';
export 'utils/enums.dart';
export 'components/grid.dart';



void initUtilities() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
}
