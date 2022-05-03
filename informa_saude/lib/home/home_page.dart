import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:informa_saude/home/home_controller.dart';

import '../map/map_page.dart';
import '../news/news_page.dart';
import '../profile/profile_page.dart';
import '../statistics/statistics_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (BuildContext context) {
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: _buildPageViewItems(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        onTap: (id) {
          _pageController.jumpToPage(id);
          widget.controller.onPageSelected(id);
          setState(() {});
        },
        showUnselectedLabels: true,
        currentIndex: widget.controller.pageSelected,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blue.shade600,
        items: _buildBottomItems(),
      ),
    );
  }

  List<Widget> _buildPageViewItems() {
    return [
      const StatisticsPage(),
      const MapPage(),
      const NewsPage(),
      const ProfilePage(),
    ];
  }

  List<BottomNavigationBarItem> _buildBottomItems() {
    return [
      _buildStatisticsItem(),
      _buildMapItem(),
      _buildNewsItem(),
      _buildProfileItem(),
    ];
  }

  BottomNavigationBarItem _buildProfileItem() {
    return BottomNavigationBarItem(
      icon: Icon(
        Icons.verified_user_outlined,
        size: 22,
        color: widget.controller.isProfileSelected
            ? Colors.black
            : Colors.blue.shade600,
      ),
      label: 'Minha Área',
    );
  }

  BottomNavigationBarItem _buildNewsItem() {
    return BottomNavigationBarItem(
      icon: Icon(
        Icons.new_releases_outlined,
        size: 22,
        color: widget.controller.isNewsSelected
            ? Colors.black
            : Colors.blue.shade600,
      ),
      label: 'Notícias',
    );
  }

  BottomNavigationBarItem _buildMapItem() {
    return BottomNavigationBarItem(
      icon: Icon(
        Icons.map_outlined,
        size: 22,
        color: widget.controller.isMapSelected
            ? Colors.black
            : Colors.blue.shade600,
      ),
      label: 'Mapa Covid',
    );
  }

  BottomNavigationBarItem _buildStatisticsItem() {
    return BottomNavigationBarItem(
      icon: Icon(
        Icons.analytics_outlined,
        size: 22,
        color: widget.controller.isStatisticsSelected
            ? Colors.black
            : Colors.blue.shade600,
      ),
      label: 'Estatísticas',
    );
  }
}
