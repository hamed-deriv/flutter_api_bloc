import 'dart:convert';

import 'package:equatable/equatable.dart';

class BoredActivity extends Equatable {
  const BoredActivity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  final String activity;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String key;
  final double accessibility;

  factory BoredActivity.fromJson(Map<String, dynamic> json) => BoredActivity(
        activity: json["activity"],
        type: json["type"],
        participants: json["participants"],
        price: json["price"].toDouble(),
        link: json["link"],
        key: json["key"],
        accessibility: json["accessibility"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "activity": activity,
        "type": type,
        "participants": participants,
        "price": price,
        "link": link,
        "key": key,
        "accessibility": accessibility,
      };

  @override
  List<Object?> get props => [
        activity,
        type,
        participants,
        price,
        link,
        key,
        accessibility,
      ];
}

BoredActivity boredActivityFromJson(String data) =>
    BoredActivity.fromJson(json.decode(data));

String boredActivityToJson(BoredActivity data) => json.encode(data.toJson());
