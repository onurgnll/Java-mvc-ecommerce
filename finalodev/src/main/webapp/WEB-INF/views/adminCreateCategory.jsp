<%@include file="navbar.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>New Category</title>
    <style type="text/css">
      body {
        font-family: Arial, sans-serif !important;
        background-color: #f0f0f0 !important;
        height: 100vh;
      }
      .container5 {
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        display: flex;
        justify-content: center;
        padding-top: 10px;
        padding-bottom: 15px;
      }
      .button1 {
        background-color: #ff1b6b;
        color: white;
        border: none;
        border-radius: 5px;
        width: 150px;
        height: 40px;
        padding: 10px 20px;
        font-size: 18px;
        cursor: pointer;
      }
      .inpdiv {
        display: flex;
        flex-direction: column;
        width: 100%;
      }
      input {
        background-color: #e5edf2;
        border: none;
        padding: 10px;
        margin-bottom: 15px;
        border-radius: 5px;
        outline: none;
      }

      .formm {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-around;
      }
    </style>
     <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <div
      class="h-75 d-flex flex-column justify-content-center align-items-center"
    >
      <div class="container5 p-5">
        <form class="formm" action="/finalodev/admin/newCategories" method="post">
          <div class="inpdiv">
          <span>YENİ KATEGORİ OLUŞTUR</span>
            <input
              type="text"
              id="categoryId"
              name="categoryName"
              required
              placeholder="Yeni Kategori İsmini Giriniz"
            /><br />
          </div>
          <button class="button1" type="submit">Oluştur</button>
        </form>
      </div>
    </div>
  </body>
</html>