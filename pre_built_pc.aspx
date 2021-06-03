<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="pre_built_pc.aspx.cs" Inherits="pre_built_pc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .largText {
            font-size:0.99rem !important;
        }
    </style>
    <script>
        var imgSource = 'assets/images/';
        $(document).ready(function () {

            getAllProducts();         
        });

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
                         <p class ="card-text col-md-5">PLATFORM: </p> <p class='col-md-7'><span class ="badge badge-danger largText" >${data.platform}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">CPU: </p> <p class="col-md-7"><span class ="badge badge-danger largText" >${data.cpu}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">MOTHERBOARD: </p> <p class="col-md-7"><span class ="badge badge-danger largText" >${data.motherboard}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">CPU COOLER: </p> <p class="col-md-7"><span class ="badge badge-danger largText" >${data.cooler}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">GPU: </p> <p class="col-md-7"><span class ="badge badge-danger largText" >${data.gpu}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">SMPS: </p> <p class="col-md-7"><span class ="badge badge-danger largText" >${data.smps}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">RAM: </p> <p class="col-md-7"><span class ="badge badge-danger largText" >${data.ram}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">CASE: </p> <p class="col-md-7"><span class ="badge badge-danger largText" >${data.pcCase}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">STORAGE 1: </p> <p class="col-md-7"><span class ="badge badge-danger largText" >${data.storage1}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">STORAGE 2: </p> <p class="col-md-7"><span class ="badge badge-danger largText" >${data.storage2}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">WATTAGE: </p> <p class="col-md-7"><span class ="badge badge-danger largText" >${data.wattage}</span></p>
                         </div>
                         <div class ="row">
                         <p class ="card-text col-md-5">WIFI CARD: </p> <p class="col-md-7"><span class ="badge badge-danger largText" >${data.wifiCard}</span></p>
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
       
        //                            <p class ="card-text">CPU: <span class ="badge badge-danger largText" >${data.cpu}</span></p>
                                    //<p class ="card-text">MOTHERBOARD: <span class ="badge badge-danger largText" >${data.motherboard}</span></p>
                                    //<p class ="card-text">CPU COOLER: <span class ="badge badge-danger largText" >${data.cooler}</span></p>
                                    //<p class ="card-text">GPU: <span class ="badge badge-danger largText" >${data.gpu}</span></p>
                                    //<p class ="card-text">SMPS: <span class ="badge badge-danger largText" >${data.smps}</span></p>
                                    //<p class ="card-text">RAM: <span class ="badge badge-danger largText" >${data.ram}</span></p>
                                    //<p class ="card-text">CASE: <span class ="badge badge-danger largText" >${data.pcCase}</span></p>
                                    //<p class ="card-text">STORAGE 1: <span class ="badge badge-danger largText" >${data.storage1}</span></p>
                                    //<p class ="card-text">STORAGE 2: <span class ="badge badge-danger largText" >${data.storage2}</span></p>
                                    //<p class ="card-text">WATTAGE: <span class ="badge badge-danger largText" >${data.wattage}</span></p>
                                    //<p class ="card-text">WIFI CARD: <span class ="badge badge-danger largText" >${data.wifiCard}</span></p>


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

        // Get Gaming Pc
        function getGamingPC() {
            $("#demo").empty();
            $.ajax({
                type: "POST",
                url: "pre_built_pc.aspx/getGamingPC",
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
                            <%--<div class="card bg-dark text-white col-md-12">
                                <img class="card-img-top" src="assets/images/fc43download.jpg" alt="Card image cap" />
                                <div class="card-body">                                    
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                </div>
                            </div>--%>
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

















<%--<p class ="card-text">MOTHERBOARD:  <span class ="badge badge-danger largText" >${data.motherboard}</span></p>
<p class ="card-text">CPU COOLER:   <span class ="badge badge-danger largText" >${data.cooler}</span></p>
<p class ="card-text">GPU:          <span class ="badge badge-danger largText" >${data.gpu}</span></p>
<p class ="card-text">SMPS:         <span class ="badge badge-danger largText" >${data.smps}</span></p>
<p class ="card-text">RAM:          <span class ="badge badge-danger largText" >${data.ram}</span></p>
<p class ="card-text">CASE:         <span class ="badge badge-danger largText" >${data.pcCase}</span></p>
<p class ="card-text">STORAGE 1:    <span class ="badge badge-danger largText" >${data.storage1}</span></p>
<p class ="card-text">STORAGE 2:    <span class ="badge badge-danger largText" >${data.storage2}</span></p>
<p class ="card-text">WATTAGE:      <span class ="badge badge-danger largText" >${data.wattage}</span></p>
<p class ="card-text">WIFI CARD:    <span class ="badge badge-danger largText" >${data.wifiCard}</span></p>--%>

