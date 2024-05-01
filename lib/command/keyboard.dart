import 'package:dart_bot/api/degree_api.dart';
import 'package:dart_bot/api/field_api.dart';
import 'package:dart_bot/helper/database_helper.dart';
import 'package:dart_bot/model/degree.dart';
import 'package:dart_bot/model/field.dart';
import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

import 'package:dart_bot/model/user.dart' as myuser;

Future onCountry(Bot bot, String countryId, CallbackQuery message) async {
  DatabaseHelper databaseHelper = DatabaseHelper('sq.db');
  print(message.from.id);

  databaseHelper.insertUserIfNotExist(myuser.User(
      id: message.from.id, countryId: countryId, back: 'back_country'));
  print('object');
  DegreeApi degreeApi = DegreeApi();
  List<Degree> degrees = await degreeApi.getDegrees(countryId) ?? [];
  bot.editMessageText(
      'degrees available', ChatID(message.from.id), message.message!.messageId,
      replyMarkup: InlineKeyboardMarkup([
        [
          ...degrees.map((e) =>
              InlineKeyboardButton.callbackData(e.name!, 'degree_${e.id}'))
        ],
        [
          InlineKeyboardButton.callbackData('Back', 'back'),
        ]
      ]));
}

Future onDegree(Bot bot, String degreeId, CallbackQuery message) async {
  FieldApi fieldApi = FieldApi();
  List<Field> fields = await fieldApi.getDegrees(degreeId) ?? [];

  // You can also send the fields as a reply markup
  bot.sendDocument(
    ChatID(message.message!.chat.id),
    HttpFile.fromUrl(
        'https://live-par-2-abr.livepush.io/vod/bigbuckbunnyclip.mp4'),
    protectContent: true,
    replyMarkup: InlineKeyboardMarkup([
      [
        ...fields.map(
            (e) => InlineKeyboardButton.callbackData(e.name!, 'field_${e.id}'))
      ],
      [
        InlineKeyboardButton.callbackData('Back', 'back'),
      ]
    ]),
  );
}
