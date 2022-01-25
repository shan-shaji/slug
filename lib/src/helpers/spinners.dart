import 'package:slug/src/enums/slug_style.dart';

class Spinner {
  List<String> frames = [];
  int interval = 80;

  Spinner({required this.frames, required this.interval});
}

Spinner getFrame(slugStyle) {
  switch (slugStyle) {
    case SlugStyle.dots:
      return Spinner(
        frames: ["⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"],
        interval: 80,
      );
    case SlugStyle.dots2:
      return Spinner(
        frames: ["⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"],
        interval: 80,
      );
    case SlugStyle.dots3:
      return Spinner(
        frames: ["⠋", "⠙", "⠚", "⠞", "⠖", "⠦", "⠴", "⠲", "⠳", "⠓"],
        interval: 80,
      );
    case SlugStyle.dots4:
      return Spinner(
        frames: [
          "⠄",
          "⠆",
          "⠇",
          "⠋",
          "⠙",
          "⠸",
          "⠰",
          "⠠",
          "⠰",
          "⠸",
          "⠙",
          "⠋",
          "⠇",
          "⠆"
        ],
        interval: 80,
      );
    case SlugStyle.dots5:
      return Spinner(
        frames: [
          "⠋",
          "⠙",
          "⠚",
          "⠒",
          "⠂",
          "⠂",
          "⠒",
          "⠲",
          "⠴",
          "⠦",
          "⠖",
          "⠒",
          "⠐",
          "⠐",
          "⠒",
          "⠓",
          "⠋"
        ],
        interval: 80,
      );
    case SlugStyle.dots6:
      return Spinner(
        frames: [
          "⠁",
          "⠉",
          "⠙",
          "⠚",
          "⠒",
          "⠂",
          "⠂",
          "⠒",
          "⠲",
          "⠴",
          "⠤",
          "⠄",
          "⠄",
          "⠤",
          "⠴",
          "⠲",
          "⠒",
          "⠂",
          "⠂",
          "⠒",
          "⠚",
          "⠙",
          "⠉",
          "⠁"
        ],
        interval: 80,
      );

    case SlugStyle.dots7:
      return Spinner(
        frames: [
          "⠈",
          "⠉",
          "⠋",
          "⠓",
          "⠒",
          "⠐",
          "⠐",
          "⠒",
          "⠖",
          "⠦",
          "⠤",
          "⠠",
          "⠠",
          "⠤",
          "⠦",
          "⠖",
          "⠒",
          "⠐",
          "⠐",
          "⠒",
          "⠓",
          "⠋",
          "⠉",
          "⠈"
        ],
        interval: 80,
      );
    case SlugStyle.dots8:
      return Spinner(
        frames: [
          "⠁",
          "⠁",
          "⠉",
          "⠙",
          "⠚",
          "⠒",
          "⠂",
          "⠂",
          "⠒",
          "⠲",
          "⠴",
          "⠤",
          "⠄",
          "⠄",
          "⠤",
          "⠠",
          "⠠",
          "⠤",
          "⠦",
          "⠖",
          "⠒",
          "⠐",
          "⠐",
          "⠒",
          "⠓",
          "⠋",
          "⠉",
          "⠈",
          "⠈"
        ],
        interval: 80,
      );
    case SlugStyle.dots9:
      return Spinner(
        frames: ["⢹", "⢺", "⢼", "⣸", "⣇", "⡧", "⡗", "⡏"],
        interval: 80,
      );
    case SlugStyle.dots10:
      return Spinner(
        frames: ["⢄", "⢂", "⢁", "⡁", "⡈", "⡐", "⡠"],
        interval: 80,
      );
    case SlugStyle.dots11:
      return Spinner(
        frames: ["⠁", "⠂", "⠄", "⡀", "⢀", "⠠", "⠐", "⠈"],
        interval: 80,
      );
    case SlugStyle.dots12:
      return Spinner(
        frames: [
          "⢀⠀",
          "⡀⠀",
          "⠄⠀",
          "⢂⠀",
          "⡂⠀",
          "⠅⠀",
          "⢃⠀",
          "⡃⠀",
          "⠍⠀",
          "⢋⠀",
          "⡋⠀",
          "⠍⠁",
          "⢋⠁",
          "⡋⠁",
          "⠍⠉",
          "⠋⠉",
          "⠋⠉",
          "⠉⠙",
          "⠉⠙",
          "⠉⠩",
          "⠈⢙",
          "⠈⡙",
          "⢈⠩",
          "⡀⢙",
          "⠄⡙",
          "⢂⠩",
          "⡂⢘",
          "⠅⡘",
          "⢃⠨",
          "⡃⢐",
          "⠍⡐",
          "⢋⠠",
          "⡋⢀",
          "⠍⡁",
          "⢋⠁",
          "⡋⠁",
          "⠍⠉",
          "⠋⠉",
          "⠋⠉",
          "⠉⠙",
          "⠉⠙",
          "⠉⠩",
          "⠈⢙",
          "⠈⡙",
          "⠈⠩",
          "⠀⢙",
          "⠀⡙",
          "⠀⠩",
          "⠀⢘",
          "⠀⡘",
          "⠀⠨",
          "⠀⢐",
          "⠀⡐",
          "⠀⠠",
          "⠀⢀",
          "⠀⡀"
        ],
        interval: 80,
      );

    case SlugStyle.line:
      return Spinner(
        frames: ["-", "\\", "|", "/"],
        interval: 130,
      );
    case SlugStyle.line2:
      return Spinner(
        frames: ["⠂", "-", "–", "—", "–", "-"],
        interval: 100,
      );
    case SlugStyle.pipe:
      return Spinner(
        frames: ["┤", "┘", "┴", "└", "├", "┌", "┬", "┐"],
        interval: 100,
      );
    case SlugStyle.simpleDots:
      return Spinner(
        frames: [".  ", ".. ", "...", "   "],
        interval: 400,
      );
    case SlugStyle.star:
      return Spinner(
        frames: ["✶", "✸", "✹", "✺", "✹", "✷"],
        interval: 70,
      );
    case SlugStyle.star2:
      return Spinner(
        frames: ["+", "x", "*"],
        interval: 100,
      );
    case SlugStyle.flip:
      return Spinner(
        frames: ["_", "_", "_", "-", "`", "`", "'", "´", "-", "_", "_", "_"],
        interval: 70,
      );
    case SlugStyle.hamburger:
      return Spinner(
        frames: ["☱", "☲", "☴"],
        interval: 100,
      );
    case SlugStyle.growVertical:
      return Spinner(
        frames: ["▁", "▃", "▄", "▅", "▆", "▇", "▆", "▅", "▄", "▃"],
        interval: 120,
      );
    case SlugStyle.growHorizontal:
      return Spinner(
        frames: ["▏", "▎", "▍", "▌", "▋", "▊", "▉", "▊", "▋", "▌", "▍", "▎"],
        interval: 120,
      );
    case SlugStyle.balloon:
      return Spinner(
        frames: [" ", ".", "o", "O", "@", "*", " "],
        interval: 140,
      );
    case SlugStyle.balloon2:
      return Spinner(
        frames: [".", "o", "O", "°", "O", "o", "."],
        interval: 140,
      );
    case SlugStyle.noise:
      return Spinner(
        frames: ["▓", "▒", "░"],
        interval: 100,
      );
    case SlugStyle.bounce:
      return Spinner(
        frames: ["⠁", "⠂", "⠄", "⠂"],
        interval: 120,
      );
    case SlugStyle.boxBounce:
      return Spinner(
        frames: ["▖", "▘", "▝", "▗"],
        interval: 120,
      );
    case SlugStyle.boxBounce2:
      return Spinner(
        frames: ["▌", "▀", "▐", "▄"],
        interval: 120,
      );
    case SlugStyle.triangle:
      return Spinner(
        frames: ["◢", "◣", "◤", "◥"],
        interval: 50,
      );
    case SlugStyle.arc:
      return Spinner(
        frames: ["◜", "◠", "◝", "◞", "◡", "◟"],
        interval: 100,
      );
    case SlugStyle.circle:
      return Spinner(
        frames: ["◡", "⊙", "◠"],
        interval: 120,
      );
    case SlugStyle.squareCorners:
      return Spinner(
        frames: ["◰", "◳", "◲", "◱"],
        interval: 180,
      );
    case SlugStyle.circleQuarters:
      return Spinner(
        frames: ["◴", "◷", "◶", "◵"],
        interval: 120,
      );
    case SlugStyle.circleHalves:
      return Spinner(
        frames: ["◐", "◓", "◑", "◒"],
        interval: 50,
      );
    case SlugStyle.squish:
      return Spinner(
        frames: ["╫", "╪"],
        interval: 120,
      );
    case SlugStyle.toggle:
      return Spinner(
        frames: ["⊶", "⊷"],
        interval: 250,
      );
    case SlugStyle.toggle2:
      return Spinner(
        frames: ["▫", "▪"],
        interval: 80,
      );
    case SlugStyle.toggle3:
      return Spinner(
        frames: ["□", "■"],
        interval: 120,
      );
    case SlugStyle.toggle4:
      return Spinner(
        frames: ["■", "□", "▪", "▫"],
        interval: 100,
      );
    case SlugStyle.toggle5:
      return Spinner(
        frames: ["▮", "▯"],
        interval: 100,
      );
    case SlugStyle.toggle6:
      return Spinner(
        frames: ["ဝ", "၀"],
        interval: 300,
      );
    case SlugStyle.toggle7:
      return Spinner(
        frames: ["⦾", "⦿"],
        interval: 80,
      );
    case SlugStyle.toggle8:
      return Spinner(
        frames: ["◍", "◌"],
        interval: 100,
      );
    case SlugStyle.toggle9:
      return Spinner(
        frames: ["◉", "◎"],
        interval: 100,
      );
    case SlugStyle.toggle10:
      return Spinner(
        frames: ["㊂", "㊀", "㊁"],
        interval: 100,
      );
    case SlugStyle.arrow:
      return Spinner(
        frames: ["←", "↖", "↑", "↗", "→", "↘", "↓", "↙"],
        interval: 100,
      );
    case SlugStyle.arrow2:
      return Spinner(
        frames: ["⬆️ ", "↗️ ", "➡️ ", "↘️ ", "⬇️ ", "↙️ ", "⬅️ ", "↖️ "],
        interval: 80,
      );
    case SlugStyle.arrow3:
      return Spinner(
        frames: ["▹▹▹▹▹", "▸▹▹▹▹", "▹▸▹▹▹", "▹▹▸▹▹", "▹▹▹▸▹", "▹▹▹▹▸"],
        interval: 100,
      );
    case SlugStyle.smiley:
      return Spinner(
        frames: ["😄 ", "😝 "],
        interval: 300,
      );
    case SlugStyle.monkey:
      return Spinner(
        frames: ["🙈 ", "🙈 ", "🙉 ", "🙊 "],
        interval: 200,
      );
    case SlugStyle.hearts:
      return Spinner(
        frames: ["💛 ", "💙 ", "💜 ", "💚 ", "❤️ "],
        interval: 100,
      );
    case SlugStyle.clock:
      return Spinner(
        frames: [
          "🕛 ",
          "🕐 ",
          "🕑 ",
          "🕒 ",
          "🕓 ",
          "🕔 ",
          "🕕 ",
          "🕖 ",
          "🕗 ",
          "🕘 ",
          "🕙 ",
          "🕚 "
        ],
        interval: 100,
      );
    case SlugStyle.earth:
      return Spinner(
        frames: ["🌍 ", "🌎 ", "🌏 "],
        interval: 100,
      );
    default:
      return Spinner(
        frames: ["⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"],
        interval: 80,
      );
  }
}
