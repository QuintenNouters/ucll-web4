package domain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import db.MessageRepository;
import db.MessageRepositoryStub;
import db.PersonRepository;
import db.PersonRepositoryStub;

public class PersonService {
	private PersonRepository personRepository = new PersonRepositoryStub();
	private MessageRepository messageRepository = new MessageRepositoryStub();
	public PersonService(){
	}
	
	public Person getPerson(String personId)  {
		return getPersonRepository().get(personId);
	}

	public List<Person> getPersons() {
		return getPersonRepository().getAll();
	}

	public void addPerson(Person person) {
		getPersonRepository().add(person);
	}

	public void updatePersons(Person person) {
		getPersonRepository().update(person);
	}

	public void deletePerson(String id) {
		getPersonRepository().delete(id);
	}
	
	public Person getAuthenticatedUser(String email, String password) {
		return getPersonRepository().getAuthenticatedUser(email, password);
	}

	private PersonRepository getPersonRepository() {
		return personRepository;
	}

	public Set<Person> getFriends(Person p) {return personRepository.getFriends(p);}

	public Set<Person> search(String search){return personRepository.search(search);}

	public void addFriend(Person person, Person friend){
		getPersonRepository().addFriend(person, friend);
	}

	public void removeFriend(Person person, Person friend){
		getPersonRepository().removeFriend(person, friend);
	}

	public int getFriendAmountOnline(Person p){
		return getPersonRepository().getFriendAmountOnline(p);
	}

	public int getFriendAmountOffline(Person p){
		return getPersonRepository().getFriendAmountOffline(p);
	}

	//person user sends a message message to another user other
	public void sendMessage(Person user, Person other, String message) {
		if (user != null && other != null && message != null && message.length() > 0) {
			messageRepository.message(user, other, message);
		}
	}

	//returns a map with the person and the messagelist
	public Map<Person, List<Message>> getMessages(Person user) {
		Map<Person, List<Message>> result = new HashMap<>();
		getFriends(user).forEach(p -> result.put(p, messageRepository.getMessagesBetween(user, p)));
		return result;
	}


}
