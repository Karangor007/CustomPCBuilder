<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="PreBuiltPC_Master.aspx.cs" Inherits="admin_PreBuiltPC_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">


                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body row">
                                    <div class="col-md-8">
                                        <h3 class="text-dark ">Pre Built PC Master</h3>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:button text="Back" cssclass="btn btn-primary mb-1" runat="server" id="btnAddNew" onclick="btnAddNew_Click" />
                                    </div>

                                </div>
                            </div>


                        </div>
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body card-block">
                                    <div id="form1" class="form-horizontal">
                                        <div class="row">
                                            <%-- Model --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col-md-3">
                                                    <label for="txtModel" class=" form-control-label">Model</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                    <asp:textbox cssclass="form-control" runat="server" placeholder="Enter Model" id="txtModel" />
                                                </div>
                                            </div>

                                            <%-- Brand --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col col-md-3">
                                                    <label for="drpBrand" class=" form-control-label">Brand</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Type Eg. DDR4 or DDR5" ID="txtType" />--%>
                                                    <asp:textbox cssclass="form-control" runat="server" placeholder="Enter Brand" id="txtBrand" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <%-- Type --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col-md-3">
                                                    <label for="txtModel" class=" form-control-label">Type</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:dropdownlist cssclass="form-control" id="drpType" runat="server">
                                                    <asp:ListItem Text="Select a Type" />
                                                    <asp:ListItem Text="Gaming" />
                                                    <asp:ListItem Text="Content Creation" />
                                                    <asp:ListItem Text="Research" />
                                                </asp:dropdownlist>
                                                </div>
                                            </div>

                                            <%-- In Stock --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col col-md-3">
                                                    <label for="drpBrand" class=" form-control-label">In stock</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Type Eg. DDR4 or DDR5" ID="txtType" />--%>
                                                    <asp:textbox cssclass="form-control" runat="server" placeholder="Enter Stock" id="txtStock" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <%-- Cooler --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col-md-3">
                                                    <label for="txtModel" class=" form-control-label">Cooler</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                    <asp:textbox cssclass="form-control" runat="server" placeholder="Enter Cooler" id="txtCooler" />
                                                </div>
                                            </div>

                                            <%-- CPU --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col col-md-3">
                                                    <label for="drpBrand" class=" form-control-label">CPU</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Type Eg. DDR4 or DDR5" ID="txtType" />--%>
                                                    <asp:textbox cssclass="form-control" runat="server" placeholder="Enter CPU" id="txtCPU" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <%-- GPU --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col-md-3">
                                                    <label for="txtModel" class=" form-control-label">GPU</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                    <asp:textbox cssclass="form-control" runat="server" placeholder="Enter GPU" id="txtGPU" />
                                                </div>
                                            </div>

                                            <%-- MotherBoard --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col col-md-3">
                                                    <label for="drpBrand" class=" form-control-label">MotherBoard</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Type Eg. DDR4 or DDR5" ID="txtType" />--%>
                                                    <asp:textbox cssclass="form-control" runat="server" placeholder="Enter MotherBoard" id="txtMotherboard" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <%-- PC Case --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col-md-3">
                                                    <label for="txtModel" class=" form-control-label">PC Case</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                    <asp:textbox cssclass="form-control" runat="server" placeholder="Enter PC Case" id="txtCase" />
                                                </div>
                                            </div>

                                            <%-- Platform --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col col-md-3">
                                                    <label for="drpBrand" class=" form-control-label">Platform</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Type Eg. DDR4 or DDR5" ID="txtType" />--%>
                                                    <asp:dropdownlist cssclass="form-control" id="drpPlatform" runat="server">
                                                    <asp:ListItem Text="Select a Platform" />
                                                    <asp:ListItem Text="Intel" />
                                                    <asp:ListItem Text="AMD" />
                                                </asp:dropdownlist>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <%-- RAM --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col-md-3">
                                                    <label for="txtModel" class=" form-control-label">RAM</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                    <asp:textbox cssclass="form-control" runat="server" placeholder="Enter RAM" id="txtRam" />
                                                </div>
                                            </div>

                                            <%-- SMPS --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col col-md-3">
                                                    <label for="drpBrand" class=" form-control-label">SMPS</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Type Eg. DDR4 or DDR5" ID="txtType" />--%>
                                                    <asp:textbox cssclass="form-control" runat="server" placeholder="Enter SMPS" id="txtSMPS" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <%-- Storage1 --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col-md-3">
                                                    <label for="txtModel" class=" form-control-label">Storage1</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                    <asp:textbox cssclass="form-control" runat="server" placeholder="Enter Storage1" id="txtStorage1" />
                                                </div>
                                            </div>

                                            <%-- Storage2 --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col col-md-3">
                                                    <label for="drpBrand" class=" form-control-label">Storage2</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Type Eg. DDR4 or DDR5" ID="txtType" />--%>
                                                    <asp:textbox cssclass="form-control" runat="server" placeholder="Enter Storage2" id="txtStorage2" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <%-- Wattage --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col-md-3">
                                                    <label for="txtModel" class=" form-control-label">Wattage</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                    <asp:textbox cssclass="form-control" runat="server" placeholder="Enter Wattage In Watts." id="txtWattage" />
                                                </div>
                                            </div>

                                            <%-- wifiCard --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col col-md-5">
                                                    <label for="drpBrand" class=" form-control-label">Wifi Card</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Type Eg. DDR4 or DDR5" ID="txtType" />--%>
                                                    <asp:textbox cssclass="form-control" runat="server" placeholder="Enter Wifi Card" id="txtWifiCard" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <%-- Details --%>
                                            <div class="row form-group col-md-12">
                                                <div class="col-md-3">
                                                    <label for="txtModel" class=" form-control-label">Details</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                    <asp:textbox cssclass="form-control" textmode="multiline" columns="50" rows="5" runat="server" placeholder="Enter Details" id="txtDetails" />
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <%-- Price --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col col-md-4">
                                                    <label for="txtPrice" class=" form-control-label">Price</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <asp:textbox cssclass="form-control" runat="server" placeholder="Enter Price In Rupees" id="txtPrice" />
                                                </div>
                                            </div>

                                            <%-- Image --%>
                                            <div class="row form-group col-md-6">
                                                <div class="col col-md-4">
                                                    <label for="txtImage" class=" form-control-label">Image</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <%--<input type="password" id="txtConfPassword" name="txtConfPassword" placeholder="Enter Confirm Password" class="form-control valid" onchange="checkPassword()">--%>
                                                    <asp:fileupload id="txtImage" cssclass="form-control" runat="server" placeholder="Choose An Image" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-1">
                                                <label class=" form-control-label">Active</label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-check">
                                                    <div class="checkbox">                                                        
                                                        <asp:checkbox runat="server" id="chbActive" cssclass="form-check-input" />                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="row">

                                    </div>
                                    <div class="card-footer">                                    
                                        <asp:button text="Submit" id="btnSubmit" runat="server" cssclass="btn btn-primary btn-md" onclick="btnSubmit_Click" />
                                        <button id="btnReset" class="btn btn-danger btn-md">
                                            Reset
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </form>

</asp:Content>

