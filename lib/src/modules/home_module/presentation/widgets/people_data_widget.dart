import 'package:flutter/material.dart';

class PeopleDataWidget extends StatelessWidget {
  final String title;
  final String value;

  const PeopleDataWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Text(value),
    );
  }
}
