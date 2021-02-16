import 'package:cryptic_currency/constants/Colors.dart';
import 'package:cryptic_currency/customWidgets/custom_text.dart';
import 'package:cryptic_currency/customWidgets/gradient_text.dart';
import 'package:cryptic_currency/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsWidget extends StatefulWidget {
  final List<NewsDataModel> news;
  final int index;

  const NewsWidget({Key key, this.news, this.index}) : super(key: key);
  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(height: 100),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(37, 38, 66, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: _width,
                  height: _height * 0.075,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 125,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blueAccent,
                                  Colors.deepPurpleAccent
                                ])),
                        child: Center(
                          child: CustomTextWidget(
                            size: 16,
                            content: 'Messari News',
                          ),
                        ),
                      ),
                      Container(
                        width: 0.75,
                        height: 30,
                        color: Colors.grey[500],
                      ),
                      CustomTextWidget(
                        size: 16,
                        content: 'News Stories',
                        color: Colors.amberAccent,
                      ),
                      CustomTextWidget(
                          size: 28, content: '${widget.news.length}'),
                    ],
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: KColors.bgColorOffet),
          width: _width,
          height: _height * 0.21,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.news.length,
              itemBuilder: (context, index) {
                final dateTime =
                    DateTime.parse('${widget.news[index].publishedAt}');

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                  child: GestureDetector(
                    onTap: () {
                      _launchUrl('${widget.news[index].url}');
                      print('${widget.news[index].url}');
                    },
                    child: Card(
                      color: KColors.bgColorOffet,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(28))),
                      child: Container(
                        width: _width,
                        height: _height * 0.25,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: ListTile(
                                subtitle: Text(
                                  'Author: ${widget.news[index].title}',
                                  style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                title: CustomTextWidget(
                                    color: Colors.amber,
                                    content:
                                        '${widget.news[index].author.name}',
                                    size: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 12),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CustomGradientText(
                                    primaryColor: Colors.blue,
                                    secondaryColor: Colors.white,
                                    content: '',
                                    size: 20),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16.0),
                              child: Align(
                                child: Text(
                                  '${Jiffy(dateTime).fromNow()}',
                                  style: GoogleFonts.cabin(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                alignment: Alignment.bottomRight,
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: true, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Couldnt not launch $url';
    }
  }
}
