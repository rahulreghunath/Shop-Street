<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@page import="java.sql.*,javax.sql.*" %>
<%

   File file ;
   String name="",id="",category="",desc="",price="",stock="",discount="",fname="";
    int maxFileSize = 5000 * 1024*3;
   int maxMemSize = 5000 * 1024*3;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");

   // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("../../images"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
       
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println("</head>");
         out.println("<body>");
         while ( i.hasNext () ) 
         {
			
            FileItem fi = (FileItem)i.next();
			 
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath + 
            fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
            file = new File( filePath + 
            fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
			
            //out.println("Uploaded Filename: " + filePath + 
            //fileName + "<br>");
			//String aa="";
			fname=fileName;
			//out.println("fname: "+fname);
			String ss="y";
			//session.invalidate();
			//response.sendRedirect("yes.jsp?mm="+session.getAttribute("x")+" ");
			
			//Class.forName("com.mysql.jdbc.Driver");
          //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_upload", "root", "");
	 //Statement st=con.createStatement();
          //int j= st.executeUpdate("insert into tbl_file(f_path) values('"+fname+"')");
		  
       //out.println("Data is successfully inserted!");

			//response.sendRedirect("index.jsp");
            }
			else{
				  String name1 = fi.getFieldName();
                  String value = fi.getString();
				  
       		 if( name1.equals("name") )
        	{
            	name = value;
       		 }
				if( name1.equals("id") )
        	{
            	id = value;
       		 }
       		 if( name1.equals("category") )
        	{
            	category= value;
       		 }
       		 if( name1.equals("desc") )
        	{
            	desc = value;
       		 }
       		 if( name1.equals("price") )
        	{
            	price = value;
       		 }
       		 if( name1.equals("stock") )
        	{
            	stock = value;
       		 }
       		 if( name1.equals("discount") )
        	{
            	discount= value;
       		 }
			}
			
         }
         
         
         
        



int status;

Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
 Statement st=c.createStatement();
 status=st.executeUpdate("insert into tbl_products value(NULL,'"+id+"','"+name+"','"+category+"','"+desc+"','"+price+"','"+discount+"','"+stock+"','0','"+fname+"')");
if(status==1)
{
    session.setAttribute("message","Product Added Successfully");
}
else
{
    session.setAttribute("message","Product not added");
}
response.sendRedirect("add_product.jsp");
   }
%>