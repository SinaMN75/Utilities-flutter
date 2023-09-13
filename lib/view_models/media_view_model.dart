part of 'view_models.dart';

class MediaViewModel {
  MediaViewModel({required this.link, this.type = TypeMedia.image, this.deepLink});

  final TypeMedia type;
  final String link;
  final String? deepLink;
}
