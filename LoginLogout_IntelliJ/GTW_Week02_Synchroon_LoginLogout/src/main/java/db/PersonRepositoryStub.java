package db;

import java.util.*;

import domain.Person;
import domain.Role;
import util.Hashing;

public class PersonRepositoryStub implements PersonRepository {
	private Map<String, Person> persons = new HashMap<String, Person>();
	private Map<Person, Set<Person>> friends = new HashMap<Person, Set<Person>>();
	
	public PersonRepositoryStub () {
		Person administrator = new Person("bib@ucll.be", "t", "Bib", "Liothekaris", Role.BIB, 10, "male");
		add(administrator);
		Person jan = new Person("jan@ucll.be", "t", "Jan", "Janssens", Role.LID, 40, "male");
//		Person friendA = new Person("friendA@ucll.be", "a", "Friend", "A", Role.LID);
//		Person friendB = new Person("friendB@ucll.be", "b", "Friend", "B", Role.LID);
//		Person friendC = new Person("friendC@ucll.be", "c", "Friend", "C", Role.LID);
//		addFriend(jan, friendA);
//		addFriend(jan, friendB);
//		addFriend(jan, friendC);
		add(jan);
		Person an = new Person("an@ucll.be", "t", "An", "Cornelissen", Role.LID, 30, "female");
		add(an);
	}
	
	public Person get(String personId){
		if(personId == null){
			throw new IllegalArgumentException("No id given");
		}
		return persons.get(personId);
	}
	
	public List<Person> getAll(){
		return new ArrayList<Person>(persons.values());	
	}

	public void add(Person person){
		if(person == null){
			throw new IllegalArgumentException("No person given");
		}
		if(person.getUserId() == null){
			throw new DbException("No person given");
		}
		if (persons.containsKey(person.getUserId())) {
			throw new IllegalArgumentException("User already exists");
		}
		persons.put(person.getUserId(), person);
		Set<Person> friendsList = new HashSet<Person>();
		friends.put(person, friendsList);
	}
	
	public void update(Person person){
		if(person == null){
			throw new IllegalArgumentException("No person given");
		}
		persons.put(person.getUserId(), person);
	}
	
	public void delete(String personId){
		if(personId == null){
			throw new IllegalArgumentException("No id given");
		}
		persons.remove(personId);
	}
	
	public Person getAuthenticatedUser(String email, String password) {
		Person person = get(Hashing.SHA256(email, "").substring(0,8));
		
		if (person != null && person.isCorrectPassword(password)) {
			return person;
		}
		else {
			return null;
		}
	}

	public Set<Person> getFriends(Person p){
		return friends.get(p);
	}

	public Set<Person> search(String search){
		Set<Person> result = new HashSet<Person>();
		for (Person p: persons.values()) {
			if(p.getEmail().contains(search)){
				result.add(p);
			}
		}
		return result;
	}

	public void addFriend(Person person, Person friendToAdd){
		if(person != null && friendToAdd != null) {
			Set<Person> friendsList = friends.get(person);
			friendsList.add(friendToAdd);
			friends.put(person, friendsList);
		}
	}

	public void removeFriend(Person person, Person friendToRemove){
		if(person != null && friendToRemove != null) {
			Set<Person> friendsList = friends.get(person);
			friendsList.remove(friendToRemove);
			friends.put(person, friendsList);
		}
	}

	public int getFriendAmountOnline(Person p){
		return getFriends(p).size() - getFriendAmountOffline(p);
	}

	public int getFriendAmountOffline(Person p){
		int result = 0;
		Set<Person> friends = getFriends(p);
		for (Person person: friends) {
			if(person.getStatus().toString().toLowerCase().equals("offline")){
				result++;
			}
		}
		return result;
	}
}
