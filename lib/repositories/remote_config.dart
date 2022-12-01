class RemoteConfigManager {
  static const String onboardingKey = 'onboarding_scenario';
  static const String popupKey = 'popup_scenario';
  static const String subscriptionsKey = 'subscription_offering';

  static const String priceKey = 'chat_price';
  static const String price3pm = 'price_3pm';
  static const String price5pm = 'price_5pm';
  static const String price9pq = 'price_9pq';
  static const String price20pc = 'price_20pc';
  static const String price100pc = 'price_100pc';

  static String scenario = 'scenario_1';
  static String chatPrice = 'price_3pm';
  static String popup = 'rewarded';
  static bool get rewardedPopup => popup == 'rewarded';
  static String offering = '1';
}
