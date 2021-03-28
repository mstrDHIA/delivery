class Seller {
  int id;
  String name;
  String address;
  String phone;
  String email;
  String long;
  String lat;
  int idSellertype;

  Seller(
      {this.id,
      this.name,
      this.address,
      this.phone,
      this.email,
      this.long,
      this.lat,
      this.idSellertype});

  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    long = json['long'];
    lat = json['lat'];
    idSellertype = json['id_sellertype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['long'] = this.long;
    data['lat'] = this.lat;
    data['id_sellertype'] = this.idSellertype;
    return data;
  }
}
