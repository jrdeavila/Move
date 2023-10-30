import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {
  const AppRoundedButton({
    super.key,
    this.onTap,
    this.label,
    this.child,
    this.radius,
    this.height = 50.0,
    this.isBordered = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
  }) : assert(label != null || child != null);

  final VoidCallback? onTap;
  final String? label;
  final Widget? child;
  final double? radius;
  final double height;
  final bool isBordered;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: onTap,
      child: Ink(
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 25),
          color: isBordered ? null : Theme.of(context).colorScheme.primary,
          border: isBordered
              ? Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 3,
                )
              : null,
        ),
        child: Center(
          child: child ??
              Text(
                label!,
                style: TextStyle(
                  fontSize: 18,
                  color: isBordered
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
        ),
      ),
    );
  }
}

class AppOutlinedRoundedButton extends StatelessWidget {
  const AppOutlinedRoundedButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).colorScheme.background,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
