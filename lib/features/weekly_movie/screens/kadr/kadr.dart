import 'package:flutter/material.dart';
import 'package:kadr/features/weekly_movie/screens/kadr/widget/critics_post_card.dart';
import 'package:kadr/features/weekly_movie/screens/kadr/widget/tabbar.dart';
import 'package:kadr/features/weekly_movie/screens/kadr/widget/top_critics_card.dart';
import 'package:kadr/utils/constants/image_strings.dart';
import 'package:kadr/utils/constants/sizes.dart';
import 'package:kadr/common/widgets/appbar/appbar_without_section.dart';
import 'package:kadr/utils/helpers/helpers.dart';
import '../../../../utils/constants/colors.dart';

class CriticsScreen extends StatefulWidget {
  const CriticsScreen({super.key});

  @override
  State<CriticsScreen> createState() => _CriticsScreenState();
}

class _CriticsScreenState extends State<CriticsScreen> {
  final List<Map<String, dynamic>> posts = const [
    {
      'avatar': TImages.user,
      'nickname': 'MovieLover23',
      'text': 'Just watched the latest blockbuster! Amazing visuals and story.',
      'movie': 'Dune: Part Two',
      'likes': 12007,
    },
    {
      'avatar': TImages.user,
      'nickname': 'FilmCritic42',
      'text': 'Random text for testing the post card layout...',
      'movie': 'Oppenheimer',
      'likes': 8,
    },
    {
      'avatar': TImages.user,
      'nickname': 'CinemaFanatic',
      'text': 'Story was decent, but acting was phenomenal!',
      'movie': 'Inside Out 2',
      'likes': 4,
    },
  ];

  final List<Map<String, dynamic>> topMainCritics = const [
    {'avatar': TImages.user, 'nickname': 'TopCritic1', 'score': 124},
    {'avatar': TImages.user, 'nickname': 'TopCritic2', 'score': 98},
    {'avatar': TImages.user, 'nickname': 'TopCritic3', 'score': 72},
  ];

  final List<Map<String, dynamic>> topLikedCritics = const [
    {'avatar': TImages.user, 'nickname': 'PopularOne', 'score': 85},
    {'avatar': TImages.user, 'nickname': 'TrendingNow', 'score': 80},
    {'avatar': TImages.user, 'nickname': 'HotReview', 'score': 78},
  ];

  final Map<String, dynamic> topNewbie = const {
    'avatar': TImages.user,
    'nickname': 'FreshVoice',
    'score': 25,
  };

  final List<String> tabs = const ['This Week', 'Top Critics'];
  int _visibleTab = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background = isDark ? Colors.black : Colors.white;

    return Scaffold(
      appBar: const TWAppBar(title: 'Critics'),
      backgroundColor: background,
      body: SafeArea(
        child: SegmentedTabView(
          tabs: tabs,
          initialIndex: _visibleTab,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? Theme.of(context).cardColor
              : TColor.lightBack,
          onPageChanged: (idx) => setState(() => _visibleTab = idx),
          pages: [
            // --- This Week page ---
            Stack(
              children: [
                ListView.separated(
                  key: const ValueKey('thisWeek'),
                  padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace),
                  itemCount: posts.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return CriticPostCard(
                      username: post['nickname'],
                      userAvatar: post['avatar'],
                      movieTitle: post['movie'] ?? 'Unknown movie',
                      content: post['text'],
                      likes: post['likes'],
                      rating: 8.0,
                      kadrLogo: TImages.appBarLogoLight,
                    );
                  },
                ),
                if (_visibleTab == 0)
                  Positioned(
                    bottom: 15,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          // handle add post
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: TColor.primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // --- Top Critics page ---
            ListView(
              key: const ValueKey('topCritics'),
              padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace),
              children: [
                _buildSectionTitle("🏆 Main Award — Top 3 Critics", showInfo: true),
                const SizedBox(height: 12),
                for (int i = 0; i < topMainCritics.length; i++)
                  TopCriticCard(
                    avatar: topMainCritics[i]['avatar'],
                    nickname: topMainCritics[i]['nickname'],
                    score: topMainCritics[i]['score'],
                    place: i + 1,
                    section: 'main',
                  ),

                const SizedBox(height: 24),
                _buildSectionTitle("🔥 Most Liked Critics"),
                const SizedBox(height: 12),
                for (int i = 0; i < topLikedCritics.length; i++)
                  TopCriticCard(
                    avatar: topLikedCritics[i]['avatar'],
                    nickname: topLikedCritics[i]['nickname'],
                    score: topLikedCritics[i]['score'],
                    place: i + 1,
                    section: 'likes',
                  ),

                const SizedBox(height: 24),
                _buildSectionTitle("✨ Top Newbie"),
                const SizedBox(height: 12),
                TopCriticCard(
                  avatar: topNewbie['avatar'],
                  nickname: topNewbie['nickname'],
                  score: topNewbie['score'],
                  place: 1,
                  section: 'newbie',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text, {bool showInfo = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          if (showInfo)
            GestureDetector(
              onTap: () {
                // TODO: open rules page
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Rules will be available soon")),
                );
              },
              child: const Icon(Icons.help_outline),
            ),
        ],
      ),
    );
  }
}
