class CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseEntity({
      this.results, 
      this.metadata, 
      this.data,
  this.message,
  this.statusMsg});

  int? results;
  MetadataEntity? metadata;
  List<CategoryOrBrandEntity>? data;
  String? statusMsg;
  String? message;
}

class CategoryOrBrandEntity {
  CategoryOrBrandEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 

  });

  String? id;
  String? name;
  String? slug;
  String? image;

}

class MetadataEntity {
  MetadataEntity({
      this.currentPage, 
      this.numberOfPages, 
      this.limit,});

  int? currentPage;
  int? numberOfPages;
  int? limit;


}