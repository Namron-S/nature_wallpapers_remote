import 'package:flutter/material.dart';

class Photo {
  int id, width, height;
  String url, photographer, photographerUrl;
  int photographerId;
  bool isFavorite;
  Source src;

  bool operator ==(Object other) {
    // TODO: Implement comparison for equality in a right way!!!!!!
    if (other is Photo) {
      if (this.id == other.id)
        return true;
      else
        return false;
    } else
      return false;
  }

  Photo(
      {this.id,
      this.width,
      this.height,
      this.url,
      this.photographer,
      this.photographerUrl,
      this.photographerId,
      this.isFavorite = false,
      this.src});

  Map<String, dynamic> toJson() => {
        'id': id,
        'width': width,
        'height': height,
        'url': url,
        'photographer': photographer,
        'photographerUrl': photographerUrl,
        'photographerId': photographerId,
        'isFavorite': isFavorite,
        'src': src,
      };

  factory Photo.fromJson(Map<String, dynamic> jsonMap) {
    return Photo(
        id: jsonMap['id'],
        width: jsonMap['width'],
        height: jsonMap['height'],
        url: jsonMap['url'],
        photographer: jsonMap['photographer'],
        photographerUrl: jsonMap['photographer_url'],
        photographerId: jsonMap['photographer_id'],
        isFavorite: jsonMap['isFavorite'],
        src: Source.fromJson(jsonMap['src']));
  }
}

class Source {
  String original, large2x, large, medium, small, portrait, landscape, tiny;

  Source(
      {this.original,
      this.large2x,
      this.large,
      this.medium,
      this.small,
      this.portrait,
      this.landscape,
      this.tiny});

  Map<String, dynamic> toJson() => {
        'original': original,
        'large2x': large2x,
        'large': large,
        'medium': medium,
        'small': small,
        'portrait': portrait,
        'landscape': landscape,
        'tiny': tiny,
      };

  factory Source.fromJson(Map<String, dynamic> jsonMap) {
    return Source(
        original: jsonMap['original'],
        large2x: jsonMap['large2x'],
        large: jsonMap['large'],
        medium: jsonMap['medium'],
        small: jsonMap['small'],
        portrait: jsonMap['portrait'],
        landscape: jsonMap['landscape'],
        tiny: jsonMap['tiny']);
  }
}

class FavoriteList extends ChangeNotifier {
  List<Photo> photoList = [];

  void removeFavorite(Photo photo) {
    photoList.remove(photo);
    notifyListeners();
  }

  void addFavorite(Photo photo) {
    photoList.add(photo);
    notifyListeners();
  }
}
