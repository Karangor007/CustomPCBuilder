<%@ Page Title="Home" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script>
        $(document).ready(function () {
            //userTb
            getRamData();
            getProcessorData();
            $('#viewLessRam').hide();
            $("#owl-demo").owlCarousel({

                autoPlay: 3000, //Set AutoPlay to 3 seconds

                items: 4,
                itemsDesktop: [1199, 3],
                itemsDesktopSmall: [979, 3]

            });

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
                            <img src="assets/images/${data.img}" alt="">
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
                            <img src="assets/images/${data.img}" alt="">
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
                    //console.log(data);

                    //userData.empty();
                    var result = JSON.parse(data.d)
                    console.log(result);
                    $.each(result, function (i, data) {
                        console.log(data);

                        var demo = `<div>


                    <div class="section-title processClass">

                    </div>

                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="assets/images/${data.image}" alt="">
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
                            <img src="assets/images/${data.image}" alt="">
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
    </script>
    <section class="instagram-post-section spad">
        <div class="container">
            <%-- RAM --%>
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
        <div class="container mt-5">
              <%-- Processor --%>
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
    </section>
    
</asp:Content>

