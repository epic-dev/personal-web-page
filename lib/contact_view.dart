import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactView extends StatelessWidget {
  final String facebookUrl = 'https://www.facebook.com/pavel.yuruts';
  final String githubUrl = 'https://github.com/epic-dev';
  final String linkedinUrl = 'https://www.linkedin.com/in/pavel-yuruts-81170659/';
  final String facebook = 'assets/logos/facebook.png';
  final String github = 'assets/logos/github.png';
  final String linkedin = 'assets/logos/linkedin.png';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 38.0),
            child: Text(
              'Psst... Wanna chat? See my work? Or hire me? :)',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'SourceCodePro',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _SocialMediaButton(
                url: facebookUrl,
                logoAssetPath: facebook,
              ),
              _SocialMediaButton(
                url: githubUrl,
                logoAssetPath: github,
              ),
              _SocialMediaButton(
                url: linkedinUrl,
                logoAssetPath: linkedin,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialMediaButton extends StatelessWidget {
  final String url;
  final String logoAssetPath;
  final width = 50.0;
  final height = 50.0;

  const _SocialMediaButton({Key key, this.url, this.logoAssetPath}) : super(key: key);

  void _followLink(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent), // removes ripple effect
      ),
      onPressed: () => _followLink(url),
      child: Image.asset(
        logoAssetPath,
        width: width,
        height: height,
      ),
    );
  }
}
