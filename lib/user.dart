class User {
  final int reference;
  final String cardTypecontroller;
  final String montant;
  final String phoneNumber;
  final String cardNumbercontroller;
  final DateTime date;
  final int cardCodecontroller;

  const User(
      {required this.reference,
      required this.cardTypecontroller,
      required this.montant,
      required this.phoneNumber,
      required this.cardNumbercontroller,
      required this.cardCodecontroller,
      required this.date});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      reference: json['reference'],
      cardTypecontroller: json['cardTypecontroller'],
      montant: json['montant'],
      phoneNumber: json['phoneNumber'],
      cardNumbercontroller: json['cardNumbercontroller'],
      date: json['date'],
      cardCodecontroller: json['cardCodecontroller'],
    );
  }
}
