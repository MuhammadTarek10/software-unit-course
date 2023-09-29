class User {
  final String name;
  double money;

  User(this.name, this.money);

  String info() {
    return "Name: $name, Money: $money";
  }
}

class Order {
  final String name;
  final double price;
  final User user;

  Order(this.name, this.price, this.user);

  void info() {
    print("Order Name: $name");
    print("Order Price: $price");
    print("Order User: ${user.info()}");
  }

  bool checkout() {
    if (user.money >= price) {
      user.money -= price;
      print("Order is done");
      return true;
    } else {
      print("User has no enough money");
      return false;
    }
  }
}

class Restaurant {
  final String name;
  List<Order>? orders;

  Restaurant(this.name) {
    orders = [];
  }

  void addOrder(Order order) {
    if (order.checkout()) orders!.add(order);
  }

  void printOrders() {
    if (orders == null) {
      print("No Orders");
    } else {
      for (int i = 0; i < orders!.length; i++) {
        orders![i].info();
      }
    }
  }
}

void main() {
  final User user = User("Ahmed", 100);
  print("User: ${user.info()}");
  final Restaurant restaurant = Restaurant("KFC");
  final Order order = Order("Chicken", 50, user);
  order.info();
  restaurant.addOrder(order);
  restaurant.printOrders();
}
