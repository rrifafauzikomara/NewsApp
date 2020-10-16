import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:list_news/domain/entities/article_entity.dart';
import 'package:shared/common/common.dart';

class NewsHeader extends StatelessWidget {
  final ArticleEntity article;

  const NewsHeader({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 3;
    var width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      expandedHeight: height,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            article.urlToImage == null
                ? Container(
                    child: Center(
                      child: Icon(Icons.error),
                    ),
                    height: height * 0.75,
                  )
                : Stack(
                    children: [
                      GestureDetector(
                        onTap: () => Modular.to.pushNamed(
                            Modular.get<NamedRoutes>().detailArticlePage,
                            arguments: article),
                        child: CachedNetworkImage(
                          height: height * 0.75,
                          width: width,
                          imageUrl: article.urlToImage,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => Container(
                            child: Center(child: CircularProgressIndicator()),
                            height: height * 0.75,
                          ),
                          errorWidget: (context, url, error) => Container(
                            child: Center(
                              child: Icon(Icons.error),
                            ),
                            height: height * 0.75,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ThemeData().cardColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          width: 150.w,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            Modular.get<LocaleKeys>().listNewsRelease.tr(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                    ],
                  ),
            Divider(height: height * 0.05),
            Container(
              color: ThemeData().cardColor,
              padding: EdgeInsets.all(5),
              height: height * 0.2,
              child: Text(article.title),
            ),
          ],
        ),
      ),
    );
  }
}
