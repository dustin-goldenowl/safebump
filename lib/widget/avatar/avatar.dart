import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/string_utils.dart';

enum ImageType { none, network, assest, file }

class XAvatar extends StatefulWidget {
  final String? url;
  final String? firstName;
  final String? lastName;
  final ImageType imageType;
  final bool isEditable;
  final VoidCallback? onEdit;
  final TextStyle? textStyle;
  final double? borderWidth;
  final double? imageSize;
  const XAvatar({
    Key? key,
    this.url,
    this.firstName,
    this.lastName,
    this.isEditable = false,
    this.onEdit,
    this.imageType = ImageType.network,
    this.textStyle,
    this.borderWidth,
    this.imageSize,
  }) : super(key: key);

  @override
  State<XAvatar> createState() => _XAvatarState();
}

class _XAvatarState extends State<XAvatar> {
  ImageType _imageType = ImageType.none;

  @override
  void initState() {
    _imageType = widget.imageType;
    super.initState();
  }

  bool isValidUrl(String? url) {
    if (url?.isEmpty ?? true) {
      return false;
    }
    return true;
  }

  String getNameAvatar(String? firstName, String? lastName) {
    String firstCharFirstName = '';
    String firstCharLastName = '';
    if (firstName != null && firstName != '') {
      firstCharFirstName = firstName[0];
    }
    if (lastName != null && lastName != '') {
      firstCharLastName = lastName[0];
    }
    return '$firstCharFirstName$firstCharLastName'.toUpperCase();
  }

  Widget _renderImage(ImageType type, String? url) {
    if (StringUtils.isNullOrEmpty(url)) {
      return _renderDefaultImage();
    }
    switch (type) {
      case ImageType.file:
        return _renderFileAvatar(url!);
      case ImageType.network:
        return _renderNetworkAvatar(url);
      default:
        return _renderDefaultImage();
    }
  }

  Widget _renderDefaultImage() {
    return Container(
        width: widget.imageSize ?? AppSize.s70,
        height: widget.imageSize ?? AppSize.s70,
        decoration: BoxDecoration(
          color: AppColors.subPrimary,
          image: null,
          borderRadius: BorderRadius.all(
            Radius.circular((widget.imageSize ?? AppSize.s70) / 2),
          ),
          border: Border.all(
            color: AppColors.primary,
            width: widget.borderWidth ?? AppSize.s4,
          ),
        ),
        child: Center(
          child: Text(
            getNameAvatar(widget.firstName, widget.lastName),
            style: widget.textStyle ??
                TextStyle(
                  fontFamily: FontFamily.productSans,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: (widget.imageSize ?? AppSize.s70) / 2.5,
                ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isValidUrl(widget.url)
            ? _renderImage(_imageType, widget.url)
            : _renderImage(ImageType.none, widget.url),
        widget.isEditable
            ? Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    widget.onEdit?.call();
                  },
                  icon: Assets.svg.icEdit.svg(),
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.only(
                    left: AppPadding.p10,
                    top: AppPadding.p10,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: AppSize.s20,
                    minHeight: AppSize.s20,
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _renderFileAvatar(String url) {
    return Container(
      width: widget.imageSize ?? AppSize.s70,
      height: widget.imageSize ?? AppSize.s70,
      decoration: BoxDecoration(
        color: AppColors.subPrimary,
        image: DecorationImage(
          image: FileImage(File(url)),
          fit: BoxFit.cover,
          onError: (exception, stackTrace) async {
            await Future.delayed(const Duration(milliseconds: 500));
            setState(() {
              _imageType = ImageType.none;
            });
          },
        ),
        borderRadius: BorderRadius.all(
          Radius.circular((widget.imageSize ?? AppSize.s70) / 2),
        ),
        border: Border.all(
          color: AppColors.primary,
          width: widget.borderWidth ?? AppSize.s4,
        ),
      ),
      child: null,
    );
  }

  Widget _renderNetworkAvatar(String? url) {
    return SizedBox(
      width: widget.imageSize ?? AppSize.s70,
      height: widget.imageSize ?? AppSize.s70,
      child: CachedNetworkImage(
        imageUrl: url ?? '',
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.subPrimary,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular((widget.imageSize ?? AppSize.s70) / 2),
              ),
              border: Border.all(
                color: AppColors.primary,
                width: widget.borderWidth ?? AppSize.s4,
              ),
            ),
          );
        },
        placeholder: (context, url) {
          return _renderDefaultImage();
        },
        errorWidget: (context, url, error) {
          return _renderDefaultImage();
        },
      ),
    );
  }
}
