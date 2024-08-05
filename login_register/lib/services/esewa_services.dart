import 'package:esewa_flutter/esewa_flutter.dart';

class eSewaService {
  static get eSewaFlutter => null;

  static Future<void> initialize() async {
    await eSewaFlutter.initialize();
  }

  static Future<void> createPayment({
    required String amount,
    required String productId,
    required String productName,
    required String returnUrl,
  }) async {
    try {
      final payment = await eSewaFlutter.createPayment(
        amount: amount,
        productId: productId,
        productName: productName,
        returnUrl: returnUrl,
      );
      return payment;
    } catch (e) {
      throw Exception('Error initiating payment: $e');
    }
  }

  static Future<void> handlePaymentResponse(String responseUrl) async {
    try {
      var eSewaFlutter;
      final response = await eSewaFlutter.getPaymentResponse(responseUrl);
      if (response.status == 'SUCCESS') {
        print('Payment successful');
      } else {
        print('Payment failed');
      }
    } catch (e) {
      throw Exception('Error handling payment response: $e');
    }
  }
}
