package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.gongjiBoardDao;
import model.gongjiBoardDto;



public class GongjiBoardUpdateProcCommand implements ICommand{

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		gongjiBoardDao dao = new gongjiBoardDao();
		gongjiBoardDto dto = new gongjiBoardDto();        
        	System.out.println("업뎃프록시연결");
        	
       String gongji_subject = req.getParameter("gongji_subject");
       System.out.println(gongji_subject+"updatecommand subject");
       String gongji_content = req.getParameter("gongji_content");
       int gongji_no = Integer.parseInt(req.getParameter("gongji_no"));
        System.out.println("추가");
        
        
        dao.updateBoard(gongji_subject, gongji_content,gongji_no);
        
     return "gongjiboardRead.jsp";
  }

}