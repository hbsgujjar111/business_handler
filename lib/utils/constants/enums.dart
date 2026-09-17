enum TextSizes { small, medium, large }

enum AlertType { error, success, warning }

enum VehicleStatus { moving, parked, idleOnMap, trackerOff, detached, nothing }

enum PaymentMethods { paypal, googlePay, applePay, visa, masterCard, creditCard, payStack, razorPay, paytm }

enum OrderStatus {
  assignOrder('Assign Order'),
  pickUp('Pick Up'),
  inDelivery('In Delivery'),
  orderDelivered('Order Delivered'),
  start('Start'),
  delivered('Delivered'),
  completed('Completed'),
  complete('Complete'),
  unknown('Unknown'); // Fallback for unexpected values

  // The raw string value expected by the backend/API
  final String rawValue;

  const OrderStatus(this.rawValue);

  /// Safely converts a raw String into its matching OrderStatus enum.
  static OrderStatus fromString(String? status) {
    if (status == null) return OrderStatus.unknown;

    return OrderStatus.values.firstWhere((element) => element.rawValue == status, orElse: () => OrderStatus.unknown);
  }
}
