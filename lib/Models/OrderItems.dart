class OrderItems {
  int id;
  int count;
  String name;
  double price;
  int idOrder;

  OrderItems({this.id, this.count, this.idOrder, });

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    idOrder = json['id_order'];
    id = json['id_item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['count'] = this.count;
    data['id_order'] = this.idOrder;
    //data['id_item'] = this.idItem;
    return data;
  }
}
