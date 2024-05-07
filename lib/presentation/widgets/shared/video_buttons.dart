import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:tok_tik/config/helpers/human_formats.dart';
import 'package:tok_tik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(iconColor: Colors.red, iconData: Icons.favorite, value: video.likes,),
        const SizedBox(height: 15,),
        _CustomIconButton(iconData: Icons.remove_red_eye_outlined, value: video.views,),
        const SizedBox(height: 15,),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton(value: null, iconData: Icons.play_circle_outline),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int? value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton({
    required this.value,
    required this.iconData,
    iconColor
  }): color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: () {}, icon: Icon(iconData, color: color, size: 30,)),

        if (value != null)
          Text(HumanFormats.humanReadableNumber(value!.toDouble())),
      ],
    );
  }
}