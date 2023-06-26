part of 'view_models.dart';

class MediaViewModel {
  MediaViewModel({required this.link, this.type = MediaType.image, this.deepLink});

  final MediaType type;
  final String link;
  final String? deepLink;
}
