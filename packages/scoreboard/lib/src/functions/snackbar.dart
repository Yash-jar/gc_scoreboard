import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../globals/styles.dart';

void showSnackBar(BuildContext buildContext, String message) {
  ScaffoldMessenger.of(buildContext).showSnackBar(SnackBar(
    content: Text(
      message,
      style: basicFontStyle,
    ),
    duration: const Duration(seconds: 5),
  ));
}

void showErrorSnackBar(BuildContext buildContext, DioError err) {
  // print(err.response!.data);
  // print(err.response);
  // print(err.response!.data['message']);
  // print(err.response!.statusCode);
  ScaffoldMessenger.of(buildContext).showSnackBar(SnackBar(
    content: Text(
      (err.response != null)
          ? err.response!.data['message']
          : "Some error occurred. try again",
      style: basicFontStyle,
    ),
    duration: const Duration(seconds: 5),
  ));
}
