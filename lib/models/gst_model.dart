class GstModel {
  final String firstName;
  final String lastName;
  final int gstNumber;
  final String status;
  final String date;
  final String address1;
  final String address2;
  final String stateJuri;
  final String centerJuri;
  final String taxPayerType;
  final String businessType;

  GstModel({
    required this.address1,
    required this.address2,
    required this.businessType,
    required this.centerJuri,
    required this.date,
    required this.firstName,
    required this.gstNumber,
    required this.lastName,
    required this.stateJuri,
    required this.status,
    required this.taxPayerType,
  });

  factory GstModel.fromJson(Map json) {
    final String firstName = json['firstname'];
    final String lastName = json['lastname'];
    final int gstNumber = json['gstin'] as int;
    final String status = json['status'];
    final String date = json['date'];
    final String address1 = json['address1'];
    final String address2 = json['address2'];
    final String stateJuri = json['state jurisdiction'];
    final String centerJuri = json['center jurisdiction'];
    final String taxPayerType = json['tax payer type'];
    final String businessType = json['business type'];

    return GstModel(
      address1: address1,
      address2: address2,
      businessType: businessType,
      centerJuri: centerJuri,
      date: date,
      firstName: firstName,
      gstNumber: gstNumber,
      lastName: lastName,
      stateJuri: stateJuri,
      status: status,
      taxPayerType: taxPayerType,
    );
  }
}

class GstReturnStatus {
  final int gstNumber;
  final String status;
  GstReturnStatus({
    required this.gstNumber,
    required this.status,
  });

  factory GstReturnStatus.fromJson(Map json) {
    final int gstNumber = json['gstin'];
    final String status = json['status'];
    return GstReturnStatus(
      gstNumber: gstNumber,
      status: status,
    );
  }
}
