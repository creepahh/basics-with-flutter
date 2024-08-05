import 'package:flutter/material.dart';
import '../services/esewa_service.dart';

class PaymentScreen extends StatelessWidget {
  void _initiatePayment() async {
    try {
      final payment = await eSewaService.createPayment(
        amount: '100', // Replace with actual amount
        productId: 'your_product_id',
        productName: 'your_product_name',
        returnUrl: 'your_return_url',
      );
      if (payment != null) {
        print('Payment initiated successfully');
      }
    } catch (e) {
      print('Error initiating payment: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: Center(
        child: ElevatedButton(
          onPressed: _initiatePayment,
          child: Text('Pay with eSewa'),
        ),
      ),
    );
  }
}
