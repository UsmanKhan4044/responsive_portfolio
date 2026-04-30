import 'package:flutter/material.dart';
import 'package:flutter_profile/models/Recommendation.dart';
import 'package:flutter_profile/screens/home/components/recommendation_card.dart';
import 'package:flutter_profile/responsive.dart';
import '../../../constants.dart';

class Recommendations extends StatefulWidget {
  const Recommendations({super.key});

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  late final ScrollController _scrollController;

  // Drag tracking variables
  double _dragStartX = 0;
  double _scrollStartOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Clean Title
          Text(
            "Recommendations",
            style: Theme.of(context).textTheme.titleLarge,
          ),

          SizedBox(height: defaultPadding),

          // ✅ SCROLLABLE AREA - Works with Mouse Drag!
          Container(
            height: Responsive.isMobile(context) ? 320 : 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[800]!, width: 1),
            ),

            child: MouseRegion(
              cursor: SystemMouseCursors.grab,

              child: GestureDetector(
                // ✅ CLICK AND DRAG TO SCROLL (Works with Mouse!)
                onHorizontalDragStart: (details) {
                  _dragStartX = details.globalPosition.dx;
                  _scrollStartOffset = _scrollController.offset;
                },

                onHorizontalDragUpdate: (details) {
                  double dragDelta = _dragStartX - details.globalPosition.dx;
                  double newOffset = (_scrollStartOffset + dragDelta);

                  // Clamp to valid range
                  if (_scrollController.hasClients) {
                    double minOffset = 0;
                    double maxOffset = _scrollController.position.maxScrollExtent;
                    double clampedOffset = newOffset.clamp(minOffset, maxOffset);

                    _scrollController.jumpTo(clampedOffset);
                  }
                },

                onHorizontalDragEnd: (details) {
                  // Add momentum effect based on velocity
                  double velocity = details.velocity.pixelsPerSecond.dx;
                  if (velocity.abs() > 100) {
                    double targetOffset = (_scrollController.offset + velocity * 0.3);

                    if (_scrollController.hasClients) {
                      double maxOffset = _scrollController.position.maxScrollExtent;
                      double clampedTarget = targetOffset.clamp(0.0, maxOffset);

                      _scrollController.animateTo(
                        clampedTarget,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    }
                  }
                },

                child: ListView.separated(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.all(defaultPadding),

                  itemCount: demo_recommendations.length,
                  separatorBuilder: (context, index) => SizedBox(width: defaultPadding),

                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: _getCardWidth(context),
                      child: RecommendationCard(
                        recommendation: demo_recommendations[index],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: defaultPadding / 2),

          // Simple dots indicator
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(demo_recommendations.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: index == 0 ? 24 : 8,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: index == 0 ? primaryColor : Colors.grey[700],
                  ),
                );
              }),
            ),
          ),

          // Subtle hint text
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "← Click and drag to scroll →",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 11,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Smart card width calculator
  double _getCardWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (Responsive.isMobile(context)) {
      return screenWidth * 0.85;
    } else if (Responsive.isTablet(context)) {
      return 340;
    } else {
      return (screenWidth * 0.28).clamp(300.0, 360.0);
    }
  }
}