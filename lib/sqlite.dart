import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

class Dog {
  final int id;
  final String name;
  final int age;

  const Dog({
    required this.id,
    required this.name,
    required this.age,
  });
}

// Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
