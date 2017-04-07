<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="PracticeAPP1.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>SmartWasteMgt</title>
    
    
      <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <meta name="description" content="The description of my page" />
</head>
<body>
    <div class="container">
        <div class="col-xs-2 col-md-3"></div>
        <div class="col-xs-8 col-md-6">

            <div class="jumbotron" style="margin-top: 150px">
                <form runat="server" id="loginform">
                    <div class="form-group input-lg text-center">
                        <label >LOGIN</label>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" runat="server" id="usernametextbox" placeholder="Enter Username" />
                        
                    </div>
                    
                    <div class="form-group">
                        <input type="password" class="form-control" runat="server" id="passwordtextbox" placeholder="Enter Password" />
                    </div>
                    
                    <div class="form-group">

                        <asp:Button runat="server" CssClass="btn btn-primary form-control" ID="loginBtn" OnClick="loginBtn_Click" Text="Submit"></asp:Button>
                     <br />   <asp:Label ID="errormsg" runat="server" Text="" CssClass="help-block"></asp:Label>
                    </div>
                    
                    <div class="form-group">
                        <a href="UserRegistration.aspx" class="btn-link">To Register Click Here</a>
                    </div>
                    
                    <div class="col-xs-2 col-sm-4"></div>


                    


                </form>

            </div>




        </div>



    </div>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
