class ValoModel {
  String? image;
  String? name;
  String? description;

  ValoModel(this.description, this.image, this.name);
}

List<ValoModel> valorant = valorantData
    .map((item) => ValoModel(item['image'], item['name'], item['description']))
    .toList();

var valorantData = [
  {
    'name': 'Jett',
    'description': 'Power',
    'image':
        'http://static1-us.millenium.gg/articles/7/13/52/7/@/144657-jett-amp_main_media_schema-3.jpg'
  },
  {
    'name': 'Reyna',
    'description': 'Power',
    'image':
        'http://images.contentstack.io/v3/assets/bltb6530b271fddd0b1/blt41a00efc125c83c8/615f8bdbaeba391136e443bf/Reyna.png'
  },
  {
    'name': 'Chamber',
    'description': 'Power',
    'image': 'http://i.ytimg.com/vi/FUoqAn5T4h4/maxresdefault.jpg'
  },
];
