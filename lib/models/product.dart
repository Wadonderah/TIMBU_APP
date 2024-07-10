// lib/models/product.dart

class Product {
  final String id;
  final String name;
  final String description;
  final List<Photo> photos;
  final double price;

  Product( {required this.photos,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json, String s) {
   
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? 'No Name',
      description: json['description'] ?? 'No Description',
      photos: json["photos"] == null ? [] : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
      price: (json['price'] != null) ? json['price'].toDouble() : 0.0,
    );
  }
}


class Photo {
    final String? modelName;
    final String? modelId;
    final String? organizationId;
    final String? filename;
    final String? url;
    final bool? isFeatured;
    final bool? saveAsJpg;
    final bool? isPublic;
    final bool? fileRename;
    final int? position;
    Photo({
        this.modelName,
        this.modelId,
        this.organizationId,
        this.filename,
        this.url,
        this.isFeatured,
        this.saveAsJpg,
        this.isPublic,
        this.fileRename,
        this.position,
    });
    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        modelName: json["model_name"],
        modelId: json["model_id"],
        organizationId: json["organization_id"],
        filename: json["filename"],
        url: json["url"],
        isFeatured: json["is_featured"],
        saveAsJpg: json["save_as_jpg"],
        isPublic: json["is_public"],
        fileRename: json["file_rename"],
        position: json["position"],
    );
    Map<String, dynamic> toJson() => {
        "model_name": modelName,
        "model_id": modelId,
        "organization_id": organizationId,
        "filename": filename,
        "url": url,
        "is_featured": isFeatured,
        "save_as_jpg": saveAsJpg,
        "is_public": isPublic,
        "file_rename": fileRename,
        "position": position,
    };
} 