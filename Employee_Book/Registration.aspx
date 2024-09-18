<%@ Page Title="Registration" Language="C#"  AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Employee_Book.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 
    <title>Registration Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.19.5/jquery.validate.min.js"></script>
   <script type="text/javascript">

 function addclick() {
        debugger;
        

        var newRow = `
            <tr>
                <td><input type="text" name="courseName[]" class="form-control" /></td>
                <td><input type="text" name="university[]" class="form-control" oninput="this.value = this.value.replace(/[^A-Za-z .]/g, '')"/></td>
                <td><input type="text" name="year[]" class="form-control" oninput="this.value = this.value.replace(/[^0-9]/g, '')" maxlength="4"/></td>
                <td><input type="text" name="percentage[]" class="form-control" oninput="validatePercentage(this)"/></td>
                <td><button type="button" class="btn btn-danger btn-sm removeRow">Remove</button></td>
            </tr>`;

       
        $("#qualificationsGridView tbody").append(newRow);


        $(".removeRow").off("click").on("click", function () {
            $(this).closest("tr").remove();
        });
    }


    function validatePercentage(input) {
        var value = input.value;
        if (value && (parseFloat(value) < 0 || parseFloat(value) > 100)) {
            alert('Percentage must be between 0 and 100.');
            input.value = '';
        }
    }
       
function handleButtonClick() {
    debugger;
   
    var first_name = document.getElementById('<%= firstName.ClientID %>').value;
    var age = document.getElementById('<%= age.ClientID %>').value;
    var phone = document.getElementById('<%= phone.ClientID %>').value;
    var gender = document.getElementById('<%= gender.ClientID %>').value;
    var mail = document.getElementById('<%= email.ClientID %>').value;
    var dob = document.getElementById('<%= dob.ClientID %>').value;
    var last_nme = document.getElementById('<%= lastName.ClientID %>').value;
    var usrnme = document.getElementById('<%= username.ClientID %>').value;
    var passwd = document.getElementById('<%= password.ClientID %>').value;



    debugger;

        if (first_name.trim().length == 0) {

        alert("Please enter your first name");
        return false;
        }
           if (age.trim().length == 0) {

        alert("Please enter your fge");
        return false;
           }
           if (phone.trim().length == 0) {

        alert("Please enter your Phone Number");
        return false;
           }
               if (gender.trim().length == 0) {

        alert("Please enter your Gender");
        return false;
               }
               if (mail.trim().length == 0) {

        alert("Please enter your Email");
        return false;
               }
                   if (dob.trim().length == 0) {

        alert("Please enter your Dob");
        return false;
                   }
    debugger;

 $.ajax({
        type: "post",
        contentType: "application/json; charset=utf-8",
     url: "WebService1.asmx/GetData",
   
             data:"{firstName :'"+ first_name +"',  lastName:'"+ last_nme +"',  age:'"+ age +"',  dob:'"+ dob +"',  gender:'"+ gender +"',  email :'"+ mail +"',  phone :'"+ phone +"',  username :'"+ usrnme +"',  password :'"+ passwd +"'}",

        dataType: "json",
        success: function (Result) {
            Result = Result.d;

            window.open('../Registration.aspx');
        },
        error: function (Result) {


        }
    });




}

    </script>
</head>
<body>
    <form id="registrationForm" runat="server">
        <div class="container mt-4">
            <h2>Registration Form</h2>

            <div class="row mb-3">
                <label for="firstName" class="col-sm-2 col-form-label">First Name</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="firstName" runat="server" CssClass="form-control" oninput="this.value = this.value.replace(/[^A-Za-z.]/g, '')" />
                </div>
            </div>
            
            <div class="row mb-3">
                <label for="lastName" class="col-sm-2 col-form-label">Last Name</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="lastName" runat="server" CssClass="form-control" oninput="this.value = this.value.replace(/[^A-Za-z.]/g, '')" />
                </div>
            </div>

            <div class="row mb-3">
                <label for="age" class="col-sm-2 col-form-label">Age</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="age" runat="server" CssClass="form-control"  oninput="this.value = this.value.replace(/[^0-9]/g, '')" MaxLength="3" />
                </div>
            </div>

            <div class="row mb-3">
                <label for="dob" class="col-sm-2 col-form-label">Date of Birth</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="dob" runat="server" CssClass="form-control" TextMode="Date" />
                </div>
            </div>

            <div class="row mb-3">
                <label for="gender" class="col-sm-2 col-form-label">Gender</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="gender" runat="server" CssClass="form-control">
                        <asp:ListItem Value="select">--Select--</asp:ListItem>
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="row mb-3">
                <label for="email" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="email" runat="server" CssClass="form-control" TextMode="Email" />
                </div>
            </div>

            <div class="row mb-3">
                <label for="phone" class="col-sm-2 col-form-label">Phone Number</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="phone" runat="server" CssClass="form-control" oninput="this.value = this.value.replace(/[^0-9]/g, '')" MaxLength="10"  TextMode="phone" />

                </div>
            </div>

            <div class="row mb-3">
                <label for="username" class="col-sm-2 col-form-label">Username</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="username" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="row mb-3">
                <label for="password" class="col-sm-2 col-form-label">Password</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password" />
                </div>
            </div>

            <h3>Qualification Details</h3>
            <table id="qualificationsGridView" class="table table-bordered">
                <thead>
                    <tr>
                        <th>Course Name</th>
                        <th>University</th>
                        <th>Passing Year</th>
                        <th>Percentage</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
<%--            <button type="button" id="addQualification" class="btn btn-primary" onclick="addclick()" >Add Qualification</button>--%>
        <button type="button" id="addQualification" class="btn btn-primary" onclick="addclick()">Add Qualification</button>

            <div class="row mb-3 mt-4">
                <div class="col-sm-10 offset-sm-2">


<%--                 <input class="btn btn-primary" type="button" value="Submit" id ="btnSubmit" onclick="RegisterButton()"/>--%>
<%--            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit"/>--%>
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClientClick="handleButtonClick(); return false;" />
               </div>
           <p id="displayValue"></p>

            </div>
           

        </div>
    </form>
    <input type="button" value="test"  onclick="check()"/>
</body>
</html>
