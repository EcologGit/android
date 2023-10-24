enum ImgsControllerService {
  defaultImg,
  favoriteButton,
  shareButton,
  reviewBottomNavigation,
  activityBottomNavigation,
  newReportBottomNavigation,
  marksBottomNavigation,
  profileBottomNavigation,
  natureRating,
  sortRating,
  routeRating,
  butteryRating,
  glassRating,
  lampRating,
  metalRating,
  paperRating,
  plasticRating,
}

extension ImgsControllerServiceExtension on ImgsControllerService {
  String url([String format = 'svg']) {
    final resolution = format;
    switch (this) {
      case ImgsControllerService.defaultImg:
        return 'assets/images/default_img_card.$resolution';
      case ImgsControllerService.favoriteButton:
        return 'assets/images/favorite_button.$resolution';
      case ImgsControllerService.shareButton:
        return 'assets/images/share_button.$resolution';
      case ImgsControllerService.reviewBottomNavigation:
        return 'assets/images/review_bottom_navigation.$resolution';
      case ImgsControllerService.activityBottomNavigation:
        return 'assets/images/activity_bottom_navigation.$resolution';
      case ImgsControllerService.newReportBottomNavigation:
        return 'assets/images/newReport_bottom_navigation.$resolution';
      case ImgsControllerService.marksBottomNavigation:
        return 'assets/images/marks_bottom_navigation.$resolution';
      case ImgsControllerService.profileBottomNavigation:
        return 'assets/images/profile_bottom_navigation.$resolution';
      case ImgsControllerService.natureRating:
        return 'assets/images/rating/nature_rating.$resolution';
      case ImgsControllerService.sortRating:
        return 'assets/images/rating/sort_rating.$resolution';
      case ImgsControllerService.routeRating:
        return 'assets/images/rating/route_rating.$resolution';
      case ImgsControllerService.butteryRating:
        return 'assets/images/rating/buttery_rating.$resolution';
      case ImgsControllerService.glassRating:
        return 'assets/images/rating/glass_rating.$resolution';
      case ImgsControllerService.lampRating:
        return 'assets/images/rating/lamp_rating.$resolution';
      case ImgsControllerService.metalRating:
        return 'assets/images/rating/metal_rating.$resolution';
      case ImgsControllerService.paperRating:
        return 'assets/images/rating/paper_rating.$resolution';
      case ImgsControllerService.plasticRating:
        return 'assets/images/rating/plastic_rating.$resolution';
    }
  }
}
