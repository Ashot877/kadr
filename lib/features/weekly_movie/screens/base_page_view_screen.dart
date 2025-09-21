import 'package:flutter/material.dart';
import 'package:kadr/common/widgets/appbar/appbar.dart';

abstract class BasePageViewScreen extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> pages;

  const BasePageViewScreen({
    super.key,
    required this.tabs,
    required this.pages,
  });
}

abstract class BasePageViewScreenState<T extends BasePageViewScreen>
    extends State<T> {
  int currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() => currentIndex = index);
  }

  void onTabSelected(String sectionIndex) {
    final index = int.parse(sectionIndex);
    setState(() {
      currentIndex = index;
      _pageController.jumpToPage(index); // <-- мгновенный переход
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        currentSection: currentIndex.toString(),
        tabs: widget.tabs,
        onSectionSelected: onTabSelected,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: widget.pages,
      ),
    );
  }
}
