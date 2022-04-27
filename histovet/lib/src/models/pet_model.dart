import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class Pet {
  final String? id;
  final String code;
  final String name;
  final String nameOwner;
  final String contactOwner;
  final int age;
  final String breed;
  final String specie;
  final String color;
  final String sex;

  Pet(this.id, this.code, this.name, this.nameOwner, this.contactOwner,
      this.age, this.breed, this.specie, this.color, this.sex);
}