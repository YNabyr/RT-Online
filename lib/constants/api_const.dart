class ApiConst {
  ApiConst._();

  // Base URL for API
  static const String apiKey = '';
  static const String baseUrl = 'https://rtonline-api.venturo.pro/api/v1';

  // Auth
  static const String login = '$baseUrl/auth/login';
  static const String invitation = "$baseUrl/invitation";

  // General
  static const String general = '$baseUrl/residence';

  // Citizen
  static const String citizen = "$baseUrl/citizen";
  static const String block = "$baseUrl/blocks";
  static const String house = "$baseUrl/houses";

  // Roles
  static const String roles = '$baseUrl/roles';

  // Announcements
  static const String announcements = '$baseUrl/announcements';
  static const String viewers = '$baseUrl/viewers';

  // Information
  static const String information = '$baseUrl/information';
  static const String categoriesInformation = "$baseUrl/categories";

  // Dues
  static const String duesCategories = '$baseUrl/dues';
}
