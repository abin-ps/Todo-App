import 'package:flutter/material.dart';

class Tasks{
  Tasks({required this.title,this.isDone = false, this.isEdit=false});
  String title;
  bool isDone;
  bool isEdit;
}