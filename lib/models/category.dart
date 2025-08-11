import 'package:flutter/widgets.dart';

class Category {
  final String icon;
  final String title;
  final Color color;

  Category({
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  String toString() => 'Category(icon: $icon, title: $title, color: $color)';

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) {
      return true;
    }

    return other.icon == icon && other.title == title && other.color == color;
  }

  @override
  int get hashCode => icon.hashCode ^ title.hashCode ^ color.hashCode;
}
