package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.freeBoardDao;
import model.freeBoardDto;

public class FreeBoardPostProcCommand implements ICommand{

      @Override
      public Object processCommand(HttpServletRequest req,
            HttpServletResponse resp) throws ServletException, IOException {
            freeBoardDao dao = new freeBoardDao();
            freeBoardDto dto = new freeBoardDto();
            HttpSession session = req.getSession();
            
            dto.setFreeboard_subject(req.getParameter("freeboard_subject"));
            dto.setFreeboard_content(req.getParameter("freeboard_content"));            
            
            dao.insertBoard(dto, (String)session.getAttribute("member_id"));
            
            
         return "freeboardList.jsp";
      }

   }