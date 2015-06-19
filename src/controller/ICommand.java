package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ICommand {		//Micro soft Style의 이름 (앞에 i)
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException;


}
