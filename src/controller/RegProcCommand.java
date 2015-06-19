package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.memberDao;
import model.memberDto;

public class RegProcCommand implements ICommand {

	@Override
	public Object processCommand(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
			//DB 저장
		boolean check = true;
		memberDao dao = new memberDao();
        memberDto dto = new memberDto();
        dto.setMember_id(req.getParameter("member_id"));
        dto.setMember_pass(req.getParameter("member_pass"));
        dto.setMember_name(req.getParameter("member_name"));
        dto.setMember_phone(req.getParameter("member_phone"));
        dto.setMember_email(req.getParameter("member_email"));
        dto.setMember_gender(req.getParameter("member_gender"));
        
        
        if(check != dao.setRegister(dto)){
        	System.out.println("regProc : ID 중복");
    		req.setAttribute("idCheck", "false");
        	return "/Main.jsp";	
        }        
        System.out.println("regProc : DB회원 추가 완료");
        req.setAttribute("regiId", req.getParameter("member_id"));
        req.setAttribute("regiComplite", "regiComplite");
		return "/Main.jsp";
	}

}
