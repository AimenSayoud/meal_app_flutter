import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_meal_app/provider/theme_provider.dart';
import 'package:flutter_meal_app/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class ThemeSettings extends StatefulWidget {
  static const routeName = '/theme';

  @override
  _ThemeSettingsState createState() => _ThemeSettingsState();
}

class _ThemeSettingsState extends State<ThemeSettings> {
  RadioListTile buildRadioListTile(
      ThemeMode themVal, String txt, IconData icon, BuildContext context) {
    return RadioListTile(
      value: themVal,
      secondary: Icon(
        icon,
        color: Theme.of(context).buttonColor,
      ),
      groupValue: Provider.of<ThemeProvider>(context).tm,
      onChanged: (newThemeVal) =>
          Provider.of<ThemeProvider>(context, listen: false)
              .themeModeChange(newThemeVal),
      title: Text(txt),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Theme"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Center(
              child: Text(
                'Adjust your themes selection',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    'Choose your theme mode :',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  buildRadioListTile(ThemeMode.system, 'System default Theme',
                      Icons.settings, context),
                  buildRadioListTile(ThemeMode.light, 'Light Theme',
                      Icons.wb_sunny_outlined, context),
                  buildRadioListTile(ThemeMode.dark, 'System Dark Theme',
                      Icons.nights_stay_outlined, context),
                  buildListTile(context, 'primary'),
                  buildListTile(context, 'accent'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(BuildContext context, String txt) {
    var primaryColor = Provider.of<ThemeProvider>(context).primaryColor;
    var accentColor = Provider.of<ThemeProvider>(context).accentColor;

    return ListTile(
      title: Text('choose your $txt Color'),
      trailing: CircleAvatar(
        backgroundColor: txt == 'primary' ? primaryColor : accentColor,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: Text('Choose your favorite color :'),
              titlePadding: EdgeInsets.all(5),
              contentPadding: EdgeInsets.all(0),
              content: SingleChildScrollView(
                child: ColorPicker(
                  onColorChanged: (Color value) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .onChanged(value, txt == 'primary' ? 1 : 2);
                  },
                  pickerColor: txt == 'primary' ? primaryColor : accentColor,
                  colorPickerWidth: 300,
                  enableAlpha: false,
                  displayThumbColor: true,
                  showLabel: false,
                  pickerAreaHeightPercent: 0.7,
                ),
              ),
              elevation: 4,
            );
          },
        );
      },
    );
  }
}
