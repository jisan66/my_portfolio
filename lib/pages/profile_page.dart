import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/projects_page.dart';
import 'package:my_portfolio/pages/skill_page.dart';
import 'package:my_portfolio/pages/welcome_page.dart';
import 'package:my_portfolio/utils/globals.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../widgets/drawer_widget.dart';
import '../widgets/top_bar_contents.dart';
import 'about_page.dart';
import 'education_page.dart';
import 'footer_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Widget> pages = [
    const WelcomePage(),
    const AboutPage(),
    const ProjectsPage(),
    const EducationPage(),
    const SkillPage(),
    const FooterPage(),
  ];

  final pageController = PageController(initialPage: 0);
  final itemScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size(100, 100),
        child: TopBarContents(
          opacity: 0.0,
          itemScrollController: itemScrollController,
        ),
      ),
      endDrawer: DrawerWidget(itemController: itemScrollController),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ScrollablePositionedList.builder(
          initialScrollIndex: 0,
          shrinkWrap: true,
          itemPositionsListener: itemPositionsListener,
          itemScrollController: itemScrollController,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            final page = pages[index];

            return page;
          },
        ),
      ),
    );
  }
}
