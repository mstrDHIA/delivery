class Buyer {
  int id;
  String firstName;
  String lastName;
  String address;
  String phone;
  String long;
  String lat;
  String email;

  Buyer(
      {this.id,
        this.firstName,
        this.lastName,
        this.address,
        this.phone,
        this.long,
        this.lat,
        this.email});

  Buyer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    phone = json['phone'];
    long = json['long'];
    lat = json['lat'];
    email = json['email'];
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
    data['email'] = this.email;
    return data;
  }
}
