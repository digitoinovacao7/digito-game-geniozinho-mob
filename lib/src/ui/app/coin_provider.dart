import 'package:flutter/material.dart';
import 'package:geniozinho/src/ui/app/game_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoinProvider with ChangeNotifier {
  int coin = 0;
  String keyCoin = 'KeyCoin';
  
  // Cache SharedPreferences instance for better performance
  SharedPreferences? _prefs;

  Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  getCoin() async {
    await _initPrefs();
    coin = _prefs!.getInt(keyCoin) ?? 0;
   debugPrint("coin===$coin");
    notifyListeners();
  }

  addCoin() async {
   debugPrint("coin===12 $coin");
    await _initPrefs();
    await _prefs!.setInt(keyCoin, (coin + rightCoin));
    coin = _prefs!.getInt(keyCoin) ?? 0;
    notifyListeners();
  }

  minusCoin({int? useCoin}) async {
    int i = (useCoin == null) ? wrongCoin : useCoin;
    await _initPrefs();
    final newCoin = ((coin - i) >= 0) ? (coin - i) : 0;
    await _prefs!.setInt(keyCoin, newCoin);
    coin = newCoin;
    notifyListeners();
  }
}
