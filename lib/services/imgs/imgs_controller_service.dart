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
}

extension ImgsControllerServiceExtension on ImgsControllerService {
  String url([String format = 'png']) {
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
        return 'assets/images/nature_rating.$resolution';
      case ImgsControllerService.sortRating:
        return 'assets/images/sort_rating.$resolution';
      case ImgsControllerService.routeRating:
        return 'assets/images/route_rating.$resolution';
    }
  }
}
