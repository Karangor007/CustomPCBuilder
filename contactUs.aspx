<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="contactUs.aspx.cs" Inherits="contactss" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>
        function sendMail()
        {
            var name = $('#txtName').val();
            var email = $('#txtEmail').val();
            var contact = $('#txtContact').val();
            var message = $('#txtMessage').val();
            //alert('Send Mail');
            var flag = validate(name, email);
            if (flag) {
                //alert('Send Mail');
                $.ajax({
                    type: "POST",
                    url: "admin/utility.aspx/sendMail",
                    data: '{name:"' + name + '",email:"' + email + '",contact:"' + contact + '",message:"' + message + '"}',
                    contentType: "application/json"
                }).done(function (res) {
                    let obj = JSON.parse(res.d);
                    console.log(obj);
                    if (obj == 1) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Success',
                            text: 'Your Response is Recorded!',

                        })
                        clear();
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
            if (trimName == '' || trimEmail == '')
            {
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

