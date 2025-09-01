import 'package:chatter/app/chatter.dart';
import 'package:chatter/app/di/di.dart';
import 'package:chatter/data/models/requests/login_request_model.dart';
import 'package:chatter/data/source/retrofit.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

void main() async {
  /*  Dio dio = Dio();
  String token =
      'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIyNSIsInVuaXF1ZV9uYW1lIjoia2FyaW0xMjMiLCJuYmYiOjE3NTY3MzUxNDMsImV4cCI6MTc1NjczODc0MywiaWF0IjoxNzU2NzM1MTQzLCJpc3MiOiJZb3VyQXBwIiwiYXVkIjoiWW91ckFwcFVzZXJzIn0.fT202yEI0pe3NeMZqKTJm94HRNQgY-sbdJAACDXAeVyR_6MwIR55HYGnQARWHyNkXCjqxaf6VxWBxLjVcBUQNw';
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    ),
  );
  final res = AppServiceClient(dio);

  final login = LoginRequestModel(username: 'karim123', password: '123456');
  final response = await res.login(login);
  print(response.token); */

  WidgetsFlutterBinding.ensureInitialized();
  await init(); // initialize GetIt
  runApp(Chatter());
}
