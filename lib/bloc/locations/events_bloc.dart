abstract class EventBlocLocations {}

class EventLocationsFilterByName extends EventBlocLocations {
  EventLocationsFilterByName(this.name, this.time);
  final String name;
  final int time;
}

class EventLocationsAll extends EventBlocLocations {
  EventLocationsAll(this.name);
  final String name;
}
