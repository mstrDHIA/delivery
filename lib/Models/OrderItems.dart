class OrderItems {
  int id;
  String name;
  double price;
  int count;
  int idOrder;

  OrderItems({this.id, this.name, this.price, this.count, this.idOrder});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    count = json['count'];
    idOrder = json['id_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['count'] = this.count;
    data['id_order'] = this.idOrder;
    return data;
  }
}
