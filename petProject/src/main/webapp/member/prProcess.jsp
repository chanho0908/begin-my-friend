<%@page import="java.io.PrintWriter"%>
<%@page import="pet.PetDAO"%>
<%@page import="pet.PetDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	request.setCharacterEncoding("utf-8");	
	
	String uploadpath = request.getRealPath("/upload/myPetImage");
	int maxSize = 1024 * 1024 * 100;
	String encoding = "UTF-8";
	
	try{
		MultipartRequest mr = new MultipartRequest(request, uploadpath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String userID = (String)session.getAttribute("userID");
		String petName = mr.getParameter("petName");
		String petBirth = mr.getParameter("petBirth");
		String breed = mr.getParameter("breed");
		String petWeight = mr.getParameter("petWeight");
		String info = mr.getParameter("info");
		
		String fileName = "";
		String og = "";
		
		Enumeration fileNames = mr.getFileNames(); //파일의 이름 반환
		if (fileNames.hasMoreElements()){
			fileName = (String)fileNames.nextElement();
			og = mr.getFilesystemName(fileName);
		}
		System.out.println("이미지를 저장하였습니다. : " + og);
		
		PetDTO dto = new PetDTO(userID, petName, petBirth, breed, petWeight, og, info);
		new PetDAO().insert(dto);
		
	}catch(Exception e){e.printStackTrace();}
		
	PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("location.href = 'myPet.jsp'");
    script.println("</script>");

%>
</body>
</html>