import 'package:flutter/material.dart';

import '../../common/overlays/custom_alert.dart';

class OverlayHelper {
  OverlayEntry? _entry;

  bool get isOpen => _entry != null;

  void hide() {
    _entry?.remove();
    _entry = null;
  }

  void show({
    required BuildContext context,
    required Widget child,
    Color? outsideColor,
    void Function()? onTapOutside,
    bool tapOutside = true,
  }) {
    if (_entry != null) {
      _entry?.remove();
      _entry = null;
    }

    _entry = OverlayEntry(
      builder: (context) => Navigator(
        onGenerateRoute: (_) => MaterialPageRoute(
          builder: (_) => Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                KAlert(
                  outsideColor: outsideColor,
                  onTapOutside: onTapOutside ?? (tapOutside ? () => hide() : null),
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_entry!);
  }
}
