package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.memberDao;
import model.memberDto;

public class ProjectServlet extends HttpServlet{

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp)
         throws ServletException, IOException {
      doPost(req,resp);
   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp)
         throws ServletException, IOException {
	
	req.setCharacterEncoding("euc-kr"); 
  	String cmd = req.getParameter("cmd");
  	//System.out.println(cmd);
	String url="";
 
	FactoryCommand factory = FactoryCommand.getInstance();
	ICommand icmd = factory.createCommand(cmd);
	
	url = (String)icmd.processCommand(req, resp);
	RequestDispatcher view = req.getRequestDispatcher(url);
	view.forward(req, resp);
   }  
      
   

}