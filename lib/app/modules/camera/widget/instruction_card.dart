// widgets/instruction_card.dart
import 'package:flutter/material.dart';
import '../model/picture_side.dart';

class InstructionCard extends StatelessWidget {
  final PictureSide side;

  const InstructionCard({
    Key? key,
    required this.side,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.camera_alt,
            size: 40,
            color: Colors.blue.shade700,
          ),

          SizedBox(height: 10),

          Text(
            'Capture ${side.displayName} View',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade700,
            ),
          ),

          SizedBox(height: 8),

          Text(
            side.instruction,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}