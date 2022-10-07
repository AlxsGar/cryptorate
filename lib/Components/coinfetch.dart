class CoinFetch {
  CoinFetch({
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  String name;
  String imageUrl;
  num price;

  factory CoinFetch.fromJson(Map<String, dynamic> json) {
    return CoinFetch(
      name: json['name'],
      imageUrl: json['image'],
      price: json['current_price'],
    );
  }
}

List<CoinFetch> coinList = [];
