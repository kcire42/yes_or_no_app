// To parse this JSON data, do
//
//     final getYesNoAnswer = getYesNoAnswerFromJson(jsonString);

import 'package:yes_or_no/domain/entities/message.dart';

class YesNoAnswer {
  String answer;
  bool forced;
  String image;

  YesNoAnswer({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoAnswer.fromJsonMap(Map<String, dynamic> json) => YesNoAnswer(
    answer: json["answer"],
    forced: json["forced"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "forced": forced,
    "image": image,
  };

  Message toMessageEntity() =>
      Message(text: answer, imageUrl: image, fromWho: FromWho.her);
}
