package beans;

public class Credentials {

	private String firstName;
	private String lastName;
	private String login;
	private String password;
	
	public Credentials(String fname, String lname, String login, String password) {
		super();
		this.firstName = fname;
		this.lastName = lname;
		this.login = login;
		this.password = password;
	}
	public String getPassword()
	{
		return password;
	}
	
	public String getlastName() 
	{
		return lastName;
	}

	public void setlastName(String name) 
	{
		this.lastName = name;
	}
 
	public String getfirstName() 
	{
		return firstName;
	}

	public void setfirstName(String name) 
	{
		this.firstName = name;
	}


	
	public String getLogin()
	{
		return this.login;
	}
	
	public void setLogin()
	{
		
	}
	
}
