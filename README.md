
<p align="center">
    <h1 align="center"> SLUG 🐌</h1>
	<p align="center"><b>Terminal progress with different spinners.</b>  </p>
</p>

<div align="center">
  <image align ="center" src="https://media.giphy.com/media/XKZvZdKh95JfcZorri/giphy.gif">
</div>


## Install

```dart

 dart pub add slug

```

## Usage

```dart

  var slug = Slug(
    slugStyle: SlugStyle.toggle7,
  );

  var slug1 = Slug(
    slugStyle: SlugStyle.noise,
  );

  var progress = slug.progress('doing some work');
  await Future.delayed(Duration(seconds: 2));
  progress.finish(message: "Completed!");

  progress = slug1.progress('doing some work');
  await Future.delayed(Duration(seconds: 2));
  progress.finish(showTiming: true, message: "Completed!");

```

Inspired from [Ora](https://github.com/sindresorhus/ora) and [cli_util](https://github.com/dart-lang/cli_util). Thank you [sindresorhus](https://github.com/sindresorhus) for the amazing collection of spinners.

