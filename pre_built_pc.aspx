<%@ Page Title="Custom PC Builder | Pre Built PC" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="pre_built_pc.aspx.cs" Inherits="pre_built_pc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .largText {
            font-size:0.99rem !important;
        }
    </style>
    <script>

      
        

        var arr = [];
        var data = [];
        var cartArray = [];
        var itemArray = [];
        var imgSource = 'assets/images/';
        $(document).ready(function () {
            //getItem();
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
                        var result = JSON.parse(data.d)
                        console.log(result);
                        $.each(result, function (i, data) {
                            console.log(data.clientuser);
                            if (data.clientuser == null) {
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
            getAllProducts();         
        });

        // Add to Cart
        function addTocart(id,type,price,brand)
        {
            itemArray = [
                {

                    itemId: id,
                    itemType: type,
                    itemPrice: price,
                    item : brand
                }
            ];
                        
            if (typeof (Storage) !== "undefined") {
                // Store
                addInSession(id, type, price, brand)
                // Retrieve
                data = JSON.parse(sessionStorage.getItem("lastname"));
                //alert(`Cart : ${data}`);
                //pushItem(arr);
            } else {
                alert("Sorry, your browser does not support Web Storage...")
            }
        }

        function getItem(obj)
        {
            if (typeof (Storage) !== "undefined") {                
                data = JSON.parse(sessionStorage.getItem("lastname"));
                alert('lastname Arr :'+data);

            } else {
                alert("Sorry, your browser does not support Web Storage...")
            }
        }

        // Add item In Session
        function addInSession(id,type,price,brand)
        {
            
            
            check = JSON.parse(sessionStorage.getItem("lastname"));
            if (check == null) {
                itemArray = [
                {
                    itemId: id,
                    itemType: type,
                    itemPrice: price,
                    item: brand
                }
                ];
                console.log(`Check Is Null : ${check}`);
                sessionStorage.setItem("lastname", JSON.stringify(itemArray));
                check = JSON.parse(sessionStorage.getItem("lastname"));
                cartArray = check;                
            }
            else {
                //debugger;
                console.log(`Check Is Not Null : ${check}`);
                itemArray = JSON.parse(sessionStorage.getItem("lastname"))
                
                console.log(`itemArray`);
                console.log(itemArray);
                let tempArray = {
                    itemId: id,
                    itemType: type,
                    itemPrice: price,
                    item: brand
                };
                itemArray.push(tempArray)
                cartArray = itemArray;                
                sessionStorage.setItem("lastname", JSON.stringify(cartArray));                
            }
            setToCart(cartArray);
        }

        // Set To Cart
        function setToCart(arrObj)
        {
            console.log(arrObj);
            var itemCount = arrObj.length;
            var obj = arrObj.item;
            var cartIcon = $('#cartbadge');
            cartIcon.text(itemCount)
            Swal.fire({
                icon: 'success',
                title: 'Success..',
                text: `You  Order has been added to your shopping cart!`,
                
            })
            //console.log(cartIcon)
            console.log('arrObj')            
            for (let val of arrObj) {
                console.log(val);
            }
        }
        // Check Array is empty or not and push item
        function pushItem(obj)
        {
            obj = JSON.parse(sessionStorage.getItem("lastname"));
            let myArray = new Array();
            myArray = obj;
            console.log('Array : ' + myArray);

        }
        

        function timerAlert() {
            let timerInterval
            Swal.fire({
                
                timerProgressBar: true,
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



        function showSpinner() {
            //$('#myLoader').show();
            timerAlert();
        }

        function hideSpinner() {
            //$('#myLoader').hide();
            Swal.close();
        }

        // Show Details
        function showDetails(id, type) {
            //console.log($('#exampleModal'));
            $('#cardBody').empty();
            console.log(`Id: ${id} Type:    ${type}`);
            $.ajax({
                type: "POST",
                url: "pre_built_pc.aspx/getPCByIdType",

                data: '{id : "' + id + '",type:"'+type+'"}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",

                success: function (data) {
                    var result = JSON.parse(data.d)
                    console.log(result);
                    $.each(result, function (i, data) {
                        var type = data.PCType;
                        var id = data.id;
                        //console.log(`id: ${id} Type: ${type}`);
                        var demoEl = `<div class="card bg-dark text-white col-md-12">
                        <img class ="card-img-top" src="${imgSource}${data.image}" alt="Card image cap" />
                        <h5 class ="card-title text-center font-weight-bold" style="font-family: 'Montserrat' !important;">${data.brand}</h5>
                        <div class ="card-body">
                        ${data.details}
                        </div>
                        <div class ="card-body">
                         <div class ="row">
                         <p class ="card-text col-md-5">PLATFORM: </p> <p class='col-md-7'><span class ="badge badge-danger largText text-wrap" >${data.platform}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">CPU: </p> <p class="col-md-7"><span class ="badge badge-danger largText text-wrap" >${data.cpu}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">MOTHERBOARD: </p> <p class="col-md-7"><span class ="badge badge-danger largText text-wrap" >${data.motherboard}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">CPU COOLER: </p> <p class="col-md-7"><span class ="badge badge-danger largText text-wrap" >${data.cooler}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">GPU: </p> <p class="col-md-7"><span class ="badge badge-danger largText text-wrap" >${data.gpu}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">SMPS: </p> <p class="col-md-7"><span class ="badge badge-danger largText text-wrap" >${data.smps}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">RAM: </p> <p class="col-md-7"><span class ="badge badge-danger largText text-wrap" >${data.ram}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">CASE: </p> <p class="col-md-7"><span class ="badge badge-danger largText text-wrap" >${data.pcCase}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">STORAGE 1: </p> <p class="col-md-7"><span class ="badge badge-danger largText text-wrap" >${data.storage1}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">STORAGE 2: </p> <p class="col-md-7"><span class ="badge badge-danger largText text-wrap" >${data.storage2}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">WATTAGE: </p> <p class="col-md-7"><span class ="badge badge-danger largText text-wrap" >${data.wattage}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">WIFI CARD: </p> <p class="col-md-7"><span class ="badge badge-danger largText text-wrap" >${data.wifiCard}</span></p>
                         </div>
                                </div>
                                
                            </div>`;

                        $('#cardBody').append(demoEl);
                        $('#detailsModal').modal('show');
                    });
                }
            });
            //$('#detailsModal').modal('show');
        }
       

        // All Products
        function getAllProducts() {
            $('#preloder').show(1).delay(1000).hide(1);
            $("#demo").empty();
            $.ajax({
                type: "POST",
                url: "pre_built_pc.aspx/getAllProducts",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var result = JSON.parse(data.d)
                    //console.log(result);
                    $.each(result, function (i, data) {
                        var type = data.PCType;
                        var id = data.id;
                        //console.log(`id: ${id} Type: ${type}`);
                        var demo = `<div class="col-md-4 text-center">
                                <div class="card bg-dark ml-1">
                                    <img class ="card-img-top" src="${imgSource}${data.image}" alt="Card image cap" />
                                    <div class="card-body">
                                        <p class ="card-text">${data.brand}</p>
                                        <p class ="card-text"><i class ="fa fa-inr"></i>${data.price}</p>
                                        <div class="form-group">
                                            <button id='btnViewDetails' class ="btn btn-outline-danger btn-sm text-white" onclick="showDetails('${id}','${type}')">View</button>
                                        </div>
                                        <div class="form-group">
                                            <button class ="btn btn-outline-danger btn-sm text-white" onclick="addTocart('${id}','${type}','${data.price}','${data.brand}')">Add To Cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div>`;
                        $("#demo").append(demo);


                    });
                }
            });
        }

        // Get Gaming Pc
        function getGamingPC() {
            $("#demo").empty();
            $.ajax({
                type: "POST",
                url: "pre_built_pc.aspx/getGamingPC",
                data: '{}',
                beforeSend: function () {
                    showSpinner();

                },
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                complete: function () {
                    hideSpinner()
                    //Swal.fire({
                    //    icon: 'success',
                    //    title: 'Success',
                    //    text: 'Your Response is Recorded!',
                    //})
                },
                success: function (data) {
                    var result = JSON.parse(data.d)

                    $.each(result, function (i, data) {
                        var demo = `<div class="col-md-4 text-center">
                                <div class="card bg-dark ml-1">
                                    <img class ="card-img-top" src="${imgSource}${data.image}" alt="Card image cap" />
                                    <div class="card-body">
                                        <p class ="card-text">${data.brand}</p>
                                        <p class ="card-text"><i class ="fa fa-inr"></i>${data.price}</p>
                                        <div class="form-group">
                                            <button class="btn btn-outline-danger btn-sm text-white text-white text-white">View</button>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-outline-danger btn-sm text-white">Add To Cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div>`;
                        $("#demo").append(demo);


                    });
                }
            });
        }

        // Get Research PC
        function getResearchPC() {
            $("#demo").empty();
            $.ajax({
                type: "POST",
                url: "pre_built_pc.aspx/getResearchPC",
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
                                        <p class ="card-text">${data.brand}</p>
                                        <p class ="card-text"><i class ="fa fa-inr"></i>${data.price}</p>
                                        <div class="form-group">
                                            <button class="btn btn-outline-danger btn-sm text-white">View</button>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-outline-danger btn-sm text-white">Add To Cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div>`;
                        $("#demo").append(demo);


                    });
                }
            });
        }

        // Get Content Creation PC
        function getContentPC() {
            $("#demo").empty();
            $.ajax({
                type: "POST",
                url: "pre_built_pc.aspx/getContentPC",
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
                                        <p class ="card-text">${data.brand}</p>
                                        <p class ="card-text"><i class ="fa fa-inr"></i>${data.price}</p>
                                        <div class="form-group">
                                            <button class="btn btn-outline-danger btn-sm text-white">View</button>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-outline-danger btn-sm text-white">Add To Cart</button>
                                        </div>
                                    </div>
                                </div>
                            </div>`;
                        $("#demo").append(demo);


                    });
                }
            });
        }

        // Show Detials


    </script>
    <section class="instagram-post-section spad">
        
        <%-- RAM --%>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="section-title">
                        <a class="linkHover" onclick="getAllProducts()">
                            <h5>All PC</h5>
                        </a>
                    </div>
                    <div class="section-title">
                        <a class="linkHover" onclick="getGamingPC()">
                            <h5>Gaming</h5>
                        </a>
                    </div>
                    <div class="section-title">
                        <a class="linkHover" id="" onclick="getContentPC()">
                            <h5>Content Creation</h5>
                        </a>
                    </div>
                    <div class="section-title">
                        <a class="linkHover" onclick="getResearchPC()">
                            <h5>Research</h5>
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

    <%-- Modal For Deails --%>
    <div class="modal" tabindex="-1" id="detailsModal" role="dialog">
        <div class="modal-dialog " role="document">
            <div class="modal-content bg-dark text-white">
                <div class="modal-header">
                    <h5 class="modal-title font-weight-bold">Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        
                        <div class="col-md-12" id="cardBody">                            
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>    
</asp:Content>

