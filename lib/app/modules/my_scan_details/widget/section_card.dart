import 'package:data_collection_app/resource/utilitis/common_style.dart';
import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final String child;
  final bool? highlight;
  const SectionCard({
    super.key,
    required this.title,
    required this.child,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: highlight == true ? Colors.blue.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              title,
              textAlign: TextAlign.start,
              style: CommonStyle.textStyleSmall()
          ),
          const SizedBox(height: 12),
          Text(child,
              textAlign: TextAlign.start,
              style: CommonStyle.textStyleSmall())
        ],
      ),
    );
  }
}
