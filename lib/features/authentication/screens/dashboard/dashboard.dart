import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';

import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';

class DashboardPage2 extends StatelessWidget {
  const DashboardPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [
                CurvedEdgesWidget(
                  child: Container(
                    color: AppColors.primary,
                    padding: const EdgeInsets.all(0),
                    child: SizedBox(
                      height: 400,
                      child: Stack(
                        children: [
                          Positioned(
                              top: -150,
                              right: -250,
                              child: CircularContainer(
                                backgroundColor: AppColors.textWhite.withOpacity(0.1),
                              )),
                          Positioned(
                              top: 100,
                              right: -300,
                              child: CircularContainer(
                                backgroundColor: AppColors.textWhite.withOpacity(0.1),
                              )),
                          ],
                ),
              ),
            ),
          )
        ],
      )
    )
    );
  }
}

class CurvedEdgesWidget extends StatelessWidget {
  const CurvedEdgesWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CustomCurvedEdges(), child: child);
  }
}
