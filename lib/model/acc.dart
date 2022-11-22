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
  Acc(email: 'Z97539', pass: 'Zensho123@'),
  Acc(email: 'Z02329', pass: 'Zensho123@'),
  Acc(email: 'Z02489', pass: 'Zensho123@'),
  Acc(email: 'Z02490', pass: 'Zensho123@'),
  Acc(email: 'Z02491', pass: 'Zensho123@'),
  Acc(email: 'Z02578', pass: 'Zensho123@'),
  Acc(email: 'Z02580', pass: 'Zensho123@'),
  Acc(email: 'Z02850', pass: 'Zensho123@'),
  Acc(email: 'Z02851', pass: 'Zensho123@'),
  Acc(email: 'Z02897', pass: 'Zensho123@'),
  Acc(email: 'Z02897', pass: 'Zensho123@'),
  Acc(email: 'Z02899', pass: 'Zensho123@'),
  Acc(email: 'Z02900', pass: 'Zensho123@'),
  Acc(email: 'Z03038', pass: 'Zensho123@'),
  Acc(email: 'Z03113', pass: 'Zensho123@'),
  Acc(email: 'Z99999', pass: 'Zensho123@'),
];
