import 'dart:convert';

class UserUpdateParams {
  final String id;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? country;
  final String? state;
  final String? city;
  final String? userName;
  final String? phoneNumber;
  final String? email;
  final String? bio;
  final String? birthdate;
  final String? fcmToken;
  final int? weight;
  final int? height;
  final String? address;
  final String? fatherName;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? addHealth1;
  final List<int>? removeHealth1;
  final List<int>? addFoodAllergies;
  final List<int>? removeFoodAllergies;
  final List<int>? addDrugAllergies;
  final List<int>? removeDrugAllergies;
  final List<int>? addSickness;
  final List<int>? removeSickness;
  final List<String>? categories;
  final List<UserAnswer>? userAnswers;

  UserUpdateParams({
    required this.id,
    this.password,
    this.firstName,
    this.lastName,
    this.country,
    this.state,
    this.city,
    this.userName,
    this.phoneNumber,
    this.email,
    this.bio,
    this.birthdate,
    this.fcmToken,
    this.weight,
    this.height,
    this.address,
    this.fatherName,
    this.addTags,
    this.removeTags,
    this.addHealth1,
    this.removeHealth1,
    this.addFoodAllergies,
    this.removeFoodAllergies,
    this.addDrugAllergies,
    this.removeDrugAllergies,
    this.addSickness,
    this.removeSickness,
    this.categories,
    this.userAnswers,
  });

  factory UserUpdateParams.fromJson(String str) => UserUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserUpdateParams.fromMap(Map<String, dynamic> json) => UserUpdateParams(
    id: json["id"],
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    userName: json["userName"],
    phoneNumber: json["phoneNumber"],
    email: json["email"],
    bio: json["bio"],
    birthdate: json["birthdate"],
    fcmToken: json["fcmToken"],
    weight: json["weight"],
    height: json["height"],
    address: json["address"],
    fatherName: json["fatherName"],
    addTags: json["addTags"] == null ? [] : List<int>.from(json["addTags"]!.map((x) => x)),
    removeTags: json["removeTags"] == null ? [] : List<int>.from(json["removeTags"]!.map((x) => x)),
    addHealth1: json["addHealth1"] == null ? [] : List<int>.from(json["addHealth1"]!.map((x) => x)),
    removeHealth1: json["removeHealth1"] == null ? [] : List<int>.from(json["removeHealth1"]!.map((x) => x)),
    addFoodAllergies: json["addFoodAllergies"] == null ? [] : List<int>.from(json["addFoodAllergies"]!.map((x) => x)),
    removeFoodAllergies: json["removeFoodAllergies"] == null ? [] : List<int>.from(json["removeFoodAllergies"]!.map((x) => x)),
    addDrugAllergies: json["addDrugAllergies"] == null ? [] : List<int>.from(json["addDrugAllergies"]!.map((x) => x)),
    removeDrugAllergies: json["removeDrugAllergies"] == null ? [] : List<int>.from(json["removeDrugAllergies"]!.map((x) => x)),
    addSickness: json["addSickness"] == null ? [] : List<int>.from(json["addSickness"]!.map((x) => x)),
    removeSickness: json["removeSickness"] == null ? [] : List<int>.from(json["removeSickness"]!.map((x) => x)),
    categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
    userAnswers: json["userAnswers"] == null ? [] : List<UserAnswer>.from(json["userAnswers"]!.map((x) => UserAnswer.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "password": password,
    "firstName": firstName,
    "lastName": lastName,
    "country": country,
    "state": state,
    "city": city,
    "userName": userName,
    "phoneNumber": phoneNumber,
    "email": email,
    "bio": bio,
    "birthdate": birthdate,
    "fcmToken": fcmToken,
    "weight": weight,
    "height": height,
    "address": address,
    "fatherName": fatherName,
    "addTags": addTags == null ? [] : List<dynamic>.from(addTags!.map((x) => x)),
    "removeTags": removeTags == null ? [] : List<dynamic>.from(removeTags!.map((x) => x)),
    "addHealth1": addHealth1 == null ? [] : List<dynamic>.from(addHealth1!.map((x) => x)),
    "removeHealth1": removeHealth1 == null ? [] : List<dynamic>.from(removeHealth1!.map((x) => x)),
    "addFoodAllergies": addFoodAllergies == null ? [] : List<dynamic>.from(addFoodAllergies!.map((x) => x)),
    "removeFoodAllergies": removeFoodAllergies == null ? [] : List<dynamic>.from(removeFoodAllergies!.map((x) => x)),
    "addDrugAllergies": addDrugAllergies == null ? [] : List<dynamic>.from(addDrugAllergies!.map((x) => x)),
    "removeDrugAllergies": removeDrugAllergies == null ? [] : List<dynamic>.from(removeDrugAllergies!.map((x) => x)),
    "addSickness": addSickness == null ? [] : List<dynamic>.from(addSickness!.map((x) => x)),
    "removeSickness": removeSickness == null ? [] : List<dynamic>.from(removeSickness!.map((x) => x)),
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
    "userAnswers": userAnswers == null ? [] : List<dynamic>.from(userAnswers!.map((x) => x.toMap())),
  };
}

class UserAnswer {
  final String? date;
  final int? totalScore;
  final List<Result>? results;

  UserAnswer({
    this.date,
    this.totalScore,
    this.results,
  });

  factory UserAnswer.fromJson(String str) => UserAnswer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserAnswer.fromMap(Map<String, dynamic> json) => UserAnswer(
    date: json["date"],
    totalScore: json["totalScore"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "date": date,
    "totalScore": totalScore,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toMap())),
  };
}

class Result {
  final String? question;
  final Answer? answer;

  Result({
    this.question,
    this.answer,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    question: json["question"],
    answer: json["answer"] == null ? null : Answer.fromMap(json["answer"]),
  );

  Map<String, dynamic> toMap() => {
    "question": question,
    "answer": answer?.toMap(),
  };
}

class Answer {
  final String? title;
  final String? score;

  Answer({
    this.title,
    this.score,
  });

  factory Answer.fromJson(String str) => Answer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Answer.fromMap(Map<String, dynamic> json) => Answer(
    title: json["title"],
    score: json["score"],
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "score": score,
  };
}
