import 'package:chatter/app/chatter.dart';
import 'package:chatter/data/network/app_api.dart';
import 'package:chatter/data/requests/register_request_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() async {
  Dio dio = Dio();
  final res = AppServiceClient(dio);
  final result = await res.register(
    RegisterRequest(
      bio: 'sda',
      password: 'dassadsasa',
      title: 'sda',
      username: 'fsafdasdas',
    ).toJson(),
  );
  print(result.token);
  runApp(Chatter());
}
