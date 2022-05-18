import 'package:flutter/material.dart';

import 'models.dart';

class Content {
  final String name;
  final String imageUrl;
  final String? titleImageUrl;
  final String? videoUrl;
  final String? description;
  final Color? color;
  final double? rating;
  final List<ContentTag>? tags;

  const Content(
      {this.tags,
      required this.name,
      required this.imageUrl,
      this.titleImageUrl,
      this.videoUrl,
      this.description,
      this.color,
      this.rating});
}
