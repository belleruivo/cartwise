class Purchase {
  final int id;
  final String store;
  final String date;
  final double total;
  final int items;
  final String initial;
  final String color;

  Purchase({
    required this.id,
    required this.store,
    required this.date,
    required this.total,
    required this.items,
    required this.initial,
    required this.color,
  });
}

final List<Purchase> recentPurchases = [
  Purchase(
    id: 1,
    store: "Pão de Açúcar",
    date: "Hoje, 10:32",
    total: 187.45,
    items: 12,
    initial: "P",
    color: "orange",
  ),
  Purchase(
    id: 2,
    store: "Carrefour",
    date: "Ontem, 18:15",
    total: 243.90,
    items: 18,
    initial: "C",
    color: "blue",
  ),
  Purchase(
    id: 3,
    store: "Extra",
    date: "20 fev, 14:00",
    total: 132.60,
    items: 9,
    initial: "E",
    color: "red",
  ),
  Purchase(
    id: 4,
    store: "Atacadão",
    date: "17 fev, 09:45",
    total: 398.20,
    items: 24,
    initial: "A",
    color: "purple",
  ),
];
