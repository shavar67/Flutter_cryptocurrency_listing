import 'package:cryptic_currency/datasource/newsResult.dart';

class NewsDataModel {
  String id;
  String title;
  String content;
  List<References> references;
  Null referenceTitle;
  String publishedAt;
  Author author;
  List<String> tags;
  String url;

  NewsDataModel(
      {this.id,
      this.title,
      this.content,
      this.references,
      this.referenceTitle,
      this.publishedAt,
      this.author,
      this.tags,
      this.url});

  NewsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    if (json['references'] != null) {
      references = new List<References>();
      json['references'].forEach((v) {
        references.add(new References.fromJson(v));
      });
    }
    referenceTitle = json['reference_title'];
    publishedAt = json['published_at'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    tags = json['tags'].cast<String>();
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    if (this.references != null) {
      data['references'] = this.references.map((v) => v.toJson()).toList();
    }
    data['reference_title'] = this.referenceTitle;
    data['published_at'] = this.publishedAt;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['tags'] = this.tags;
    data['url'] = this.url;
    return data;
  }
}
