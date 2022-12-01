import 'package:flutter/material.dart';
import 'package:tarot/app_module.dart';
import 'package:tarot/models/text_size.dart';

class SettingsRadioTile extends StatelessWidget {
  SettingsRadioTile({
    required this.onChanged,
    required this.textSize,
  });
  final _settingsRepository = provideSettings();
  final TextSize textSize;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _settingsRepository.textSize.set(textSize);
        onChanged();
      },
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<TextSize>(
                stream: _settingsRepository.textSize.stream,
                builder: (_, snapshot) {
                  final size = snapshot.data;
                  if (size != null)
                    return Image.asset(
                      size.equals(textSize)
                          ? 'assets/images/settings_icons/radio_on.png'
                          : 'assets/images/settings_icons/radio_off.png',
                      width: 20.0,
                      height: 20.0,
                    );
                  return SizedBox.shrink();
                },
              ),
            ),
            Text(
              textSize.size,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
