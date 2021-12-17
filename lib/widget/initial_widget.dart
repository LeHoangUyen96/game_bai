import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile_admin/widget/image_customized.dart';

class InitialWidget extends StatefulWidget {
  final Widget child;
  final String? titleAppBar;
  final bool? isShowBack;
  final Widget? iconBack;
  final bool? isCenterTitle;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final Color? backgroundAppBar;
  final Color? statusBarColor;
  final Widget? endWidget;
  final bool? isEnableSafeArea;
  final Brightness? statusBarIconBrightness;
  final Widget? bottomNavigationBar;
  final bool? isAdd;
  final Widget? iconAdd;
  final Color? titleAppBarColor;

  InitialWidget(
      {required this.child,
      this.floatingActionButton,
      this.titleAppBar,
      this.isShowBack,
      this.isCenterTitle,
      this.backgroundColor,
      this.backgroundAppBar,
      this.statusBarColor,
      this.endWidget,
      this.iconBack,
      this.bottomNavigationBar,
      this.isEnableSafeArea,
      this.statusBarIconBrightness,
      this.isAdd,
      this.iconAdd,
      this.titleAppBarColor});

  @override
  _InitialWidgetState createState() => _InitialWidgetState();
}

class _InitialWidgetState extends State<InitialWidget> {
  double _luminance = 0;
  bool _isDark = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.statusBarColor != null) {
      _luminance = widget.statusBarColor!.computeLuminance();
    } else if (widget.backgroundColor != null) {
      _luminance = widget.backgroundColor!.computeLuminance();
    } else {
      _luminance = 0.4;
    }
    setState(() {
      if (widget.backgroundAppBar == Colors.transparent) {
        _isDark = false;
        return;
      }
      if (_luminance > 0.5) {
        _isDark = false;
      } else {
        _isDark = true;
      }
    });
    // If no appbar, this is active. If app bar appear, it's not working!
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: widget.statusBarColor ?? Colors.transparent,
          statusBarIconBrightness: widget.statusBarIconBrightness != null
              ? widget.statusBarIconBrightness
              : _isDark
                  ? Brightness.dark
                  : Brightness.light),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(Get.context!).requestFocus(FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          floatingActionButton: widget.floatingActionButton,
          //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          backgroundColor: widget.backgroundColor ?? Colors.white,
          appBar: widget.titleAppBar != null ||
                  (widget.isShowBack != null && widget.isShowBack!)
              ? AppBar(
                  actions: [
                      widget.iconAdd ?? Container(),
                    ],
                  brightness: _isDark ? Brightness.dark : Brightness.light,
                  centerTitle: widget.isCenterTitle ?? true,
                  backgroundColor:
                      widget.backgroundAppBar ?? Theme.of(context).accentColor,
                  elevation:
                      widget.backgroundAppBar == Colors.transparent ? 0 : null,
                  leading: widget.isShowBack != null && widget.isShowBack!
                      ? InkWell(
                          onTap: () => Navigator.pop(context, 0),
                          child: widget.iconBack ??
                              TextButton(
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                  color: _isDark ? Colors.white : Colors.white,
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                        )
                      : Container(),
                  flexibleSpace: Container(
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                      image: new AssetImage(
                        'assets/images/bg_appbar.png',
                      ),
                      fit: BoxFit.cover,
                    )),
                    child: ImageCustomized(
                      path: "assets/images/retangle.png",
                      width: Get.width,
                      height: Get.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Container(
                      width: Get.width,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.titleAppBar != null
                                  ? widget.titleAppBar!
                                  : "",
                              style: TextStyle(
                                fontSize: 20,
                                color: _isDark
                                    ? widget.titleAppBarColor
                                    : Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ])))
              : null,
          bottomNavigationBar: widget.bottomNavigationBar,
          body: SafeArea(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
