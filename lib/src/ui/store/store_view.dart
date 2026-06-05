import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geniozinho/src/ui/app/coin_provider.dart';
import 'package:geniozinho/src/ui/app/theme_provider.dart';
import 'package:geniozinho/src/ui/resizer/fetch_pixels.dart';
import 'package:geniozinho/src/ui/common/common_app_bar.dart';
import 'package:geniozinho/src/ui/common/common_button.dart';

class StoreView extends StatefulWidget {
  @override
  _StoreViewState createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: FetchPixels.getPixelWidth(10),
                  vertical: FetchPixels.getPixelHeight(10)),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: Theme.of(context).textTheme.titleLarge?.color),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  SizedBox(width: FetchPixels.getPixelWidth(10)),
                  Text(
                    'Loja',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: FetchPixels.getPixelHeight(10)),
            _buildCoinHeader(context),
            SizedBox(height: FetchPixels.getPixelHeight(30)),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(20)),
                children: [
                  Text(
                    'Temas do Aplicativo',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: FetchPixels.getPixelHeight(10)),
                  _buildStoreItem(
                    context,
                    title: 'Tema Claro',
                    icon: Icons.light_mode,
                    price: 0, // Free
                    isBought: true,
                    onTap: () {
                      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                      if (themeMode == ThemeMode.dark) themeProvider.changeTheme();
                    },
                  ),
                  _buildStoreItem(
                    context,
                    title: 'Tema Escuro',
                    icon: Icons.dark_mode,
                    price: 0, // Free or make it cost coins? Let's make it 50 coins to showcase the logic
                    isBought: true, // We will treat Light/Dark as free since they are already features
                    onTap: () {
                      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                      if (themeMode == ThemeMode.light) themeProvider.changeTheme();
                    },
                  ),
                  SizedBox(height: FetchPixels.getPixelHeight(20)),
                  Text(
                    'Vantagens',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: FetchPixels.getPixelHeight(10)),
                  _buildStoreItem(
                    context,
                    title: '1x Pular Desafio',
                    icon: Icons.fast_forward,
                    price: 150,
                    isBought: false,
                    onTap: () async {
                      final coinProvider = Provider.of<CoinProvider>(context, listen: false);
                      bool success = await coinProvider.buyItem(150);
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Comprado com sucesso!')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Moedas insuficientes.')));
                      }
                    },
                  ),
                  _buildStoreItem(
                    context,
                    title: 'Dica Extra (Mostra 1 certa)',
                    icon: Icons.lightbulb,
                    price: 80,
                    isBought: false,
                    onTap: () async {
                      final coinProvider = Provider.of<CoinProvider>(context, listen: false);
                      bool success = await coinProvider.buyItem(80);
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Comprado com sucesso!')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Moedas insuficientes.')));
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoinHeader(BuildContext context) {
    return Consumer<CoinProvider>(
      builder: (context, coinProvider, child) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(20),
            vertical: FetchPixels.getPixelHeight(10),
          ),
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.2),
            borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(20)),
            border: Border.all(color: Colors.amber, width: 2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.monetization_on, color: Colors.amber, size: FetchPixels.getPixelHeight(30)),
              SizedBox(width: FetchPixels.getPixelWidth(10)),
              Text(
                '${coinProvider.coin}',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Colors.amber.shade700,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStoreItem(BuildContext context, {required String title, required IconData icon, required int price, required bool isBought, required VoidCallback onTap}) {
    return Container(
      margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(15)),
      padding: EdgeInsets.all(FetchPixels.getPixelHeight(15)),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
            radius: FetchPixels.getPixelHeight(25),
            child: Icon(icon, color: Theme.of(context).primaryColor, size: FetchPixels.getPixelHeight(30)),
          ),
          SizedBox(width: FetchPixels.getPixelWidth(15)),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isBought ? Colors.grey : Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(10)),
              ),
            ),
            onPressed: isBought ? null : onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!isBought) Icon(Icons.monetization_on, size: FetchPixels.getPixelHeight(16), color: Colors.white),
                if (!isBought) SizedBox(width: FetchPixels.getPixelWidth(5)),
                Text(
                  isBought ? 'EQUIPAR' : '$price',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
