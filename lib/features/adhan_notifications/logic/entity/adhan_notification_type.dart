enum AdhanNotificationType {
  adhan('adhan'),
  prePrayer('pre_prayer');

  const AdhanNotificationType(this.storageValue);

  final String storageValue;
}
