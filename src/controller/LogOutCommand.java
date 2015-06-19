package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import javax.servlet.jsp.PageContext;

import model.memberDao;
import model.memberDto;

public class LogOutCommand implements ICommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
			System.out.println("LogOutCommand");
			
			HttpSession session = req. getSession();
			session.invalidate();
			
			return "/Admin.jsp";	
			}
			
	}

