import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

class StoryView extends StatefulWidget {
  const StoryView({
    required this.data,
    final Key? key,
    this.footer,
    this.header,
    this.appbar,
  }) : super(key: key);

  final List<MediaViewModel> data;
  final Widget? footer;
  final PreferredSizeWidget? appbar;
  final Widget? header;

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(final BuildContext context) => scaffold(
        appBar: widget.appbar,
        body: CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(height: screenHeight, viewportFraction: 1),
          items: widget.data.map((final MediaViewModel item) {
            Widget result = Container();
            switch (item.type) {
              case MediaType.svg:
                result = _showImage(context, item.link);
                break;
              case MediaType.video:
                result = VideoPlayerScreen(url: item.link);
                break;
              case MediaType.pdf:
                result = _showPdf(context, item.link);
                break;
              case MediaType.voice:
                result = ShowVoice(url: item.link);
                break;
              case MediaType.link:
                result = _showWeb(context, item.link);
                break;
              case MediaType.image:
                result = _showImage(context, item.link);
                break;
            }
            return Stack(
              children: <Widget>[
                result,
                Positioned(top: 0, left: 0, right: 0, child: widget.header ?? Container()),
                item.type != MediaType.link
                    ? Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: widget.footer == null ? _footer(item.link, context) : widget.footer!,
                      )
                    : Container(),
                isWeb
                    ? Positioned(
                        top: screenHeight / 2,
                        right: 10,
                        child: InkWell(
                          onTap: () => buttonCarouselController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          ),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                            child: const Icon(Icons.arrow_right, color: Colors.blueAccent),
                          ),
                        ),
                      )
                    : Container(),
                isWeb
                    ? Positioned(
                        top: screenHeight / 2,
                        left: 10,
                        child: InkWell(
                          onTap: () => buttonCarouselController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          ),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                            child: const Icon(Icons.arrow_left, color: Colors.blueAccent),
                          ),
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList(),
        ),
      );

  Widget _footer(final String url, final BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: double.infinity,
        height: 50,
        child: Row(
          children: <Widget>[
            const Spacer(),
            InkWell(
              onTap: () => shareText(url),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                child: const Icon(Icons.share, color: Colors.blueAccent),
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                child: const Icon(Icons.downloading_outlined, color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      );

  Widget _showImage(final BuildContext context, final String url) => Center(
        child: image(url, height: screenHeight, width: screenWidth),
      );

  Widget _showPdf(final BuildContext context, final String url) => SizedBox(
        height: screenHeight,
        child: SfPdfViewer.network(url),
      );

  Widget _showWeb(final BuildContext context, final String url) => WebViewX(
        initialContent: url,
        height: screenHeight,
        width: screenWidth,
      );
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({required this.url, final Key? key}) : super(key: key);
  final String url;

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => SizedBox(
        height: screenHeight,
        child: FutureBuilder<dynamic>(
          future: _initializeVideoPlayerFuture,
          builder: (final BuildContext context, final dynamic snapshot) {
            if (snapshot.connectionState == ConnectionState.done)
              return AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller));
            else
              return const Center(child: CircularProgressIndicator());
          },
        ),
      );
}

class ShowVoice extends StatefulWidget {
  const ShowVoice({required this.url, final Key? key}) : super(key: key);
  final String url;

  @override
  _ShowVoiceState createState() => _ShowVoiceState();
}

class _ShowVoiceState extends State<ShowVoice> {
  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    play(widget.url);
    super.initState();
  }

  void play(final String url) async {
    await player.setUrl(url);
    await player.play();
  }

  @override
  void dispose() {
    player.pause();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Container();
}
