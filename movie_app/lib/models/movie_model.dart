// To parse this JSON data, do
//
//     final movieModel = movieModelFromMap(jsonString);

import 'dart:convert';

class MovieModel {
  MovieModel({
    this.data,
  });

  Data? data;

  factory MovieModel.fromJson(String str) =>
      MovieModel.fromMap(json.decode(str));

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
        data: Data.fromMap(json["data"]),
      );
}

class Data {
  Data({
    this.posts,
  });

  List<Post>? posts;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromMap(x))),
      );
}

class Post {
  Post({
    this.id,
    this.url,
    this.title,
    this.images,
    this.sourceDomain,
  });

  String? id;
  String? url;
  String? title;
  Images? images;
  String? sourceDomain;

  factory Post.fromJson(String str) => Post.fromMap(json.decode(str));

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json["id"],
        url: json["url"],
        title: json["title"],
        images: Images.fromMap(json["images"]),
        sourceDomain: json["sourceDomain"],
      );
}

class Images {
  Images({
    this.image700,
    this.image460,
    this.imageFbThumbnail,
    this.image460Sv,
  });

  Image? image700;
  Image? image460;
  Image? imageFbThumbnail;
  Image460Sv? image460Sv;

  factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

  factory Images.fromMap(Map<String, dynamic> json) => Images(
        image700: Image.fromMap(json["image700"]),
        image460: Image.fromMap(json["image460"]),
        imageFbThumbnail: Image.fromMap(json["imageFbThumbnail"]),
        image460Sv:json["image460sv"] ==null ? null: Image460Sv.fromMap(json["image460sv"]),
      );
}

class Image {
  Image({
    this.width,
    this.height,
    this.url,
    this.webpUrl,
  });

  int? width;
  int? height;
  String? url;
  String? webpUrl;

  factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        webpUrl: json["webpUrl"] == null ? null : json["webpUrl"],
      );

  Map<String, dynamic> toMap() => {
        "width": width,
        "height": height,
        "url": url,
        "webpUrl": webpUrl == null ? null : webpUrl,
      };
}

class Image460Sv {
  Image460Sv({
    this.width,
    this.height,
    this.url,
    this.hasAudio,
    this.duration,
    this.vp8Url,
    this.h265Url,
    this.vp9Url,
  });

  int? width;
  int? height;
  String? url;
  int? hasAudio;
  int? duration;
  String? vp8Url;
  String? h265Url;
  String? vp9Url;

  factory Image460Sv.fromJson(String str) =>
      Image460Sv.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image460Sv.fromMap(Map<String, dynamic> json) => Image460Sv(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        hasAudio: json["hasAudio"],
        duration: json["duration"],
        vp8Url: json["vp8Url"],
        h265Url: json["h265Url"],
        vp9Url: json["vp9Url"],
      );

  Map<String, dynamic> toMap() => {
        "width": width,
        "height": height,
        "url": url,
        "hasAudio": hasAudio,
        "duration": duration,
        "vp8Url": vp8Url,
        "h265Url": h265Url,
        "vp9Url": vp9Url,
      };
}
