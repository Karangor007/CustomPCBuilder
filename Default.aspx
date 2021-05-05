<%@ Page Title="" Language="C#" MasterPageFile="~/client.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>
        $(document).ready(function () {
            //userTb
            getRamData();
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
                <%--<div class="col-lg-4 col-md-7">
                    <div class="sidebar-option">
                        <div class="insta-media">
                            <div class="section-title">
                                <h5>Instagram</h5>
                            </div>
                            <div class="insta-pic">
                                <img src="assets/img/instagram/ip-1.jpg" alt="">
                                <img src="assets/img/instagram/ip-2.jpg" alt="">
                                <img src="assets/img/instagram/ip-3.jpg" alt="">
                                <img src="assets/img/instagram/ip-4.jpg" alt="">
                            </div>
                        </div>
                        <div class="best-of-post">
                            <div class="section-title">
                                <h5>Best of</h5>
                            </div>
                            <div class="bp-item">
                                <div class="bp-loader">
                                    <div class="loader-circle-wrap">
                                        <div class="loader-circle">
                                            <span class="circle-progress-1" data-cpid="id-1" data-cpvalue="95" data-cpcolor="#c20000"></span>
                                            <div class="review-point">9.5</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="bp-text">
                                    <h6><a href="#">This gaming laptop with a GTX 1660...</a></h6>
                                    <ul>
                                        <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                        <li><i class="fa fa-comment-o"></i> 20</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="bp-item">
                                <div class="bp-loader">
                                    <div class="loader-circle-wrap">
                                        <div class="loader-circle">
                                            <span class="circle-progress-1" data-cpid="id-2" data-cpvalue="85" data-cpcolor="#c20000"></span>
                                            <div class="review-point">8.5</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="bp-text">
                                    <h6><a href="#">This gaming laptop with a GTX 1660...</a></h6>
                                    <ul>
                                        <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                        <li><i class="fa fa-comment-o"></i> 20</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="bp-item">
                                <div class="bp-loader">
                                    <div class="loader-circle-wrap">
                                        <div class="loader-circle">
                                            <span class="circle-progress-1" data-cpid="id-3" data-cpvalue="80" data-cpcolor="#c20000"></span>
                                            <div class="review-point">8.0</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="bp-text">
                                    <h6><a href="#">This gaming laptop with a GTX 1660...</a></h6>
                                    <ul>
                                        <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                        <li><i class="fa fa-comment-o"></i> 20</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="bp-item">
                                <div class="bp-loader">
                                    <div class="loader-circle-wrap">
                                        <div class="loader-circle">
                                            <span class="circle-progress-1" data-cpid="id-4" data-cpvalue="75" data-cpcolor="#c20000"></span>
                                            <div class="review-point">7.5</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="bp-text">
                                    <h6><a href="#">This gaming laptop with a GTX 1660...</a></h6>
                                    <ul>
                                        <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                        <li><i class="fa fa-comment-o"></i> 20</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="subscribe-option">
                            <div class="section-title">
                                <h5>Subscribe</h5>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor.</p>
                            <form action="#">
                                <input type="text" placeholder="Name">
                                <input type="text" placeholder="Email">
                                <button type="submit"><span>Subscribe</span></button>
                            </form>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
    </section>
</asp:Content>

