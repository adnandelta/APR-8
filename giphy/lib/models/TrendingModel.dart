class GiphyQuery {
  List<GifData>? data;
  Pagination? pagination;

  GiphyQuery({this.data, this.pagination});

  GiphyQuery.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GifData>[];
      json['data'].forEach((v) {
        data!.add(GifData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }

    return data;
  }
}

class GifData {
  String? type;
  String? id;
  String? url;
  String? slug;
  String? bitlyGifUrl;
  String? bitlyUrl;
  String? embedUrl;
  String? username;
  String? source;
  String? title;
  String? rating;
  String? contentUrl;
  String? sourceTld;
  String? sourcePostUrl;
  int? isSticker;
  String? importDatetime;
  String? trendingDatetime;
  Images? images;
  User? user;
  String? analyticsResponsePayload;

  GifData({
    this.type,
    this.id,
    this.url,
    this.slug,
    this.bitlyGifUrl,
    this.bitlyUrl,
    this.embedUrl,
    this.username,
    this.source,
    this.title,
    this.rating,
    this.contentUrl,
    this.sourceTld,
    this.sourcePostUrl,
    this.isSticker,
    this.importDatetime,
    this.trendingDatetime,
    this.images,
    this.user,
    this.analyticsResponsePayload,
  });

  GifData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    url = json['url'];
    slug = json['slug'];
    bitlyGifUrl = json['bitly_gif_url'];
    bitlyUrl = json['bitly_url'];
    embedUrl = json['embed_url'];
    username = json['username'];
    source = json['source'];
    title = json['title'];
    rating = json['rating'];
    contentUrl = json['content_url'];
    sourceTld = json['source_tld'];
    sourcePostUrl = json['source_post_url'];
    isSticker = json['is_sticker'];
    importDatetime = json['import_datetime'];
    trendingDatetime = json['trending_datetime'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    analyticsResponsePayload = json['analytics_response_payload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['url'] = url;
    data['slug'] = slug;
    data['bitly_gif_url'] = bitlyGifUrl;
    data['bitly_url'] = bitlyUrl;
    data['embed_url'] = embedUrl;
    data['username'] = username;
    data['source'] = source;
    data['title'] = title;
    data['rating'] = rating;
    data['content_url'] = contentUrl;
    data['source_tld'] = sourceTld;
    data['source_post_url'] = sourcePostUrl;
    data['is_sticker'] = isSticker;
    data['import_datetime'] = importDatetime;
    data['trending_datetime'] = trendingDatetime;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['analytics_response_payload'] = analyticsResponsePayload;

    return data;
  }
}

class Images {
  Original? original;

  FixedHeight? fixedHeight;
  FixedHeightDownsampled? fixedHeightDownsampled;
  FixedHeight? fixedHeightSmall;

  Images({
    this.original,
    this.fixedHeight,
    this.fixedHeightDownsampled,
    this.fixedHeightSmall,
  });

  Images.fromJson(Map<String, dynamic> json) {
    original =
        json['original'] != null ? Original.fromJson(json['original']) : null;

    fixedHeight = json['fixed_height'] != null
        ? FixedHeight.fromJson(json['fixed_height'])
        : null;
    fixedHeightDownsampled = json['fixed_height_downsampled'] != null
        ? FixedHeightDownsampled.fromJson(json['fixed_height_downsampled'])
        : null;
    fixedHeightSmall = json['fixed_height_small'] != null
        ? FixedHeight.fromJson(json['fixed_height_small'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (original != null) {
      data['original'] = original!.toJson();
    }

    if (fixedHeight != null) {
      data['fixed_height'] = fixedHeight!.toJson();
    }
    if (fixedHeightDownsampled != null) {
      data['fixed_height_downsampled'] = fixedHeightDownsampled!.toJson();
    }
    if (fixedHeightSmall != null) {
      data['fixed_height_small'] = fixedHeightSmall!.toJson();
    }

    return data;
  }
}

class Original {
  String? height;
  String? width;
  String? size;
  String? url;
  String? mp4Size;
  String? mp4;
  String? webpSize;
  String? webp;
  String? frames;
  String? hash;

  Original(
      {this.height,
      this.width,
      this.size,
      this.url,
      this.mp4Size,
      this.mp4,
      this.webpSize,
      this.webp,
      this.frames,
      this.hash});

  Original.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
    size = json['size'];
    url = json['url'];
    mp4Size = json['mp4_size'];
    mp4 = json['mp4'];
    webpSize = json['webp_size'];
    webp = json['webp'];
    frames = json['frames'];
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['width'] = width;
    data['size'] = size;
    data['url'] = url;
    data['mp4_size'] = mp4Size;
    data['mp4'] = mp4;
    data['webp_size'] = webpSize;
    data['webp'] = webp;
    data['frames'] = frames;
    data['hash'] = hash;
    return data;
  }
}

class FixedHeight {
  String? height;
  String? width;
  String? size;
  String? url;
  String? mp4Size;
  String? mp4;
  String? webpSize;
  String? webp;

  FixedHeight(
      {this.height,
      this.width,
      this.size,
      this.url,
      this.mp4Size,
      this.mp4,
      this.webpSize,
      this.webp});

  FixedHeight.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
    size = json['size'];
    url = json['url'];
    mp4Size = json['mp4_size'];
    mp4 = json['mp4'];
    webpSize = json['webp_size'];
    webp = json['webp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['width'] = width;
    data['size'] = size;
    data['url'] = url;
    data['mp4_size'] = mp4Size;
    data['mp4'] = mp4;
    data['webp_size'] = webpSize;
    data['webp'] = webp;
    return data;
  }
}

class FixedHeightDownsampled {
  String? height;
  String? width;
  String? size;
  String? url;
  String? webpSize;
  String? webp;

  FixedHeightDownsampled(
      {this.height, this.width, this.size, this.url, this.webpSize, this.webp});

  FixedHeightDownsampled.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
    size = json['size'];
    url = json['url'];
    webpSize = json['webp_size'];
    webp = json['webp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['width'] = width;
    data['size'] = size;
    data['url'] = url;
    data['webp_size'] = webpSize;
    data['webp'] = webp;
    return data;
  }
}

class User {
  String? avatarUrl;
  String? bannerImage;
  String? bannerUrl;
  String? profileUrl;
  String? username;
  String? displayName;
  String? description;
  String? instagramUrl;
  String? websiteUrl;
  bool? isVerified;

  User(
      {this.avatarUrl,
      this.bannerImage,
      this.bannerUrl,
      this.profileUrl,
      this.username,
      this.displayName,
      this.description,
      this.instagramUrl,
      this.websiteUrl,
      this.isVerified});

  User.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatar_url'];
    bannerImage = json['banner_image'];
    bannerUrl = json['banner_url'];
    profileUrl = json['profile_url'];
    username = json['username'];
    displayName = json['display_name'];
    description = json['description'];
    instagramUrl = json['instagram_url'];
    websiteUrl = json['website_url'];
    isVerified = json['is_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar_url'] = avatarUrl;
    data['banner_image'] = bannerImage;
    data['banner_url'] = bannerUrl;
    data['profile_url'] = profileUrl;
    data['username'] = username;
    data['display_name'] = displayName;
    data['description'] = description;
    data['instagram_url'] = instagramUrl;
    data['website_url'] = websiteUrl;
    data['is_verified'] = isVerified;
    return data;
  }
}

class Onload {
  String? url;

  Onload({this.url});

  Onload.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}

class Pagination {
  int? totalCount;
  int? count;
  int? offset;

  Pagination({this.totalCount, this.count, this.offset});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    count = json['count'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_count'] = totalCount;
    data['count'] = count;
    data['offset'] = offset;
    return data;
  }
}
