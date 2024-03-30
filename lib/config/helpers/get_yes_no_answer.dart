import 'package:dio/dio.dart';
import 'package:one_side_chat/domain/entities/message.dart';
import 'package:one_side_chat/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer{

  final _dio = Dio();
  Future<Message> getAnswer() async{
    final response = await _dio.get('https://yesno.wtf/api');

    final YesNoModel yesNoModel= YesNoModel.fromJson(response.data);

    return yesNoModel.toMessageEntity();
  }
}