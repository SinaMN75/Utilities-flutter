import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:utilities/components/sound_player/widgets.dart';

class SoundPlayer extends StatefulWidget {
  const SoundPlayer({required this.list, final Key? key}) : super(key: key);

  final List<String> list;

  @override
  State<SoundPlayer> createState() => _SoundPlayerState();
}

class _SoundPlayerState extends State<SoundPlayer> with Widgets {
  @override
  void initState() {
    super.initState();
    setPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  void setPlayer() async {
    final ConcatenatingAudioSource playlist = ConcatenatingAudioSource(
      shuffleOrder: DefaultShuffleOrder(),
      children: widget.list.map((final String e) => AudioSource.uri(Uri.parse(e))).toList(),
    );

    await player.setAudioSource(playlist, initialIndex: 0, initialPosition: Duration.zero);
    await player.play();
  }

  String getTime(final Duration? duration) {
    final String d = duration.toString();
    String res = '';
    if (duration != null && d.contains(":")) {
      final String h = d.split(":")[0];
      final String m = d.split(":")[1];
      final String s = d.split(":")[2].split(".")[0];
      if (h != "0") {
        res = '$h:$m:$s';
      } else {
        res = '$m:$s';
      }
    } else {
      res = "00:00";
    }

    return res;
  }

  @override
  Widget build(final BuildContext context) => Container(
      color: const Color(0xff10182f),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    speedPlay(listSpeed: <double>[0.25, 0.50, 0.75, 1, 1.25, 1.50, 1.75]),
                    fileName(list: widget.list),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  previous(),
                  play(),
                  next(),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 25,
                    width: MediaQuery.of(context).size.width,
                    child: seekBar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        StreamBuilder<PositionData>(
                          stream: positionDataStream,
                          builder: (final BuildContext context, final AsyncSnapshot<PositionData> snapshot) {
                            final PositionData? positionData = snapshot.data;
                            return Text(getTime(positionData?.position ?? Duration.zero), style: const TextStyle(fontSize: 18, color: Colors.white));
                          },
                        ),
                        StreamBuilder<PositionData>(
                          stream: positionDataStream,
                          builder: (final BuildContext context, final AsyncSnapshot<PositionData> snapshot) {
                            final PositionData? positionData = snapshot.data;
                            return Text(getTime(positionData?.duration ?? Duration.zero), style: const TextStyle(fontSize: 18, color: Colors.white));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
}

class HiddenThumbComponentShape extends SliderComponentShape {
  @override
  Size getPreferredSize(final bool isEnabled, final bool isDiscrete) => Size.zero;

  @override
  void paint(
    final PaintingContext context,
    final Offset center, {
    required final Animation<double> activationAnimation,
    required final Animation<double> enableAnimation,
    required final bool isDiscrete,
    required final TextPainter labelPainter,
    required final RenderBox parentBox,
    required final SliderThemeData sliderTheme,
    required final TextDirection textDirection,
    required final double value,
    required final double textScaleFactor,
    required final Size sizeWithOverflow,
  }) {}
}

class PositionData {

  PositionData(this.position, this.bufferedPosition, this.duration);
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}
