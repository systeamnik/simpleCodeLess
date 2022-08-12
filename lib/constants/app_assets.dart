class AppAssets {
  static const images = _Images();
  static const svg = _Svg();
}

class _Images {
  const _Images();

  final String noAvatar = 'assets/images/bitmap/no_avatar.png';
  final String logo = 'assets/images/bitmap/logo.png';
  final String splashBackground = 'assets/images/bitmap/splash_bg.png';
  final String splashMorty = 'assets/images/bitmap/splash_screen_morty.png';
  final String splashRick = 'assets/images/bitmap/splash_screen_rick.png';
  final String personsNotFound = 'assets/images/bitmap/persons-not-found.png';
}

class _Svg {
  const _Svg();
  final String iconAccount = 'assets/images/svg/account.svg';
  final String iconPassword = 'assets/images/svg/password.svg';
  final String iconPerson = 'assets/images/svg/person.svg';
  final String iconSetting = 'assets/images/svg/setting.svg';
  final String iconList = 'assets/images/svg/list.svg';
  final String iconGrid = 'assets/images/svg/grid.svg';
  final String iconLocation = 'assets/images/svg/location.svg';
}
