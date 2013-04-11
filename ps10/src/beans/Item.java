package beans;

public class Item 
{
	private String category;
	private String description;
	private String value;
	private String serial;
	private String date;
	
	
	
	//<tr><th>Category</th><th>Description</th><th>Value</th><th>Serial #</th><th> Date</th></tr>
	public Item(String c, String de, String v, String s, String d)
	{
		this.category = c;
		this.description = de;
		this.setValue(v);
		this.setSerial(s);
		this.setDate(d);
	}
	
	//Getters && Setters
	
	public String getCategory()
	{
		return category;
	}
	
	public void setCategory(String c)
	{
		this.category = c;
	}
	
	public void setDescription(String de)
	{
		this.description = de;
	}
	
	public String getDescription()
	{
		return description;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getSerial() {
		return serial;
	}

	public void setSerial(String serial) {
		this.serial = serial;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
	
	
}
