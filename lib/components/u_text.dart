import "package:flutter/material.dart";

class UTextDisplayLarge extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsLabel;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextLeadingDistribution? leadingDistribution;
  final bool selectable;

  const UTextDisplayLarge(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.textBaseline,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsLabel,
    this.shadows,
    this.foreground,
    this.background,
    this.textDirection,
    this.style,
    this.leadingDistribution,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        style: Theme.of(context).textTheme.displayLarge!
            .copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: height,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              textBaseline: textBaseline,
              shadows: shadows,
              foreground: foreground,
              background: background,
              leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
            )
            .merge(style),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      style: Theme.of(context).textTheme.displayLarge!
          .copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            shadows: shadows,
            foreground: foreground,
            background: background,
            leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
          )
          .merge(style),
    );
  }
}

class UTextDisplayMedium extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsLabel;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextLeadingDistribution? leadingDistribution;
  final bool selectable;

  const UTextDisplayMedium(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.textBaseline,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsLabel,
    this.shadows,
    this.foreground,
    this.background,
    this.textDirection,
    this.style,
    this.leadingDistribution,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        style: Theme.of(context).textTheme.displayMedium!
            .copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: height,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              textBaseline: textBaseline,
              shadows: shadows,
              foreground: foreground,
              background: background,
              leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
            )
            .merge(style),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      style: Theme.of(context).textTheme.displayMedium!
          .copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            shadows: shadows,
            foreground: foreground,
            background: background,
            leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
          )
          .merge(style),
    );
  }
}

class UTextDisplaySmall extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsLabel;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextLeadingDistribution? leadingDistribution;
  final bool selectable;

  const UTextDisplaySmall(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.textBaseline,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsLabel,
    this.shadows,
    this.foreground,
    this.background,
    this.textDirection,
    this.style,
    this.leadingDistribution,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        style: Theme.of(context).textTheme.displaySmall!
            .copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: height,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              textBaseline: textBaseline,
              shadows: shadows,
              foreground: foreground,
              background: background,
              leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
            )
            .merge(style),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      style: Theme.of(context).textTheme.displaySmall!
          .copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            shadows: shadows,
            foreground: foreground,
            background: background,
            leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
          )
          .merge(style),
    );
  }
}

class UTextHeadlineLarge extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsLabel;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextLeadingDistribution? leadingDistribution;
  final bool selectable;

  const UTextHeadlineLarge(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.textBaseline,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsLabel,
    this.shadows,
    this.foreground,
    this.background,
    this.textDirection,
    this.style,
    this.leadingDistribution,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        style: Theme.of(context).textTheme.headlineLarge!
            .copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: height,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              textBaseline: textBaseline,
              shadows: shadows,
              foreground: foreground,
              background: background,
              leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
            )
            .merge(style),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      style: Theme.of(context).textTheme.headlineLarge!
          .copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            shadows: shadows,
            foreground: foreground,
            background: background,
            leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
          )
          .merge(style),
    );
  }
}

class UTextHeadlineMedium extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsLabel;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextLeadingDistribution? leadingDistribution;
  final bool selectable;

  const UTextHeadlineMedium(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.textBaseline,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsLabel,
    this.shadows,
    this.foreground,
    this.background,
    this.textDirection,
    this.style,
    this.leadingDistribution,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        style: Theme.of(context).textTheme.headlineMedium!
            .copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: height,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              textBaseline: textBaseline,
              shadows: shadows,
              foreground: foreground,
              background: background,
              leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
            )
            .merge(style),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      style: Theme.of(context).textTheme.headlineMedium!
          .copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            shadows: shadows,
            foreground: foreground,
            background: background,
            leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
          )
          .merge(style),
    );
  }
}

class UTextHeadlineSmall extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsLabel;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextLeadingDistribution? leadingDistribution;
  final bool selectable;

  const UTextHeadlineSmall(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.textBaseline,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsLabel,
    this.shadows,
    this.foreground,
    this.background,
    this.textDirection,
    this.style,
    this.leadingDistribution,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        style: Theme.of(context).textTheme.headlineSmall!
            .copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: height,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              textBaseline: textBaseline,
              shadows: shadows,
              foreground: foreground,
              background: background,
              leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
            )
            .merge(style),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      style: Theme.of(context).textTheme.headlineSmall!
          .copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            shadows: shadows,
            foreground: foreground,
            background: background,
            leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
          )
          .merge(style),
    );
  }
}

class UTextTitleLarge extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsLabel;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextLeadingDistribution? leadingDistribution;
  final bool selectable;

  const UTextTitleLarge(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.textBaseline,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsLabel,
    this.shadows,
    this.foreground,
    this.background,
    this.textDirection,
    this.style,
    this.leadingDistribution,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        style: Theme.of(context).textTheme.titleLarge!
            .copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: height,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              textBaseline: textBaseline,
              shadows: shadows,
              foreground: foreground,
              background: background,
              leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
            )
            .merge(style),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      style: Theme.of(context).textTheme.titleLarge!
          .copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            shadows: shadows,
            foreground: foreground,
            background: background,
            leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
          )
          .merge(style),
    );
  }
}

class UTextTitleMedium extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsLabel;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextLeadingDistribution? leadingDistribution;
  final bool selectable;

  const UTextTitleMedium(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.textBaseline,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsLabel,
    this.shadows,
    this.foreground,
    this.background,
    this.textDirection,
    this.style,
    this.leadingDistribution,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        style: Theme.of(context).textTheme.titleMedium!
            .copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: height,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              textBaseline: textBaseline,
              shadows: shadows,
              foreground: foreground,
              background: background,
              leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
            )
            .merge(style),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      style: Theme.of(context).textTheme.titleMedium!
          .copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            shadows: shadows,
            foreground: foreground,
            background: background,
            leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
          )
          .merge(style),
    );
  }
}

class UTextTitleSmall extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsLabel;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextLeadingDistribution? leadingDistribution;
  final bool selectable;

  const UTextTitleSmall(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.textBaseline,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsLabel,
    this.shadows,
    this.foreground,
    this.background,
    this.textDirection,
    this.style,
    this.leadingDistribution,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        style: Theme.of(context).textTheme.titleSmall!
            .copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: height,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              textBaseline: textBaseline,
              shadows: shadows,
              foreground: foreground,
              background: background,
              leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
            )
            .merge(style),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      style: Theme.of(context).textTheme.titleSmall!
          .copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            shadows: shadows,
            foreground: foreground,
            background: background,
            leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
          )
          .merge(style),
    );
  }
}

class UTextBodyLarge extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsLabel;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextLeadingDistribution? leadingDistribution;
  final bool selectable;

  const UTextBodyLarge(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.textBaseline,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsLabel,
    this.shadows,
    this.foreground,
    this.background,
    this.textDirection,
    this.style,
    this.leadingDistribution,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        style: Theme.of(context).textTheme.bodyLarge!
            .copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: height,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              textBaseline: textBaseline,
              shadows: shadows,
              foreground: foreground,
              background: background,
              leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
            )
            .merge(style),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      style: Theme.of(context).textTheme.bodyLarge!
          .copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            shadows: shadows,
            foreground: foreground,
            background: background,
            leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
          )
          .merge(style),
    );
  }
}

class UTextBodyMedium extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsLabel;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextLeadingDistribution? leadingDistribution;
  final bool selectable;

  const UTextBodyMedium(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.textBaseline,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsLabel,
    this.shadows,
    this.foreground,
    this.background,
    this.textDirection,
    this.style,
    this.leadingDistribution,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        style: Theme.of(context).textTheme.bodyMedium!
            .copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: height,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              textBaseline: textBaseline,
              shadows: shadows,
              foreground: foreground,
              background: background,
              leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
            )
            .merge(style),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      style: Theme.of(context).textTheme.bodyMedium!
          .copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            shadows: shadows,
            foreground: foreground,
            background: background,
            leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
          )
          .merge(style),
    );
  }
}

class UTextBodySmall extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsLabel;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextLeadingDistribution? leadingDistribution;
  final bool selectable;

  const UTextBodySmall(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.textBaseline,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsLabel,
    this.shadows,
    this.foreground,
    this.background,
    this.textDirection,
    this.style,
    this.leadingDistribution,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        style: Theme.of(context).textTheme.bodySmall!
            .copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: height,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              textBaseline: textBaseline,
              shadows: shadows,
              foreground: foreground,
              background: background,
              leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
            )
            .merge(style),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      style: Theme.of(context).textTheme.bodySmall!
          .copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            shadows: shadows,
            foreground: foreground,
            background: background,
            leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
          )
          .merge(style),
    );
  }
}

class UTextLabelLarge extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsLabel;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextLeadingDistribution? leadingDistribution;
  final bool selectable;

  const UTextLabelLarge(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.textBaseline,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsLabel,
    this.shadows,
    this.foreground,
    this.background,
    this.textDirection,
    this.style,
    this.leadingDistribution,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        style: Theme.of(context).textTheme.labelLarge!
            .copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: height,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              textBaseline: textBaseline,
              shadows: shadows,
              foreground: foreground,
              background: background,
              leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
            )
            .merge(style),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      style: Theme.of(context).textTheme.labelLarge!
          .copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            shadows: shadows,
            foreground: foreground,
            background: background,
            leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
          )
          .merge(style),
    );
  }
}

class UTextLabelMedium extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsLabel;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextLeadingDistribution? leadingDistribution;
  final bool selectable;

  const UTextLabelMedium(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.textBaseline,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsLabel,
    this.shadows,
    this.foreground,
    this.background,
    this.textDirection,
    this.style,
    this.leadingDistribution,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        style: Theme.of(context).textTheme.labelMedium!
            .copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: height,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              textBaseline: textBaseline,
              shadows: shadows,
              foreground: foreground,
              background: background,
              leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
            )
            .merge(style),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      style: Theme.of(context).textTheme.labelMedium!
          .copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            shadows: shadows,
            foreground: foreground,
            background: background,
            leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
          )
          .merge(style),
    );
  }
}

class UTextLabelSmall extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsLabel;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextLeadingDistribution? leadingDistribution;
  final bool selectable;

  const UTextLabelSmall(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.textBaseline,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsLabel,
    this.shadows,
    this.foreground,
    this.background,
    this.textDirection,
    this.style,
    this.leadingDistribution,
    this.selectable = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selectable) {
      return SelectableText(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        style: Theme.of(context).textTheme.labelSmall!
            .copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              fontFamily: fontFamily,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: height,
              decoration: decoration,
              decorationColor: decorationColor,
              decorationStyle: decorationStyle,
              textBaseline: textBaseline,
              shadows: shadows,
              foreground: foreground,
              background: background,
              leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
            )
            .merge(style),
      );
    }

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
      textHeightBehavior: textHeightBehavior,
      style: Theme.of(context).textTheme.labelSmall!
          .copyWith(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            height: height,
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            shadows: shadows,
            foreground: foreground,
            background: background,
            leadingDistribution: leadingDistribution ?? TextLeadingDistribution.proportional,
          )
          .merge(style),
    );
  }
}
