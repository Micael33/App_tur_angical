class TouristSpot {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String imageAlt;
  final String location;

  const TouristSpot({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.imageAlt,
    required this.location,
  });
}

// Mock Data
final List<TouristSpot> mockTouristSpots = [
  const TouristSpot(
    id: '1',
    name: 'Praça da Matriz',
    description: 'A praça central de Angical do Piauí é o coração da cidade, onde acontecem os principais eventos culturais e religiosos. Possui belos jardins e a histórica Igreja Matriz.',
    imageUrl: 'https://placeholder.com/600x400', // Replace with real asset if available
    imageAlt: 'Foto da Praça da Matriz durante o dia, mostrando a igreja ao fundo e árvores ao redor.',
    location: 'Centro, Angical do Piauí',
  ),
  const TouristSpot(
    id: '2',
    name: 'Balneário Prainha',
    description: 'Local ideal para lazer e banho, com águas calmas e quiosques para alimentação.',
    imageUrl: 'https://placeholder.com/600x400',
    imageAlt: 'Foto do Balneário Prainha com pessoas nadando e quiosques de palha.',
    location: 'Rio Parnaíba',
  ),
];
