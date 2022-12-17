import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});
  _launchURLBrowser(String link) async {
    var url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => _launchURLBrowser('https://github.com/Omar-Hosny1'),
              child: Image.asset(
                height: 40,
                "assets/icons/github.png",
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () =>
                  _launchURLBrowser('https://leetcode.com/hosnyomar022/'),
              child: Image.asset(
                height: 40,
                "assets/icons/coding.png",
                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () => _launchURLBrowser(
                  'https://www.linkedin.com/in/omar-hosny-68a712208/'),
              child: Image.asset(
                height: 40,
                "assets/icons/linkedin.png",
                color: Colors.white,
              ),
            )
          ],
        ));
  }
}
