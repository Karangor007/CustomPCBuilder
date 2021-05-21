<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="custompc.aspx.cs" Inherits="custompc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .myCheckBoxClass {
            display: none;
        }

        .checkClass {
        }

        ul {
            list-style-type: none;
        }

        li {
            display: inline-block;
        }

        input[type="radio"][id^="myRadio"] {
            display: none;
        }

        label {
            border: 1px solid #fff;
            padding: 10px;
            display: block;
            position: relative;
            margin: 10px;
            cursor: pointer;
        }

            label:before {
                background-color: white;
                color: white;
                content: " ";
                display: block;
                border-radius: 50%;
                border: 1px solid grey;
                position: absolute;
                top: -5px;
                left: -5px;
                width: 25px;
                height: 25px;
                text-align: center;
                line-height: 28px;
                transition-duration: 0.4s;
                transform: scale(0);
            }

            label img {
                height: 100px;
                width: 100px;
                transition-duration: 0.2s;
                transform-origin: 50% 50%;
            }

        :checked + label {
            border-color: #ddd;
        }

            :checked + label:before {
                content: "✓";
                background-color: grey;
                transform: scale(1);
            }

            :checked + label img {
                transform: scale(0.9);
                /* box-shadow: 0 0 5px #333; */
                z-index: -1;
            }


    </style>
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

        function getCheckBoxDemo() {
            //myCheckBoxClass
             $('.checkClass').prop('disabled', true);
            console.log()
        }

    </script>
    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card bg-dark">
                        <div class="card-body">
                            <ul>
                                <li >
                                    <input type="checkbox" id="myCheckbox1" class="myCheckBoxClass" />
                                    <label for="myCheckbox1" class="checkClass" onclick="getCheckBoxDemo()">
                                        <img src="assets/images/pc1.jpg" /></label>
                                </li>
                                <li >

                                    <input type="checkbox" id="myCheckbox2" class="myCheckBoxClass" />
                                    <label for="myCheckbox2" class="checkClass " onclick="getCheckBoxDemo()">
                                        <img src="http://tech21info.com/admin/wp-content/uploads/2013/03/chrome-logo-200x200.png" /></label>
                                </li>
                                <li >

                                    <input type="checkbox" id="myCheckbox3" class="myCheckBoxClass" />
                                    <label for="myCheckbox3" class="checkClass" onclick="getCheckBoxDemo()">
                                        <img src="http://www.thebusinessofsports.com/wp-content/uploads/2010/10/facebook-icon-200x200.png" /></label>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>


            </div>

        </div>

    </section>

</asp:Content>

