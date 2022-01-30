import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostInteractionButton extends StatelessWidget {
  final String iconPath;
  final String? tooltip;
  final VoidCallback? onPressed;

  const PostInteractionButton({
    Key? key,
    required this.iconPath,
    required this.onPressed,
    required this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      icon: SvgPicture.asset(
        iconPath,
      ),
      iconSize: 20,
      color: Colors.black,
      onPressed: onPressed,
    );
  }
}
