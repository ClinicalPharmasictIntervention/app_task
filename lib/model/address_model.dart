class AddressModel {
  AddressModel({
    this.street,
    this.city,
    this.suite,
    this.zipcode,
  });

  String? street;
  String? suite;
  String? city;
  String? zipcode;

  AddressModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      street = json['street'];
      city = json['city'];
      suite = json['suite'];
      zipcode = json['zipcode'];
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'city': city,
      'suite': suite,
      'zipcode': zipcode,
    };
  }
}
