import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_box/video_box.dart';

class ItemVideo extends StatefulWidget {
  ItemVideo({required this.address, this.setLooping, this.videoAspectRatio, this.aspectRatio, Key? key}) : super(key: key);
  String address;
  bool? setLooping;
  double? aspectRatio;
  Function(double aspectRatio)? videoAspectRatio;

  @override
  createState() => _ItemVideoState();
}

class _ItemVideoState extends State<ItemVideo> {
  late VideoController vc;

  RxBool isInit = false.obs;
  RxBool init = true.obs;

  void setIndex() {
    vc.autoplay = true;
    vc.setLooping(widget.setLooping ?? false);
    vc.setSource(VideoPlayerController.network(widget.address));
    vc.initialize().then((_) {
      isInit(true);
      if (widget.videoAspectRatio != null) {
        widget.videoAspectRatio!(vc.value.size.aspectRatio);
      }
      setState(() {});
    });
    setState(() {});

    vc.play();
  }

  @override
  void initState() {
    super.initState();
    vc = VideoController(source: VideoPlayerController.network(widget.address))..initialize();
    setState(() => setIndex());
  }

  @override
  void dispose() {
    vc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => init.value
        ? AspectRatio(
            aspectRatio: widget.aspectRatio ?? (isInit.value && vc.value.size.aspectRatio > 0 ? vc.value.size.aspectRatio : 1),
            child: VideoBox(controller: vc),
          )
        : const SizedBox());
  }
}

//
// Widget rrr(){
//
//   return FutureBuilder(
//     future:   , builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//
//
//   },
//   );
// }
