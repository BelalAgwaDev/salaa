import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:salaa/presentation/resource/language_manger.dart';

import 'app/app.dart';

import 'app/di.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();

  initHomeModule();


  runApp(EasyLocalization(
      child:
      Phoenix(child:MyApp()),
      supportedLocales: const [arabicLocal, englishLocal],
      path: assestPathLocalisation));
}
