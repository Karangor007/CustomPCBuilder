<%@ Page Title="" Language="C#" MasterPageFile="adminMaster.master" AutoEventWireup="true" CodeFile="Platform_List.aspx.cs" Inherits="Platform_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        $(document).ready(function () {
            $('#platformTb').DataTable({
                "autoWidth": true,
                "searching": true,
                "ordering": true,
            });
        });
    </script>
    <form id="form1" runat="server">
        <div class="main-content">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">


                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body row">
                                    <div class="col-md-8">
                                        <h3 class="text-dark ">Platform List</h3>
                                    </div>
                                    <div class="col-md-4">

                                        <asp:button text="Add New" cssclass="btn btn-primary mb-1" runat="server" id="btnAddNew" onclick="btnAddNew_Click" />
                                    </div>

                                </div>
                            </div>


                        </div>
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="dt-responsive table-responsive">
                                        <table id="platformTb" class="table table-striped table-bordered table-responsive nowrap" style="width: 100%; display: inline-table">
                                            <thead>
                                                <tr>
                                                    <th>Sr No.</th>
                                                    <th>Image</th>
                                                    <th>Name</th>
                                                    <th>Brand</th>
                                                    <th>Active</th>
                                                    <th>Update</th>
                                                    <th>Delete</th>
                                                </tr>

                                            </thead>
                                            <tbody id="platformTbBody">
                                                <asp:repeater id="rptPlatform" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <%#Container.ItemIndex+1 %>
                                                        </td>
                                                        <td>
                                                            <asp:Image ImageUrl='<%#imgUrl(Eval("image")) %>' Height="80" Width="160" runat="server" ID="imgRam" />
                                                        </td>
                                                        <td>
                                                            <asp:Label Text='<%#Eval("name")%>' ID="lblName" runat="server" />
                                                        </td>
                                                        <td>
                                                            <asp:Label Text='<%#Eval("brand")%>' ID="lblBrand" runat="server" />
                                                        </td>
                                                        <td>
                                                            <%--<label class="btn btn-danger">Deactive</label>--%>
                                                            <asp:Label Text='<%#Eval("IsActive").ToString().ToLower()=="true" ? "Active" : "DeActive" %>' ID="Label1"
                                                                CssClass='<%#Eval("IsActive").ToString().ToLower()=="true" ? "badge badge-success pt-2 pb-2 pl-3 pr-3" : "badge badge-danger pt-2 pb-2 pl-3 pr-3" %>'
                                                                runat="server" />
                                                        </td>
                                                        <td>
                                                            <%--<button class="btn btn-success">Edit</button></td>--%>
                                                            <asp:LinkButton Text="Update" type="button" ID="btnUpdateRepeater"
                                                                CssClass="btn waves-effect btn-sm btn-success"
                                                                CommandArgument='<%#Eval("pt_id")%>'
                                                                CommandName="Update"
                                                                runat="server"
                                                                OnCommand="btnUpdateRepeater_Command" />
                                                        <td>
                                                            <%--<button class="btn btn-danger">Delete</button>--%>
                                                            <asp:LinkButton ID="btnDeleteRepeater" Text="Delete" runat="server" class="btn btn-danger btn-sm"
                                                                CommandArgument='<%#Eval("pt_id")%>'
                                                                CommandName="Delete"
                                                                OnCommand="btnDeleteRepeater_Command"
                                                                OnClientClick="return confirm('Are you sure you want DELETE');"
                                                                runat="server" />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:repeater>

                                            </tbody>

                                        </table>
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

