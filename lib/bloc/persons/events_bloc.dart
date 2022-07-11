abstract class EventBlocPersons {}

class EventPersonsFilterByName extends EventBlocPersons {
  EventPersonsFilterByName(this.name);
  final String name;
}

class EventReadAll extends EventBlocPersons {
  EventReadAll(this.time);
  final int time;
}

class EventLoadNextPage extends EventBlocPersons {
  EventLoadNextPage(this.page);
  final String page;
}
