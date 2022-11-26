class ArtistModel {
  final String? name, image, id;
  ArtistModel({
    required this.name,
    required this.image,
    required this.id,
  });
}

List<ArtistModel> listArtists = [
  ArtistModel(
    id: 'user1',
    name: 'Adele',
    image: 'Adele.jpg',
  ),
  ArtistModel(
    id: 'user2',
    name: 'Lyodra Ginting',
    image: 'Lyodra Ginting.jpg',
  ),
  ArtistModel(
    id: 'user3',
    name: 'Mawar de Jongh',
    image: 'Mawar de Jongh.jpg',
  ),
  ArtistModel(
    id: 'user4',
    name: 'Nadin Amizah',
    image: 'Nadin Amizah.jpg',
  ),
  ArtistModel(
    id: 'user5',
    name: 'Weird Genius',
    image: 'Weird Genius.jpg',
  ),
];
