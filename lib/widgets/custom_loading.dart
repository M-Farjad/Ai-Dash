import '../header.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});
  // final AnimationController? controller;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      Assets.loading,
      width: 100,
      // controller: controller,
      // onLoaded: (composition) {
      //   if (controller != null) {
      //     controller!
      //       ..duration = composition.duration
      //       ..forward();
      //   }
      // },
    );
  }
}
