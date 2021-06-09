<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="contactUs.aspx.cs" Inherits="contactss" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .myLoad {
            width: 40px;
            height: 40px;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -13px;
            margin-left: -13px;
            border-radius: 60px;
            animation: loader .8s linear infinite;
            -webkit-animation: loader .8s linear;
        }

        #myLoader {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 999999;
            background: #000;
        }

        #spinLoad {
            position: fixed;
            /*width: 100%;*/
            /*height: 100%;*/
            top: 0;
            left: 0;
            z-index: 999999;
            /*background: #000;*/
        }
    </style>



    <script>

        function timerAlert()
        {
            let timerInterval
            Swal.fire({
                title: 'Please Wait ! Your Response is Being Process...',
                timerProgressBar : true,
                timer: 2000,
                timerProgressBar: true,
                didOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        const content = Swal.getHtmlContainer()
                        if (content) {
                            const b = content.querySelector('b')
                            if (b) {
                                b.textContent = Swal.getTimerLeft()
                            }
                        }
                    }, 100)
                },
                willClose: () => {
                    clearInterval(timerInterval)
                }
            }).then((result) => {
                /* Read more about handling dismissals below */
                if (result.dismiss === Swal.DismissReason.timer) {
                    //console.log('I was closed by the timer')
                }
            })
        }

        function loadSpinner() {           
            timerAlert();
            setTimeout(function () {
                //$('#myLoader').hide();
                Swal.close();
            }, 1000)
            timerAlert();
          
        }

        function showSpinner()
        {
            //$('#myLoader').show();
            timerAlert();
        }

        function hideSpinner()
        {
            //$('#myLoader').hide();
            Swal.close();
        }


        function sendMail() {                       
            var name = $('#txtName').val();
            var email = $('#txtEmail').val();
            var contact = $('#txtContact').val();
            var message = $('#txtMessage').val();            
            var flag = validate(name, email);
            if (flag) {
                
                $.ajax({
                    type: "POST",
                    url: "admin/utility.aspx/sendMail",
                    beforeSend: function(){
                        showSpinner();
                        
                    },
                    data: '{name:"' + name + '",email:"' + email + '",contact:"' + contact + '",message:"' + message + '"}',
                    contentType: "application/json",
                    complete: function () {
                        hideSpinner()
                        Swal.fire({
                            icon: 'success',
                            title: 'Success',
                            text: 'Your Response is Recorded!',
                        })
                    }
                }).done(function (res) {
                    let obj = JSON.parse(res.d);
                    console.log(obj);
                    clear();
                    if (obj == 1) {
                        
                        Swal.fire({
                            icon: 'success',
                            title: 'Success',
                            text: 'Your Response is Recorded!',
                        })
                       
                    }

                    else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops..',
                            text: 'Some Error Occured Try Again!',

                        })
                    }
                });
            }
            else {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops..',
                    text: 'Please Insert Name and Email',

                })
            }
        }

        function validate(name, email) {
            var flag = true;
            trimName = name.trim();
            trimEmail = email.trim();
            if (trimName == '' || trimEmail == '') {
                flag = false;
            }
            return flag;

        }

        clear()
        {
            $('#txtName').val('');
            $('#txtEmail').val('');
            $('#txtContact').val('');
            $('#txtMessage').val('');
        }
    </script>
    <div id="myLoader" style="display:none">
        <div class="myLoad" ></div>
    </div>
    <%--<div class="d-flex justify-content-center">
        <div class="spinner-grow text-danger" id='spinLoad' style="display: none;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>--%>

    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact-text">
                        <div class="contact-title">
                            <h3>Contact us</h3>
                            <p>
                                My experience with This serivce is absolutely positive. The PC and all the items are  beautifully
                                designed and well maintained. They also provides quick support.
                            </p>
                        </div>
                        <div class="contact-form">
                            <div class="dt-leave-comment">
                                <form>
                                    <div class="input-list">
                                        <input type="text" id="txtName" class="form-control" placeholder="Name" />
                                        <input type="text" id="txtEmail" class="form-control" placeholder="Email" />
                                        <input type="text" id="txtContact" class="form-control" placeholder="Contact No." />
                                    </div>
                                    <textarea class="form-control" id="txtMessage" placeholder="Message"></textarea>
                                    <button type="button" onclick="sendMail()">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

