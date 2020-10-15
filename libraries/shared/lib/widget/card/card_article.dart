import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_news/domain/entities/article_entity.dart';

class CardArticle extends StatelessWidget {
  final ArticleEntity article;
  final Function onPressed;

  const CardArticle({Key key, @required this.article, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: article.urlToImage == null
            ? Container(
                width: 200.w,
                child: Center(child: Icon(Icons.error)),
              )
            : Hero(
                tag: article.urlToImage,
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage,
                  width: 200.w,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error)),
                ),
              ),
        title: Text(
          article.title ?? "",
        ),
        subtitle: Text(article.author ?? ""),
        onTap: onPressed,
      ),
    );
  }
}
