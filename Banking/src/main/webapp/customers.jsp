<%@ page language="java" contentType="text/html" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">



 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body class = "bg-image" style="background-image: url(https://cdn.wallpapersafari.com/3/53/3exP02.gif); height:100vh;">

	<nav class="navbar text-light bg-dark p-3 rounded">
  		<div class="">
    		<a class="navbar-brand text-light" style = "text-decoration: none;" href="home.jsp">
      		<img src="https://internship.thesparksfoundation.info/assests/img/logo.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
     		 TSF Bank
    		</a>
  		</div>

  		<div class="">
  			<ul class="me-5">
  				<a href="home.jsp" class="text-light mx-3" style = "text-decoration: none;" >Home</a>
  				<a href="customers.jsp" class="text-light mx-3" style = "text-decoration: none;">Customers</a>
  				<a href="transfer.jsp" class="text-light mx-3" style = "text-decoration: none;">Transfer</a>
  			</ul>
  		</div>
</nav>

<div class="container-fluid text-light text-center rounded mt-2">

<h1 class="text-dark">Customer details</h1>

</div>

<%

ResultSet result;

try{

try {

		Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch(Exception e) {}

		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking","root","gk06");
		Statement st = cn.createStatement();
		result = st.executeQuery("SELECT * FROM customer"); 
%>


<div class="container mt-4 ">
		<table class="table table-dark table-striped table-hover">
			<thead>
				<tr class="row">
					<th class="col">Name</th>
					<th class="col">Email</th>
					<th class="col">Balance</th>
					<th class="col">View or Transfer</th>
				</tr>
			</thead>
			<tbody>		

		<%

		while(result.next())
		{
			int balance = result.getInt("balance");
			String name = result.getString("name"); 
			String email = result.getString("email");%>


			<tr class="row">

				<td class="col">
					<% out.print(name); %>
				</td>

				<td class="col">
					<% out.print(email); %>
				</td>
				<td class="col">
					<% out.print(balance); %>
				</td>

				<td class="col"><form action="transfer.jsp" method="GET">
					<input type="hidden" name="from_name" value="<%=name%>">
					<button type="submit" class ="btn btn-success" >Transfer / Transactions</button>
				</form></td>
			</tr>
			<%

		}%>
		</tbody>
	</table>
</div>


<%

}catch(Exception e){

}
%>


</body>