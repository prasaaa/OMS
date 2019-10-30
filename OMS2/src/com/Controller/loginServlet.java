package com.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DatabaseHandle.LoginBean;
import com.DatabaseHandle.LoginDao;
import com.model.CurrentUser;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String emp_email = request.getParameter("emp_email");
		 String emp_password = request.getParameter("emp_password");
		 
		 LoginBean loginBean = new LoginBean();
		 
		 loginBean.setUserName(emp_email);
		 loginBean.setPassword(emp_password);
		 
		 LoginDao loginDao = new LoginDao();
		 
		 try
		 {
		 String userValidate = loginDao.authenticateUser(loginBean);
		 
		 if(userValidate.equals("Admin_Role"))
		 {
		 System.out.println("Admin's Home");
		 
		 HttpSession session = request.getSession(); //Creating a session
		 session.setAttribute("Admin", emp_email); //setting session attribute
		 request.setAttribute("emp_email", emp_email);
		 CurrentUser.setUsername("admin");
		 request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
		
		 }
		 else if(userValidate.equals("Editor_Role"))
		 {
		 System.out.println("Editor's Home");
		 
		 HttpSession session = request.getSession();
		 session.setAttribute("Manager", emp_email);
		 request.setAttribute("emp_email", emp_email);
		 CurrentUser.setUsername("manager");
		 request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
		
		 }
		 
		 else if(userValidate.equals("Accountant"))
		 {
		 System.out.println("Accountant Home");
		 
		 HttpSession session = request.getSession();
		 session.setAttribute("Accountant", emp_email);
		 request.setAttribute("emp_email", emp_email);
		 CurrentUser.setUsername("accountant");
		 request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
		 
		 }
			//user roles add 
		 else
		 {
		 System.out.println("Error message = "+userValidate);
		 request.setAttribute("errMessage", userValidate);
		 
		 request.getRequestDispatcher("login.jsp").forward(request, response);
		 }
		 }
		 catch (IOException e1)
		 {
		 e1.printStackTrace();
		 }
		 catch (Exception e2)
		 {
		 e2.printStackTrace();
		 }
		} //End of doPost()
		}
