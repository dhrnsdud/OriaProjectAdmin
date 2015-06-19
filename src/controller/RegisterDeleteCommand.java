package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.memberDao;
import model.memberDto;

public class RegisterDeleteCommand implements ICommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("member_no");
		memberDao dao = new memberDao();

		dao.setDeleteRegister(no);
        	return "/regiAdmin.jsp";	

	}

}
