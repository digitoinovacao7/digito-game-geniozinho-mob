import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/app_assets.dart';
import '../core/app_constant.dart';
import '../ui/app/theme_provider.dart';
import '../ui/common/common_alert_dialog.dart';
import '../ui/common/rate_dialog_view.dart';
import '../utility/constants.dart';
import 'model/gradient_model.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Future<Map<String, bool>>? _settingsFuture;

  @override
  void initState() {
    super.initState();
    _settingsFuture = _loadInitialSettings();
  }

  Future<Map<String, bool>> _loadInitialSettings() async {
    final sound = await getSound();
    final vibration = await getVibration();
    final isDarkMode = themeMode == ThemeMode.dark;
    return {
      'sound': sound,
      'vibration': vibration,
      'darkMode': isDarkMode,
    };
  }

  void backClicks() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Theme.of(context).textTheme.bodyLarge?.color),
          onPressed: backClicks,
        ),
        title: Text(
          'Configurações',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, bool>>(
        future: _settingsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Erro ao carregar configurações"));
          } else if (snapshot.hasData) {
            return buildSettingsList(context, snapshot.data!);
          } else {
            return const Center(child: Text("Nenhuma configuração encontrada."));
          }
        },
      ),
    );
  }

  Widget buildSettingsList(BuildContext context, Map<String, bool> settings) {
    final soundOn = ValueNotifier(settings['sound']!);
    final vibrateOn = ValueNotifier(settings['vibration']!);
    final darkMode = ValueNotifier(settings['darkMode']!);

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: [
        _buildSectionTitle(context, "Geral"),
        _buildSwitchTile(
          context: context,
          title: "Som",
          icon: Icons.volume_up_outlined,
          notifier: soundOn,
          onToggle: (val) {
            soundOn.value = val;
            setSound(val);
          },
        ),
        _buildSwitchTile(
          context: context,
          title: "Vibração",
          icon: Icons.vibration_outlined,
          notifier: vibrateOn,
          onToggle: (val) {
            vibrateOn.value = val;
            setVibration(val);
          },
        ),
        const SizedBox(height: 16),
        _buildSectionTitle(context, "Aparência"),
        _buildSwitchTile(
          context: context,
          title: "Modo Escuro",
          icon: Icons.brightness_4_outlined,
          notifier: darkMode,
          onToggle: (val) {
            context.read<ThemeProvider>().changeTheme();
            darkMode.value = val;
          },
        ),
        const SizedBox(height: 16),
        _buildSectionTitle(context, "Outros"),
        _buildNavigationTile(context, "Compartilhar", Icons.share_outlined, () => share()),
        _buildNavigationTile(context, "Avalie-nos", Icons.star_outline, () => _showRateDialog()),
        _buildNavigationTile(context, "Feedback", Icons.feedback_outlined, () => _showFeedbackDialog()),
        _buildNavigationTile(context, "Política de Privacidade", Icons.privacy_tip_outlined, () => _launchURL()),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 16.0, right: 16.0),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).hintColor,
            ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required BuildContext context,
    required String title,
    required IconData icon,
    required ValueNotifier<bool> notifier,
    required Function(bool) onToggle,
  }) {
    return ValueListenableBuilder<bool>(
      valueListenable: notifier,
      builder: (context, value, child) {
        return InkWell(
          onTap: () => onToggle(!value),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 24),
                Expanded(
                  child: Text(title, style: Theme.of(context).textTheme.titleMedium),
                ),
                const SizedBox(width: 16),
                FlutterSwitch(
                  value: value,
                  inactiveColor: Theme.of(context).colorScheme.surfaceVariant,
                  activeColor: Theme.of(context).colorScheme.primary,
                  width: 50.0,
                  height: 30.0,
                  toggleSize: 25.0,
                  padding: 2.0,
                  onToggle: onToggle,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavigationTile(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  void _showRateDialog() {
    GradientModel model = GradientModel()..primaryColor = KeyUtil.primaryColor1;
    showDialog(
      context: context,
      builder: (newContext) => CommonAlertDialog(
        child: RateViewDialog(colorTuple: Tuple2(model, 0)),
      ),
      barrierDismissible: false,
    );
  }

  void _showFeedbackDialog() {
    _showRateDialog();
  }

  void _launchURL() async {
    if (!await launchUrl(Uri.parse(privacyURL))) {
      throw 'Não foi possível iniciar $privacyURL';
    }
  }

  void share() async {
    await Share.share(getAppLink(), subject: 'Gêniozinho');
  }
}
