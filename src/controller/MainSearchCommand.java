package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MainSearchCommand implements ICommand{

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session= req.getSession();
		String txtSearch = req.getParameter("txtSearch");
		
		session.setAttribute("cmd", req.getParameter("cmd"));
		session.setAttribute("txtSearch", txtSearch);
		
		
		return "foodBoard.jsp";
		
	}

}
