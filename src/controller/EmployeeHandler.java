package controller;

import model.Employee;
import utilities.Session;
import view.LoginView;

public class EmployeeHandler {
	private String errormsg = "";

	public EmployeeHandler() {
		
	}
	
	public void showLoginForm() {
		new LoginView();
	}
	
	public Employee getCurrentEmployee() {
		return Session.getUser();
	}
	
	public void logout() {
		Session.setUser(null);
		new LoginView();
	}
	
	
	public Employee authenticate(String username, String password) {
		if(username.isEmpty()) {
			errormsg = "Username Can't be empty";
			return null;
		}
		if(password.isEmpty()) {
			errormsg = "Password Can't be empty";
			return null;
		}
		
		Employee u = new Employee (username, password);
		u = u.Login();
		
		if(u==null) {
			errormsg = "invalid username or Password";
		}
		else {	
			Session.setUser(u);
		}
		return u;
	}
	
	public String getErrormsg() {
		return errormsg;
	}
}
	


 