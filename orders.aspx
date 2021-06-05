<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>

        $(document).ready(function () {

            $('#userTb').DataTable();
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

        // Redirect Obj

        function getData() {

            var obj = JSON.parse(sessionStorage.getItem("lastname"));
            if (obj != null) {
                $("#userTb").dataTable().fnDestroy();
                $.each(obj, function (i, data) {
                    var tableData = `
                            <tr>
                               <td>${i}</td>
                               <td>${data.item}</td>
                               <td>${data.itemType}</td>
                               <td>${data.itemPrice}</td>
                               <td>Delete</td>
                            </tr>
                        `;
                    $('#userTbBody').append(tableData);
                });

            }
        }

    </script>



    <%--Shopping Content--%>
    <section class="instagram-post-section spad">
        <div class="section-title">
            <h5>RAM</h5>
        </div>
        <%-- List --%>
        <div class="container">
            <div class="row">

                <div class="col-lg-12">
                    <div class="card bg-dark text-white">
                        <div class="card-body">
                            <table id="userTb" class="table table-dark table-striped table-bordered table-responsive">
                                <thead>
                                    <tr>
                                        <th>Sr No.</th>
                                        <th>Product</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Delete</th>
                                    </tr>

                                </thead>
                                <tbody id="userTbBody">
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>


    </section>

</asp:Content>

