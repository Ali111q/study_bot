import 'dart:async';

import 'package:dart_bot/api/country_api.dart';

import 'package:dart_bot/model/country.dart';
import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

import 'keyboard.dart';

Future<dynamic> start(Bot bot, Update update) async {
  ChatID chatId = ChatID(update.message?.chat.id);
  CountryApi countryApi = CountryApi();
  if (update.message != null) {
    String message = update.message!.text!;
    if (message == '/start') {
      Message myMessage = await bot.sendMessage(chatId, 'Loading...');
      List<Country> countries = await countryApi.getCountries() ?? [];
      print(countries);
      await bot.editMessageText('Welcome message', chatId, myMessage.messageId,
          replyMarkup: InlineKeyboardMarkup([
            [
              ...countries.map(
                (e) => InlineKeyboardButton.callbackData(
                    e.name!, 'country_${e.id}'),
              ),
            ],
          ]));
    }
  }

  if (update.callbackQuery != null) {
    switch (update.callbackQuery!.data!.split('_').first) {
      case 'country':
        await onCountry(bot, update.callbackQuery!.data!.split('_').last,
            update.callbackQuery!);
        await bot.answerCallbackQuery(update.callbackQuery!.id,
            text: 'Country selected!');
        break;
      case 'degree':
        await onDegree(bot, update.callbackQuery!.data!.split('_').last,
            update.callbackQuery!);
        await bot.answerCallbackQuery(update.callbackQuery!.id,
            text: 'degree selected!');
      default:
    }
  }
}
