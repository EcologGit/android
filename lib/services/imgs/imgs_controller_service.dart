enum ImgsControllerService {
  defaultImg,
  favoriteButton,
  shareButton,
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
    }
  }
}
