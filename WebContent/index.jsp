<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	var xmlHttp;// global instance of XMLHttpRequest
	  function createXmlHttpRequest()
		{
			   if(window.ActiveXObject)
			   {
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			  }

			else if(window.XMLHttpRequest)
			{
				xmlHttp=new XMLHttpRequest();
			 }

		}

	  function onChangeSubmitCallWebServiceAJAX()
		{
		  createXmlHttpRequest();
		  var firstName=document.getElementById("firstName").value;
		  var lastName=document.getElementById("lastName").value;
		  xmlHttp.open("GET","/AJAXServletCallSample/AjaxServlet?firstName="+firstName+"&lastName="+lastName,true)
		  xmlHttp.onreadystatechange=handleStateChange;
		  xmlHttp.send(null);

		}

		function handleStateChange()
		{
			if(xmlHttp.readyState==4)
			{
				if(xmlHttp.status==200)
					{		
						document.getElementById("firstName").value=
							xmlHttp.responseXML.getElementsByTagName("firstName")[0].childNodes[0].nodeValue;
						document.getElementById("lastName").value=
						xmlHttp.responseXML.getElementsByTagName("lastName")[0].childNodes[0].nodeValue;
					}
				else
				{
				   alert("Error loading pagen"+ xmlHttp.status +":"+xmlHttp.statusText);
				}
			}
		}

</script>
</head>
<body>

First Name: <input type="text" value="first" id="firstName"><br>
Last Name: <input type="text" value="Last" id="lastName"><br>
<input type="Submit" onclick="onChangeSubmitCallWebServiceAJAX();">

</body>
</html>