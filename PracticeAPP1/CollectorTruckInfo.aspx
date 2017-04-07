<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CollectorTruckInfo.aspx.cs" Inherits="PracticeAPP1.CollectorTruckInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>SmartWasteMgt</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/custom.css" rel="stylesheet" />
</head>
<body>

    <div class="container">
        <form id="form1" runat="server">
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
                                <a class="navbar-brand" style="padding-top: 3px" href="Default.aspx">
                                    <img alt="logo" src="Images/proj.jpg" height="50" /></a>
                            </div>
                            <div class="navbar-collapse collapse">
                                <ul class="nav navbar-nav navbar-left">
                                    <li><a href="LoggedIn.aspx">Home</a></li>
                                    <li class="active"><a href="CollectorTruckInfo.aspx">Collector Truck Driver Info</a></li>
                                    <li><a href="BinStatus.aspx">View Bin Status</a></li>
                                    <li><a href="NewCollectorTruckInfo.aspx">New Collector</a></li>


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
            <!-- New Edit-->
            <h2>Here We ARE</h2>
            <!--Add Form-->
            <div class="col-xs-0"></div>
            <div class="col-xs-12 col-sm-6 col-md-5 jumbotron">
                <div class="form-group">
                    <div class="form-group">
                        <asp:DropDownList AutoPostBack="true" ID="Citylist" runat="server" CssClass="form-control" DataTextField="City_Name" DataValueField="City_Id" OnSelectedIndexChanged="Citylist_SelectedIndexChanged">
                        </asp:DropDownList><br />
                    </div>
                    <div class="form-group">
                        <asp:DropDownList ID="Zonelist" runat="server" CssClass="form-control" DataTextField="Zone_Name" DataValueField="Zone_Id">
                        </asp:DropDownList><br />
                    </div>
                    <input runat="server" class="form-control" type="text" placeholder="enter username" id="username" /><br />
                    <input runat="server" class="form-control" type="password" placeholder="enter userna" id="userpassword" /><br />

                    
                    
                    <input runat="server" id="contactno" class="form-control" type="text" placeholder="enter contact no." /><br />
                    <input runat="server" id="licenceno" class="form-control" type="text" placeholder="enter licence no." /><br />
                    <div class="form-group center-block">
                        <asp:Button CssClass="form-control btn btn-primary" ID="infoSubmit" runat="server" Text="Submit" OnClick="infoSubmit_Click" />
                    </div>
                    <asp:Label ID="errormsg" runat="server" Text="" CssClass="help-block"></asp:Label>
                </div>
            </div>
            <div class="col-xs-2"></div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

            <!--Repeter Pane-->
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading text-center">
                    <h2>Collector Info</h2>
                </div>
                <div class="panel-body">
                </div>



                <!--Data Table-->
                <asp:Repeater ID="rptrCollectorInfo" runat="server">
                    <HeaderTemplate>
                        <table class="table">
                            <thead>
                                <tr>

                                    <th>Username</th>
                                    <th>Contact No</th>
                                    <th>City</th>
                                    <th>Zone</th>
                                    <th>Licence</th>
                                    <th>#</th>
                                </tr>

                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>

                        <tr>
                            <th><%# Eval("Username") %></th>
                            <td><%# Eval("Contact_No")%></td>
                            <td><%# Eval("City") %></td>
                            <td><%# Eval("Zone")%></td>
                            <td><%# Eval("Licence") %></td>
                            <td></td>
                        </tr>

                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                        </table>
                    </FooterTemplate>

                </asp:Repeater>

                <!-- Table -->



            </div>






        </form>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
