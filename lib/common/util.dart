import 'package:ending_wars/screens/film_screen.dart';
import 'package:ending_wars/screens/person_screen.dart';
import 'package:ending_wars/screens/planet_screen.dart';
import 'package:ending_wars/screens/species_screen.dart';
import 'package:ending_wars/screens/starship_screen.dart';
import 'package:ending_wars/screens/vehicle_screen.dart';

String capitalize(String word) {
  return "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
}

dynamic getResourceScreen(String resourceNameType, resource) {

  switch (resourceNameType) {
    case 'people':
      return PersonScreen(person: resource);
    case 'planets':
      return PlanetScreen(planet: resource);
    case 'films':
      return FilmScreen(film: resource);
    case 'species':
      return SpeciesScreen(species: resource);
    case 'vehicles':
      return VehicleScreen(vehicle: resource);
    case 'starships':
      return StarshipScreen(starship: resource);
  }

}
