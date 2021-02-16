import 'package:cryptic_currency/model/news_model.dart';

class NewsResultModel {
  Status status;
  List<NewsDataModel> data;

  NewsResultModel({this.status, this.data});

  NewsResultModel.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = new List<NewsDataModel>();
      json['data'].forEach((v) {
        data.add(new NewsDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  int elapsed;
  String timestamp;

  Status({this.elapsed, this.timestamp});

  Status.fromJson(Map<String, dynamic> json) {
    elapsed = json['elapsed'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['elapsed'] = this.elapsed;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class References {
  String name;
  String url;

  References({this.name, this.url});

  References.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Author {
  String name;

  Author({this.name});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
