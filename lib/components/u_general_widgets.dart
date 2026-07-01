import "package:u/utilities.dart";

class UListTile extends StatelessWidget {
  const UListTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.color,
    this.textColor,
    this.subtitle,
    super.key,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final Color? color;
  final Color? textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => UPressable(
    onTap: onTap,
    child: Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        leading: UIconBackground(icon, color: color ?? Theme.of(context).colorScheme.primary),
        title: UTextBodyMedium(title, color: textColor, fontWeight: FontWeight.bold),
        subtitle: subtitle == null ? null : UTextLabelSmall(subtitle!, color: textColor?.withValues(alpha: 0.6)),
        trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).disabledColor, size: 16),
      ),
    ),
  );
}

class UIconBackground extends StatelessWidget {
  const UIconBackground(
    this.icon, {
    required this.color,
    this.size = 42,
    super.key,
  });

  final IconData icon;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => UContainer(
    width: size,
    height: size,
    alignment: Alignment.center,
    color: color.withValues(alpha: 0.2),
    radius: 12,
    child: Icon(icon, color: color, size: size / 1.8),
  );
}
