import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:shared/common/common.dart';

enum SmoothMode { Lottie, Network, Asset }

class ButtonConfig {
  final String dialogDone, dialogCancel;
  Color buttonCancelColor, buttonDoneColor, labelCancelColor, labelDoneColor;

  ButtonConfig(
      {this.dialogDone = 'Done',
      this.dialogCancel = 'Cancel',
      this.buttonCancelColor,
      this.buttonDoneColor}) {
    if (buttonCancelColor == null)
      buttonCancelColor = Modular.get<ColorPalettes>().lightPrimary;
    if (buttonDoneColor == null)
      buttonDoneColor = Modular.get<ColorPalettes>().darkAccent;
    if (labelCancelColor == null)
      labelCancelColor = Modular.get<ColorPalettes>().darkPrimary;
    if (labelDoneColor == null)
      labelDoneColor = Modular.get<ColorPalettes>().lightPrimary;
  }
}

class SmoothDialog {
  final String path;
  final String title;
  final String content;
  final double dialogHeight;
  final double imageHeight;
  final double imageWidth;
  final Function submit;
  final Function cancel;
  final BuildContext context;

  ButtonConfig buttonConfig;
  SmoothMode mode = SmoothMode.Lottie;

  SmoothDialog({
    Key key,
    @required this.context,
    @required this.path,
    @required this.title,
    @required this.content,
    @required this.submit,
    @required this.cancel,
    @required this.mode,
    this.buttonConfig,
    this.imageHeight = 150,
    this.imageWidth = 150,
    this.dialogHeight = 310,
  }) {
    if (buttonConfig == null) buttonConfig = ButtonConfig();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              contentPadding: EdgeInsets.fromLTRB(16, 24, 16, 8),
              content: Container(
                width: double.maxFinite,
                height: dialogHeight,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 16),
                    if (mode == SmoothMode.Lottie) ...[
                      Center(
                        child: Lottie.asset(
                          path,
                          width: imageWidth,
                          height: imageHeight,
                        ),
                      ),
                    ] else if (mode == SmoothMode.Asset) ...[
                      Center(
                        child: Image.asset(
                          path,
                          width: imageWidth,
                          height: imageHeight,
                        ),
                      ),
                    ] else ...[
                      Center(
                        child: CachedNetworkImage(
                          imageUrl: path,
                          width: imageWidth,
                          height: imageHeight,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      )
                    ],
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      content,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        cancel();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 22),
                                        decoration: BoxDecoration(
                                            color:
                                                buttonConfig.buttonCancelColor,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Text(
                                          "${buttonConfig.dialogCancel}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                buttonConfig.labelCancelColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        submit();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 26),
                                        decoration: BoxDecoration(
                                            color: buttonConfig.buttonDoneColor,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Text(
                                          "${buttonConfig.dialogDone}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: buttonConfig.labelDoneColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
