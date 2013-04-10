package beans;

public class Credentials {

	private String firstName;
	private String lastName;
	private String login;
	private String password;
	private String address;
	private String phone;
	
	public Credentials(String fname, String lname, String login, String password, String ph, String ad) 
	{
		super();
		this.firstName = fname;
		this.lastName = lname;
		this.login = login;
		this.password = password;
		this.phone = ph;
		this.address = ad;
	}
	public String getPhone()
	{
		return phone;
	}
	
	public String getAddress()
	{
		return address;
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
