import 'package:one_side_chat/domain/entities/message.dart';

class YesNoModel {
    String answer;
    bool forced;
    String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    //pasar la siguiente funcion a un archivo independiente
    Message toMessageEntity(){
        return Message(
            text: answer=='yes'?'Si':'No',
            imageURL: image,
            fromWho: FromWho.bot);
    }
}
