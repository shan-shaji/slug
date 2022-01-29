import 'dart:async';
import 'dart:ffi';
import 'package:slug/slug.dart';

Future<void> main(List<String> args) async {
  print("\n");

  var slug = Slug(slugStyle: SlugStyle.star);
  var slug2 = Slug(slugStyle: SlugStyle.growVertical);
  var slug3 = Slug(slugStyle: SlugStyle.dots);
  var slug4 = Slug(slugStyle: SlugStyle.line);
  var slug5 = Slug(slugStyle: SlugStyle.toggle7);
  var slug6 = Slug(slugStyle: SlugStyle.earth, hideCursor: false);

  var progress = slug5.progress('doing some work');
  await Future.delayed(Duration(seconds: 2));
  progress.finish(showTiming: true, message: "Completed!");

  progress = slug6.progress('doing some work');
  await Future.delayed(Duration(seconds: 2));
  progress.finish(showTiming: true, message: "Completed!");

  progress = slug.progress('doing some work');
  await Future.delayed(Duration(seconds: 2));
  progress.finish(showTiming: true, message: "Completed!");

  progress = slug2.progress('doing some work');
  await Future.delayed(Duration(seconds: 2));
  progress.finish(showTiming: true, message: "Completed!");

  progress = slug3.progress('doing some work');
  await Future.delayed(Duration(seconds: 2));
  progress.error(showTiming: true, message: "Error!");

  progress = slug4.progress('doing some work');
  await Future.delayed(Duration(seconds: 2));
  progress.finish(showTiming: true);
}
