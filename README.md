
<p align="center">
    <h1 align="center"> SLUG 🐌</h1>
	<p align="center"><b>Terminal progress with different spinners.</b>  </p>
</p>

<p align="center"> 
<iframe src="https://giphy.com/embed/SnJBm9UZRYYJ4bfzks" width="480" height="294" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/SnJBm9UZRYYJ4bfzks">Video</a></p>
</p>


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