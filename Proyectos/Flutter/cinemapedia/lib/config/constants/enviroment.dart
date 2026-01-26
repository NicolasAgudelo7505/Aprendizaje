import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
static String themovieDbKey=dotenv.env['THE_MOVIEDB_KEY'] ?? 'no hay API key';

}