<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>

        $(document).ready(function () {
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
       
    </script>
</asp:Content>

