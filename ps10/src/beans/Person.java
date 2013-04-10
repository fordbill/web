package beans;

/**
 * A bean that packages the name and phone number of a person.
 */
public class Person {
	
	private String name;
	private String phone;
	private String login;
	
	public Person(String name, String phone, String login) {
		super();
		this.name = name;
		this.phone = phone;
		this.login = login;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getLogin()
	{
		return this.login;
	}
	
	public void setLogin()
	{
		
	}
	
	
}

