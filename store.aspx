<%@ Page Title="Custom PC Builder | Store" Language="C#" MasterPageFile="client.master" AutoEventWireup="true" CodeFile="store.aspx.cs" Inherits="store" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    
    <script>
        var imgSource = 'assets/images/';
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
                debugger;
                //admin/utility.aspx/
                var demoObj = new obj();
                $.ajax({
                    type: "POST",
                    url: "admin/utility.aspx/getClientUser",
                    data: '{}',
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        //console.log(data);        
                        debugger;
                        var result = JSON.parse(data.d)
                        console.log(result);
                        $.each(result, function (i, data) {
                            console.log(data.clientuser);
                            debugger;
                            if (data.clientuser == "" || data.clientuser == null) {
                                //alert('Please Login First');                            
                                swalAlert();
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
            //$('preloder').show(1).delay(1000).hide(1);
            getAllProducts();
            //getItem();

        });

        function getCartData(){
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
                        console.log(data);

                    });
                }
            });
        }

        function addTocart(id, type, price, brand,model)
        {
            console.log(`id : ${id} Model : ${model} Type : ${type} Price : ${price}`)

            var product_id = `${id}`;
            var type = `${type}`;
            var price = `${price}`;
            var quantity = '';

            $.ajax({
                type: "POST",
                url: "admin/utility.aspx/addToProductCartData",
                data: '{product_id:"' + product_id + '",type:"' + type + '",quantity:"' + quantity + '",price:"' + price + '"}',
                contentType: "application/json"
            }).done(function (res) {
                //alert(res);
                $('#catModal').modal('hide');
                clear();
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: `${model} Has Been Added To Cart!`,
                })
                getCartData()

                //console.log(res);
            });
        }

        // All Products
        function getAllProducts() {
            $('#preloder').show(1).delay(1000).hide(1);
            $("#demo").empty();
            $.ajax({
                type: "POST",
                url: "store.aspx/getAllProducts",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var result = JSON.parse(data.d)
                    //console.log(result);
                    $.each(result, function (i, data) {
                        var demo = `<div class="col-md-4 text-center">
                                <div class="card bg-dark ml-1">
                                    <img class ="card-img-top" src="${imgSource}${data.image}" alt="Card image cap" />
                                    <div class="card-body">
                                        <p class ="card-text">${data.model}</p>
                                        <p class ="card-text">${data.brand}</p>
                                        <p class ="card-text"><i class ="fa fa-inr"></i>${data.price}</p>
                                        <div class="form-group">
                                            <button class ="btn btn-outline-danger btn-sm text-white text-white">View</button>
                                        </div>
                                        <div class="form-group">
                                            <button class ="btn btn-outline-danger btn-sm text-white text-white" onclick="addTocart('${data.id}','${data.type}','${data.price}','${data.brand}','${data.model}')">Add To Cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div>`;
                        $("#demo").append(demo);


                    });
                }
            });
        }

        // All Mouse
        function getMouse() {
            $("#demo").empty();
            $.ajax({
                type: "POST",
                url: "store.aspx/getMouse",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var result = JSON.parse(data.d)

                    $.each(result, function (i, data) {
                        var demo = `<div class="col-md-4 text-center">
                                <div class="card bg-dark ml-1">
                                    <img class ="card-img-top" src="${imgSource}${data.image}" alt="Card image cap" />
                                    <div class="card-body">
                                        <p class ="card-text">${data.model}</p>
                                        <p class ="card-text">${data.brand}</p>
                                        <p class ="card-text"><i class ="fa fa-inr"></i>${data.price}</p>
                                        <div class="form-group">
                                            <button class="btn btn-outline-danger btn-sm text-white text-white text-white">View</button>
                                        </div>
                                        <div class="form-group">
                                            <button class ="btn btn-outline-danger btn-sm text-white" onclick="addTocart('${data.id}','${data.type}','${data.price}','${data.brand}','${data.model}')">Add To Cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div>`;
                        $("#demo").append(demo);


                    });
                }
            });
        }

        // All Monitors
        function getMonitors() {
            $("#demo").empty();
            $.ajax({
                type: "POST",
                url: "store.aspx/getMonitor",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var result = JSON.parse(data.d)

                    $.each(result, function (i, data) {
                        var demo = `<div class="col-md-4 text-center">
                                <div class="card bg-dark ml-1">
                                    <img class ="card-img-top" src="${imgSource}${data.image}" alt="Card image cap" />
                                    <div class="card-body">
                                        <p class ="card-text">${data.model}</p>
                                        <p class ="card-text">${data.brand}</p>
                                        <p class ="card-text"><i class ="fa fa-inr"></i>${data.price}</p>
                                        <div class="form-group">
                                            <button class="btn btn-outline-danger btn-sm text-white">View</button>
                                        </div>
                                        <div class="form-group">
                                            <button class ="btn btn-outline-danger btn-sm text-white" onclick="addTocart('${data.id}','${data.type}','${data.price}','${data.brand}','${data.model}')">Add To Cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div>`;
                        $("#demo").append(demo);


                    });
                }
            });
        }

        // All Keyboard
        function getKeyboard() {
            $("#demo").empty();
            $.ajax({
                type: "POST",
                url: "store.aspx/getKeyboard",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var result = JSON.parse(data.d)

                    $.each(result, function (i, data) {
                        var demo = `<div class="col-md-4 text-center">
                                <div class="card bg-dark ml-1">
                                    <img class ="card-img-top" src="${imgSource}${data.image}" alt="Card image cap" />
                                    <div class="card-body">
                                        <p class ="card-text">${data.model}</p>
                                        <p class ="card-text">${data.brand}</p>
                                        <p class ="card-text"><i class ="fa fa-inr"></i>${data.price}</p>
                                        <div class="form-group">
                                            <button class="btn btn-outline-danger btn-sm text-white">View</button>
                                        </div>
                                        <div class="form-group">
                                            <button class ="btn btn-outline-danger btn-sm text-white" onclick="addTocart('${data.id}','${data.type}','${data.price}','${data.brand}','${data.model}')">Add To Cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div>`;
                        $("#demo").append(demo);


                    });
                }
            });
        }

        // All Headsets
        function getHeadset() {
            $("#demo").empty();
            $.ajax({
                type: "POST",
                url: "store.aspx/getHeadset",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var result = JSON.parse(data.d)

                    $.each(result, function (i, data) {
                        var demo = `<div class="col-md-4 text-center">
                                <div class="card bg-dark ml-1">
                                    <img class ="card-img-top" src="${imgSource}${data.image}" alt="Card image cap" />
                                    <div class="card-body">
                                        <p class ="card-text">${data.model}</p>
                                        <p class ="card-text">${data.brand}</p>
                                        <p class ="card-text"><i class ="fa fa-inr"></i>${data.price}</p>
                                        <div class="form-group">
                                            <button class="btn btn-outline-danger btn-sm text-white">View</button>
                                        </div>
                                        <div class="form-group">
                                            <button class ="btn btn-outline-danger btn-sm text-white" onclick="addTocart('${data.id}','${data.type}','${data.price}','${data.brand}','${data.model}')">Add To Cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div>`;
                        $("#demo").append(demo);


                    });
                }
            });
        }

        // All Wifi Card
        function getWifiCard() {
            $("#demo").empty();
            debugger;
            $.ajax({
                type: "POST",
                url: "store.aspx/getWiFiCard",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    debugger;
                    var result = JSON.parse(data.d)

                    $.each(result, function (i, data) {
                        var demo = `<div class="col-md-4 text-center">
                                <div class="card bg-dark ml-1">
                                    <img class ="card-img-top" src="${imgSource}${data.image}" alt="Card image cap" />
                                    <div class="card-body">
                                        <p class ="card-text">${data.model}</p>
                                        <p class ="card-text">${data.brand}</p>
                                        <p class ="card-text"><i class ="fa fa-inr"></i>${data.price}</p>
                                        <div class="form-group">
                                            <button class="btn btn-outline-danger btn-sm text-white">View</button>
                                        </div>
                                        <div class="form-group">
                                            <button class ="btn btn-danger btn-sm text-white" onclick="addTocart('${data.id}','${data.type}','${data.price}','${data.brand}','${data.model}')">Add To Cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div>`;
                        $("#demo").append(demo);


                    });
                }
            });
        }



    </script>
    
    <section class="instagram-post-section spad">

        <%-- RAM --%>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="section-title">
                        <a class="linkHover" onclick="getAllProducts()">
                            <h5>All Products</h5>
                        </a>
                    </div>
                    <div class="section-title">
                        <a class="linkHover" onclick="getMonitors()">
                            <h5>Monitor</h5>
                        </a>
                    </div>
                    <div class="section-title">
                        <a class="linkHover" id="" onclick="getHeadset()">
                            <h5>Headsets</h5>
                        </a>
                    </div>
                    <div class="section-title">
                        <a class="linkHover" onclick="getMouse()">
                            <h5>Mouse</h5>
                        </a>
                    </div>
                    <div class="section-title">
                        <a class="linkHover" id="" onclick="getKeyboard()">
                            <h5>KeyBoards</h5>
                        </a>
                    </div>

                </div>
                <div class="col-md-9">
                    <div class="card bg-dark">
                        <div class="row mt-2" id="demo">
                            <div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
        </div>
    </section>
</asp:Content>

