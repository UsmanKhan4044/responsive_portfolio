import 'package:flutter/material.dart';
import 'package:flutter_profile/models/Recommendation.dart';
import '../../../constants.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({Key? key, required this.recommendation}) : super(key: key);

  final Recommendation recommendation;

  @override
  Widget build(BuildContext context) {
    return Container(
      // ✅ Fill available width from parent
      width: double.infinity,

      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
          width: 1,
        ),
      ),

      // ✅ Prevent any overflow
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Name
          Text(
            recommendation.name!,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),

          SizedBox(height: 6),

          // Source badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              recommendation.source!,
              style: TextStyle(
                color: primaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(height: defaultPadding),

          // Review text - Flexible to fit available space
          Expanded(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Text(
                recommendation.text!,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  height: 1.65,
                  color: bodyTextColor,
                  fontSize: 14.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}