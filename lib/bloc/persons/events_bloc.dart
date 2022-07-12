abstract class EventBlocPersons {}

class EventPersonsFilterByName extends EventBlocPersons {
  EventPersonsFilterByName(this.name, this.time);
  final String name;
  final int time;
}

class EventReadAll extends EventBlocPersons {
  EventReadAll(this.name);
  final String name;
}

class EventLoadNextPage extends EventBlocPersons {
  EventLoadNextPage(this.page);
  final String page;
}
