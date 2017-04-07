<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BinStatus.aspx.cs" Inherits="PracticeAPP1.BinStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>SmartWasteMgt</title>
    <link href="bootstrap/css/Customcss.css" rel="stylesheet" />

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <meta name="description" content="The description of my page" />
</head>
<body>



    <form id="form1" runat="server">
        <div class="container">
            <!--Navigation Bar-->
            <div class="row">
                <div class="col-sm-12">
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
                                    <li><a href="LoggedIn.aspx">Home</a></li>
                                    <li><a href="NewCollectorTruckInfo.aspx">Collector And Bin Information</a></li>
                                   
                                    <li class="active"><a href="BinStatus.aspx">View Bin Status</a></li>
                                    


                                </ul>

                                <ul class="nav navbar-nav navbar-right">
                                    <li class="dropdown"><a class="dropdown-toggle btn-link " data-toggle="dropdown">
                                        <asp:Label runat="server" Text="" ID="onlineuser"></asp:Label><span class="caret"></span></a>
                                        <ul class="dropdown-menu">

                                            <li>
                                                <asp:Button CssClass="btn btn-link" runat="server" OnClick="LogOut_Click" Text="LogOut" /></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>

                        </div>

                    </div>
                </div>

            </div>

            <br />
            <br />
            <br />
            <br />
            <div class="container">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                </asp:Timer>
                <asp:Image ID="binimage" runat="server" Height="400px" Width="250px" />
                </ContentTemplate>
            </asp:UpdatePanel>
                <br />
            <asp:Button ID="StartLiveView" runat="server" Text="Live View" CssClass="btn btn-primary" OnClick="StartLiveView_Click" />
            </div>

            


        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
