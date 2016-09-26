package de.foo.bar;

import java.util.List;
import java.util.Vector;

public class ReturnCode {
	
	private int rc;
	private static final int DEFAULT_RC = 99;
	public static List<Integer> maxRC = new Vector<Integer>();
	
	public ReturnCode()
	{
		this.rc = DEFAULT_RC;
	}
	
	public void setRC(int rc)
	{
		
		if(this.rc == DEFAULT_RC &&	ReturnCode.getMaxRC() == DEFAULT_RC)
		{
			this.setMaxRC(rc);
		}else if(rc > ReturnCode.getMaxRC())
		{
			this.setMaxRC(rc);
		}
		this.rc = rc;
	}
	
	public int getRC()
	{
		return this.rc;
	}
	
	public static int getMaxRC()
	{
		
		if(maxRC.isEmpty())
		{
			maxRC.add(DEFAULT_RC);
		}
		return maxRC.get(0);
	}
	
	private void setMaxRC(int rc)
	{
		ReturnCode.maxRC.remove(0);
		ReturnCode.maxRC.add(new Integer(rc));
	}

}
