<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="custompc.aspx.cs" Inherits="custompc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .svg {
            max-width: 13% !important;
        }

            .svg:hover {
                transform: skew(-15deg);
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
                //admin/utility.aspx/
                var demoObj = new obj();
                $.ajax({
                    type: "POST",
                    url: "admin/utility.aspx//getClientUser",
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

        // RAM Data
        function getRamData() {            
            $.ajax({
                type: "POST",
                url: "admin/utility.aspx/getRamData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (res) {                    
                    var result = JSON.parse(res.d)
                    //console.log(res);
                    $.each(result, function (i, data) {
                        console.log(`RAM Data : ${res}`);
                    });
                }
            });
        }

        // Processor Data
        function getProcessorData()
        {
            $.ajax({
                type: "POST",
                url: "admin/utility.aspx/getProcessorData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                        console.log(`Processor Data : ${data[i]}`);
                    });
                }
            });
        }


     
        // Motherboard Data
        function getMotherboardData()
        {
            $.ajax({
                type: "POST",
                url: "admin/utility.aspx/getMotherboardData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                        console.log(`MotherBoard Data : ${data[i]}`);
                    });
                }
            });
        }

     
        // GPU Data
        function getGPUData() {
            $.ajax({
                type: "POST",
                url: "admin/utility.aspx/getGPUData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                        console.log(`GPU Data : ${data[i]}`);
                    });
                }
            });
        }


        // SMPS Data
        function getSMPSData() {
            $.ajax({
                type: "POST",
                url: "admin/utility.aspx/getSMPSData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                        console.log(`SMPS Data : ${data[i]}`);
                    });
                }
            });
        }

        
        function getCoolerData() {
            $.ajax({
                type: "POST",
                url: "admin/utility.aspx/getCoolerData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                        console.log(`Cooler Data : ${data[i]}`);
                    });
                }
            });
        }

        // Storage Data
        function getStorageData() {
            $.ajax({
                type: "POST",
                url: "admin/utility.aspx/getStorageData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    var result = JSON.parse(data.d)

                    $.each(result, function (i, data) {
                        console.log(`Storage Data : ${data[i]}`);
                    });
                }
            });
        }

        // Wifi Card Data
        function getWifiData() {
            $.ajax({
                type: "POST",
                url: "admin/utility.aspx/getWifiCardData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    
                    var result = JSON.parse(data.d)
                    
                    $.each(result, function (i, data) {
                        console.log(`Wifi Data : ${data[i]}`);
                    });
                }
            });
        }
    </script>
    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="card bg-dark">
                        <div class="card-header row">
                            <div class="col-md-12">
                                <h3 class="text-white text-center">Select Parts</h3>
                                <div class="col-md-12 row mt-2 text-center">
                                    <a href="#">
                                        <i class="fa fa-arrow-left bg-dark text-white mr-1"></i>
                                    </a>
                                    
                                    <div class="col-md-1">
                                        
                                    </div>
                                    
                                    <div class="col-md-3 form-group">
                                        <button class="btn btn-outline-danger btn-md text-white">Item</button>
                                    </div>
                                    <div class="col-md-3 form-group">
                                        <button class="btn btn-outline-danger btn-md text-white">Item</button>
                                    </div>
                                    <div class="col-md-3 form-group">
                                        <button class="btn btn-outline-danger btn-md text-white">Item</button>
                                    </div>
                                    <div class="col-md-1">
                                        
                                    </div>
                                    <a href="#">
                                        <i class="fa fa-arrow-right bg-dark text-white"></i>
                                    </a>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="card-body row">
                            
                            <div class="col-md-12"></div>
                        </div>
                        <div class="card-footer text-center">
                            <img class="svg rounded" src="assets/images/icon/platform.svg" alt="Alternate Text" />
                            <div class="col-md-12">
                                <span class="text-center text-white">Choose Platform</span>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card bg-dark">
                        <div class="card-body">
                        </div>
                        <div class="card-footer">
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </section>

</asp:Content>

