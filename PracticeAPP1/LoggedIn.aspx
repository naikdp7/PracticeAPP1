<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoggedIn.aspx.cs" Inherits="PracticeAPP1.NavigationBar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>SmartWasteMgt</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">

        <div>
            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container ">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" style="padding-top: 3px" href="LoggedIn.aspx">
                            <img alt="logo" src="Images/proj.jpg" height="50" /></a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-left">
                            <li class="active"><a href="LoggedIn.aspx">Home</a></li>
                            <li><a href="NewCollectorTruckInfo.aspx">Collector And Bin Information</a></li>
                     
                            <li><a href="BinStatus.aspx">View Bin Status</a></li>
                            


                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown"><a class="dropdown-toggle btn-link " data-toggle="dropdown">
                                <asp:Label runat="server" Text="" ID="onlineuser"></asp:Label><span class="caret"></span></a>
                                <ul class="dropdown-menu">

                                    <li>
                                        <asp:Button CssClass="btn btn-link" runat="server" Text="LogOut" OnClick="LogOut_Click" /></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    
                </div>

            </div>
            <br /><br /><br /><br />

         <div class="container">
             <div class="row">
                 <div class="col-md-8 col-md-offset-2">
                     <div id="imagecarousel" class="carousel slide" data-interval="3000" data-wrap="true" >
                         <ol class="carousel-indicators">
                             <li data-target="#imagecarousel" data-slide-to="0" class="active"></li>
                             <li data-target="#imagecarousel" data-slide-to="1"></li>
                             <li data-target="#imagecarousel" data-slide-to="2"></li>
                             <li data-target="#imagecarousel" data-slide-to="3"></li>
                         </ol>
                         <div class="carousel-inner">
                             <div class="item active">
                                 <img src="Images/123.png" class="img-responsive"/>
                                 <div class="carousel-caption">
                                     <h3>Image 1</h3>
                                 </div>
                             </div>
                             <div class="item">
                                 <img src="Images/234.jpg" class="img-responsive" />
                                 <div class="carousel-caption">
                                     <h3>Image 2</h3>
                                 </div>
                             </div>
                             <div class="item">
                                 <img src="Images/213.jpg" class="img-responsive"/>
                                 <div class="carousel-caption">
                                     <h3>Image 3</h3>
                                 </div>
                             </div>
                             <div class="item">
                                 <img src="Images/143.jpg" class="img-responsive"/>
                                 <div class="carousel-caption">
                                     <h3>Image 4</h3>
                                 </div>
                             </div>
                         </div>

                         <a href="#imagecarousel" class="carousel-control left" data-slide="prev">
                             <span class="glyphicon glyphicon-chevron-left"></span>
                         </a>
                         <a href="#imagecarousel" class="carousel-control right" data-slide="next">
                             <span class="glyphicon glyphicon-chevron-right"></span>
                         </a>
                     </div>
                 </div>
             </div>
         </div>

        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#imagecarousel').carousel();
            });
        </script>

    </form>
</body>
</html>
