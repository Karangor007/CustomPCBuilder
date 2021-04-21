﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>-- Login Here --</title>

    <meta charset="UTF-8">
    <%--<link href="admin/css/font-face.css" rel="stylesheet" />--%>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">
    <link href="admin/css/font-face.css" rel="stylesheet" media="all">
    <link href="admin/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="admin/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="admin/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="admin/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">
    <link href="admin/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="admin/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="admin/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="admin/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="admin/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="admin/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="admin/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.24/datatables.min.css" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="admin/css/theme.css" rel="stylesheet" media="all">

    <script src="admin/vendor/jquery-3.2.1.min.js"></script>

</head>
<body>

    <script>

        $(document).ready(function () {
            function demo() {
                Swal.fire('It Worked!', '', 'success')
            }
        });

        
    </script>

    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <%--<div class="container mt-4">
            <div class="row">
                <div class="col-md-12 mx-auto">
                    <div class="card">

                        <div class="card-body">
                            <div class="row">

                                <div class="col-md-12 mb-2">
                                    <h2 class="text-center text-info display-4">Log In</h2>
                                </div>

                                <div class="form-group col-md-12">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user"></i>
                                        </div>

                                        <asp:TextBox runat="server" placeholder="Enter Username" ID="txtUsername" CssClass="form-control" />
                                    </div>
                                </div>

                                <div class="form-group col-md-12">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-asterisk"></i>
                                        </div>

                                        <asp:TextBox TextMode="Password" runat="server" placeholder="Enter Password" ID="txtPassword" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-actions form-group col-md-12">
                                    
                                            <asp:Button Text="LogIn" runat="server" ID="btnLogin" CssClass="btn btn-success btn-block" OnClick="btnLogin_Click"/>
                                    
                                   
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>--%>

         <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Sign In</h5>
            <%--<form class="form-signin">--%>
              <div class="form-label-group">
                <%--<input type="text" id="txtUser" class="form-control" placeholder="Enter Username" required autofocus>--%>
                  <asp:TextBox CssClass="form-control" ID="txtUser" runat="server" placeholder="Enter Username"/>
                <label for="txtUser">Enter Username</label>
              </div>

              <div class="form-label-group">
                <%--<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>--%>
                  <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" placeholder="Enter Password"/>
                <label for="txtPassword">Enter Password</label>
              </div>

              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Remember password</label>
              </div>
              <%--<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>--%>
                <asp:Button ID="btnLogin" Text="Sign in" CssClass="btn btn-lg btn-primary btn-block text-uppercase" runat="server"  OnClick="btnLogin_Click"/>
              <hr class="my-4">
              <%--<button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button>--%>
            <%--</form>--%>
          </div>
        </div>
      </div>
    </div>
  </div>

        <script src="admin/vendor/bootstrap-4.1/popper.min.js"></script>
        <script src="admin/vendor/bootstrap-4.1/bootstrap.min.js"></script>
        <script src="admin/vendor/slick/slick.min.js">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script src="admin/vendor/wow/wow.min.js"></script>
        <script src="admin/vendor/animsition/animsition.min.js"></script>
        <script src="admin/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
        </script>
        <script src="admin/vendor/counter-up/jquery.waypoints.min.js"></script>
        <script src="admin/vendor/counter-up/jquery.counterup.min.js">
        </script>
        <script src="admin/vendor/circle-progress/circle-progress.min.js"></script>
        <script src="admin/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script src="admin/vendor/chartjs/Chart.bundle.min.js"></script>
        <script src="admin/vendor/select2/select2.min.js">
        </script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.24/datatables.min.js"></script>
        <script src="admin/js/main.js"></script>
    </form>
</body>
</html>
