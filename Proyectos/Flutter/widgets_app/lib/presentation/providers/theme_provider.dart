import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:gifs_app/config/theme/app_theme.dart';

final isDarkModeProvider =StateProvider<bool>((ref) => false,);

// listado de colores inmutable

final colorListProvider =Provider((ref) => colorList);

// un simple entero
final selectedColorProvider = StateProvider<int>((ref) => 1);