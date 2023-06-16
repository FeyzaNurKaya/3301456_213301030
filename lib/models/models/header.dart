import 'package:flutter/material.dart';

Widget header(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 10),
    child: Text(
      text,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}
