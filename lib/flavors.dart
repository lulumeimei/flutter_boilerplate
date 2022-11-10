enum Flavor {
  STAGING,
  PRODUCTION,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.STAGING:
        return 'Staging App';
      case Flavor.PRODUCTION:
        return 'Production App';
      default:
        return 'title';
    }
  }

}
