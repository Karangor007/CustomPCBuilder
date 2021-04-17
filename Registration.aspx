<%@ Page Title="" Language="C#" MasterPageFile="adminMaster.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <script>
        

        $(document).ready(function () {
            var btnSubmit = document.querySelector('#btnSubmit');
            //console.log(btnSubmit);
            btnSubmit.addEventListener('click', function () {
                //alert('Clicked');

                $.ajax({
                    type: "POST",
                    url: "Registration.aspx/insertUpdateData",
                    data: '{Mode:"DemoString" }',
                    contentType: "application/json",
                    success: function (result) {
                        //$("#div1").html(result);
                        alert(result);
                    }
                });

            });
        });

    </script>

    <div class="page-container">
        <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <form class="form-header" action="#" method="POST">
                                <input class="au-input au-input--xl" type="text" name="search" placeholder="Search for datas &amp; reports..." />
                                <button class="au-btn--submit" type="submit">
                                    <i class="zmdi zmdi-search"></i>
                                </button>
                            </form>
                            <div class="header-button">
                                <div class="noti-wrap">
                                    <div class="noti__item js-item-menu">
                                        <i class="zmdi zmdi-comment-more"></i>
                                        <span class="quantity">1</span>
                                        <div class="mess-dropdown js-dropdown">
                                            <div class="mess__title">
                                                <p>You have 2 news message</p>
                                            </div>
                                            <div class="mess__item">
                                                <div class="image img-cir img-40">
                                                    <img src="images/icon/avatar-06.jpg" alt="Michelle Moreno" />
                                                </div>
                                                <div class="content">
                                                    <h6>Michelle Moreno</h6>
                                                    <p>Have sent a photo</p>
                                                    <span class="time">3 min ago</span>
                                                </div>
                                            </div>
                                            <div class="mess__item">
                                                <div class="image img-cir img-40">
                                                    <img src="images/icon/avatar-04.jpg" alt="Diane Myers" />
                                                </div>
                                                <div class="content">
                                                    <h6>Diane Myers</h6>
                                                    <p>You are now connected on message</p>
                                                    <span class="time">Yesterday</span>
                                                </div>
                                            </div>
                                            <div class="mess__footer">
                                                <a href="#">View all messages</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="noti__item js-item-menu">
                                        <i class="zmdi zmdi-email"></i>
                                        <span class="quantity">1</span>
                                        <div class="email-dropdown js-dropdown">
                                            <div class="email__title">
                                                <p>You have 3 New Emails</p>
                                            </div>
                                            <div class="email__item">
                                                <div class="image img-cir img-40">
                                                    <img src="images/icon/avatar-06.jpg" alt="Cynthia Harvey" />
                                                </div>
                                                <div class="content">
                                                    <p>Meeting about new dashboard...</p>
                                                    <span>Cynthia Harvey, 3 min ago</span>
                                                </div>
                                            </div>
                                            <div class="email__item">
                                                <div class="image img-cir img-40">
                                                    <img src="images/icon/avatar-05.jpg" alt="Cynthia Harvey" />
                                                </div>
                                                <div class="content">
                                                    <p>Meeting about new dashboard...</p>
                                                    <span>Cynthia Harvey, Yesterday</span>
                                                </div>
                                            </div>
                                            <div class="email__item">
                                                <div class="image img-cir img-40">
                                                    <img src="images/icon/avatar-04.jpg" alt="Cynthia Harvey" />
                                                </div>
                                                <div class="content">
                                                    <p>Meeting about new dashboard...</p>
                                                    <span>Cynthia Harvey, April 12,,2018</span>
                                                </div>
                                            </div>
                                            <div class="email__footer">
                                                <a href="#">See all emails</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="noti__item js-item-menu">
                                        <i class="zmdi zmdi-notifications"></i>
                                        <span class="quantity">3</span>
                                        <div class="notifi-dropdown js-dropdown">
                                            <div class="notifi__title">
                                                <p>You have 3 Notifications</p>
                                            </div>
                                            <div class="notifi__item">
                                                <div class="bg-c1 img-cir img-40">
                                                    <i class="zmdi zmdi-email-open"></i>
                                                </div>
                                                <div class="content">
                                                    <p>You got a email notification</p>
                                                    <span class="date">April 12, 2018 06:50</span>
                                                </div>
                                            </div>
                                            <div class="notifi__item">
                                                <div class="bg-c2 img-cir img-40">
                                                    <i class="zmdi zmdi-account-box"></i>
                                                </div>
                                                <div class="content">
                                                    <p>Your account has been blocked</p>
                                                    <span class="date">April 12, 2018 06:50</span>
                                                </div>
                                            </div>
                                            <div class="notifi__item">
                                                <div class="bg-c3 img-cir img-40">
                                                    <i class="zmdi zmdi-file-text"></i>
                                                </div>
                                                <div class="content">
                                                    <p>You got a new file</p>
                                                    <span class="date">April 12, 2018 06:50</span>
                                                </div>
                                            </div>
                                            <div class="notifi__footer">
                                                <a href="#">All notifications</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="image">
                                            <img src="images/icon/avatar-01.jpg" alt="John Doe" />
                                        </div>
                                        <div class="content">
                                            <a class="js-acc-btn" href="#">john doe</a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">
                                                <div class="image">
                                                    <a href="#">
                                                        <img src="images/icon/avatar-01.jpg" alt="John Doe" />
                                                    </a>
                                                </div>
                                                <div class="content">
                                                    <h5 class="name">
                                                        <a href="#">john doe</a>
                                                    </h5>
                                                    <span class="email"><a href="https://colorlib.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="d2b8bdbabcb6bdb792b7aab3bfa2beb7fcb1bdbf">[email&#160;protected]</a></span>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__body">
                                                <div class="account-dropdown__item">
                                                    <a href="#">
                                                        <i class="zmdi zmdi-account"></i>Account
                                                    </a>
                                                </div>
                                                <div class="account-dropdown__item">
                                                    <a href="#">
                                                        <i class="zmdi zmdi-settings"></i>Setting
                                                    </a>
                                                </div>
                                                <div class="account-dropdown__item">
                                                    <a href="#">
                                                        <i class="zmdi zmdi-money-box"></i>Billing
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="account-dropdown__footer">
                                                <a href="#">
                                                    <i class="zmdi zmdi-power"></i>Logout
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">


                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <strong>User Registration</strong> 
                                </div>
                                <div class="card-body card-block">
                                    <form action="#" method="post" enctype="multipart/form-data" class="form-horizontal">
                                        
                                        <%-- First Name --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtFname" class=" form-control-label">First Name</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <input type="text" id="txtFname" name="text-input" placeholder="Enter First Name" class="form-control">
                                                
                                            </div>
                                        </div>
                                        <%-- Last Name --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtLastName" class=" form-control-label">Last Name</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <input type="text" id="txtLastName" name="text-input" placeholder="Enter Last Name" class="form-control">
                                                
                                            </div>
                                        </div>
                                        <%-- UserName --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtUserName" class=" form-control-label">Username</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <input type="text" id="txtUserName" name="text-input" placeholder="Enter Last Name" class="form-control">
                                                
                                            </div>
                                        </div>
                                        <%-- Password --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtPassword" class=" form-control-label">Password</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <input type="password" id="txtPassword" name="text-input" placeholder="Enter Password" class="form-control">
                                                
                                            </div>
                                        </div>
                                        <%-- Confirm Password --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtConfPassword" class=" form-control-label">Confirm Password</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <input type="password" id="txtConfPassword" name="text-input" placeholder="Enter Confirm Password" class="form-control">
                                                
                                            </div>
                                        </div>
                                        <%-- Email --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtEmail" class=" form-control-label">Email Address</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <input type="email" id="txtEmail" name="email-input" placeholder="Enter Email" class="form-control">
                                                <small class="help-block form-text">Please enter your email</small>
                                            </div>
                                        </div>
                                        <%-- Contact --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtContact" class=" form-control-label">Contact No.</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <input type="email" id="txtContact" name="email-input" placeholder="Enter Contact Number" class="form-control">
                                                <small class="help-block form-text">Please enter your email</small>
                                            </div>
                                        </div>
                                         <%-- DOB --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtDob" class=" form-control-label">D.O.B</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <input type="text" id="txtDob" name="" placeholder="Select a Date" class="form-control">
                                                <small class="help-block form-text">Please enter your email</small>
                                            </div>
                                        </div>

                                        
                                        
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtAddress" class=" form-control-label">Address</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <textarea name="txtAddress" id="txtAddress" rows="9" placeholder="Enter Address Here" class="form-control"></textarea>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="selectUserType" class=" form-control-label">User Type</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <select name="selectUserType" id="selectUserType" class="form-control">
                                                    <option value="0">Select Type</option>
                                                    <option value="1">User</option>
                                                    <option value="2">Admin</option>
                                                    
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label class=" form-control-label">Active</label>
                                            </div>
                                            <div class="col col-md-9">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <label for="chbActive" class="form-check-label ">
                                                            <input type="checkbox" id="chbActive" name="chbActive" value="1" class="form-check-input">
                                                        </label>
                                                    </div>
                                                    
                                                    
                                                </div>
                                            </div>
                                        </div>
                                        
                                        
                                    </form>
                                </div>
                                <div class="card-footer">
                                    <button id="btnSubmit" class="btn btn-primary btn-sm">
                                        <i class="fa fa-dot-circle-o"></i>Submit
                                    </button>
                                    <button type="reset" id="btnReset" class="btn btn-danger btn-sm">
                                        <i class="fa fa-ban"></i>Reset
                                    </button>
                                </div>
                            </div>

                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $("#txtDob").flatpickr();
        });
    </script>
</asp:Content>

