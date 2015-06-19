package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.businessDao;
import model.memberDao;
import model.memberDto;

public class TypeFoodBoardCommand implements ICommand {

   @Override
   public Object processCommand(HttpServletRequest req,
         HttpServletResponse resp) throws ServletException, IOException {
         
         /*String areafood = req.getParameter("area");
         businessDao dao = new businessDao();
         dao.getBusinessAreaList(areafood);*/
      req.setCharacterEncoding("euc-kr");
		if(req.getSession().getAttribute("member_id") == null){
			req.setAttribute("notLogin", "notLogin");
			return "/Main.jsp";
		}
      return "/typefoodBoard.jsp";
   }

}