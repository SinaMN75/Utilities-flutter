enum ShorteningPolicy {
  /// displays a value of 1234456789.34 as 1,234,456,789.34
  NoShortening,

  /// displays a value of 1234456789.34 as 1,234,456K
  RoundToThousands,

  /// displays a value of 1234456789.34 as 1,234M
  RoundToMillions,

  /// displays a value of 1234456789.34 as 1B
  RoundToBillions,
  RoundToTrillions,

  /// uses K, M, B, or T depending on how big the numeric value is
  Automatic
}

/// [Comma] means this format 1,000,000.00
/// [Period] means thousands and mantissa will look like this
/// 1.000.000,00
/// [None] no separator will be applied at all
/// [SpaceAndPeriodMantissa] 1 000 000.00
/// [SpaceAndCommaMantissa] 1 000 000,00
enum ThousandSeparator {
  Comma,
  Space,
  Period,
  None,
  SpaceAndPeriodMantissa,
  SpaceAndCommaMantissa,
}
