import 'package:flutter/material.dart';
import 'package:kadr/features/weekly_movie/screens/home/sections/top_3_page.dart';
import 'package:kadr/features/weekly_movie/screens/home/sections/premiere_page.dart';
import '../base_page_view_screen.dart';

class HomeScreen extends BasePageViewScreen {
  const HomeScreen({super.key})
      : super(
    tabs: const ['Premiere', 'Top 3'],
    pages: const [
      PremierePage(key: PageStorageKey('PremierePage')),
      Top3Screen(key: PageStorageKey('TopPage')),
      //ChallengesPage(key: PageStorageKey('VotePage')),
    ],
  );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BasePageViewScreenState<HomeScreen> {}
