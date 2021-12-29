import 'dart:io';

import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';
import 'package:angel_hot/angel_hot.dart';

Future<void> main() async {
  var hot = HotReloader(createServer, [Directory('bin'), 'bin/main.dart']);
  await hot.startServer('127.0.0.1', 3000);
}

Future<Angel> createServer() async {
  var app = Angel();
  app.get('/', (req, res) => {res.write('get requested: Ahmad\'s Server')});
  app.fallback((req, res) => throw AngelHttpException.notFound());
  return app;
}
