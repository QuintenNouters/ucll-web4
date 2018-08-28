package db;

import java.util.List;
import java.util.Set;

import domain.Person;

public interface PersonRepository {

	public abstract void add(Person person);

	public abstract void delete(String userId);

	public abstract Person get(String userId);

	public abstract List<Person> getAll();
	
	public abstract Person getAuthenticatedUser(String email, String password);

	public abstract void update(Person person);

	Set<Person> getFriends(Person p);

	Set<Person> search(String search);

	void addFriend(Person person, Person friendToAdd);

	void removeFriend(Person person, Person friendToRemove);

	int getFriendAmountOnline(Person p);

	int getFriendAmountOffline(Person p);

}