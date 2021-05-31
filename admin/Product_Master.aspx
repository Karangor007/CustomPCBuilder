<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="Product_Master.aspx.cs" Inherits="admin_Product_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server" id="form2">


        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">


                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body row">
                                    <div class="col-md-8">
                                        <h3 class="text-dark ">Product Master</h3>
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
                                    <div id="form1" enctype="multipart/form-data" class="form-horizontal">

                                        <%-- Model --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtModel" class=" form-control-label">Model</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                <asp:textbox cssclass="form-control" runat="server" placeholder="Enter Model" id="txtModel" />
                                            </div>
                                        </div>
                                        <%-- Brand --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtBrand" class=" form-control-label">Brand</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                <asp:textbox cssclass="form-control" runat="server" placeholder="Enter Brand Name" id="txtBrand" />
                                            </div>
                                        </div>
                                        <%-- Type --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="drpRamSize" class="form-control-label">Type</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                <asp:dropdownlist runat="server" id="drpType" cssclass="form-control">
                                                    <asp:ListItem Text="Select Product Type" />
                                                    <asp:ListItem Text="Wifi-Card" />
                                                    <asp:ListItem Text="Mouse" />
                                                    <asp:ListItem Text="Monitors" />
                                                    <asp:ListItem Text="Headsets" />
                                                    <asp:ListItem Text="Keyboards" />                                                    
                                                </asp:dropdownlist>
                                            </div>
                                        </div>
                                       <div class="row form-group">
                                                <div class="col-md-3">
                                                    <label for="txtModel" class=" form-control-label">Details</label>
                                                </div>
                                                <div class="col-md-9">
                                                    <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                    <asp:textbox cssclass="form-control" textmode="multiline" columns="50" rows="5" runat="server" placeholder="Enter Details" id="txtDetails" />
                                                </div>
                                            </div>
                                        <%-- Price --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtPrice" class=" form-control-label">Price</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                <asp:textbox cssclass="form-control" runat="server" placeholder="Enter Price" id="txtPrice" />
                                            </div>
                                        </div>
                                        <%-- Stock --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtStock" class=" form-control-label">In Stock</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                <asp:textbox cssclass="form-control" runat="server" placeholder="Available In Stock" id="txtStock" />
                                            </div>
                                        </div>

                                        <%-- Image --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtImage" class=" form-control-label">Image</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <%--<input type="password" id="txtConfPassword" name="txtConfPassword" placeholder="Enter Confirm Password" class="form-control valid" onchange="checkPassword()">--%>
                                                <asp:fileupload id="txtImage" cssclass="form-control" runat="server" placeholder="Choose An Image" />
                                            </div>
                                        </div>

                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label class=" form-control-label">Active</label>
                                            </div>
                                            <div class="col col-md-9">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <label for="chbActive" class="form-check-label ">
                                                            <%--<input type="checkbox" id="chbActive" name="chbActive" class="form-check-input">--%>
                                                            <asp:checkbox runat="server" id="chbActive" cssclass="form-check-input" />
                                                        </label>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="card-footer">
                                        <%--<button id="btnSubmit" class="btn btn-primary btn-md">
                                        Submit
                                    </button>--%>
                                        <asp:button text="Submit" id="btnSubmit" runat="server" cssclass="btn btn-primary btn-md" onclick="btnSubmit_Click" />
                                        <button id="btnReset" class="btn btn-danger btn-md" onclick="clear()">
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

