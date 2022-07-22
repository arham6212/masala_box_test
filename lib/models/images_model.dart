
class Images {
  Images({
    this.id,
   this.sponsorship,
    this.description,
    this.altDescription,
    this.urls,
    });

  String ?id;

  String ?description;
  dynamic altDescription;
  Urls ?urls;
  Sponsorship? sponsorship;



  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    description: json["description"],
    altDescription: json["alt_description"],
    urls: Urls.fromJson(json["urls"]),

    sponsorship: json["sponsorship"] == null ? null : Sponsorship.fromJson(json["sponsorship"]),

  );
}


class Sponsorship {
  Sponsorship({
    this.impressionUrls,
    this.tagline,
    this.sponsor,
  });

  List<String> ?impressionUrls;
  String ?tagline;
  String ?taglineUrl;
  User ?sponsor;

  factory Sponsorship.fromJson(Map<String, dynamic> json) => Sponsorship(
    impressionUrls: List<String>.from(json["impression_urls"].map((x) => x)),
    tagline: json["tagline"],
    sponsor: User.fromJson(json["sponsor"]),
  );


}

class User {
  User({

    this.username,
    this.name,
    this.profileImage,
  });


  String ?username;
  String ?name;
  ProfileImage ?profileImage;

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],

    name: json["name"],
    profileImage: ProfileImage.fromJson(json["profile_image"]),
  );

}

class ProfileImage {
  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  String ?small;
  String ?medium;
  String ?large;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
  );


}




class Urls {
  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  String ?raw;
  String ?full;
  String ?regular;
  String ?small;
  String ?thumb;
  String ?smallS3;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    raw: json["raw"],
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
    thumb: json["thumb"],
    smallS3: json["small_s3"],
  );


}
