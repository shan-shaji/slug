
<p align="center">
    <h1 align="center"> SLUG 🐌</h1>
	<p align="center"><b>Terminal progress with different spinners.</b>  </p>
</p>

![GIf](assets/video.gif) 

## Install

```
$ dart pub add slug

```

## Usage

```dart

  var slug = Slug(
    ansi: Ansi(true),
    slugStyle: SlugStyle.toggle7,
  );

  var slug1 = Slug(
    ansi: Ansi(true),
    slugStyle: SlugStyle.noise,
  );

  var progress = slug.progress('doing some work');
  await Future.delayed(Duration(seconds: 2));
  progress.finish(showTiming: true, message: "Completed!");

  progress = slug1.progress('doing some work');
  await Future.delayed(Duration(seconds: 2));
  progress.finish(showTiming: true, message: "Completed!");

```