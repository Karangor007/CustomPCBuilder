<%@ Page Title="Dashboard" Language="C#" MasterPageFile="adminMaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script>
        getRecordsCount();
        function getRecordsCount() {
            $.ajax({
                type: "POST",
                url: "utility.aspx/getRecordCount",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    var objResult = result;
                    console.log(objResult);


                    console.log('Record Count')
                    var obj = JSON.parse(result.d);
                    console.log(obj);
                    for(var val of obj)
                    {
                    
                        $('#listUsers').text(val.cntUsers);
                        $('#listPreBuilt').text(val.cntPreBuiltPC);
                        $('#listProducts').text(val.cntProducts);
                        $('#listPlat').text(val.cntPlatform);
                        $('#listRAM').text(val.cntRam);
                        $('#listProcessor').text(val.cntProcessor);
                        $('#listMotherboard').text(val.cntMotherBoard);
                        $('#listGPU').text(val.cntGPU);
                        $('#listSMPS').text(val.cntSMPS);
                        $('#listCooler').text(val.cntCooler);
                        $('#listStorage').text(val.cntStorage);
                        $('#listWifiCard').text(val.cntWiFI);
                    }
                }
            });
        }
    </script>

    <div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="overview-wrap">
                            <h2 class="title-1">overview</h2>

                        </div>
                    </div>
                </div>
                <div class="row m-t-25">
                    <div class="col-sm-4">
                        <div class="overview-item overview-item--c1" style="height:8rem;">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">                                   
                                   <div class="text">
                                       <h2 id="heading">Users</h2>
                                        <h4 id="listUsers">10368</h4>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="overview-item overview-item--c2" style="height:8rem;">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">                                    
                                    <div class="text">
                                        <h2>Pre Built PC</h2>
                                        <h4 id="listPreBuilt">10368</h4>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="overview-item overview-item--c3" style="height:8rem;">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">                                    
                                    <div class="text">
                                        <h2>Products</h2>
                                        <h4 id="listProducts">123</h4>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="overview-item overview-item--c4" style="height:8rem;">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">
                                    
                                    <div class="text">
                                        <h2>Platform</h2>
                                        <h4 id="listPlat">123</h4>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                     <div class="col-sm-4">
                        <div class="overview-item overview-item--c1" style="height:8rem;">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">                                   
                                   <div class="text">
                                       <h2 id="">RAM</h2>
                                        <h4 id="listRAM">10368</h4>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="overview-item overview-item--c2" style="height:8rem;">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">                                    
                                    <div class="text">
                                        <h2>Processor</h2>
                                        <h4 id="listProcessor">10368</h4>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="overview-item overview-item--c3" style="height:8rem;">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">                                    
                                    <div class="text">
                                        <h2>Motherboard</h2>
                                        <h4 id="listMotherboard">123</h4>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="overview-item overview-item--c4" style="height:8rem;">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">
                                    
                                    <div class="text">
                                        <h2>GPU</h2>
                                        <h4 id="listGPU">123</h4>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                     <div class="col-sm-4">
                        <div class="overview-item overview-item--c1" style="height:8rem;">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">                                   
                                   <div class="text">
                                       <h2 id="">SMPS</h2>
                                        <h4 id="listSMPS">10368</h4>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="overview-item overview-item--c2" style="height:8rem;">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">                                    
                                    <div class="text">
                                        <h2>Cooler</h2>
                                        <h4 id="listCooler">10368</h4>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="overview-item overview-item--c3" style="height:8rem;">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">                                    
                                    <div class="text">
                                        <h2>Storage</h2>
                                        <h4 id="listStorage">123</h4>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="overview-item overview-item--c4" style="height:8rem;">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">
                                    
                                    <div class="text">
                                        <h2>Wifi Card</h2>
                                        <h4 id="listWifiCard">123</h4>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
               

            </div>
        </div>
    </div>



</asp:Content>

