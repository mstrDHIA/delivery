class Orders {
  int id;
  String state;
  int stars;
  String review;
  int idUser;
  int idShop;
  int idClient;
  int idPayement;
  int idTime;
  int idPrice;

  Orders(
      {this.id,
        this.state,
        this.stars,
        this.review,
        this.idUser,
        this.idShop,
        this.idClient,
        this.idPayement,
        this.idTime,
        this.idPrice});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    stars = json['stars'];
    review = json['review'];
    idUser = json['id_user'];
    idShop = json['id_shop'];
    idClient = json['id_client'];
    idPayement = json['id_payement'];
    idTime = json['id_time'];
    idPrice = json['id_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state'] = this.state;
    data['stars'] = this.stars;
    data['review'] = this.review;
    data['id_user'] = this.idUser;
    data['id_shop'] = this.idShop;
    data['id_client'] = this.idClient;
    data['id_payement'] = this.idPayement;
    data['id_time'] = this.idTime;
    data['id_price'] = this.idPrice;
    return data;
  }

  
}
