
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


Spinners that are currently available can be accessed using `SlugStyle` enum.

```dart

enum SlugStyle {
  dots,
  dots2,
  dots3,
  dots4,
  dots5,
  dots6,
  dots7,
  dots8,
  dots9,
  dots10,
  dots11,
  dots12,
  line,
  line2,
  pipe,
  simpleDots,
  star,
  star2,
  flip,
  hamburger,
  growVertical,
  growHorizontal,
  balloon,
  balloon2,
  noise,
  bounce,
  boxBounce,
  boxBounce2,
  triangle,
  arc,
  circle,
  squareCorners,
  circleQuarters,
  circleHalves,
  squish,
  toggle,
  toggle2,
  toggle3,
  toggle4,
  toggle5,
  toggle6,
  toggle7,
  toggle8,
  toggle9,
  toggle10,
  arrow,
  arrow2,
  arrow3,
  smiley,
  monkey,
  hearts,
  clock,
  earth,
  weather,
}

```


## Supports 

✅ Ubuntu <br>
✅ Windows <br>
✅ Mac OS 

Inspired from [Ora](https://github.com/sindresorhus/ora) and [cli_util](https://github.com/dart-lang/cli_util). Thank you [sindresorhus](https://github.com/sindresorhus) for the amazing collection of spinners.

