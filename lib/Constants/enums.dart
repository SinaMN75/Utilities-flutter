enum TagUser {
  male('مرد', 'Male', 100),
  female('زن', 'Female', 101),
  superAdmin('سوپر ادمین', 'Super Admin', 201);

  const TagUser(this.titleFa, this.titleEn, this.number);

  final String titleFa;
  final String titleEn;
  final int number;
}

enum TagCategory {
  category('دسته‌بندی', 'Category', 100);

  const TagCategory(this.titleFa, this.titleEn, this.number);

  final String titleFa;
  final String titleEn;
  final int number;
}

enum TagMedia {
  image('تصویر', 'Image', 100);

  const TagMedia(this.titleFa, this.titleEn, this.number);

  final String titleFa;
  final String titleEn;
  final int number;
}

enum TagProduct {
  product('محصول', 'Product', 101),
  new_('جدید', 'New', 201),
  kindOfNew('نو', 'Kind of New', 202),
  used('دست دوم', 'Used', 203),
  released('منتشر شده', 'Released', 301),
  expired('منقضی شده', 'Expired', 302),
  inQueue('در حال بررسی', 'In Queue', 303),
  deleted('حذف شده', 'Deleted', 304),
  notAccepted('تایید نشده', 'Not Accepted', 305),
  awaitingPayment('در انتظار پرداخت', 'Awaiting Payment', 306);

  const TagProduct(this.titleFa, this.titleEn, this.number);

  final String titleFa;
  final String titleEn;
  final int number;
}

enum TagComment {
  released('منتشر شده', 'Released', 100),
  inQueue('در حال بررسی', 'In Queue', 101),
  rejected('رد شده', 'Rejected', 102),
  private('خصوصی', 'Private', 501);

  const TagComment(this.titleFa, this.titleEn, this.number);

  final String titleFa;
  final String titleEn;
  final int number;
}

enum TagReaction {
  like('پسندیدن', 'Like', 101),
  disLike('نپسندیدن', 'Dislike', 102);

  const TagReaction(this.titleFa, this.titleEn, this.number);

  final String titleFa;
  final String titleEn;
  final int number;
}
