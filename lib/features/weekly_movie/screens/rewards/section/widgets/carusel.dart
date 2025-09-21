import 'package:flutter/material.dart';
import '../../../../../../common/widgets/images/t_rounded_image.dart';
import 'dart:math';

class BannerCarousel extends StatefulWidget {
  final List<String> banners;
  final double height;
  final double viewportFraction;
  const BannerCarousel({
    super.key,
    required this.banners,
    this.height = 200,
    this.viewportFraction = 0.85, // <- близко, но соседей видно
  });

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: widget.banners.length * 1000,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _calculateScale(int index) {
    if (!_controller.hasClients) return 1.0;
    final page = _controller.page ?? _controller.initialPage.toDouble();
    final diff = (index - page).abs();
    // Центр чуть крупнее, но не слишком (максимум ~1.02)
    return max(0.94, 1 - (diff * 0.06)); // центральная ≈1.0, дальше уменьшаем
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: PageView.builder(
        controller: _controller,
        itemBuilder: (context, index) {
          final banner = widget.banners[index % widget.banners.length];

          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final rawScale = _calculateScale(index);
              // Поднимем центр чуть выше 1.0, но безопасно (например +0.02)
              final scale = rawScale >= 0.995 ? (1.0 + (1 - rawScale) * 0.02) : rawScale;
              return Center(
                child: Transform.scale(
                  scale: scale,
                  alignment: Alignment.center,
                  child: Container(
                    // маленький gap — не делаем большой, чтобы соседи были ближе
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: MediaQuery.of(context).size.width * widget.viewportFraction,
                    height: widget.height,
                    child: TRoundedImage(
                      // НЕ передаём width — пусть родитель задаёт размер.
                      imageUrl: banner,
                      applyImageRadius: true,
                      fit: BoxFit.cover, // обязательно
                      padding: EdgeInsets.zero, // явно
                    ),

                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
