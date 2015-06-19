package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.freeBoardDao;
import model.freeBoardDto;
import model.memberDao;
import model.memberDto;
import model.reservationDao;
import model.reservationDto;

public class ReservationCommand implements ICommand{

      @Override
      public Object processCommand(HttpServletRequest req,
            HttpServletResponse resp) throws ServletException, IOException {
            req.setCharacterEncoding("euc-kr");
            String member_name = req.getParameter("member_name_reservation");
            String member_phone = req.getParameter("member_phone_reservation");
            String content = req.getParameter("content");
            int business_no = Integer.parseInt(req.getParameter("business_no"));
            System.out.println(member_name+","+member_phone+","+content+","+business_no);
            reservationDto dto = new reservationDto();
            memberDao mdao= new memberDao();
            memberDto mdto = new memberDto();

            mdto = mdao.getMember(member_name);
            System.out.println(business_no+"회사번호"+mdto.getMember_no()+"회원번호"+content+"내용");
            dto.setBusiness_no(business_no);
            dto.setMember_no(mdto.getMember_no());
            dto.setReser_content(content);
            reservationDao dao = new reservationDao();
            dao.insertReservation(dto);
            
         return "Main.jsp";
      }

   }