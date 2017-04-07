<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewCollectorTruckInfo.aspx.cs" Inherits="PracticeAPP1.NewCollectorTruckInfo" %>

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
                                    <li class="active"><a href="NewCollectorTruckInfo.aspx">Collector And Bin Information</a></li>

                                    <li><a href="BinStatus.aspx">View Bin Status</a></li>



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

            <!--Collector Info Bar-->



            <div class="col-xs-0 col-sm-6 col-sm-offset-3 ">
                <div class="btn-group btn-group-justified">
                    <div class="btn-group">
                        <asp:Button ID="viewinfo" CssClass="btn btn-default text-center" Enabled="true" runat="server" Text="View Collector Info" OnClick="viewinfo_Click" />
                    </div>
                    <div class="btn-group">
                        <asp:Button ID="addinfo" CssClass="btn btn-default text-center" Enabled="true" runat="server" Text="Add Collector Info" OnClick="addinfo_Click" />
                    </div>

                    <div class="btn-group">
                        <asp:Button ID="addbininfobar" CssClass="btn btn-default text-center" Enabled="true" runat="server" Text="Add Bin Info" OnClick="addbininfobar_Click" />
                    </div>



                </div>

            </div>




            <br /><br />
            
            <br />


            <asp:MultiView ID="CollectorInfo" runat="server">
                <!--view1-->

                <asp:View ID="collectorinfoview" runat="server">
                    <div class="col-xs-0 col-sm-6 col-sm-offset-3">
                        <div class="jumbotron">
                            <div class="form-group input-lg text-center">
                                <asp:Label ID="currentbardisplay" runat="server" Text=""></asp:Label>
                            </div>
                            
                            <div class="form-group">
                                <div class="form-group">
                                    <asp:DropDownList AutoPostBack="true" ID="Citylist" runat="server" CssClass="form-control" DataTextField="City_Name" DataValueField="City_Id" OnSelectedIndexChanged="Citylist_SelectedIndexChanged">
                                    </asp:DropDownList><br />
                                </div>
                                <div class="form-group">
                                    <asp:DropDownList ID="Zonelist" runat="server" CssClass="form-control" DataTextField="Zone_Name" DataValueField="Zone_Id">
                                    </asp:DropDownList><br />
                                </div>

                                <div class="form-group center-block">
                                    <asp:Button CssClass="form-control btn btn-primary" ID="infoSubmit" runat="server" Text="Submit" OnClick="infoSubmit_Click" />
                                </div>
                                <asp:Label ID="errormsg" runat="server" Text="" CssClass="help-block"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-12">



                        <asp:GridView ID="showCollectorInformation" runat="server" CssClass="table table-hover table-bordered table-responsive" OnRowDataBound="showCollectorInformation_RowDataBound" OnRowDeleting="showCollectorInformation_RowDeleting">

                            <Columns>
                                <asp:CommandField ShowDeleteButton="true" />

                            </Columns>

                        </asp:GridView>









                    </div>

                </asp:View>

                <!--view2-->
                <asp:View ID="addinfoview" runat="server">
                    <div class="col-xs-0 col-sm-6 col-sm-offset-3">
                        <div class="form-group jumbotron">
                            <div class="form-group input-lg text-center">
                                <asp:Label ID="addInfoLabel" runat="server" Text=""></asp:Label>
                            </div>


                            <div class="form-group">
                                <asp:DropDownList AutoPostBack="true" ID="addCity_Name" runat="server" CssClass="form-control" DataTextField="City_Name" DataValueField="City_Id" OnSelectedIndexChanged="addCity_Name_SelectedIndexChanged">
                                </asp:DropDownList><br />
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="addZone_Name" runat="server" CssClass="form-control" DataTextField="Zone_Name" DataValueField="Zone_Id">
                                </asp:DropDownList><br />
                            </div>
                            <input runat="server" class="form-control" type="text" placeholder="Enter Username" id="username" /><br />
                            <input runat="server" class="form-control" type="password" placeholder="Enter User Password" id="userpassword" /><br />



                            <input runat="server" id="contactno" class="form-control" type="text" placeholder="Enter Contact no." /><br />
                            <input runat="server" id="licenceno" class="form-control" type="text" placeholder="Enter licence no." /><br />
                            <div class="form-group center-block">
                                <asp:Button CssClass="form-control btn btn-primary" ID="infoAdd" runat="server" Text="Submit" OnClick="infoAdd_Click" />
                            </div>
                            <asp:Label ID="displayMSG" runat="server" Text="" CssClass="help-block"></asp:Label>
                        </div>
                    </div>


                </asp:View>

                <!--view3-->
                <asp:View ID="addbininfo" runat="server">
                    <div class="col-xs-0 col-sm-6 col-sm-offset-3">
                        <div class="form-group jumbotron">
                            <div class="form-group input-lg text-center">
                                <asp:Label ID="addBinLabel" runat="server" Text=""></asp:Label>
                            </div>


                           
                            <input runat="server" class="form-control" type="text" placeholder="Enter Bin ID" id="binid" /><br />
                            


                            <input runat="server" id="latitude" class="form-control" type="text" placeholder="Enter Latitude" /><br />
                            <input runat="server" id="longitude" class="form-control" type="text" placeholder="Enter Longitude" /><br />
                            <div class="form-group center-block">
                                <asp:Button CssClass="form-control btn btn-primary" ID="binInfoBtn" runat="server" Text="Submit" OnClick="bininfoAdd_Click" />
                            </div>
                            <asp:Label ID="bininfoadderror" runat="server" Text="" CssClass="help-block"></asp:Label>
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>




        </div>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

        <script src="bootstrap/js/bootstrap.min.js"></script>

    </form>
</body>
</html>
