<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        #owl-demo .item{
  margin: 3px;
}
#owl-demo .item img{
  display: block;
  width: 100%;
  height: auto;
}
    </style>
    <script>
        $(document).ready(function () {
            //userTb
            getRamData();

            $("#owl-demo").owlCarousel({

                autoPlay: 3000, //Set AutoPlay to 3 seconds

                items: 4,
                itemsDesktop: [1199, 3],
                itemsDesktopSmall: [979, 3]

            });

        });



        function getRamData() {
            // Destroy Datatable


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

                        var demo = `<div id="divRam">


                    <div class="section-title">

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
                                Price: <i class ="fas fa-rupee-sign"></i> ${data.price}
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
        }

    </script>
    <section class="instagram-post-section spad">
        <div class="container">
            <div class="row">
                <div class="section-title">
                    <h5>RAM</h5>
                </div>
                <div class="col-lg-12">
                    <div id="divRam">


                        <%--<div class="section-title">
                        <h5>RAM</h5>
                    </div>
                    
                    <div class="ip-item">
                        <div class="ip-pic">
                            <img src="assets/images/07ea51HIx1CNZxL._AC_SL1007_.jpg" alt="">
                        </div>
                        <div class="ip-text">
                            <div class="label"><span>Latest</span></div>
                            <h5><a href="#">Crucial Crucial DDR4 2666 MHz 8 GB</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li><i class="fa fa-comment-o"></i> 20</li>
                            </ul>
                            <p class="label">
                                Price : 3,250 
                            </p>
                            <p class="label">
                                Available in stock : 3 
                            </p>
                            <p class="mt-5">
                                <button class="btn btn-block btn-outline-danger" type="button">Buy</button>
                            </p>
                            
                        </div>
                           
                    </div>--%>
                    </div>


                    <div class="pagination-item">
                        <a href="#"><span>1</span></a>
                        <a href="#"><span>2</span></a>
                        <a href="#"><span>3</span></a>
                        <a href="#"><span>Next</span></a>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <section class="video-guide-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h5>Videos guide</h5>
                    </div>
                </div>
            </div>
            <div class="tab-elem">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#tabs-5" role="tab">All</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">Platform</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#tabs-7" role="tab">Hardware</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#tabs-8" role="tab">Reviews</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tabs-5" role="tabpanel">
                        <div class="row">
                            <div class="vg-slider owl-carousel" id="owl-demo">


                                <div class="item" style="margin: 3px">
                                    <img src="amin/img/videos/videos-1.jpg" alt="Owl Image"></div>
                                <div class="item" style="margin: 3px">
                                    <img src="amin/img/videos/videos-2.jpg" alt="Owl Image"></div>
                                <div class="item" style="margin: 3px">
                                    <img src="amin/img/videos/videos-2.jpg" alt="Owl Image"></div>
                                <div class="item" style="margin: 3px">
                                    <img src="amin/img/videos/videos-1.jpg" alt="Owl Image"></div>
                                <div class="item" style="margin: 3px">
                                    <img src="amin/img/videos/videos-2.jpg" alt="Owl Image"></div>
                                <div class="item" style="margin: 3px">
                                    <img src="amin/img/videos/videos-2.jpg" alt="Owl Image"></div>



                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>
    </section>
</asp:Content>

