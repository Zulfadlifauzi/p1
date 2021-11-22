class ValoModel {
  String? name;
  String? description;
  String? image;

  ValoModel(this.name, this.description, this.image);
}

List<ValoModel> valorant = valorantData
    .map((item) => ValoModel(item['name'], item['description'], item['image']))
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
    'image': 'https://i.ytimg.com/vi/IzsQNYrq9AM/maxresdefault.jpg'
  },
  {
    'name': 'Chamber',
    'description': 'Power',
    'image': 'http://i.ytimg.com/vi/FUoqAn5T4h4/maxresdefault.jpg'
  },
];
