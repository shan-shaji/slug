import 'package:slug/src/progress/progress.dart';
import 'package:slug/src/slug_main.dart';

class SimpleProgress extends Progress {
  final Slug slug;

  SimpleProgress(this.slug, String message) : super(message) {
    slug.stdout('$message...');
  }

  @override
  void cancel() {}

  @override
  void finish({String? message, bool showTiming = false}) {}

  @override
  void error({String? message, bool showTiming = false}) {}
}
