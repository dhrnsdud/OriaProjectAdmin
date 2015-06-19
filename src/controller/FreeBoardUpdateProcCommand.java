package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.freeBoardDao;
import model.freeBoardDto;

public class FreeBoardUpdateProcCommand implements ICommand{

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		freeBoardDao dao = new freeBoardDao();
        freeBoardDto dto = new freeBoardDto();        
        	System.out.println("업뎃프록시연결");
        	
       String freeboard_subject = req.getParameter("freeboard_subject");
       System.out.println(freeboard_subject+"updatecommand subject");
       String freeboard_content = req.getParameter("freeboard_content");
       int freeboard_no = Integer.parseInt(req.getParameter("freeboard_no"));
        System.out.println("추가");
        
        
        dao.updateBoard(freeboard_subject, freeboard_content,freeboard_no);
        
     return "freeboardRead.jsp";
  }

}