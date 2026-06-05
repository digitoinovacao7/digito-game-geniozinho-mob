import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geniozinho/src/ui/resizer/fetch_pixels.dart';

class NicknameDialog extends StatefulWidget {
  final VoidCallback onNicknameSet;

  const NicknameDialog({Key? key, required this.onNicknameSet}) : super(key: key);

  @override
  _NicknameDialogState createState() => _NicknameDialogState();
}

class _NicknameDialogState extends State<NicknameDialog> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  Future<void> _saveNickname() async {
    final nickname = _controller.text.trim();
    if (nickname.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('player_nickname', nickname);

    setState(() {
      _isLoading = false;
    });

    widget.onNicknameSet();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(FetchPixels.getPixelHeight(20)),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            Text(
              "Como devemos te chamar?",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: FetchPixels.getPixelHeight(15)),
            Text(
              "Escolha um apelido para aparecer no Ranking Global!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: FetchPixels.getPixelHeight(20)),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Seu apelido...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Theme.of(context).cardColor,
              ),
              maxLength: 15,
            ),
            SizedBox(height: FetchPixels.getPixelHeight(20)),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: FetchPixels.getPixelHeight(15)),
                ),
                onPressed: _isLoading ? null : _saveNickname,
                child: _isLoading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      )
                    : Text(
                        "SALVAR",
                        style: TextStyle(
                          fontSize: FetchPixels.getPixelHeight(18),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
