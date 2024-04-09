enum ImgsControllerService {
  defaultImg,
  favoriteButton,
  mapButton,
  newReportButton,
  shareButton,
  changeButton,
  publicButton,
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
  reportRating,
  ratingRating,
  photoRating,
}

extension ImgsControllerServiceExtension on ImgsControllerService {
  String url([String format = 'svg']) {
    final resolution = format;
    const String images = 'assets/images';
    return switch (this) {
      ImgsControllerService.defaultImg => '$images/default_img_card.$resolution',
      ImgsControllerService.favoriteButton => '$images/favorite_button.$resolution',
      ImgsControllerService.mapButton => '$images/map_button.$resolution',
      ImgsControllerService.newReportButton => '$images/newReport_button.$resolution',
      ImgsControllerService.shareButton => '$images/share_button.$resolution',
      ImgsControllerService.changeButton => '$images/change_button.$resolution',
      ImgsControllerService.publicButton => '$images/public_button.$resolution',
      ImgsControllerService.reviewBottomNavigation => '$images/review_bottom_navigation.$resolution',
      ImgsControllerService.activityBottomNavigation => '$images/activity_bottom_navigation.$resolution',
      ImgsControllerService.newReportBottomNavigation => '$images/newReport_bottom_navigation.$resolution',
      ImgsControllerService.marksBottomNavigation => '$images/marks_bottom_navigation.$resolution',
      ImgsControllerService.profileBottomNavigation => '$images/profile_bottom_navigation.$resolution',
      ImgsControllerService.natureRating => '$images/rating/nature_rating.$resolution',
      ImgsControllerService.sortRating => '$images/rating/sort_rating.$resolution',
      ImgsControllerService.routeRating => '$images/rating/route_rating.$resolution',
      ImgsControllerService.butteryRating => '$images/rating/buttery_rating.$resolution',
      ImgsControllerService.glassRating => '$images/rating/glass_rating.$resolution',
      ImgsControllerService.lampRating => '$images/rating/lamp_rating.$resolution',
      ImgsControllerService.metalRating => '$images/rating/metal_rating.$resolution',
      ImgsControllerService.paperRating => '$images/rating/paper_rating.$resolution',
      ImgsControllerService.plasticRating => '$images/rating/plastic_rating.$resolution',
      ImgsControllerService.reportRating => '$images/rating/report_rating.$resolution',
      ImgsControllerService.ratingRating => '$images/rating/rating_rating.$resolution',
      ImgsControllerService.photoRating => '$images/rating/photo_rating.$resolution',
    };
  }
}
