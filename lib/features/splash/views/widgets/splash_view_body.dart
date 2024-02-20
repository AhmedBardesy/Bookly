import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tt_2/core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initialSlidingAnimation();

    navigationToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset(AssetsData.Logo)),
        const SizedBox(
          height: 6,
        ),
        AnimatedBuilder(
            animation: slidingAnimation,
            builder: (context, _) {
              return SlideTransition(
                  position: slidingAnimation,
                  child: const Text('Read Free Books'));
            })
      ],
    );
  }

  void initialSlidingAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 1)); //values from 0 to 1

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 20), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigationToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // Get.off(
        //   () => const HomeView(),
        //   transition: Transition.fade,
        //   duration: KTransitionDuration,
        // );
        GoRouter.of(context).push('/homeview');
      },
    );
  }
}
