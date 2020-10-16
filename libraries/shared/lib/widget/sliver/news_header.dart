import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:list_news/domain/entities/article_entity.dart';
import 'package:shared/common/common.dart';

class NewsHeader extends StatelessWidget {
  final ArticleEntity article;

  const NewsHeader({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            article.urlToImage == null
                ? Container(
                    child: Center(
                      child: Icon(Icons.error),
                    ),
                    height: 300.h,
                  )
                : Stack(
                    children: [
                      GestureDetector(
                        onTap: () => Modular.to.pushNamed(
                            Modular.get<NamedRoutes>().detailArticlePage,
                            arguments: article),
                        child: CachedNetworkImage(
                          height: 300.h,
                          width: double.infinity,
                          imageUrl: article.urlToImage,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => Container(
                            child: Center(child: CircularProgressIndicator()),
                            height: 300.h,
                          ),
                          errorWidget: (context, url, error) => Container(
                            child: Center(
                              child: Icon(Icons.error),
                            ),
                            height: 300.h,
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
            Spacer(),
            Divider(),
            Container(
              color: ThemeData().cardColor,
              padding: EdgeInsets.all(5),
              child: Text(article.title),
            ),
          ],
        ),
      ),
    );
  }
}
