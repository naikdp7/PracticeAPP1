<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="PracticeAPP1.UserRegisteration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>SmartWasteMgt</title>
   <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/css/Customcss.css" rel="stylesheet" />
    
</head>
<body>
    <div class="container">

        <div class="col-xs-1 col-sm-3"></div>


        <div class="col-xs-12 col-sm-6">
            <form id="registration" runat="server">
                <div>
                    
                    <div class="jumbotron " style="margin-top: 130px">
                        <div class="form-group input-lg text-center">
                            <label>REGISTRATION</label>
                        </div>
                        <div class="form-group">
                            <input type="text" runat="server" class="form-control" placeholder="Enter Username" id="username" />
                            
                        </div>
                        <div class="form-group">
                            <input type="password" runat="server" class="form-control" placeholder="Enter Password" id="password" />
                        </div>
                        <div class="form-group">
                            <input type="password" runat="server" class="form-control" placeholder="Confirm Password" id="confirmpassword" />
                        </div>

                        <div class="form-group">
                            <input type="text" runat="server" class="form-control" placeholder="Enter The Identy" id="licenceid" />
                        </div>
                        <div class="form-group">
                            
                            <asp:Button CssClass="btn btn-success form-control" ID="RegisterInfo" runat="server" Text="Submit" OnClick="RegisterInfo_Click" />
                            <asp:Label ID="regerrormsg" CssClass="help-block has-error" runat="server" Text=""></asp:Label>
                        </div>
                    </div>

                </div>

            </form>
        </div>



        <div class="col-xs-1 col-sm-3"></div>


    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
