<%@ Page Title="" Language="C#" MasterPageFile="adminMaster.master" AutoEventWireup="true" CodeFile="processor_master.aspx.cs" Inherits="processor_master" %>

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
                                        <h3 class="text-dark ">Processor Master</h3>
                                    </div>
                                    <div class="col-md-4">

                                        <%--<asp:Button Text="Add New" CssClass="btn btn-primary mb-1" runat="server" ID="btnAddNew" OnClick="" />--%>
                                        <asp:Button Text="Back" CssClass="btn btn-primary mb-1" runat="server" ID="btnAddNew" OnClick="btnAddNew_Click" />
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
                                                <asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Model" ID="txtModel" />
                                            </div>
                                        </div>

                                        <%-- Brand --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="drpBrand" class=" form-control-label">Brand</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <%--<asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Type Eg. DDR4 or DDR5" ID="txtType" />--%>
                                                <asp:DropDownList CssClass="form-control" ID="drpBrand" runat="server">
                                                    <asp:ListItem Text="Select a Brand" />
                                                    <asp:ListItem Text="Intel" />
                                                    <asp:ListItem Text="AMD" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <%-- Socket Type --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtSocket" class=" form-control-label">Socket Type</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                <asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Socket Type" ID="txtSocket" />
                                            </div>
                                        </div>
                                        <%-- Clock Speed --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtClock" class=" form-control-label">Clock Speed</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                <asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Clock Speed" ID="txtClock" />
                                            </div>
                                        </div>
                                        <%-- Price --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtPrice" class=" form-control-label">Price</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Price In Rupees" ID="txtPrice" />
                                            </div>
                                        </div>
                                        <%-- Stock --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtStock" class=" form-control-label">In Stock</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <asp:TextBox CssClass="form-control" runat="server" placeholder="Available Stock" ID="txtStock" />
                                            </div>
                                        </div>
                                        <%-- Image --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtImage" class=" form-control-label">Image</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <%--<input type="password" id="txtConfPassword" name="txtConfPassword" placeholder="Enter Confirm Password" class="form-control valid" onchange="checkPassword()">--%>
                                                <asp:FileUpload ID="txtImage" CssClass="form-control" runat="server" placeholder="Choose An Image" />
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
                                                            <asp:CheckBox runat="server" ID="chbActive" CssClass="form-check-input" />
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
                                        <asp:Button Text="Submit" ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-md" OnClick="btnSubmit_Click" />
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

