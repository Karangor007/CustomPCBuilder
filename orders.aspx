<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>

        $(document).ready(function () {

            $('#pcPartsTb').DataTable();
            $('#customPCTb').DataTable();
            $('#preBuiltTb').DataTable();

            getData();
            var obj = function () {
                this.demoAlert = function () {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Please Login First!'

                    })
                }

                this.demoRedirect = function () {
                    window.location.replace("Default.aspx");
                }
            }

            function checkLogin() {
                //admin/utility.aspx
                var demoObj = new obj();
                $.ajax({
                    type: "POST",
                    url: "admin/utility.aspx/getClientUser",
                    data: '{}',
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        //console.log(data);                    
                        var result = JSON.parse(data.d)
                        console.log(result);
                        $.each(result, function (i, data) {
                            console.log(data.clientuser);
                            if (data.clientuser == null) {
                                //alert('Please Login First');                            
                                swalAlert();
                                //setTimeout(function () {
                                //    //alert('Please Login First');
                                //    window.location.replace("Default.aspx");
                                //},1400)                            
                            }

                        });
                    }
                });
            }

            // Redirect
            function redirectToHome() {
                window.location.replace("Default.aspx");
            }

            // alert
            function swalAlert() {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please Login First!'

                }).then(function () {
                    redirectToHome();
                })
            }

            checkLogin();
        });
        getCartData();
        // get Cart Data
        function getCartData() {
            $.ajax({
                type: "POST",
                url: "admin/utility.aspx/getCartDataCount",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var result = JSON.parse(data.d)
                    console.log('Cart Data');
                    //console.log(result);
                    $.each(result, function (i, data) {
                        console.log(data.Cart_Data_Count);

                    });
                }
            });
        }

        // Redirect Obj

        function getData() {

            var obj = JSON.parse(sessionStorage.getItem("lastname"));
            if (obj != null) {
                $("#userTb").dataTable().fnDestroy();
                $.each(obj, function (i, data) {
                    var tableData = `
                            <tr>
                               <td>${++i}</td>
                               <td>${data.item}</td>
                               <td>${data.itemType}</td>
                               <td>${data.itemPrice}</td>
                               <td><button class ="btn btn-danger btn-md">Delete</button></td>
                            </tr>
                        `;
                    $('#userTbBody').append(tableData);
                });

            }
        }

    </script>

    
    

    <%--Shopping Content--%>
    
    <section class="instagram-post-section spad">
        <%-- PC Parts --%>
        <div class="section-title container">
            <h5>PC Parts</h5>
        </div>
        <%-- List --%>

        <div class="container">
            <div class="row">

                <div class="col-lg-7">
                    <div class="card bg-dark text-white">
                        <div class="card-body">
                            <table id="pcPartsTb" class="table table-dark table-striped  ">
                                <thead>
                                    <tr>
                                        <th>Sr No.</th>
                                        <th>Product</th>
                                        <th>Type</th>
                                        <th>Price</th>
                                        
                                        <th>Delete</th>
                                    </tr>

                                </thead>
                                <tbody id="pcPartsTbBody">
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%-- Pre Built PC --%>
         <div class="section-title container mt-4">
            <h5>Pre Built PC</h5>
        </div>
        <%-- List --%>

        <div class="container">
            <div class="row">

                <div class="col-lg-7">
                    <div class="card bg-dark text-white">
                        <div class="card-body">
                            <table id="preBuiltTb" class="table table-dark table-striped  ">
                                <thead>
                                    <tr>
                                        <th>Sr No.</th>
                                        <th>Product</th>
                                        <th>Type</th>
                                        <th>Price</th>
                                        
                                        <th>Delete</th>
                                    </tr>

                                </thead>
                                <tbody id="preBuiltTbBody">
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%-- Custom Built PC --%>
         <div class="section-title container mt-4">
            <h5>Custom Built PC</h5>
        </div>
        <%-- List --%>

        <div class="container">
            <div class="row">

                <div class="col-lg-7">
                    <div class="card bg-dark text-white">
                        <div class="card-body">
                            <table id="customPCTb" class="table table-dark table-striped">
                                <thead>
                                    <tr>
                                        <th>Sr No.</th>
                                        <th>Product</th>
                                        <th>Type</th>
                                        <th>Price</th>
                                        
                                        <th>Delete</th>
                                    </tr>

                                </thead>
                                <tbody id="customPCTbBody">
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
       

    </section>

</asp:Content>

