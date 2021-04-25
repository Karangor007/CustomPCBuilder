<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.master" AutoEventWireup="true" CodeFile="RAM_Master.aspx.cs" Inherits="RAM_Master" %>

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
                                        <h3 class="text-dark ">RAM Master</h3>
                                    </div>
                                    

                                </div>
                            </div>


                        </div>
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body card-block">
                                    <div id="form1" enctype="multipart/form-data" class="form-horizontal">

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
                                        <%-- Frequency --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtFrequency" class=" form-control-label">Frequency</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                <asp:textbox cssclass="form-control" runat="server" placeholder="Enter Frequency In Mhz" id="txtFrequency" />
                                            </div>
                                        </div>
                                        <%-- Channel --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtChannel" class=" form-control-label">Channel</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                <asp:textbox cssclass="form-control" runat="server" placeholder="Enter Channel" id="txtChannel" />
                                            </div>
                                        </div>
                                        <%-- Type --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtType" class=" form-control-label">Type</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <%--<asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Type Eg. DDR4 or DDR5" ID="txtType" />--%>
                                                <asp:dropdownlist cssclass="form-control" id="drpType" runat="server">
                                                    <asp:ListItem Text="Select Type" />                                                    
                                                    <asp:ListItem Text="DDR4" />
                                                    <asp:ListItem Text="DDR5" />
                                                </asp:dropdownlist>
                                            </div>
                                        </div>
                                        <%-- Size --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtSize" class=" form-control-label">Size</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <%--<asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Size In MB" ID="txtSize" />--%>
                                                <asp:dropdownlist runat="server" cssclass="form-control" id="drpSize">
                                                    <asp:ListItem Text="Select Size In MB" />
                                                    <asp:ListItem Text="4" />
                                                    <asp:ListItem Text="6" />
                                                    <asp:ListItem Text="8" />
                                                    <asp:ListItem Text="16" />
                                                    <asp:ListItem Text="32" />
                                                    <asp:ListItem Text="64" />
                                                    <asp:ListItem Text="128" />
                                                </asp:dropdownlist>
                                            </div>
                                        </div>
                                        <%-- Price --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtPrice" class=" form-control-label">Price</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <asp:textbox cssclass="form-control" runat="server" placeholder="Enter Price In Rupees" id="txtPrice" />
                                            </div>
                                        </div>
                                        <%-- Stock --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtStock" class=" form-control-label">In Stock</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <asp:textbox cssclass="form-control" runat="server" placeholder="Available Stock" id="txtStock" />
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

