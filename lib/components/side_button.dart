import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../helpers/design_system.dart';
import '../main.dart';

class SideButton extends HookWidget {
  const SideButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.selected,
  });

  final String text;
  final bool selected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final hovering = useState(false);
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        hitTestBehavior: HitTestBehavior.opaque,
        onEnter: (event) {
          hovering.value = true;
        },
        onExit: (event) => hovering.value = false,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          height: 36,
          width: selected ? 250 : 180,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 24),
          decoration: BoxDecoration(
            color: selected ? SotmColors.orange : const Color(0xff799177),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff536C5B),
            ),
          ),
        ),
      ),
    );
  }
}
