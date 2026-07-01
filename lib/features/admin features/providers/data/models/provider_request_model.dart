class ProviderRequestModel {
  final String serviceName;
  final String providerName;
  final String image;
  final bool isRejected;

  const ProviderRequestModel({
    required this.serviceName,
    required this.providerName,
    required this.image,
    this.isRejected = false,
  });
}
