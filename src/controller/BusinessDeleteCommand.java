package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import model.businessDao;
import model.memberDao;
import model.memberDto;

public class BusinessDeleteCommand implements ICommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("business_no");
		businessDao dao = new businessDao();

		dao.setDeleteBusiness(no);
        	return "/businessAdmin.jsp";	

	}

}
