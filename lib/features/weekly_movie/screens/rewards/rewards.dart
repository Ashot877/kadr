import 'package:flutter/material.dart';
import 'package:kadr/features/weekly_movie/screens/rewards/section/market_page.dart';
import 'package:kadr/features/weekly_movie/screens/rewards/section/my_items_page.dart';
import '../base_page_view_screen.dart';

class RewardsScreen extends BasePageViewScreen {
  const RewardsScreen({super.key})
      : super(
    tabs: const ['Market', 'My Items'],
    pages: const [
      MarketTab(key: PageStorageKey('MarketTab')),
      MyItemsTab(key: PageStorageKey('MyItemsTab')),
    ],
  );

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends BasePageViewScreenState<RewardsScreen> {}
