import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class SegmentedTabView extends StatefulWidget {
  final List<String> tabs;
  final List<Widget> pages;
  final int initialIndex;
  final ValueChanged<int>? onPageChanged;
  final Color? activeColor;
  final Color? backgroundColor;

  const SegmentedTabView({
    super.key,
    required this.tabs,
    required this.pages,
    this.initialIndex = 0,
    this.onPageChanged,
    this.activeColor,
    this.backgroundColor,
  }) : assert(tabs.length == pages.length, 'tabs and pages must have same length');

  @override
  State<SegmentedTabView> createState() => _SegmentedTabViewState();
}

class _SegmentedTabViewState extends State<SegmentedTabView> {
  late final PageController _pageController;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex.clamp(0, widget.pages.length - 1);
    _pageController = PageController(initialPage: _selectedIndex);

    _pageController.addListener(() {
      final page = _pageController.page;
      if (page != null) {
        final newIndex = page.round();
        if (newIndex != _selectedIndex) {
          setState(() => _selectedIndex = newIndex);
          widget.onPageChanged?.call(newIndex);
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _changeTo(int index) {
    if (index == _selectedIndex) return;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = widget.backgroundColor ?? theme.cardColor;
    final active = widget.activeColor ?? TColor.primaryColor;

    return Column(
      children: [
        const SizedBox(height: TSizes.defaultSpace / 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Row(
              children: [
                for (int i = 0; i < widget.tabs.length; i++) ...[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _changeTo(i),
                      child: _selectedIndex == i
                          ? AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: active,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            widget.tabs[i],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                          : Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            widget.tabs[i],
                            style: TextStyle(
                              color: theme.textTheme.bodyMedium!.color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (i != widget.tabs.length - 1) const SizedBox(width: 6),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Expanded(
          child: PageView(
            controller: _pageController,
            children: widget.pages,
          ),
        ),
      ],
    );
  }
}
