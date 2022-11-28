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
  Acc(email: 'Z97539', pass: 'kq6uzd'), //島田 保英
  Acc(email: 'Z02329', pass: '5bgz66'), //Nguyen Khac Tung
  Acc(email: 'Z02489', pass: 'en4it2'), //Le Quang Anh
  Acc(email: 'Z02490', pass: '2q625c'), //Nguyen Cam Linh
  Acc(email: 'Z02491', pass: 'ew0x4r'), //Vu Thi Kim Tuyen
  Acc(email: 'Z02578', pass: 'lqywx5'), //Bui Van Khoi
  Acc(email: 'Z02580', pass: 'fb8ds9'), //Khuat Quang Giang
  Acc(email: 'Z02850', pass: 'tj5hds'), //Hoang Dinh Chien
  Acc(email: 'Z02851', pass: '6ti8sg'), //Dang Le Duc Anh
  Acc(email: 'Z02897', pass: 'lihf0t'), //Nguyen Anh Van
  Acc(email: 'Z02898', pass: 'grfjc6'), //Le Thi Lan Huong
  Acc(email: 'Z02899', pass: '3sjxxv'), //Nguyen Viet Dung
  Acc(email: 'Z02900', pass: 'yfkqz0'), //Doan Huy Duc
  Acc(email: 'Z03038', pass: '8825bl'), //Nguyen Ngoc Diep
  Acc(email: 'Z03113', pass: '4g7rzh'), //Luong Minh Trang
  Acc(email: 'Z99999', pass: 'y2i8so'), //Tran Minh Hung
];
