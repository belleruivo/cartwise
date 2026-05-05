class CartItem {
  final int id;
  final String name;
  final String category;
  int quantity;
  final double unitPrice;

  CartItem({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
    required this.unitPrice,
  });

  double get total => quantity * unitPrice;
}
