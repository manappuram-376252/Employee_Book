
<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Employee_Book.Registration" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Student Registration</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.19.5/jquery.validate.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#registrationForm").validate({
                rules: {
                    firstName: "required",
                    age: "required",
                    dob: "required",
                    gender: "required",
                    email: {
                        required: true,
                        email: true
                    },
                    phone: "required"
                },
                messages: {
                    firstName: "Please enter your first name",
                    age: "Please enter your age",
                    dob: "Please enter your date of birth",
                    gender: "Please select your gender",
                    email: "Please enter a valid email address",
                    phone: "Please enter your phone number"
                }
            });

$("#addQualification").click(function () {
                rowCount++;
                var newRow = `<tr id="row${rowCount}">
                    <td><input type="text" class="courseName" name="courseName[]"/></td>
                    <td><input type="text" class="percentage" name="percentage[]"/></td>
                    <td><input type="text" class="yearOfPassing" name="yearOfPassing[]"/></td>
                    <td><button type="button" onclick="removeRow('row${rowCount}')">Remove</button></td>
                </tr>`;
                $("#qualifications tbody").append(newRow);
            });
        });
    </script>
</head>
<body>
<%--    <form id="registrationForm" runat="server">--%>
        <h2>Student Registration Form</h2>

        <label for="firstName">First Name:</label>
        <asp:TextBox ID="firstName" runat="server" /><br />

        <label for="lastName">Last Name:</label>
        <asp:TextBox ID="lastName" runat="server" /><br />

        <label for="age">Age:</label>
        <asp:TextBox ID="age" runat="server" /><br />

        <label for="dob">Date of Birth:</label>
        <asp:TextBox ID="dob" runat="server" TextMode="Date" /><br />

        <label for="gender">Gender:</label>
        <asp:DropDownList ID="gender" runat="server">
            <asp:ListItem Value="Male">Male</asp:ListItem>
            <asp:ListItem Value="Female">Female</asp:ListItem>
            <asp:ListItem Value="Other">Other</asp:ListItem>
        </asp:DropDownList><br />

        <label for="email">Email ID:</label>
        <asp:TextBox ID="email" runat="server" TextMode="Email" /><br />

        <label for="phone">Phone Number:</label>
        <asp:TextBox ID="phone" runat="server" TextMode="Tel" /><br />

        <label for="username">Username:</label>
        <asp:TextBox ID="username" runat="server" /><br />

        <label for="password">Password:</label>
        <asp:TextBox ID="password" runat="server" TextMode="Password" /><br />

        <h3>Qualification Details</h3>
        <div id="qualifications">
            <div class="qualification">
                <label for="courseName">Course Name:</label>
                <asp:TextBox ID="courseName" runat="server" /><br />

                <label for="percentage">Percentage:</label>
                <asp:TextBox ID="percentage" runat="server" /><br />

                <label for="yearOfPassing">Year of Passing:</label>
                <asp:TextBox ID="yearOfPassing" runat="server" /><br />
            </div>
        </div>
        <button type="button" id="addQualification">Add More Qualifications</button><br />

        <asp:Button ID="registerButton" runat="server" Text="Register" OnClick="RegisterButton_Click" />
<%--    </form>--%>
</body>
</html>

</asp:Content>
