import 'SellerType.dart';
class Seller {
  int id;
  String firstName;
  String lastName;
  String address;
  int phone;
  String email;
  double long;
  double lat;
  SellerType seller_type;

  Seller({this.id, this.firstName, this.lastName, this.address, this.phone,this.email, this.long, this.lat,this.seller_type});

  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    long = json['long'];
    lat = json['lat'];
    seller_type=json['seller_type'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['long'] = this.long;
    data['lat'] = this.lat;
    data['seller_type']=this.seller_type;
    return data;
  }
}
