package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.freeBoardDao;

public class FreeBoardSearchCommand implements ICommand{

   @Override
   public Object processCommand(HttpServletRequest req,
         HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
      System.out.println("freeBoardSearchCommand¿¬°á");
      
      freeBoardDao dao = new freeBoardDao();
      
       String keyWord = req.getParameter("keyWord");
       String keyField =req.getParameter("keyField");
       System.out.println("keyword11"+keyWord);
       System.out.println("keyfield11"+keyField);
        dao.getBoardList(keyField, keyWord);       
        
      
      return "freeboardList.jsp";
      
   }

}