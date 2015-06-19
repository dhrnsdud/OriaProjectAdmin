package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.freeBoardDao;
import model.freeBoardDto;

public class FreeBoardDeleteProcCommand implements ICommand{

    @Override
    public Object processCommand(HttpServletRequest req,
          HttpServletResponse resp) throws ServletException, IOException {
    	
          freeBoardDao dao = new freeBoardDao();
          freeBoardDto dto = new freeBoardDto();
          
          System.out.println("deleteproc¡¢º”");
          int freeboard_no = Integer.parseInt(req.getParameter("freeboard_no"));   
          System.out.println(freeboard_no);
          dao.deleteBoard(freeboard_no);
          
       return "freeboardList.jsp";
    }

 }