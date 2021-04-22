class Blocks {
  int id;
  String buyerEmail;
  DateTime date;
  String blocker;
  String reason;
  int idUser;
  int idBuyer;

  Blocks(
      {this.id,
      this.buyerEmail,
      this.date,
      this.blocker,
      this.reason,
      this.idUser,
      this.idBuyer});

  Blocks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buyerEmail = json['buyer_email'];
    date =DateTime.parse(json['date']);
    blocker = json['blocker'];
    reason = json['reason'];
    idUser = json['id_user'];
    idBuyer = json['id_buyer'];
  }
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['buyer_email'] = this.buyerEmail;
    data['date'] = this.date.toString();
    data['blocker'] = this.blocker;
    data['reason'] = this.reason;
    data['id_user'] = this.idUser;
    data['id_buyer'] = this.idBuyer;
    return data;
  }
}
