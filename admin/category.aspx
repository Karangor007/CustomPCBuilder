<%@ Page Title="Admin | Category" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="admin_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script>
        $(document).ready(function () {
            //$('#catTb').DataTable();
            getData()
        })

        // Bind Table
        function getData() {
            $('#catTb').dataTable().fnDestroy();

            $.ajax({
                type: "POST",
                url: "category.aspx/getData",
                data: '{}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    console.log(data);
                    var userData = $('#catTb tbody');
                    userData.empty();
                    var result = JSON.parse(data.d)
                    var i = 0;
                    var table = '';
                    console.log(result)
                    $.each(result, function (i, emp) {
                        i++;
                        //console.log(emp);

                        table += '<tr><td>' + i + '</td><td>' + emp.name + '</td>';
                        if (emp.isActive == "1") {
                            table += '<td><label class="badge badge-success pt-2 pb-2 pl-3 pr-3">Active</label></td>';
                        }
                        else {
                            table += '<td><label class="badge badge-danger pt-2 pb-2 pl-3 pr-3">Deactive</label></td>';
                        }
                        table += '<td> <button class="btn btn-success"  onclick="update(' + emp.id + ')">Edit</button></td>';
                        table += '<td><button class="btn btn-danger" onclick="deleteData(' + emp.id + ')">Delete</button></td></tr>';



                    });

                    userData.append(table);
                    $('#catTb').DataTable();
                }
            });

            $('#catTb').DataTable();
        }

        // Add new Product Category
        function addNew() {
            //catModal
            $('#catModalLabel').text('Add Category');
            $('#catModal').modal('show');
            //var category = $('#txtCat').val();
            //console.log(category);
            clear();
        }

        // Clear Textbox
        function clear() {
            $('#txtCat').val('')
        }

        // Check Emty or Not
        function checkNull(obj) {
            var flag = true;
            if (obj == '' || obj == null) {
                flag = false
            }
            return flag;
        }

        // save data
        function save() {
            
            var modeCheck = $('#catModalLabel').text();
            var mode = '';
            if (modeCheck == "Add Category")
            {
                mode = "insert";
            }
            
            var name = $('#txtCat').val();
            var check = checkNull(name);
            var id = $('#hdfId').val();
            //mdTitle
            var isActive = "1";
            
            if ($('#chbActive').prop('checked') == true) {
                isActive = "1";
            }
            else {
                isActive = "0";
            }
            if (check) {
                //swalMessage('success', 'Category Has been added!');
                $.ajax({
                    type: "POST",
                    url: "category.aspx/insertUpdateData",                    
                    data: '{mode:"' + mode + '",name:"' + name + '",isActive:"' + isActive + '",id:"' + id + '"}',
                    contentType: "application/json"
                }).done(function (res) {
                    //alert(res);
                    $('#catModal').modal('hide');
                    clear();
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: 'Record Has Been Saved!',
                    })
                    getData();

                    //console.log(res);
                });
            }
            else {
                swalMessage('error', 'Please Enter Category!!');
            }


        }

        function swalMessage(type, message) {
            Swal.fire(`${message}`, '', `${type}`)
        }

        // Update Data
        function update(catId)
        {
            $('#catModalLabel').text('Edit Category');
            $('#catModal').modal('show');
            $('#btnSave').html('Update');
            getCatDataById(catId)
        }
        // Get Data By Id
        function getCatDataById(catId)
        {                        
            //hdfId
            $('#hdfId').val(catId);
            $.ajax({
                type: "POST",
                url: "category.aspx/getCatData",
                data: '{id:"' + catId + '"}',
                contentType: "application/json"
            }).done(function (res) {
                //alert(res);
                //$('#largeModal').modal('hide');
                //clear();
                //Swal.fire({
                //    icon: 'success',
                //    title: 'Success',
                //    text: 'Record Has Been Saved!',

                //})
                //getData();
                var result = JSON.parse(res.d);
                console.log(result);
                for(var data of result)
                {
                //console.log(val);
                    $('#txtCat').val(data.name)                    
                    //var dob = $('#ddlDob').val();                    

                    if (data.isActive == "1") {
                        $("#chbActive ").prop("checked", true);
                    }
                    else {
                        $("#chbActive ").prop("checked", false);
                    }

                }

            });
        }

        // Delete Part
        function deleteFunc(id) {
            $.ajax({
                type: "POST",
                url: "category.aspx/deleteCat",
                data: '{id:"' + id + '"}',
                contentType: "application/json"
            }).done(function (res) {
                Swal.fire('Record Has Been Deleted!', '', 'success')
                getData();
            });



        }

        function deleteData(id) {

            // Confirmation
            Swal.fire({
                title: 'Do you want To Delete This Record?',

                showCancelButton: true,
                confirmButtonText: `Yes`,

            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {

                    deleteFunc(id);


                } else if (result.isDenied) {
                    Swal.fire('Changes are not saved', '', 'info')
                }
            })

        }

    </script>

    <div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">


                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body row">
                                <div class="col-md-8">
                                    <h3 class="text-dark ">Category Master</h3>
                                </div>
                                <div class="col-md-4">
                                    <button type="button" class="btn btn-primary mb-1" onclick="addNew()">
                                        Add New
                                    </button>
                                </div>

                            </div>
                        </div>


                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <table id="catTb" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Sr No.</th>
                                            <th>Category</th>
                                            <th>Active</th>
                                            <th>Update</th>
                                            <th>Delete</th>
                                        </tr>

                                    </thead>
                                    <tbody id="catTbBody">
                                        <%--<tr>
                                            <td>1</td>
                                            <td>Headsets</td>
                                            <td>
                                                <label class="btn btn-danger">Deactive</label></td>
                                            <td>
                                                <button class="btn btn-success" data-toggle="modal" data-target="#largeModal">Edit</button></td>
                                            <td>
                                                <button class="btn btn-danger">Delete</button></td>
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


    <%-- Modal --%>


    <div class="modal fade" id="catModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="catModalLabel">New Category</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="form-group">
                        <label for="txtCat" class="col-form-label">Category</label>
                        <input type="text" class="form-control" id="txtCat">
                        <input type="hidden" id="hdfId"/>
                    </div>
                    <div class="row form-group ">
                        <div class=" col-md-2">
                            <label class=" form-control-label">Active</label>                                     
                        </div>                        
                        <div class=" col-md-4">
                            <input type="checkbox" id="chbActive" name="chbActive" class="form-check-input">   
                            
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="btnSave" onclick="save()">Save</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

