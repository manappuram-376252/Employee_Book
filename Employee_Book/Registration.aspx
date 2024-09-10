<%@ Page Title="Registration" Language="C#"  AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Employee_Book.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 
    <title>Registration Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.19.5/jquery.validate.min.js"></script>
   <script>
        $(document).ready(function () {
            $("#addQualification").click(function () {
                var rowCount = $("#qualificationsGridView tr").length;
                var newRow = `<tr>
                    <td><input type="text" name="courseName[]" class="form-control" /></td>
                    <td><input type="text" name="university[]" class="form-control" /></td>
                    <td><input type="text" name="year[]" class="form-control" /></td>
                    <td><input type="text" name="percentage[]" class="form-control" /></td>
                    <td><button type="button" class="btn btn-danger btn-sm removeRow">Remove</button></td>
                </tr>`;
                $("#qualificationsGridView tbody").append(newRow);
            });

            $(document).on("click", ".removeRow", function () {
                $(this).closest("tr").remove();
            });
          

            $("#registrationForm").validate({
                rules: {
                    firstName: "required",
                    age: {
                        required: true,
                        digits: true
                    },
                    dob: "required",
                    email: {
                        required: true,
                        email: true
                    },
                    phone: "required"
                },
                messages: {
                    firstName: "Please enter your first name",
                    age: {
                        required: "Please enter your age",
                        digits: "Please enter a valid age"
                    },
                    dob: "Please enter your date of birth",
                    email: "Please enter a valid email address",
                    phone: "Please enter your phone number"
                }
            });
        });
    </script>
</head>
<body>
    <form id="registrationForm" runat="server">
        <div class="container mt-4">
            <h2>Registration Form</h2>

            <div class="row mb-3">
                <label for="firstName" class="col-sm-2 col-form-label">First Name</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="firstName" runat="server" CssClass="form-control" />
                </div>
            </div>
            
            <div class="row mb-3">
                <label for="lastName" class="col-sm-2 col-form-label">Last Name</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="lastName" runat="server" CssClass="form-control" />
                </div>
            </div>

            <div class="row mb-3">
                <label for="age" class="col-sm-2 col-form-label">Age</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="age" runat="server" CssClass="form-control" />
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
                    <asp:TextBox ID="phone" runat="server" CssClass="form-control" TextMode="SingleLine" />
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
                        <th>Year</th>
                        <th>Percentage</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <button type="button" id="addQualification" class="btn btn-primary">Add Qualification</button>

            <div class="row mb-3 mt-4">
                <div class="col-sm-10 offset-sm-2">


<%--                 <input class="btn btn-primary" type="button" value="Submit" onclick="RegisterButton_Click"/>--%>
            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" />
               </div>
                <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="false"></asp:Label>

            </div>
           

        </div>
    </form>
</body>
</html>
