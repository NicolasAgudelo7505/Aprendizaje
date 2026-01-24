import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:gifs_app/config/theme/app_theme.dart';

final isDarkModeProvider =StateProvider<bool>((ref) => false,);

// listado de colores inmutable

final colorListProvider =Provider((ref) => colorList);

// un simple entero
final selectedColorProvider = StateProvider<int>((ref) => 2);




// un objeto de tipo AppTheme(custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref)=>ThemeNotifier(),
  );

// controller 
class ThemeNotifier extends StateNotifier <AppTheme> {
  // STATE =Estado =new AppTheme();
  ThemeNotifier(): super(AppTheme());


  void toggleDarkmode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode );
  }

  void changeColorIndex(int colorIndex){
    state=state.copyWith(selectedColor: colorIndex );
  }

}