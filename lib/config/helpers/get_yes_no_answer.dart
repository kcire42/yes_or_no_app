import 'package:yes_or_no/domain/entities/message.dart';
import 'package:dio/dio.dart';
import 'package:yes_or_no/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getanswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoAnswer.fromJsonMap(response.data);
    return yesNoModel.toMessageEntity();
  }
}
