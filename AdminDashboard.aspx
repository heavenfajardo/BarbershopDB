<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="barbershop.AdminDashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        h3 {
            font-weight: bold;
            color: #343a40;
            margin-bottom: 20px;
        }

        button {
            font-size: 16px;
            font-weight: bold;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }

        button:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }

        table {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        table th {
            background-color: #343a40;
            color: white;
            font-weight: bold;
        }

        table td {
            vertical-align: middle;
        }

        .progress-bar {
            background-color: #17a2b8;
        }

        .col-md-8, .col-md-4 {
            background-color: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .col-md-4 {
            text-align: center;
        }

        h5 {
            color: #495057;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .row {
            margin-bottom: 30px;
        }

        .badge {
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h1 class="mb-4">Admin Dashboard</h1>
                       <asp:GridView ID="gvAppointments" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                    <asp:BoundField DataField="AppointmentDate" HeaderText="Date" />
                    <asp:BoundField DataField="AppointmentTime" HeaderText="Time" />
                    <asp:BoundField DataField="BarberName" HeaderText="Barber" />
                    <asp:BoundField DataField="ServiceName" HeaderText="Service" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
            </asp:GridView>

        </div>
    </form>
</body>
</html>