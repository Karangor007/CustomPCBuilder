<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.master" AutoEventWireup="true" CodeFile="RAM_List.aspx.cs" Inherits="RAM_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                        <button type="button" class="btn btn-primary mb-1" onclick="addNew()">
                                        Add New User
                                    </button>
                                    </div>
                                    
                                </div>
                            </div>


                        </div>
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <table id="userTb" class="table table-striped table-bordered table-responsive">
                                        <thead>
                                            <tr>
                                                <th>Sr No.</th>
                                                <th>Brand</th>
                                                <th>Type</th>
                                                <th>Size</th>
                                                <th>Price</th>
                                                <th>In Stock</th>
                                                <th>Active</th>
                                                <th>Update</th>
                                                <th>Delete</th>
                                            </tr>

                                        </thead>
                                        <tbody id="userTbBody">
                                            <%--<tr>
                                                <td>1</td>
                                                <td>Karan@123</td>
                                                <td>Karan Rajgor</td>
                                                <td>Karan@gmail.com</td>
                                                <td>7894561231</td>
                                                <td>Demo Address</td>
                                                <td><label class="btn btn-danger">Deactive</label></td>
                                                <td><button class="btn btn-success" data-toggle="modal" data-target="#largeModal">Edit</button></td>
                                                <td><button class="btn btn-danger">Delete</button></td>
                                            </tr>--%>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
</asp:Content>

