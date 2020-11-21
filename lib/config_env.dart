enum Flavor {
  staging,
  production,
  mock,
}

class ConfigEnv {
  static Flavor appFlavor;
  static String apiKey = "87cd4ca429c679b114de112ea245d291";
  static String getDomainAPI() {
    return 'https://api.themoviedb.org/3';
  }
}
