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
                                    <div class="col-md-4">
                                        <button type="button" class="btn btn-primary mb-1">
                                            Add New RAM
                                        </button>
                                    </div>

                                </div>
                            </div>


                        </div>
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body card-block">
                                    <div id="form1" enctype="multipart/form-data" class="form-horizontal">

                                        <%-- First Name --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtBrand" class=" form-control-label">Brand</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <%--<input type="text" id="txtFirstName" name="text-input" placeholder="Enter First Name" class="form-control">--%>
                                                <asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Brand Name" ID="txtBrand" />
                                            </div>
                                        </div>
                                        <%-- Last Name --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtType" class=" form-control-label">Type</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Type Eg. DDR4 or DDR5" ID="txtType" />
                                            </div>
                                        </div>
                                        <%-- UserName --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtSize" class=" form-control-label">Size</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Size In MB" ID="txtSize" />
                                            </div>
                                        </div>
                                        <%-- Password --%>
                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label for="txtPrice" class=" form-control-label">Price</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <asp:TextBox CssClass="form-control" runat="server" placeholder="Enter Price In Rupees" ID="txtPrice" />
                                            </div>
                                        </div>
                                        <%-- Confirm Password --%>
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
                                        <asp:Button Text="Submit" ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-md" OnClick="btnSubmit_Click"/>
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

