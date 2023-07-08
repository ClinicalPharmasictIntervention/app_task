import 'address_model.dart';

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.address,
  });

  int? id;
  String? name;
  AddressModel? address;

  UserModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      name = json['name'];
      id = json['id'];
      address = AddressModel.fromJson(json['address']);
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'address': address,
    };
  }
}
