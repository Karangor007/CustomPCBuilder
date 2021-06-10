<%@ Page Title="Home" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script>

        var imgSource = 'assets/images/';
        
        $(document).ready(function () {
            //userTb
            getRamData();
            getProcessorData();
            getMotherboardData();
            getGPUData()
            getSMPSData();
            getCoolerData();
            getStorageData();
            getWifiData();
            //$('#viewLessRam').hide();          
        });

        // View More RAM
        function viewMoreRam() {
            //alert('More RAM');
            $('#divRam').empty();
            $('#viewMoreRam').hide();
            $('#viewLessRam').show();
            $.ajax({
                type: "POST",
                url: "Default.aspx/getMoreRamData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    //console.log(data);

                    //userData.empty();
                    var result = JSON.parse(data.d)
                    console.log(result);
                    $.each(result, function (i, data) {
                        //console.log(emp.brand);

                        var demo = `<div>


                    <div class="section-title ramClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.img}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.type} ${data.frequency} ${data.size} GB</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>
                  
                    </div>`

                        $("#divRam").append(demo);


                    });
                }
            });
            //$('#viewLessRam').show();
            //console.log($('#divRam'));
        }

        // View Less RAM
        function viewLessRam() {
            //alert('it worked');
            //alert('Less RAM');
            $('#divRam').empty();
            $('#viewLessRam').hide();
            $('#viewMoreRam').show();
            
            getRamData();
        }
        // RAM Data
        function getRamData() {
            
            $.ajax({
                type: "POST",
                url: "Default.aspx/getRamData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {                    
                    var result = JSON.parse(data.d)                    
                    $.each(result, function (i, data) {
                    
                        var demo = `<div>


                    <div class="section-title ramClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.img}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.type} ${data.frequency} ${data.size} GB</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>
                    <div class ="pagination-item">
                        <div  onclick="viewLessRam()" id="viewLessRam" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                    </div>`

                        $("#divRam").append(demo);


                    });
                }
            });
        }

        // Processor Data
        function getProcessorData()
        {
            $.ajax({
                type: "POST",
                url: "Default.aspx/getProcessorData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                        
                        var demo = `<div>


                    <div class="section-title processClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.image}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.clock_speed} ${data.socket_type}</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>
                    <div class ="pagination-item">
                        <div  onclick="viewLessProcessor()" id="viewLessProcessor" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                    </div>`



                        $("#divProcess").append(demo);


                    });
                }
            });
        }


        function viewLessProcessor()
        {
            $('#divProcess').empty();
            $('#viewLessProcess').hide();
            $('#viewMoreProcess').show();

            getProcessorData();
        }

        function viewMoreProcessor()
        {
            $('#divProcess').empty();
            $('#viewMoreProcess').hide();
            $('#viewLessProcess').show();
            $.ajax({
                type: "POST",
                url: "Default.aspx/getMoreProcessorData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                    
                        var demo = `<div>


                    <div class="section-title ramClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.image}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.clock_speed} ${data.socket_type}</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>

                    </div>`



                        $("#divProcess").append(demo);


                    });
                }
            });
        }

        // Motherboard Data
        function getMotherboardData()
        {
            $.ajax({
                type: "POST",
                url: "Default.aspx/getMotherboardData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                    
                        var demo = `<div>


                    <div class ="section-title ramClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.image}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.storage}</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>
                    <div class ="pagination-item">
                        <div  onclick="viewLessProcessor()" id="viewLessProcessor" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                    </div>`

                        $("#divMBoard").append(demo);
                        //console.log(demo);

                    });
                }
            });
        }

        function viewMoreMotherBoard()
        {
            $('#divMBoard').empty();
            $('#viewMoreMotherBoard').hide();
            $('#viewLessMotherBoard').show();
            $.ajax({
                type: "POST",
                url: "Default.aspx/getMoreMotherboardData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                    
                        var demo = `<div>

                    <div class="section-title ramClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.image}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.storage}</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>

                    </div>`

                        $("#divMBoard").append(demo);

                    });
                }
            });
        }

        function viewLessMotherBoard()
        {
            $('#divMBoard').empty();
            $('#viewLessMotherBoard').hide();
            $('#viewMoreMotherBoard').show();

            getMotherboardData();
        }

        // GPU Data
        function getGPUData() {
            $.ajax({
                type: "POST",
                url: "Default.aspx/getGPUData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                        var demo = `<div>

                    <div class ="section-title ramClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.image}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.ram_size} ${data.ram_type} ${data.interface}</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>
                    <div class ="pagination-item">
                        <div  onclick="viewLessProcessor()" id="viewLessProcessor" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                    </div>`

                        $("#divGPU").append(demo);
                        

                    });
                }
            });
        }

        function viewMoreGPU() {
            $('#divGPU').empty();
            $('#viewMoreGPU').hide();
            $('#viewLessGPU').show();
            $.ajax({
                type: "POST",
                url: "Default.aspx/getMoreGPUData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                    
                        var demo = `<div>


                    <div class="section-title ramClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.image}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.ram_size} ${data.ram_type} ${data.interface}</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>

                    </div>`

                        $("#divGPU").append(demo);


                    });
                }
            });
        }

        function viewLessGPU() {
            $('#divGPU').empty();
            $('#viewLessGPU').hide();
            $('#viewMoreGPU').show();

            getGPUData();
        }

        // SMPS Data
        function getSMPSData() {
            $.ajax({
                type: "POST",
                url: "Default.aspx/getSMPSData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                    
                        var demo = `<div>


                    <div class ="section-title ramClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.image}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.wattage}</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>
                    <div class ="pagination-item">
                        <div  onclick="viewLessProcessor()" id="viewLessProcessor" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                    </div>`


                        $("#divSMPS").append(demo);
                        

                    });
                }
            });
        }

        function viewMoreSMPS() {
            $('#divSMPS').empty();
            $('#viewMoreSMPS').hide();
            $('#viewLessSMPS').show();
            $.ajax({
                type: "POST",
                url: "Default.aspx/getMoreSMPSData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    console.log(result);
                    $.each(result, function (i, data) {
                    
                        var demo = `<div>


                    <div class="section-title ramClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.image}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.wattage}</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>

                    </div>`

                        $("#divSMPS").append(demo);


                    });
                }
            });
        }

        function viewLessSMPS() {
            $('#divSMPS').empty();
            $('#viewLessSMPS').hide();
            $('#viewMoreSMPS').show();

            getSMPSData();
        }

        
        function getCoolerData() {
            $.ajax({
                type: "POST",
                url: "Default.aspx/getCoolerData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                    
                        var demo = `<div>


                    <div class ="section-title ramClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.image}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.wattage}</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>
                    <div class ="pagination-item">
                        <div  onclick="viewLessProcessor()" id="viewLessProcessor" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                    </div>`


                        $("#divCooler").append(demo);
                    
                    });
                }
            });
        }

        function viewMoreCooler() {
            $('#divCooler').empty();
            $('#viewMoreCooler').hide();
            $('#viewLessCooler').show();
            $.ajax({
                type: "POST",
                url: "Default.aspx/getMoreCoolerData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                    
                        var demo = `<div>


                    <div class="section-title ramClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.image}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.wattage}</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>

                    </div>`

                        $("#divCooler").append(demo);


                    });
                }
            });
        }

        function viewLessCooler() {
            $('#divCooler').empty();
            $('#viewLessCooler').hide();
            $('#viewMoreCooler').show();

            getCoolerData();
        }

        // Storage Data
        function getStorageData() {
            $.ajax({
                type: "POST",
                url: "Default.aspx/getStorageData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    var result = JSON.parse(data.d)

                    $.each(result, function (i, data) {
                        var demo = `<div>


                    <div class ="section-title ramClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.image}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.size} ${data.interface} </a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>
                    <div class ="pagination-item">
                        <div  onclick="viewLessProcessor()" id="viewLessProcessor" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                    </div>`

                        $("#divStorage").append(demo);
                        
                    });
                }
            });
        }

        function viewMoreStorage() {
            $('#divStorage').empty();
            $('#viewMoreStorage').hide();
            $('#viewLessStorage').show();
            $.ajax({
                type: "POST",
                url: "Default.aspx/getMoreStorageData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                    
                        var demo = `<div>


                    <div class="section-title ramClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.image}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.size} ${data.interface}</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>

                    </div>`

                        $("#divStorage").append(demo);

                    });
                }
            });
        }

        function viewLessStorage() {
            $('#divStorage').empty();
            $('#viewLessStorage').hide();
            $('#viewMoreStorage').show();

            getStorageData();
        }

        // Wifi Card Data
        function getWifiData() {
            $.ajax({
                type: "POST",
                url: "Default.aspx/getWifiCardData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                    
                        var demo = `<div>

                    <div class ="section-title ramClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.image}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.speed} ${data.interface} </a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>
                    <div class ="pagination-item">
                        <div  onclick="viewLessProcessor()" id="viewLessProcessor" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                    </div>`

                        $("#divWifi").append(demo);
                        

                    });
                }
            });
        }

        function viewMoreWifi() {
            $('#divWifi').empty();
            $('#viewMoreWifi').hide();
            $('#viewLessWifi').show();
            $.ajax({
                type: "POST",
                url: "Default.aspx/getMoreWifiCardData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                    
                        var demo = `<div>


                    <div class="section-title ramClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="${imgSource}${data.image}" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">${data.brand} ${data.model} ${data.speed} ${data.interface}</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price: <i class ="fa fa-inr"></i> ${data.price}
                            </p>
                            <p class="label">
                                Available in stock: ${data.in_stock}
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>

                        </div>

                    </div>

                    </div>`

                        $("#divWifi").append(demo);


                    });
                }
            });
        }

        function viewLessWifi() {
            $('#divWifi').empty();
            $('#viewLessWifi').hide();
            $('#viewMoreWifi').show();

            getWifiData();
        }
    </script>
    <section class="instagram-post-section spad">

        <%-- RAM --%>
        <div class="container">            
            <div class="row">
                <div class="section-title">
                    <h5>RAM</h5>
                </div>
                <div class="col-lg-12">
                    <div id="divRam">

                    </div>


                    <div class="pagination-item">
                        <div  onclick="viewMoreRam()" id="viewMoreRam"><i class="fa fa-plus"></i><span class="ml-2">View More...</span></div>
                        
                    </div>
                      <div class ="pagination-item">
                        <div  onclick="viewLessRam()" id="viewLessRam" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                </div>

            </div>
        </div>

        <%-- Processor --%>
        <div class="container mt-5">              
            <div class="row">
                <div class="section-title">
                    <h5>Processors</h5>
                </div>
                <div class="col-lg-12">
                    <div id="divProcess">

                    </div>


                    <div class="pagination-item">
                        <div  onclick="viewMoreProcessor()" id="viewMoreProcess"><i class="fa fa-plus"></i><span class="ml-2">View More...</span></div>
                        
                    </div>
                      <div class ="pagination-item">
                        <div  onclick="viewLessProcessor()" id="viewLessProcess" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                </div>

            </div>
        </div>

        <%-- MotherBoard --%>
        <div class="container mt-5">              
            <div class="row">
                <div class="section-title">
                    <h5>Motherboard</h5>
                </div>
                <div class="col-lg-12">
                    <div id="divMBoard">

                    </div>


                    <div class="pagination-item">
                        <div  onclick="viewMoreMotherBoard()" id="viewMoreMotherBoard"><i class="fa fa-plus"></i><span class="ml-2">View More...</span></div>
                        
                    </div>
                      <div class ="pagination-item">
                        <div  onclick="viewLessMotherBoard()" id="viewLessMotherBoard" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                </div>

            </div>
        </div>

        <%-- GPU --%>
        <div class="container mt-5">              
            <div class="row">
                <div class="section-title">
                    <h5>GPU</h5>
                </div>
                <div class="col-lg-12">
                    <div id="divGPU">

                    </div>


                    <div class="pagination-item">
                        <div  onclick="viewMoreGPU()" id="viewMoreGPU"><i class="fa fa-plus"></i><span class="ml-2">View More...</span></div>
                        
                    </div>
                      <div class ="pagination-item">
                        <div  onclick="viewLessGPU()" id="viewLessGPU" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                </div>

            </div>
        </div>

          <%-- SMPS --%>
        <div class="container mt-5">              
            <div class="row">
                <div class="section-title">
                    <h5>SMPS</h5>
                </div>
                <div class="col-lg-12">
                    <div id="divSMPS">

                    </div>


                    <div class="pagination-item">
                        <div  onclick="viewMoreSMPS()" id="viewMoreSMPS"><i class="fa fa-plus"></i><span class="ml-2">View More...</span></div>
                        
                    </div>
                      <div class ="pagination-item">
                        <div  onclick="viewLessSMPS()" id="viewLessSMPS" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                </div>

            </div>
        </div>

         <%-- Cooler --%>
        <div class="container mt-5">              
            <div class="row">
                <div class="section-title">
                    <h5>Coolers</h5>
                </div>
                <div class="col-lg-12">
                    <div id="divCooler">

                    </div>


                    <div class="pagination-item">
                        <div  onclick="viewMoreCooler()" id="viewMoreCooler"><i class="fa fa-plus"></i><span class="ml-2">View More...</span></div>
                        
                    </div>
                      <div class ="pagination-item">
                        <div  onclick="viewLessCooler()" id="viewLessCooler" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                </div>

            </div>
        </div>

         <%-- Storage --%>
        <div class="container mt-5">              
            <div class="row">
                <div class="section-title">
                    <h5>Storage</h5>
                </div>
                <div class="col-lg-12">
                    <div id="divStorage">

                    </div>


                    <div class="pagination-item">
                        <div  onclick="viewMoreStorage()" id="viewMoreStorage"><i class="fa fa-plus"></i><span class="ml-2">View More...</span></div>
                        
                    </div>
                      <div class ="pagination-item">
                        <div  onclick="viewLessStorage()" id="viewLessStorage" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                </div>

            </div>
        </div>

          <%-- Wifi Card --%>
        <div class="container mt-5">              
            <div class="row">
                <div class="section-title">
                    <h5>Wifi Card</h5>
                </div>
                <div class="col-lg-12">
                    <div id="divWifi">

                    </div>


                    <div class="pagination-item">
                        <div  onclick="viewMoreWifi()" id="viewMoreWifi"><i class="fa fa-plus"></i><span class="ml-2">View More...</span></div>
                        
                    </div>
                      <div class ="pagination-item">
                        <div  onclick="viewLessWifi()" id="viewLessWifi" style='display:none;'><i class ="fa fa-minus"></i><span class="ml-2">View Less...</span></div>

                    </div>
                </div>

            </div>
        </div>

    </section>    
</asp:Content>

