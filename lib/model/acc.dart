class Acc {
  Acc({
    required this.email,
    required this.pass,
  });

  final String email;
  final String pass;

  factory Acc.fromJson(Map<String, dynamic> json) {
    return Acc(email: json['email'] as String, pass: json['pass'] as String);
  }
}

List<Acc> accounts = [
  Acc(email: 'error', pass: '123'),
  Acc(email: 'tmhung', pass: 'tmhung'),
  Acc(email: 'dldanh', pass: 'dldanh'),
  Acc(email: 'dhduc', pass: 'dhduc'),
  Acc(email: 'nvdung', pass: 'nvdung'),
  Acc(email: 'anhlq', pass: 'anhlq'),
  Acc(email: 'khoibv', pass: 'khoibv'),
  Acc(email: 'chienhd', pass: 'chienhd'),
  Acc(email: 'diepnguyen', pass: 'diepnguyen'),
  Acc(email: 'ducdoan', pass: 'ducdoan'),
  Acc(email: 'giangkhuat', pass: 'giangkhuat'),
  Acc(email: 'huongle', pass: 'huongle'),
  Acc(email: 'linhnguyen', pass: 'linhnguyen'),
  Acc(email: 'kimtuyen3386', pass: 'kimtuyen3386'),
  Acc(email: 'luongminhtrang', pass: 'luongminhtrang'),
  Acc(email: 'tungnguyen', pass: 'tungnguyen'),
  Acc(email: 'vannguyenanh', pass: 'vannguyenanh'),
  Acc(email: 'bac', pass: '1234567'),
];
