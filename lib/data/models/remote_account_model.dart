import 'package:untitled1/data/data.dart';
import 'package:untitled1/domain/domain.dart';

class RemoteAccountModel {
  final String accessToken;
  RemoteAccountModel({required this.accessToken});

  //todo rename to api specific
  factory RemoteAccountModel.fromJson(Map json) {
    if (json.containsKey('accessToken')) {
      return RemoteAccountModel(accessToken: json['accessToken']);
    } else {
      throw HttpError.invalidData;
    }
  }

  AccountEntity toEntity() => AccountEntity(token: accessToken);
}
