package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.gongjiBoardDao;



public class GongjiBoardSearchCommand implements ICommand{

   @Override
   public Object processCommand(HttpServletRequest req,
         HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
      System.out.println("GongjiBoardSearchCommand¿¬°á");
      
      gongjiBoardDao dao = new gongjiBoardDao();
      
       String keyWord = req.getParameter("keyWord");
       String keyField =req.getParameter("keyField");
       

        dao.getBoardList(keyField, keyWord);       
        
      
      return "gongjiboardList.jsp";
      
   }

}