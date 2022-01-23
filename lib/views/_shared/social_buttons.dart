import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SocialButton(
              svgLogo: 'assets/icons/github_icon.svg',
              helpText: 'See my github account',
              onTap: () {
                //TODO: Navegar Para Github
              }),
          SocialButton(
              svgLogo: 'assets/icons/linkedin_icon.svg',
              helpText: 'See my linkedin account',
              onTap: () {
                //TODO: Navegar Para Linkedin

              }),
          SocialButton(
              svgLogo: 'assets/icons/youtube_icon.svg',
              helpText: 'Follow my youtube channel',
              onTap: () {
                //TODO: Navegar Para Youtube
              }),
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String svgLogo;
  final String helpText;
  final VoidCallback onTap;

  const SocialButton({
    Key? key,
    required this.svgLogo,
    required this.helpText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: helpText,
      child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(
          svgLogo,
          color: Colors.white70,
          height: 20,
        ),
      ),
    );
  }
}
