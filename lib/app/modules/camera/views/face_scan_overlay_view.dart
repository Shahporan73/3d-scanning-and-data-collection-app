// widget/face_scanning_overlay.dart
import 'package:data_collection_app/app/modules/camera/model/picture_side.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/camera_controller.dart';

class FaceScanningOverlay extends StatefulWidget {
  @override
  _FaceScanningOverlayState createState() => _FaceScanningOverlayState();
}

class _FaceScanningOverlayState extends State<FaceScanningOverlay>
    with TickerProviderStateMixin {
  late AnimationController _scanController;
  late AnimationController _pulseController;
  late Animation<double> _scanAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _scanController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _pulseController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _scanAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scanController,
      curve: Curves.easeInOut,
    ));

    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _scanController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CameraController cameraController = Get.find<CameraController>();

    return Stack(
      children: [
        // Semi-transparent overlay
        Container(
          color: Colors.black.withOpacity(0.3),
        ),

        // Face scanning area
        Center(
          child: AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _pulseAnimation.value,
                child: Container(
                  width: 280,
                  height: 350,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      // Corner brackets
                      ...buildCornerBrackets(),

                      // Scanning line
                      AnimatedBuilder(
                        animation: _scanAnimation,
                        builder: (context, child) {
                          return Positioned(
                            top: _scanAnimation.value * 320,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.greenAccent,
                                    Colors.transparent,
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.greenAccent,
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Scanning status text
        Positioned(
          bottom: 200,
          left: 0,
          right: 0,
          child: Obx(() => Column(
            children: [
              Text(
                'Scanning Face...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'Position your ${cameraController.currentSide.value.displayName.toLowerCase()} view within the frame',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )),
        ),
      ],
    );
  }

  List<Widget> buildCornerBrackets() {
    const double bracketSize = 30;
    const double bracketThickness = 4;

    return [
      // Top-left corner
      Positioned(
        top: 0,
        left: 0,
        child: Container(
          width: bracketSize,
          height: bracketSize,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.greenAccent, width: bracketThickness),
              left: BorderSide(color: Colors.greenAccent, width: bracketThickness),
            ),
          ),
        ),
      ),

      // Top-right corner
      Positioned(
        top: 0,
        right: 0,
        child: Container(
          width: bracketSize,
          height: bracketSize,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.greenAccent, width: bracketThickness),
              right: BorderSide(color: Colors.greenAccent, width: bracketThickness),
            ),
          ),
        ),
      ),

      // Bottom-left corner
      Positioned(
        bottom: 0,
        left: 0,
        child: Container(
          width: bracketSize,
          height: bracketSize,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.greenAccent, width: bracketThickness),
              left: BorderSide(color: Colors.greenAccent, width: bracketThickness),
            ),
          ),
        ),
      ),

      // Bottom-right corner
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          width: bracketSize,
          height: bracketSize,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.greenAccent, width: bracketThickness),
              right: BorderSide(color: Colors.greenAccent, width: bracketThickness),
            ),
          ),
        ),
      ),
    ];
  }
}