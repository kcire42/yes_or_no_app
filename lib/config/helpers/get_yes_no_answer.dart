import 'package:yes_or_no/domain/entities/message.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getanswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    response.data['answer'];
    return Message(
      text: response.data['answer'],
      imageUrl: response.data['image'],
      fromWho: FromWho.her,
    );
  }
}
