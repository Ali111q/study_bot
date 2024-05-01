import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import '../lib/command/command.dart' as commands;

void main(List<String> arguments) {
  Bot bot = Bot(
    token: '1415219808:AAGinp7uhtVG0AIkcdfG56ejozC9dwYKQQY',
    onReady: (p0) {
      p0.start(clean: true);
    },
  );

  bot.onUpdate(commands.start);
}
