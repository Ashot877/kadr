import 'package:flutter/material.dart';
import 'package:kadr/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:kadr/utils/helpers/helpers.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgesWidget(
        child: Container(
          color: dark
              ? Colors.white.withAlpha((0.2 * 255).round())
              : Colors.black.withAlpha((0.2 * 255).round()),
          padding: const EdgeInsets.only(bottom: 0),
          child: Stack(
            children: [
              child,
            ],
          ),
        )
    );
  }
}
