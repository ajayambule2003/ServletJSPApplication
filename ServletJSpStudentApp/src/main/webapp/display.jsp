<%@page import="java.util.Iterator"%>
<%@page import="com.model.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.StudentDAOImpl"%>
<%@page import="com.dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Record</title>
<link rel="stylesheet" href="css/table.css">
</head>
<body>
	<%
	StudentDAO dao = new StudentDAOImpl();
	List<Student> studList = dao.getAllStudents();
	%>

	<table>
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>MARKS</th>
			<th>DELETE</th>
			<th>UPDATE</th>
		</tr>

		<%
		Iterator<Student> itr = studList.iterator();
		while (itr.hasNext()) {
			Student student = itr.next();
		%>

		<tr>
			<td><%=student.getId()%></td>
			<td><%=student.getName()%></td>
			<td><%=student.getMarks()%></td>
			<td>
				<%
				out.print("<a href='StudentDeleteServlet?id=" + student.getId() + "'>" + "DELETE" + "</a>");
				%>
			</td>
			<td>
				<%
				out.print("<a href='StudentUpdateForm?id=" + student.getId() + "'>" + "UPDATE" + "</a>");
				%>
			</td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>