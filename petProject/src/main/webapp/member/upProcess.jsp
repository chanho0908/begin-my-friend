<%@page import="java.io.File"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="pet.PetDTO"%>
<%@page import="pet.PetDAO"%>
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
	
	String userID = (String)session.getAttribute("userID");
	String path = new PetDAO().getImage(userID);
	boolean isDel = false;
	
	String uploadedFileName = request.getRealPath("/upload/myPetImage/") + path;
    File realFile = new File(uploadedFileName);  //파일객체 생성

    isDel = realFile.delete(); //boolean type 리턴
    
	String uploadpath = request.getRealPath("/upload/myPetImage");
	int maxSize = 1024 * 1024 * 100;
	String encoding = "UTF-8";
	
	try{
		MultipartRequest mr = new MultipartRequest(request, uploadpath, maxSize, encoding, new DefaultFileRenamePolicy());
		
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
		System.out.println("upload complete. : " + og);
		
		new PetDAO().update(petName, petBirth, breed, petWeight, og, info, userID);
	
		
		}catch(Exception e){e.printStackTrace();}
			
		PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("location.href = 'myPet.jsp'");
	    script.println("</script>");	
	%>
</body>
</html>