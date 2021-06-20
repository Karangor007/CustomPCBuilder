<%@ Page Title="Custom PC Builder | Build Custom PC" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="custompc.aspx.cs" Inherits="custompc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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
        });


        var imgSource = 'assets/images/';

        $(document).ready(function () {
            //userTb
            //getRamData();
            //getProcessorData();
            //getMotherboardData();
            //getGPUData()
            //getSMPSData();
            //getCoolerData();
            //getStorageData();
            //getWifiData();
            //$('#viewLessRam').hide();
            getPlatformData();

        });

        // Platform Data
        function getPlatformData() {
            $('#partsContent').empty();
            $.ajax({
                type: "POST",
                url: "admin/utility.aspx/getPlatformData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (res) {
                    var result = JSON.parse(res.d)
                    
                    var demo = `
                             <fieldset id='options'>
                            </fieldset>
                            <div class ="card-footer text-center">
                                <img class ="svg rounded" src="assets/images/icon/platform.svg" alt="Alternate Text" />
                                <div class ="col-md-12">
                                    <span class ="text-center text-white">Choose Platform</span>
                                </div>
                                <div class ="col-md-12">
                                    <div class ="row">
                                        <div class ="form-group col-md-6 text-center">
                                            <button class ="btn btn-danger btn-md" id="preButton">Back</button>
                                        </div>
                                        <div class ="form-group col-md-6 text-center">
                                            <button class ="btn btn-danger btn-md" id="nextButton" onclick='getMotherboardData()'>Next</button>
                                        </div>
                                    </div>
                                </div>
                            </div>`;
                    //console.log(`Platform Data : ${res}`);
                    $('#partsContent').append(demo);
                    console.log(result);
                    $.each(result, function (i, data) {

                        var demoOptions = `<div class ="card bg-dark text-white">
                                    <label>
                                        <input type="radio" name="radio-button" value='${data.pt_id}' />
                                        <span class ="text-white">${data.name}</span>
                                    </label>
                                </div>
                                `;
                        $('#options').append(demoOptions);
                    });
                }
            });
        }

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
        function getProcessorData() {
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
        function getMotherboardData() {


            $('#partsContent').empty();
            $.ajax({
                type: "POST",
                url: "admin/utility.aspx/getMotherboardData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    var result = JSON.parse(data.d)
                    
                    
                    var demo = `
                             <fieldset id='options'>



                            </fieldset>
                            <div class ="card-footer text-center">
                                <img class ="svg rounded" src="assets/images/icon/platform.svg" alt="Alternate Text" />
                                <div class ="col-md-12">
                                    <span class ="text-center text-white">Choose Motherboard</span>
                                </div>
                                <div class ="col-md-12">
                                    <div class ="row">
                                        <div class ="form-group col-md-6 text-center">
                                            <button class ="btn btn-danger btn-md" id="preButton" onclick='getPlatformData()'>Back</button>
                                        </div>
                                        <div class ="form-group col-md-6 text-center">
                                            <button class ="btn btn-danger btn-md" id="nextButton" onclick=''>Next</button>
                                        </div>
                                    </div>
                                </div>
                            </div>`;
                    //console.log(`Platform Data : ${res}`);
                    $('#partsContent').append(demo);
                    console.log(result);
                    $.each(result, function (i, data) {

                        var demoOptions = `<div class ="card bg-dark text-white">
                                    <label>
                                        <input type="radio" name="radio-button" value='${data.id}' />
                                        <span class ="text-white">${data.model} ${data.brand}</span>
                                    </label>
                                </div>
                                `;
                        $('#options').append(demoOptions);
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
                <div class="col-md-12">
                    <div class="card bg-dark">
                        <div class="card-header row">
                            <div class="col-md-12">
                                <h2 class="text-white text-center">Built Your Own PC</h2>
                                <h3 class="text-white text-center">Select Parts</h3>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3 form-group">
                                    <button class="btn btn-outline-danger  text-white">Platform</button>
                                </div>
                                <div class="col-md-3 form-group">
                                    <button class="btn btn-outline-danger  text-white">PC Case</button>
                                </div>
                                <div class="col-md-3 form-group">
                                    <button class="btn btn-outline-danger  text-white">RAM</button>
                                </div>
                                <div class="col-md-3 form-group">
                                    <button class="btn btn-outline-danger  text-white">GPU</button>
                                </div>
                                <div class="col-md-3 form-group">
                                    <button class="btn btn-outline-danger  text-white">Processor</button>
                                </div>
                                <div class="col-md-3 form-group">
                                    <button class="btn btn-outline-danger  text-white">Cooler</button>
                                </div>
                                <div class="col-md-3 form-group">
                                    <button class="btn btn-outline-danger  text-white">SMPS</button>
                                </div>
                                <div class="col-md-3 form-group">
                                    <button class="btn btn-outline-danger  text-white">MotherBoard</button>
                                </div>
                                <div class="col-md-3 form-group">
                                    <button class="btn btn-outline-danger  text-white">Storage</button>
                                </div>
                            </div>
                                                      
                        </div>
                        <div class="card-footer">
                            <div class="form-group">
                                <button class="btn btn-block btn-outline-danger text-white">Proceed Your Order</button>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-6" style="display:none;">
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

