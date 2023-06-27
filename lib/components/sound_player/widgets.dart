import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:utilities/components/sound_player/sound_player.dart';

mixin Widgets {
  late AudioPlayer player = AudioPlayer();
  String speed = '1.1X';
  bool isShowSpeed = false;

  Stream<PositionData> get positionDataStream => Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        player.positionStream,
        player.bufferedPositionStream,
        player.durationStream,
        (final Duration position, final Duration bufferedPosition, final Duration? duration) => PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  void showSliderDialog({
    required final BuildContext context,
    required final String title,
    required final int divisions,
    required final double min,
    required final double max,
    required final double value, required final Stream<double> stream, required final ValueChanged<double> onChanged, final String valueSuffix = '',
  }) {
    showDialog<void>(
      context: context,
      builder: (final BuildContext context) => AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
        content: StreamBuilder<double>(
          stream: stream,
          builder: (final BuildContext context, final AsyncSnapshot<double> snapshot) => SizedBox(
            height: 100,
            child: Column(
              children: [
                Text('${snapshot.data?.toStringAsFixed(1)}$valueSuffix', style: const TextStyle(fontFamily: 'Fixed', fontWeight: FontWeight.bold, fontSize: 24)),
                Slider(
                  divisions: divisions,
                  min: min,
                  max: max,
                  value: snapshot.data ?? value,
                  onChanged: onChanged,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget speedPlay({required final List<double> listSpeed}) => StreamBuilder<double>(
      stream: player.speedStream,
      builder: (final BuildContext context, final AsyncSnapshot<double> snapshot) => Container(
        width: 50,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white),
        ),
        child: IconButton(
          icon: Text("${snapshot.data?.toStringAsFixed(1)}x", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          onPressed: () {
            showSliderDialog(
              context: context,
              title: "Adjust speed",
              divisions: 10,
              min: 0.5,
              max: 1.5,
              value: player.speed,
              stream: player.speedStream,
              onChanged: player.setSpeed,
            );
          },
        ),
      ),
    );

  Widget seekBar() => StreamBuilder<PositionData>(
      stream: positionDataStream,
      builder: (final BuildContext context, final AsyncSnapshot<PositionData> snapshot) {
        final PositionData? positionData = snapshot.data;
        return SeekBar(
          duration: positionData?.duration ?? Duration.zero,
          position: positionData?.position ?? Duration.zero,
          bufferedPosition: positionData?.bufferedPosition ?? Duration.zero,
          onChangeEnd: player.seek,
        );
      },
    );

  Widget previous() => StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (final BuildContext context, final AsyncSnapshot<PlayerState> snapshot) {
        if (player.hasPrevious) {
          return iconPlay(icon: Icons.skip_previous, onTap: () => player.seekToPrevious());
        } else {
          return iconPlay(icon: Icons.skip_previous, color: Colors.white.withOpacity(0.5));
        }
      },
    );

  Widget next() => StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (final BuildContext context, final AsyncSnapshot<PlayerState> snapshot) {
        if (player.hasNext) {
          return iconPlay(icon: Icons.skip_next, onTap: () => player.seekToNext());
        } else {
          return iconPlay(icon: Icons.skip_next, color: Colors.white.withOpacity(0.5));
        }
      },
    );

  Widget play() => StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (final BuildContext context, final AsyncSnapshot<PlayerState> snapshot) {
        final PlayerState? playerState = snapshot.data;
        final ProcessingState? processingState = playerState?.processingState;
        final bool? playing = playerState?.playing;
        if (processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
          return Container(margin: const EdgeInsets.all(8), width: 48, height: 48, child: const CircularProgressIndicator());
        } else if (playing != true) {
          return iconPlay(icon: Icons.play_arrow, onTap: player.play);
        } else if (processingState != ProcessingState.completed) {
          return iconPlay(icon: Icons.pause, onTap: player.pause);
        } else {
          return iconPlay(icon: Icons.replay, onTap: () => player.seek(Duration.zero));
        }
      },
    );

  Widget fileName({
    required final List<String> list,
  }) => StreamBuilder<Duration?>(
      stream: player.durationStream,
      builder: (final BuildContext context, final AsyncSnapshot<Duration?> snapshot) => Container(
          width: 300,
          height: 50,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (final BuildContext context, final int index) => Text(
              list[player.currentIndex ?? 0].split("/")[list[player.currentIndex ?? 0].split("/").length - 1].replaceAll("%20", " "),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
    );

  Widget iconPlay({required final IconData icon, final Color? color, final VoidCallback? onTap}) => InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color ?? Colors.white, width: 4),
        ),
        child: Icon(
          icon,
          size: 40,
          color: color ?? Colors.white,
        ),
      ),
    );
}

class SeekBar extends StatefulWidget {

  const SeekBar({
    required this.duration, required this.position, required this.bufferedPosition, final Key? key,
    this.onChanged,
    this.onChangeEnd,
  }) : super(key: key);
  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  @override
  SeekBarState createState() => SeekBarState();
}

class SeekBarState extends State<SeekBar> {
  double? _dragValue;
  late SliderThemeData _sliderThemeData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sliderThemeData = SliderTheme.of(context).copyWith(
      trackHeight: 2,
    );
  }

  @override
  Widget build(final BuildContext context) => Stack(
      children: [
        SliderTheme(
          data: _sliderThemeData.copyWith(
            thumbShape: HiddenThumbComponentShape(),
            activeTrackColor: Colors.blue.shade100,
            inactiveTrackColor: Colors.grey.shade300,
          ),
          child: ExcludeSemantics(
            child: Slider(
              min: 0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: min(widget.bufferedPosition.inMilliseconds.toDouble(), widget.duration.inMilliseconds.toDouble()),
              onChanged: (final double value) {
                setState(() {
                  _dragValue = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(Duration(milliseconds: value.round()));
                }
              },
              onChangeEnd: (final double value) {
                if (widget.onChangeEnd != null) {
                  widget.onChangeEnd!(Duration(milliseconds: value.round()));
                }
                _dragValue = null;
              },
            ),
          ),
        ),
        SliderTheme(
          data: _sliderThemeData.copyWith(
            inactiveTrackColor: Colors.transparent,
          ),
          child: Slider(
            min: 0,
            max: widget.duration.inMilliseconds.toDouble(),
            value: min(_dragValue ?? widget.position.inMilliseconds.toDouble(), widget.duration.inMilliseconds.toDouble()),
            onChanged: (final double value) {
              setState(() {
                _dragValue = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(Duration(milliseconds: value.round()));
              }
            },
            onChangeEnd: (final double value) {
              if (widget.onChangeEnd != null) {
                widget.onChangeEnd!(Duration(milliseconds: value.round()));
              }
              _dragValue = null;
            },
          ),
        ),
        Positioned(
          right: 16,
          bottom: 0,
          child: Text(RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$').firstMatch("$_remaining")?.group(1) ?? '$_remaining', style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    );

  Duration get _remaining => widget.duration - widget.position;
}
