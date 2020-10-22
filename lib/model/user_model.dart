class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Komal gudan',
  imageUrl: 'assets/images/komalgudan.jpg',
  isOnline: true,
);

// USERS

final User komalgudan = User(
  id: 1,
  name: ' Komal Gudan',
  imageUrl: 'assets/images/komalgudan.jpg',
  isOnline: true,
);
final User nikhil = User(
  id: 2,
  name: 'Nikhil',
  imageUrl: 'assets/images/nikhil.jpg',
  isOnline: false,
);
final User prajakta = User(
  id: 3,
  name: 'Prajakta Koli',
  imageUrl: 'assets/images/prajakta-koli.jpg',
  isOnline: false,
);
final User sejal = User(
  id: 4,
  name: 'Sejal',
  imageUrl: 'assets/images/sejal.jpg',
  isOnline: true,
);
final User selena = User(
  id: 5,
  name: 'Selena',
  imageUrl: 'assets/images/selena.jpg',
  isOnline: false,
);
final User shruti = User(
  id: 6,
  name: 'Shruti',
  imageUrl: 'assets/images/Shruti.jpg',
  isOnline: false,
);
final User priyanka = User(
  id: 7,
  name: 'Priyanka',
  imageUrl: 'assets/images/PC.jpg',
  isOnline: false,
);
