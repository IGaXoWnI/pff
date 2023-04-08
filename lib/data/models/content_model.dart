import 'package:pff/core/constants/imageAssets.dart';

class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      image: AppImages.onboarding1,
      title: 'GPS Tracking',
      discription:
          "Loved the class! Such beautiful land and collective impact infrastructure social entrepreneur. "),
  UnbordingContent(
      image: AppImages.onboarding2,
      title: 'GPS Tracking',
      discription:
          "Loved the class! Such beautiful land and collective impact infrastructure social entrepreneur. "),
];
