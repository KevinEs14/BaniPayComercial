// To parse this JSON data, do
//
//     final userAccount = userAccountFromJson(jsonString);

import 'dart:convert';

UserAccount userAccountFromJson(String str) =>
    UserAccount.fromJson(json.decode(str));

String userAccountToJson(UserAccount data) => json.encode(data.toJson());

class UserAccount {
  UserAccount({
    required this.idToken,
    required this.user,
  });

  String idToken;
  User user;

  factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
        idToken: json["id_token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id_token": idToken,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.activated,
    this.imageUrl,
    required this.phone,
    required this.documentType,
    required this.documentNumber,
    this.authority,
    this.affiliate,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String email;
  String firstName;
  String lastName;
  String password;
  bool activated;
  String? imageUrl;
  String phone;
  String documentType;
  String documentNumber;
  Authority? authority;
  Affiliate? affiliate;
  String? createdAt;
  String? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        password: json["password"],
        activated: json["activated"],
        imageUrl: json["imageUrl"],
        phone: json["phone"],
        documentType: json["documentType"],
        documentNumber: json["documentNumber"],
        authority: json["authority"]==null?null:Authority.fromJson(json["authority"]),
        affiliate: json["affiliate"]==null?null:Affiliate.fromJson(json["affiliate"]),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "activated": activated,
        "imageUrl": imageUrl,
        "phone": phone,
        "documentType": documentType,
        "documentNumber": documentNumber,
        "authority": authority!.toJson(),
        "affiliate": affiliate!.toJson(),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class Affiliate {
  Affiliate({
    required this.id,
    required this.legalName,
    required this.nit,
    required this.legalAddress,
    required this.contactNumber,
    required this.reportEmail,
    required this.industry,
    this.imageUrl,
    required this.activated,
    required this.withInvoice,
    required this.bankAccountNumberBolivian,
    required this.bolivianBank,
    this.bankAccountNumberUsDollar,
    required this.idCommercial,
    this.createdAt,
    this.updatedAt,
    this.usDollarBank,
  });

  String id;
  String legalName;
  String nit;
  String legalAddress;
  String contactNumber;
  String reportEmail;
  String industry;
  String? imageUrl;
  bool activated;
  bool withInvoice;
  String bankAccountNumberBolivian;
  String bolivianBank;
  String? bankAccountNumberUsDollar;
  String idCommercial;
  String? createdAt;
  String? updatedAt;
  String? usDollarBank;

  factory Affiliate.fromJson(Map<String, dynamic> json) {
    return Affiliate(
      id: json["id"],
      legalName: json["legalName"],
      nit: json["nit"],
      legalAddress: json["legalAddress"],
      contactNumber: json["contactNumber"],
      reportEmail: json["reportEmail"],
      industry: json["industry"],
      imageUrl: json["imageUrl"],
      activated: json["activated"],
      withInvoice: json["withInvoice"],
      bankAccountNumberBolivian: json["bankAccountNumberBolivian"],
      bolivianBank: json["bolivianBank"],
      bankAccountNumberUsDollar: json["bankAccountNumberUsDollar"],
      idCommercial: json["idCommercial"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      usDollarBank: json["usDollarBank"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "legalName": legalName,
        "nit": nit,
        "legalAddress": legalAddress,
        "contactNumber": contactNumber,
        "reportEmail": reportEmail,
        "industry": industry,
        "imageUrl": imageUrl,
        "activated": activated,
        "withInvoice": withInvoice,
        "bankAccountNumberBolivian": bankAccountNumberBolivian,
        "bolivianBank": bolivianBank,
        "bankAccountNumberUsDollar": bankAccountNumberUsDollar,
        "idCommercial": idCommercial,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "usDollarBank": usDollarBank!,
      };
}

class Bank {
  Bank({
    required this.id,
    required this.initials,
    required this.name,
    this.imageUrl,
  });

  String id;
  String initials;
  String name;
  String? imageUrl;

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        id: json["id"],
        initials: json["initials"],
        name: json["name"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "initials": initials,
        "name": name,
        "imageUrl": imageUrl,
      };
}

class Authority {
  Authority({
    required this.id,
  });

  String id;

  factory Authority.fromJson(Map<String, dynamic> json) => Authority(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
