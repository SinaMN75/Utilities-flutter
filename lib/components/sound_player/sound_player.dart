import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:utilities/components/sound_player/widgets.dart';

class SoundPlayer extends StatefulWidget {
  SoundPlayer({required this.list, Key? key}) : super(key: key);

  List<String> list;

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
    var playlist = ConcatenatingAudioSource(
      useLazyPreparation: true,
      shuffleOrder: DefaultShuffleOrder(),
      children: widget.list.map((e) => AudioSource.uri(Uri.parse(e))).toList(),
    );

    player.setAudioSource(playlist, initialIndex: 0, initialPosition: Duration.zero);
    player.play();
  }

  String getTime(Duration? duration) {
    String d = duration.toString();
    String res = '';
    if (duration != null && d.contains(":")) {
      String h = d.split(":")[0];
      String m = d.split(":")[1];
      String s = d.split(":")[2].split(".")[0];
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
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff10182f),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    speedPlay(listSpeed: [0.25, 0.50, 0.75, 1.0, 1.25, 1.50, 1.75]),
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
                children: [
                  SizedBox(
                    height: 25,
                    width: MediaQuery.of(context).size.width,
                    child: seekBar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StreamBuilder<PositionData>(
                          stream: positionDataStream,
                          builder: (context, snapshot) {
                            final positionData = snapshot.data;
                            return Text(getTime(positionData?.position ?? Duration.zero), style: const TextStyle(fontSize: 18, color: Colors.white));
                          },
                        ),
                        StreamBuilder<PositionData>(
                          stream: positionDataStream,
                          builder: (context, snapshot) {
                            final positionData = snapshot.data;
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
}

class HiddenThumbComponentShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.zero;

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {}
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}
