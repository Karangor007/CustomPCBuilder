<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="custompc.aspx.cs" Inherits="custompc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <style>
        /*.svg {
            max-width: 30% !important;
        }

            .svg:hover {
                transform: skew(-15deg);
            }*/
    </style>
    <script>
        $(document).ready(function () {
            
          


            secondFourHide();

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
            //$(document).ready(function (e) {
            //    $(".img-check").click(function () {
            //        $(this).toggleClass("check");
            //    });
            //});
            $(".image-checkbox").each(function () {
                if ($(this).find('input[type="checkbox"]').first().attr("checked")) {
                    $(this).addClass('image-checkbox-checked');
                }
                else {
                    $(this).removeClass('image-checkbox-checked');
                }
            });

            // sync the state to the input
            function getCheckBox() {
                //myCheckBoxClass
                var check = $('.checkClass');
                $('.checkClass').prop('disabled', true);
                console.log(check)
            }

            getCheckBox();
        });
        function secondFourHide() {
            var secondFour = $('.secondFour');
            console.log(secondFour);
            secondFour.hide();
        }
        

        function getCheckBoxDemo() {
            //myCheckBoxClass
            $('.checkClass').prop('disabled', true);
            console.log($('.checkClass'))
        }


        function secondFourShow() {
            var secondFour = $('.secondFour');
            var firstFive = $('.firstFive');
            console.log(secondFour);
            firstFive.hide();
            secondFour.show();
        }
    </script>
    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="card bg-dark">
                        <div class="card-body">
                            <button class="btn btn-outline-danger " onclick="">Show</button>
                            <%--<ul>
                                <li >
                                    <input type="checkbox" id="myCheckbox1" class="myCheckBoxClass" />
                                    <label for="myCheckbox1" class="checkClass" >
                                        <img src="assets/images/pc1.jpg" /></label>
                                </li>
                                <li >

                                    <input type="checkbox" id="myCheckbox2" class="myCheckBoxClass" />
                                    <label for="myCheckbox2" class="checkClass " >
                                        <img src="http://tech21info.com/admin/wp-content/uploads/2013/03/chrome-logo-200x200.png" /></label>
                                </li>
                                <li >


                                    <input type="checkbox" id="myCheckbox3" class="myCheckBoxClass" />
                                    <label for="myCheckbox3" class="checkClass" >
                                        <img src="http://www.thebusinessofsports.com/wp-content/uploads/2010/10/facebook-icon-200x200.png" /></label>
                                </li>
                            </ul>--%>
                        </div>
                        <div class="card-footer">
                            
                        </div>
                    </div>
                </div>


            </div>

        </div>

    </section>

</asp:Content>

