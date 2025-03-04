class PaymentMethodModel {
  final String name;
  final String image;

  PaymentMethodModel({required this.name, required this.image});

  static PaymentMethodModel empty() => PaymentMethodModel(name: '', image: '');
}
