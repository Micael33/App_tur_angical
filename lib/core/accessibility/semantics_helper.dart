import 'package:flutter/material.dart';

class SemanticsHelper {
  static Widget wrapWithSemantics({
    required Widget child,
    required String label,
    String? hint,
    bool isButton = false,
    bool isHeader = false,
    VoidCallback? onTap,
  }) {
    return Semantics(
      label: label,
      hint: hint,
      button: isButton,
      header: isHeader,
      excludeSemantics: true, // Wrap child and exclude its internal semantics if needed to provide a clean label
      onTap: onTap,
      child: child,
    );
  }
}

/// A button wrapper that ensures minimum touch target size (48x48)
class AcessibleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final String semanticsLabel;

  const AcessibleButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticsLabel,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
