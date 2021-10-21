import 'dart:io';
import 'package:viet_trung_mobile/data/network/network_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

enum _ResourceLocationType { NETWORK_FILE, LOCAL_FILE, ASSET_FILE }
enum _ResourceType { NORMAL_IMAGE, SVG_IMAGE }

class ImageCustomized extends StatelessWidget {
  final String? path;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final double? radius;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String? package;
  final File? file;

  ImageCustomized({
    this.path,
    this.file,
    this.width = 20,
    this.height,
    this.fit,
    this.color,
    this.backgroundColor,
    this.margin,
    this.padding,
    this.package,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    switch (file) {
      /*
      * File is null, return image widget or svg widget
      * */
      case null:
        // print('OK ${this.path}');
        final imageUrl = makeURLTrue(this.path);
        // print('OK imageUrl ${imageUrl}');
        final resourceTypeLocation = getResourceTypeLocationOfImageURL(imageUrl);
        // print('OK resourceTypeLocation ${resourceTypeLocation}');
        switch (resourceTypeLocation) {
          /*
          * Return network image widget or svg network
          * */
          case _ResourceLocationType.NETWORK_FILE:
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 0),
                color: backgroundColor ?? Colors.transparent,
              ),
              margin: margin ?? EdgeInsets.all(0),
              padding: padding ?? EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius ?? 0),
                child: onBuildNetworkImage(
                  context,
                  resourceTypeLocation,
                  imageUrl,
                  width: width,
                  height: height,
                  fit: fit,
                ),
              ),
            );
          default:
            /*
          * Return image local widget or svg local
          * */
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 0),
                color: backgroundColor ?? Colors.transparent,
              ),
              margin: margin ?? EdgeInsets.all(0),
              padding: padding ?? EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius ?? 0),
                child: onBuildLocalImage(
                  resourceTypeLocation,
                  imageUrl,
                  width: width,
                  height: height,
                  fit: fit,
                ),
              ),
            );
        }
      default:
        /*
        * If file not nul, return Image.File widget
        * */
        return Image.file(
          file!,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          color: color,
        );
    }
  }

  Widget onBuildLocalImage(_ResourceLocationType resourceTypeLocation, String imageUrl, {double? width, double? height, BoxFit? fit}) {
    final resourceType = getResourceTypeOfImage(imageUrl);
    // print('onBuildLocalImage $resourceTypeLocation $resourceType $imageUrl');
    switch (imageUrl) {
      case '':
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade200,
          ),
          child: Icon(
            Icons.error_outline_rounded,
            color: Colors.red,
          ),
        );
      // break;
      default:
        switch (resourceType) {
          case _ResourceType.SVG_IMAGE:
            return SvgPicture.asset(
              imageUrl,
              width: width,
              height: height,
              fit: fit ?? BoxFit.contain,
              color: color,
              package: package ?? null,
            );
          default:
            return Image.asset(
              imageUrl,
              width: width,
              height: height,
              fit: fit ?? BoxFit.contain,
              color: color,
              package: package ?? null,
            );
        }
    }
  }

  Widget onBuildNetworkImage(BuildContext context, _ResourceLocationType resourceTypeLocation, String imageUrl, {double? width, double? height, BoxFit? fit}) {
    final resourceType = getResourceTypeOfImage(imageUrl);
    // print('onBuildNetworkImage $resourceTypeLocation $resourceType $url');
    return Container(
      width: width,
      height: height,
      child: resourceType == _ResourceType.NORMAL_IMAGE
          ? CachedNetworkImage(
              imageUrl: imageUrl,
              width: width,
              height: height,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: fit ?? BoxFit.contain,
                  ),
                ),
              ),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade400,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: width,
                  height: height,
                  color: Colors.grey,
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )
          : SvgPicture.network(
              imageUrl,
              // 'https://raw.githubusercontent.com/dnfield/flutter_svg/7d374d7107561cbd906d7c0ca26fef02cc01e7c8/example/assets/flutter_logo.svg',
              placeholderBuilder: (BuildContext context) => Shimmer.fromColors(
                baseColor: Colors.grey.shade400,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: width,
                  height: height,
                  color: Colors.grey,
                ),
              ),
            ),
    );
  }

  // Future<bool> cacheImage(String url, BuildContext context) async {
  //   bool hasNoError = true;
  //   var output = Completer<bool>();
  //   precacheImage(
  //     NetworkImage(url),
  //     context,
  //     onError: (e, stackTrace) => hasNoError = false,
  //   ).then((_) => output.complete(hasNoError));
  //   return output.future;
  // }

  String makeURLTrue(String? imageUrl) {
    if(imageUrl == null ) return "";
    if(imageUrl == "null" ) imageUrl = "assets/images/no-images.png";
    // print('imageUrl $imageUrl ${imageUrl.runtimeType} ${imageUrl.length}');

    if (imageUrl.indexOf('assets') == 0) {
      return imageUrl;
    } else if (imageUrl.indexOf('//') == 0) {
      return 'https:' + imageUrl;
    } else if (imageUrl != '' && imageUrl.indexOf('http') < 0) {
      return NetworkConfig.URL_SERVER_BASE_CDN + imageUrl;
    }
    return imageUrl;
  }

  _ResourceLocationType getResourceTypeLocationOfImageURL(String? imageUrl) {
    if (imageUrl == '' || imageUrl!.indexOf('assets') == 0) {
      return _ResourceLocationType.ASSET_FILE;
    } else if (imageUrl.indexOf('http') == 0) {
      return _ResourceLocationType.NETWORK_FILE;
    }
    return _ResourceLocationType.LOCAL_FILE;
  }

  _ResourceType getResourceTypeOfImage(String? imageUrl) {
    if (imageUrl!.indexOf('.svg') == (imageUrl.length - 4)) {
      return _ResourceType.SVG_IMAGE;
    }
    return _ResourceType.NORMAL_IMAGE;
  }
}
