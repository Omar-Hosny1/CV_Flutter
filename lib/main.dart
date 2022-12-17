import 'dart:io';

import 'package:cv/widgets/bottomNavigationBar.dart';
import 'package:cv/widgets/entry.dart';
import 'package:cv/widgets/language.dart';
import 'package:cv/widgets/skill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 41, 46, 53),
        accentColor: Color.fromARGB(255, 255, 255, 255),
      ),
      title: "OH Resume",
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Map<String, dynamic>> projects = [
    {
      'name': 'Adidas Clone',
      'type': 'E-Commerce Website',
      'link': 'https://commerce-app-angular.web.app/',
      'icon': Icon(Icons.shopping_bag, color: Colors.white)
    },
    {
      'name': 'Marvel Website',
      'type': 'Movies Website',
      'link': 'https://movies-website-oh.netlify.app/home',
      'icon': Icon(Icons.movie_creation_outlined, color: Colors.white)
    },
    {
      'name': 'Play station 5',
      'type': 'PS Simulator',
      'link': 'https://ps-simulator-7aa3c.web.app/',
      'icon': Icon(Icons.games, color: Colors.white)
    },
  ];

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
    String aboutMe =
        '''Software Engineer With Good Problem Solving Skills, have A Passione For learning New Technologies''';
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            margin: EdgeInsets.only(top: 17, left: 15, right: 15),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Omar Hosny".toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Software Engineer",
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Icon(
                    CupertinoIcons.person,
                    size: 35,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Entry(input: "About me"),
              RichText(
                softWrap: true,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: Colors.grey.shade700),
                  children: [
                    TextSpan(text: aboutMe),
                  ],
                ),
              ),
              Entry(input: "Top Projects"),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, i) => Container(
                    height: 125,
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              projects[i]['name'],
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            // Icon(Icons.safety_check),
                            projects[i]['icon'],
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              projects[i]['type'],
                              style: TextStyle(color: Colors.white),
                            ),
                            InkWell(
                              onTap: () =>
                                  _launchURLBrowser(projects[i]['link']),
                              child: Icon(Icons.link, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Entry(input: "Experience"),
              Container(
                padding: EdgeInsets.all(15),
                height: 90,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Software Engineer at IBM",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("IBM", style: TextStyle(color: Colors.white)),
                        Text("Oct 2022 - Nov 2022 · 1 mos",
                            style: TextStyle(color: Colors.white))
                      ],
                    )
                  ],
                ),
              ),
              Entry(input: "Skills"),
              Container(
                height: 80,
                child: ListView.builder(
                  itemCount: skills.length,
                  itemBuilder: (context, i) => Skill(skill: skills[i]),
                ),
              ),
              Entry(input: "Languages"),
              Container(
                child: Row(
                  children: [
                    Language(
                      languageName: "Arabic",
                    ),
                    Language(
                      languageName: "English",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
