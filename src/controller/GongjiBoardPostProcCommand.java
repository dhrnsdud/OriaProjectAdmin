package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import model.gongjiBoardDao;
import model.gongjiBoardDto;

public class GongjiBoardPostProcCommand implements ICommand{

    @Override
    public Object processCommand(HttpServletRequest req,
          HttpServletResponse resp) throws ServletException, IOException {
          gongjiBoardDao dao = new gongjiBoardDao();
          gongjiBoardDto dto = new gongjiBoardDto();
          HttpSession session = req.getSession();
          System.out.println("gongjipostproc¿¬°á");
          dto.setGongji_subject(req.getParameter("gongji_subject"));
          dto.setGongji_content(req.getParameter("gongji_content"));            
          System.out.println(req.getParameter("gongji_subject"));
          System.out.println(req.getParameter("gongji_content"));
          dao.insertBoard(dto, (String)session.getAttribute("member_id"));
          
          
       return "gongjiboardList.jsp";
    }

 }