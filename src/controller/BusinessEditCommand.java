package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import model.businessDao;
import model.businessDto;
import model.memberDao;
import model.memberDto;

public class BusinessEditCommand implements ICommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("business_no");
		System.out.println(req.getParameter("business_edit_addr"));
		businessDao dao = new businessDao();
		businessDto dto = new businessDto();
		dto.setBusiness_name(req.getParameter("business_edit_name"));
		dto.setBusiness_content(req.getParameter("business_edit_content"));
		dto.setBusiness_addr(req.getParameter("business_edit_addr"));
		dto.setBusiness_phone(req.getParameter("business_edit_phone"));
		dto.setBusiness_tof(req.getParameter("business_edit_tof"));
		


		dao.setUpdateBusiness(dto, req.getParameter("business_no"));
        	return "/businessAdmin.jsp";	

	}

}
