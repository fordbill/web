package beans;

public class Login 
{
	private String username;
	private String password;
	
	
	public Login(String u, String p)
	{
		setUsername(u);
		setPassword(p);
	}
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
