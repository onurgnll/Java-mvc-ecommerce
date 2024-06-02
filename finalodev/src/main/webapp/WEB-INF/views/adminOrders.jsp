<%@include file="navbar.jsp" %> <%@page contentType="text/html"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />

    <style type="text/css">
      body {
        font-family: Arial, sans-serif !important;
        background-color: #f0f0f0 !important;
      }
      img{
      	height: 20vh;
		object-fit: cover;
		object-position: center;
		border-radius:15px;
      }
    </style>
  </head>
  <body>
  		<div class="d-flex justify-content-center">
  		
    <div class="d-flex justify-content-between align-items-center my-4 ms-3 " style="height: 20vh; width: 85%; background-color:#E5EDF2; border-radius:15px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);" >
   			<div style="">
   			<img alt="" src="https://iis-akakce.akamaized.net/p.x?%2F%2Fcdn.dsmcdn.com%2Fty1256%2Fproduct%2Fmedia%2Fimages%2Fprod%2FPIM%2F20240413%2F12%2F568b04ff-510d-48ca-bbdc-78e977e4b0c6%2F1_org_zoom.jpg"></div>
   			<span>{Ürün adı} siparişiniz var.</span>
   			<div class="me-5">
   			<button type="button" class="btn btn-success px-4">Onayla</button>
   			<button type="button" class="btn btn-danger px-4">Reddet</button>
   			</div>
    </div>
    </div>
  </body>
</html>

</body>
</html>