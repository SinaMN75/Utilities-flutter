part of 'components.dart';

Widget image(
  final String source, {
  final FileData? fileData,
  final Color? color,
  final double? width,
  final double? height,
  final double? size,
  final BoxFit fit = BoxFit.contain,
  final Clip clipBehavior = Clip.hardEdge,
  final double borderRadius = 1,
  final EdgeInsets margin = EdgeInsets.zero,
  final String? placeholder,
  final ProgressIndicatorBuilder? progressIndicatorBuilder,
  final VoidCallback? onTap,
}) {
  if (fileData != null) {
    if (isWeb)
      return imageMemory(
        fileData.bytes!,
        width: size ?? width,
        height: size ?? height,
        borderRadius: borderRadius,
        color: color,
        margin: margin,
        onTap: onTap,
        fit: fit,
        clipBehavior: clipBehavior,
      );
    else
      return imageFile(
        File(fileData.path!),
        width: size ?? width,
        height: size ?? height,
        borderRadius: borderRadius,
        color: color,
        margin: margin,
        onTap: onTap,
        fit: fit,
        clipBehavior: clipBehavior,
      );
  }
  if (source.length <= 10) {
    if (placeholder == null)
      return SizedBox(width: width, height: height);
    else
      return imageAsset(
        placeholder,
        width: size ?? width,
        height: size ?? height,
        borderRadius: borderRadius,
        color: color,
        margin: margin,
        onTap: onTap,
        fit: fit,
        clipBehavior: clipBehavior,
      );
  } else {
    if (source.startsWith("http"))
      return imageNetwork(
        source,
        width: size ?? width,
        height: size ?? height,
        fit: fit,
        clipBehavior: clipBehavior,
        margin: margin,
        borderRadius: borderRadius,
        color: color,
        onTap: onTap,
        progressIndicatorBuilder: progressIndicatorBuilder,
        placeholder: placeholder,
      );
    else if (source.startsWith("http") && source.endsWith(".json"))
      return lottie.Lottie.network(source, width: width, height: height, fit: fit, repeat: true);
    else if (source.endsWith(".json"))
      return lottie.Lottie.asset(source, width: width, height: height, fit: fit, repeat: true);
    else
      return imageAsset(
        source,
        width: size ?? width,
        height: size ?? height,
        fit: fit,
        clipBehavior: clipBehavior,
        margin: margin,
        borderRadius: borderRadius,
        color: color,
        onTap: onTap,
      );
  }
}

Widget iconPrimary(
  final String source, {
  final Color? color,
  final double? width,
  final double? height,
  final BoxFit fit = BoxFit.contain,
  final Clip clipBehavior = Clip.hardEdge,
  final double borderRadius = 1,
  final EdgeInsets margin = EdgeInsets.zero,
  final String? placeholder,
  final ProgressIndicatorBuilder? progressIndicatorBuilder,
  final VoidCallback? onTap,
}) =>
    image(
      source,
      color: color ?? colorScheme.primary,
      width: width,
      height: height,
      fit: fit,
      clipBehavior: clipBehavior,
      borderRadius: borderRadius,
      margin: margin,
      placeholder: placeholder,
      progressIndicatorBuilder: progressIndicatorBuilder,
      onTap: onTap,
    );

Widget imageAsset(
  final String asset, {
  final Color? color,
  final double? width,
  final double? height,
  final BoxFit fit = BoxFit.contain,
  final Clip clipBehavior = Clip.hardEdge,
  final double borderRadius = 1,
  final EdgeInsets margin = EdgeInsets.zero,
  final VoidCallback? onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
        margin: margin,
        width: width,
        height: height,
        child: asset.substring(asset.length - 3).toLowerCase() == "svg"
            ? SvgPicture.asset(
                asset,
                width: width,
                height: height,
                color: color,
                fit: fit,
                clipBehavior: clipBehavior,
              )
            : Image.asset(asset, color: color, width: width, height: height, fit: fit),
      ),
    );

Widget imageNetwork(
  final String url, {
  final Color? color,
  final double? width,
  final double? height,
  final BoxFit fit = BoxFit.contain,
  final Clip clipBehavior = Clip.hardEdge,
  final double borderRadius = 1,
  final EdgeInsets margin = EdgeInsets.zero,
  final VoidCallback? onTap,
  final String? placeholder,
  final ProgressIndicatorBuilder? progressIndicatorBuilder,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
        margin: margin,
        width: width,
        height: height,
        child: url.length <= 10
            ? placeholder == null
                ? const SizedBox()
                : imageAsset(
                    placeholder,
                    width: width,
                    height: height,
                    color: color,
                    fit: fit,
                    clipBehavior: clipBehavior,
                  )
            : url.substring(url.length - 3) == "svg"
                ? SvgPicture.network(
                    url,
                    width: width,
                    height: height,
                    color: color,
                    fit: fit,
                    placeholderBuilder: placeholder == null
                        ? null
                        : (final _) => imageAsset(
                              placeholder,
                              width: width,
                              height: height,
                              fit: fit,
                              clipBehavior: clipBehavior,
                            ),
                  )
                : CachedNetworkImage(
                    imageUrl: url,
                    color: color,
                    width: width,
                    height: height,
                    fit: fit,
                    progressIndicatorBuilder: progressIndicatorBuilder,
                    errorWidget: placeholder == null
                        ? null
                        : (final _, final __, final ___) => image(
                              placeholder,
                              color: color,
                              width: width,
                              height: height,
                              fit: fit,
                              clipBehavior: clipBehavior,
                            ),
                    placeholder: placeholder == null
                        ? null
                        : (final _, final __) => image(
                              placeholder,
                              color: color,
                              width: width,
                              height: height,
                              fit: fit,
                              clipBehavior: clipBehavior,
                            ),
                  ),
      ),
    );

Widget imageFile(
  final File file, {
  final Color? color,
  final double? width,
  final double? height,
  final BoxFit fit = BoxFit.contain,
  final Clip clipBehavior = Clip.hardEdge,
  final double borderRadius = 1,
  final EdgeInsets margin = EdgeInsets.zero,
  final VoidCallback? onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
        margin: margin,
        width: width,
        height: height,
        child: Image.file(file, color: color, width: width, height: height, fit: fit),
      ),
    );

Widget imageMemory(
  final Uint8List file, {
  final Color? color,
  final double? width,
  final double? height,
  final BoxFit fit = BoxFit.contain,
  final Clip clipBehavior = Clip.hardEdge,
  final double borderRadius = 1,
  final EdgeInsets margin = EdgeInsets.zero,
  final VoidCallback? onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
        margin: margin,
        width: width,
        height: height,
        child: Image.memory(file, color: color, width: width, height: height, fit: fit),
      ),
    );
