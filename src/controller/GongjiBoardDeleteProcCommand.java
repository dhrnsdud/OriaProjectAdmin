package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.gongjiBoardDao;
import model.gongjiBoardDto;


public class GongjiBoardDeleteProcCommand implements ICommand{

    @Override
    public Object processCommand(HttpServletRequest req,
          HttpServletResponse resp) throws ServletException, IOException {
    	
          gongjiBoardDao dao = new gongjiBoardDao();
          gongjiBoardDto dto = new gongjiBoardDto();
          
          System.out.println("deleteproc¡¢º”");
          int gongji_no = Integer.parseInt(req.getParameter("gongji_no"));   
          System.out.println(gongji_no);
          dao.deleteBoard(gongji_no);
          
       return "gongjiboardList.jsp";
    }

 }