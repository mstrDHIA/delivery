class Profile {
  int id;
  int age;
  String sex;
  int phone;
  int idUser;

  Profile({this.id, this.age, this.sex, this.phone, this.idUser});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    age = json['age'];
    sex = json['sex'];
    phone = json['phone'];
    idUser = json['id_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['age'] = this.age;
    data['sex'] = this.sex;
    data['phone'] = this.phone;
    data['id_user'] = this.idUser;
    return data;
  }
}
