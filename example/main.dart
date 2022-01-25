import 'dart:async';
import 'package:slug/slug.dart';

Future<void> main(List<String> args) async {
  print("\n");

  var logger = Slug.standard(
    ansi: Ansi(true),
    slugStyle: SlugStyle.growHorizontal,
  );

  var slug2 = Slug.standard(
    ansi: Ansi(true),
    slugStyle: SlugStyle.growVertical,
  );

  var slug3 = Slug.standard(
    ansi: Ansi(true),
    slugStyle: SlugStyle.dots,
  );

  var slug4 = Slug.standard(
    ansi: Ansi(true),
    slugStyle: SlugStyle.line,
  );

  var slug5 = Slug.standard(
    ansi: Ansi(true),
    slugStyle: SlugStyle.toggle7,
  );

  var progress = slug5.progress('doing some work');
  await Future.delayed(Duration(seconds: 2));
  progress.finish(showTiming: true, message: "Completed!");

  progress = logger.progress('doing some work');
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
