enum DeliveryMethod { delivery, pickup }

class Product {
  final String id, name;
  final double price;
  int stock;
  Product({required this.id, required this.name, required this.price, required this.stock});
}

class Customer {
  final String id, name, email;
  final String? address;
  Customer({required this.id, required this.name, required this.email, this.address});
}

class OrderItem {
  final Product product;
  final int quantity;
  OrderItem({required this.product, required this.quantity});
  double get subtotal => product.price * quantity;
}

class Order {
  final String id;
  final Customer customer;
  final List<OrderItem> items;
  final DeliveryMethod method;
  final DateTime date;
  
  Order({
    required this.id,
    required this.customer,
    required this.items,
    required this.method,
  }) : date = DateTime.now() {
    if (method == DeliveryMethod.delivery && customer.address == null) {
      throw Exception('Delivery address required');
    }
    // Check stock
    for (var item in items) {
      if (item.quantity > item.product.stock) {
        throw Exception('Insufficient stock for ${item.product.name}');
      }
    }
  }
  
  // Named constructors
  factory Order.pickup({required String id, required Customer customer, required List<OrderItem> items}) {
    return Order(id: id, customer: customer, items: items, method: DeliveryMethod.pickup);
  }
  
  factory Order.delivery({required String id, required Customer customer, required List<OrderItem> items}) {
    return Order(id: id, customer: customer, items: items, method: DeliveryMethod.delivery);
  }
  
  // Compute total amount
  double get totalAmount => items.fold(0, (sum, item) => sum + item.subtotal);
  
  void processOrder() {
    for (var item in items) {
      item.product.stock -= item.quantity;
    }
    print('Order processed. Stock updated.');
  }
  
  void printSummary() {
    print('=== ORDER SUMMARY ===');
    print('ID: $id | Customer: ${customer.name}');
    print('Method: ${method.name} | Date: $date');
    if (method == DeliveryMethod.delivery) print('Address: ${customer.address}');
    print('--- Items ---');
    for (var item in items) {
      print('${item.product.name} x${item.quantity}: \$${item.subtotal}');
    }
    print('Total: \$$totalAmount');
    print('-------------------\n');
  }
}

void main() {
  // Create sample data
  final products = [
    Product(id: '1', name: 'Shirt', price: 30, stock: 10),
    Product(id: '2', name: 'Jean', price: 50.15, stock: 20),
    Product(id: '3', name: 'Jacket', price: 125.50, stock: 15),
  ];
  
  final customers = [
    Customer(id: '1', name: 'kimheng', email: 'kimheng@email.com', address: 'Phnom Penh, Cambodia'),
    Customer(id: '2', name: 'Nary', email: 'nary@email.com'), // No address for pickup
  ];
  
  print('Online Shop\n');
  
  // Test delivery order
  final order1 = Order.delivery(
    id: '12345',
    customer: customers[0],
    items: [
      OrderItem(product: products[0], quantity: 1),
      OrderItem(product: products[1], quantity: 2),
    ],
  );
  order1.printSummary();
  order1.processOrder();
  
  // Test pickup order  
  final order2 = Order.pickup(
    id: '13245',
    customer: customers[1],
    items: [
      OrderItem(product: products[2], quantity: 1),
    ],
  );
  order2.printSummary();
  order2.processOrder();
  
  //total amount calculation
  print('Order 1 Total: \$${order1.totalAmount}');
  print('Order 2 Total: \$${order2.totalAmount}');
  
  // Show updated stock
  print('\nUpdated Stock:');
  for (var product in products) {
    print('${product.name}: ${product.stock} left');
  }
}