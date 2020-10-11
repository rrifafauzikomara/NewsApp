import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_news/domain/entities/article_entity.dart';
import 'package:shared/widget/widget.dart';

class DetailNewsPage extends StatelessWidget {
  final Article article;

  const DetailNewsPage({@required this.article});

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          article.urlToImage == null
              ? Container(
                  height: 200.h,
                  child: Icon(Icons.error),
                )
              : Hero(
                  tag: article.urlToImage,
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Container(child: Icon(Icons.error)),
                  ),
                ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.description ?? "",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Divider(color: Colors.grey),
                Text(
                  article.title ?? "",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Divider(color: Colors.grey),
                Text(
                  'Date: ${article.publishedAt}',
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Author: ${article.author}',
                  style: Theme.of(context).textTheme.caption,
                ),
                Divider(color: Colors.grey),
                Text(
                  article.content ?? "",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 10.h),
                RaisedButton(
                  child: Text('Read more'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('News App', style: TextStyle(color: Colors.black)),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        middle: Text('News App', style: TextStyle(color: Colors.black)),
      ),
      child: _buildBody(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
