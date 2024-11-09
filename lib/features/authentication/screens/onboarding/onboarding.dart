import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter_application_1/utils/constants/colors.dart';
import 'package:flutter_application_1/utils/constants/image_strings.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';
import 'package:flutter_application_1/utils/constants/text_strings.dart';
import 'package:flutter_application_1/utils/device/device_utility.dart';
import 'package:flutter_application_1/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          //Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: AppImages.onBoardingImage1,
                title: AppTexts.onBoardingText1,
                subTitle: AppTexts.onBoardingText1a,
              ),
              OnBoardingPage(
                image: AppImages.onBoardingImage2,
                title: AppTexts.onBoardingText2,
                subTitle: AppTexts.onBoardingText2a,
              ),
              OnBoardingPage(
                image: AppImages.onBoardingImage3,
                title: AppTexts.onBoardingText3,
                subTitle: AppTexts.onBoardingText3a,
              ),
              OnBoardingPage(
                image: AppImages.onBoardingImage4,
                title: AppTexts.onBoardingText4,
                subTitle: AppTexts.onBoardingText4a,
              ),
            ],
          ),
          // Additional widgets such as Skip Button, Dot Navigation SmoothPageIndicator, and Circular Button can be added here
          // Skip Button
          const OnBoardingSkip(),

          //Dot Navigation
          const OnBoardingDotNavigation(),

          // Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Positioned(
      right: Sizes.defaultSpace,
      bottom: DeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark ? AppColors.primary : Colors.black),
        child: const Icon(Iconsax.arrow_right_3),
        )
      );
  }
}

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = HelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: DeviceUtils.getBottomNavigationBarHeight() + 25,
        left: Sizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 4,
          effect: ExpandingDotsEffect(activeDotColor: dark ? AppColors.light: AppColors.dark, dotHeight: 6),
        )
      );
  }
}

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: DeviceUtils.getAppBarHeight(),
        right: Sizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text("Skip"),
        ));
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: HelperFunctions.screenWidth() * 0.8, // 80% of width
            height: HelperFunctions.screenHeight() * 0.6, // 60% of height
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Sizes.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
