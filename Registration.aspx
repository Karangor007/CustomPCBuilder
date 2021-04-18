<%@ Page Title="" Language="C#" MasterPageFile="adminMaster.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script>
        

        //$(document).ready(function () {
        //    var btnSubmit = document.querySelector('#btnSubmit');
        //    //console.log(btnSubmit);
        //    btnSubmit.addEventListener('click', function () {
        //        //alert('Clicked');

        //        $.ajax({
        //            type: "POST",
        //            url: "Registration.aspx/insertUpdateData",
        //            data: '{demo:"DemoString"}',
        //            contentType: "application/json",
        //            success: function (result) {
        //                //$("#div1").html(result);
        //                alert(result);
        //            }
        //        });

        //    });
        //});

        $(document).ready(function(){
            //userTb
            $('#userTb').DataTable();
        });

        function checkValidation()
        {
            var flag = true;
            var validElm = $('.valid');
            //console.log(validElm);
            for(var el of validElm)
            {
                //console.log(el);
                if(el.value == '' || el.value == null)
            {
                    flag = false;
                    Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Please Fill Username , Password and Confirm Password',
                
            })
        }
           

        }
          return flag;
        }

        function checkPassword()
        {
            var passFlag = true;
            //alert();
            //console.log('Checking Password');
            var password = $('#txtPassword').val();
            var confPassword = $('#txtConfPassword').val();
            //console.log('Password:'+password + 'Confirm Password:'+confPassword);
            if(confPassword == password)
            {
                console.log('Password Match');
                passFlag = true;
            }
            else
            {
                //console.log('Password Does Not Match');
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Password Does Not Match',
                
                })
                passFlag = false;
            }
            return passFlag;

        }

        function chkSelect()
        {
            var selectFlag = false;
            var userSelect = $('#selectUserType').val();

            if(userSelect == 'Select Type')
            {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please Select a User Type',
                
                })
                selectFlag = false;
            }
            else
            {
                selectFlag = true;
            }

            return selectFlag;
        }

        function Save()
        {
            //alert('Button Cliked');

            var chkValid = checkValidation();
            var checkPassValid = checkPassword(); 
            //var checkUserType = chkSelect();
            //console.log(val);
            var checkFlag = chkValid === checkPassValid;
            if(checkFlag)
            {
                // Values
                var fname = $('#txtFirstname').val();
                var lname = $('#txtLastname').val();
                var username = $('#txtUsername').val();
                var password = $('#txtPassword').val();
                var email = $('#txtEmail').val();
                var contact = $('#txtContact').val();
                var dob = $('#ddlDob').val();
                var userType = $('#selectUserType').val();
                var address = $('#txtAddress').val();
                var isActive = $('#chbActive').val();


                //string fname,string lname,string username,string password,string email,
                //string contact,DateTime dob,
                //string address,string usertype,string isActive
                $.ajax({
                    type: "POST",
                    url: "Registration.aspx/insertUpdateData",
                    data: '{fname:"'+fname+'",lname:"'+lname+'",username:"'+username+'",password:"'+password+'",email:"'+email+'",contact:"'+contact+'",dob:"'+dob+'",address:"'+address+'",usertype:"'+userType+'",isActive:"'+isActive+'"}',
                    contentType: "application/json"
                }).done(function (res) {
                    alert(res);
                    //console.log(res);
                });
            }

            //$.ajax({
            //    type: "POST",
            //    url: "Registration.aspx/insertUpdateData",
            //    data: '{demo:"demostring"}',
            //    contentType: "application/json"
            //}).done(function (res) {
            //    //alert(res);
            //    console.log(res);
            //});

        }

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
                                <div class="card-body">
                                    <button type="button" class="btn btn-primary mb-1" data-toggle="modal" data-target="#largeModal">
                                        Add New User
                                    </button>
                                </div>
                            </div>


                        </div>
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <table id="userTb" class="table table-striped table-bordered table-responsive">
                                        <thead>
                                            <tr>
                                                <th>Sr No.</th>
                                                <th>Username</th>
                                                <th>Full Name</th>
                                                <th>Email</th>
                                                <th>Contact</th>
                                                <th>Address</th>
                                                <th>Active</th>
                                                <th>Update</th>
                                                <th>Delete</th>
                                            </tr>

                                        </thead>
                                        <tbody id="userTbBody">
                                            <%--<tr>
                                                <td>1</td>
                                                <td>Karan@123</td>
                                                <td>Karan Rajgor</td>
                                                <td>Karan@gmail.com</td>
                                                <td>7894561231</td>
                                                <td>Demo Address</td>
                                                <td><label class="btn btn-danger">Deactive</label></td>
                                                <td><button class="btn btn-success" data-toggle="modal" data-target="#largeModal">Edit</button></td>
                                                <td><button class="btn btn-danger">Delete</button></td>
                                            </tr>--%>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- Modal --%>
    <div class="modal fade" id="largeModal" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="mdTitle">Add User</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="card">
                        <div class="card-header">
                            <strong>User Registration</strong>
                        </div>
                        <div class="card-body card-block">
                            <form action="#" method="post" enctype="multipart/form-data" class="form-horizontal">

                                <%-- First Name --%>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="txtFirstname" class=" form-control-label">First Name</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="txtFirstname" name="text-input" placeholder="Enter First Name" class="form-control">
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
                                        <input type="text" id="txtUserName" name="txtUserName" placeholder="Enter Last Name" class="form-control valid">
                                    </div>
                                </div>
                                <%-- Password --%>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="txtPassword" class=" form-control-label">Password</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="password" id="txtPassword" name="txtPassword" placeholder="Enter Password" class="form-control valid" onchange="checkPassword()">
                                    </div>
                                </div>
                                <%-- Confirm Password --%>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="txtConfPassword" class=" form-control-label">Confirm Password</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="password" id="txtConfPassword" name="txtConfPassword" placeholder="Enter Confirm Password" class="form-control valid" onchange="checkPassword()">
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
                                        <input type="text" id="txtContact" name="txtContact" placeholder="Enter Contact Number" class="form-control">
                                        <small class="help-block form-text">Please enter your email</small>
                                    </div>
                                </div>
                                <%-- DOB --%>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="ddlDob" class=" form-control-label">D.O.B</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="ddlDob" name="" placeholder="Select a Date" class="form-control">
                                        <small class="help-block form-text">Please Select D.O.B.</small>
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
                            <button id="btnSubmit" class="btn btn-primary btn-sm" onclick="Save()">
                                <i class="fa fa-dot-circle-o"></i>Submit
                            </button>
                            <button type="reset" id="btnReset" class="btn btn-danger btn-sm">
                                <i class="fa fa-ban"></i>Reset
                            </button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $("#ddlDob").flatpickr();
        });
    </script>
</asp:Content>
