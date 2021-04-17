class Profile {
  int id;
  int age;
  String sex;
  String country;
  String governorate;
  String city;
  String state;
  String lat;
  String long;
  String photo;
  String vehicle;
  int phone;
  String address;
  int idUser;

  Profile(
      {this.id,
      this.age,
      this.sex,
      this.country,
      this.governorate,
      this.city,
      this.state,
      this.lat,
      this.long,
      this.photo,
      this.vehicle,
      this.address,

      this.phone,
      this.idUser});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    age = json['age'];
    sex = json['sex'];
    country = json['country'];
    governorate = json['governorate'];
    city = json['city'];
    address = json['address'];

    state = json['state'];
    lat = json['lat'];

    long = json['long'];
    photo = json['photo'];

    vehicle = json['vehicle'];
    phone = json['phone'];
    idUser = json['id_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['age'] = this.age;
    data['sex'] = this.sex;
    data['country'] = this.country;
    data['governorate'] = this.governorate;
    data['city'] = this.city;
    data['address'] = this.address;


    data['state'] = this.state;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['photo'] = this.photo;
    data['vehicle'] = this.vehicle;
    data['phone'] = this.phone;
    data['id_user'] = this.idUser;
    return data;
  }
}
