<%@ Page Title="" Language="C#" MasterPageFile="adminMaster.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script>
        
        $(document).ready(function(){
            //userTb
            getData();
        });

        function getData()
        {
            // Destroy Datatable
            $("#userTb").dataTable().fnDestroy();

            $.ajax({
                type : "POST",
                url :"Registration.aspx/getData",
                data : '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success : function(data){
                    //console.log(data);
                    var userData = $('#userTb tbody');
                    userData.empty();
                    var result = JSON.parse(data.d)
                    var i = 0;
                    var table = '';

                    $.each(result, function (i, emp) {
                        i++;
                        //console.log(emp);
                        var fullName = emp.fname+ ' ' + emp.lname;
                        table += '<tr><td>' + i + '</td><td>' + emp.usrname + '</td><td>' + fullName + '</td><td>' + emp.email + '</td><td>' + emp.contact + '</td><td>' + emp.address + '</td>';
                        if (emp.isActive == "1") {
                            table += '<td><label class="badge badge-success pt-2 pb-2 pl-3 pr-3">Active</label></td>';
                        }
                        else {
                            table += '<td><label class="badge badge-danger pt-2 pb-2 pl-3 pr-3">Deactive</label></td>';
                        }
                        table += '<td> <button class="btn btn-success"  onclick="update('+emp.user_id+')">Edit</button></td>';
                        table += '<td><button class="btn btn-danger" onclick="deleteData('+emp.user_id+')">Delete</button></td></tr>';
                    });

                    userData.append(table);
                    $('#userTb').DataTable();
                }
            });
        }

        function deleteFunc(id)
        {
            $.ajax({
                type : "POST",
                url :"Registration.aspx/deleteUser",
                data : '{id:"'+id+'"}',                
                contentType: "application/json"
            }).done(function(res){
                Swal.fire('Record Has Been Deleted!', '', 'success')
                getData();
            });


            
        }

        function deleteData(id)
        {
            
            // Confirmation
            Swal.fire({
                title: 'Do you want To Delete This Record?',
                
                showCancelButton: true,
                confirmButtonText: `Yes`,
                
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {

                deleteFunc(id);

                
        } else if (result.isDenied) {
            Swal.fire('Changes are not saved', '', 'info')
        }
        })

        }

        function  update(id)
        {
            $('#largeModal').modal('show');
            $('#mdTitle').html('Update User');
            $('#btnSubmit').html('Update');
            //hdfId
            $('#hdfId').val(id);

            $.ajax({
                type : "POST",
                url :"Registration.aspx/getData",
                data : '{id:"'+id+'"}',                
                contentType: "application/json"
            }).done(function (res) {
                //alert(res);
                //$('#largeModal').modal('hide');
                //clear();
                //Swal.fire({
                //    icon: 'success',
                //    title: 'Success',
                //    text: 'Record Has Been Saved!',
                        
                //})
                //getData();
                var result = JSON.parse(res.d);
                console.log(result);
                for(var data of result)
                {
                    //console.log(val);
                $('#txtFirstName').val(data.fname)
                $('#txtLastName').val(data.lname)
                $('#txtUserName').val(data.usrname)
                $('#txtPassword').val(data.password)
                $('#txtEmail').val(data.email)
                $('#txtContact').val(data.contact)
                    //var dob = $('#ddlDob').val();
                $('#selectUserType').val(data.type)
                $('#txtAddress').val(data.address)

                 if(data.isActive == "1")
                {
                    $("#chbActive ").prop("checked", true);
                }
            else
            {
                      $("#chbActive ").prop("checked", false);
            }

            }
    
        });

        //console.log(id);
        }

        function clear()
        {
            $('#txtFirstName').val('')
            $('#txtLastName').val('')
            $('#txtUserName').val('')
            $('#txtPassword').val('')
            $('#txtEmail').val('')
            $('#txtContact').val('')
            //var dob = $('#ddlDob').val();
            $('#selectUserType').val('')
            $('#txtAddress').val('')
            $('#txtConfPassword').val('')
            

            //console.log('Clear Func')
        }

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

        function addNew()
        {
            $('#largeModal').modal('show');
            $('#mdTitle').html('Add User');
            $('#btnSubmit').html('Submit');
            //hdfId
            clear();
            $("#chbActive ").prop("checked", 1);
            $('#hdfId').val('');
            //console.log(id);
        }

        function Save()
        {
            //alert('Button Cliked');
            var id = $('#hdfId').val() == '' ? '' : $('#hdfId').val();

            var chkValid = checkValidation();
            var checkPassValid = checkPassword(); 
            //var checkUserType = chkSelect();
            //console.log(val);
            var checkFlag = chkValid === checkPassValid;
            if(checkFlag)
            {
                // Values
                var fname = $('#txtFirstName').val();
                var lname = $('#txtLastName').val();
                var username = $('#txtUserName').val();
                var password = $('#txtPassword').val();
                var email = $('#txtEmail').val();
                var contact = $('#txtContact').val();
                //var dob = $('#ddlDob').val();
                var userType = $('#selectUserType').val();
                var address = $('#txtAddress').val();
                var isActive = "1";
                //mdTitle

                if($('#chbActive').prop('checked') == true)
                {
                    isActive = "1";
                }
                else
                {
                    isActive = "0";
                }

                //console.log($('#mdTitle').html());
                var mode = '';
                if($('#mdTitle').html() == 'Add User')
                {
                    mode = 'insert';
                }
                else
                {
                    mode = 'update';
                }

                //string fname,string lname,string username,string password,string email,
                //string contact,DateTime dob,
                //string address,string usertype,string isActive
                $.ajax({
                    type: "POST",
                    url: "Registration.aspx/insertUpdateData",
                    data: '{mode:"'+mode+'",fname:"'+fname+'",lname:"'+lname+'",username:"'+username+'",password:"'+password+'",email:"'+email+'",contact:"'+contact+'",address:"'+address+'",usertype:"'+userType+'",isActive:"'+isActive+'",id:"'+id+'"}',
                    contentType: "application/json"
                }).done(function (res) {
                    //alert(res);
                    $('#largeModal').modal('hide');
                    clear();
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: 'Record Has Been Saved!',
                        
                    })
                    getData();

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

    
        

        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">


                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body row">
                                    <div class="col-md-8">
                                        <h3 class="text-dark ">User Master</h3>
                                    </div>
                                    <div class="col-md-4">
                                        <button type="button" class="btn btn-primary mb-1" onclick="addNew()">
                                        Add New User
                                    </button>
                                    </div>
                                    
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
                                        <input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">
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
                                        <input type="text" id="txtUserName" name="txtUserName" placeholder="Enter UserName" class="form-control valid">
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

                                            <option value="User">User</option>
                                            <option value="Admin">Admin</option>

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
                                                    <input type="checkbox" id="chbActive" name="chbActive" class="form-check-input">
                                                </label>
                                            </div>


                                        </div>
                                    </div>
                                </div>


                            </form>
                        </div>
                        <div class="card-footer">
                            <button id="btnSubmit" class="btn btn-primary btn-lg" onclick="Save()">
                                <i class="fa fa-dot-circle-o"></i>Submit
                            </button>
                            <button id="btnReset" class="btn btn-danger btn-lg" onclick="clear()">
                                <i class="fa fa-ban"></i>Reset
                            </button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <input type="hidden" name="hdfId" id="hdfId" />
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
