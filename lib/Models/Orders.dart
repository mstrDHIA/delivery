import 'Buyer.dart';
import 'OrderItems.dart';
import 'Payment.dart';
import 'Seller.dart';
import 'User.dart';

class Orders {
  int id;
  String buyerPhone;
  String buyerMail;
  double totalPrice;
  double deliveryFees;
  double price;
  int stars;
  String review;
  String deliveryTime;
  String deliveryDuration;
  String orderTime;
  String orderType;
  bool isPaid;
  double distance;
  double orderDuration;
  String state;
  User user;
  Buyer buyer;
  Payment payement;
  Seller seller;
  List<OrderItems> orderitems;
  

  Orders(
      {this.id,
      this.buyerPhone,
      this.buyerMail,
      this.totalPrice,
      this.deliveryFees,
      this.price,
      this.stars,
      this.review,
      this.deliveryTime,
      this.deliveryDuration,
      this.orderTime,
      this.orderType,
      this.isPaid,
      this.distance,
      this.orderDuration,
      this.state,
      this.user,
      this.buyer,
      this.payement,
      this.seller,
      this.orderitems});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buyerPhone = json['buyer_phone'];
    buyerMail = json['buyer_mail'];
    totalPrice = json['total_price'];
    deliveryFees = json['delivery_fees'];
    price = json['price'];
    stars = json['stars'];
    review = json['review'];
    deliveryTime = json['delivery_time'];
    deliveryDuration = json['delivery_duration'];
    orderTime = json['order_time'];
    orderType = json['order_type'];
    isPaid = json['is_paid'];
    distance = json['distance'];
    orderDuration = json['order_duration'];
    state = json['state'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['buyer_phone'] = this.buyerPhone;
    data['buyer_mail'] = this.buyerMail;
    data['total_price'] = this.totalPrice;
    data['delivery_fees'] = this.deliveryFees;
    data['price'] = this.price;
    data['stars'] = this.stars;
    data['review'] = this.review;
    data['delivery_time'] = this.deliveryTime;
    data['delivery_duration'] = this.deliveryDuration;
    data['order_time'] = this.orderTime;
    data['order_type'] = this.orderType;
    data['is_paid'] = this.isPaid;
    data['distance'] = this.distance;
    data['order_duration'] = this.orderDuration;
    data['state'] = this.state;
    
    return data;
  }
}