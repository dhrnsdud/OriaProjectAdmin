package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GongjiBoardListCommand implements ICommand{

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(req.getSession().getAttribute("member_id") != null){
		return "gongjiboardList.jsp";
		}
		req.setAttribute("accessReject", "accessReject");
		
		return "Admin.jsp";
	}

}
