class TopupRequestModel {
  final int id;
  final String userName;
  final String paymentMethod;
  final String transactionNumber;
  final String amount;
  final String imageUrl;

  const TopupRequestModel({
    required this.id,
    required this.userName,
    required this.paymentMethod,
    required this.transactionNumber,
    required this.amount,
    required this.imageUrl,
  });

  factory TopupRequestModel.fromJson(Map<String, dynamic> json) {
    return TopupRequestModel(
      id: json['id'] ?? 0,
      userName: json['user']?['name'] ?? json['name'] ?? '',
      paymentMethod: json['payment_method'] ?? json['paymentMethod'] ?? '',
      transactionNumber: json['transaction_id'] ?? json['transactionNumber'] ?? '',
      amount: json['amount']?.toString() ?? '',
      imageUrl: json['image'] ?? json['image_url'] ?? '',
    );
  }
}
