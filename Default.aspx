<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="barbershop._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Section -->
    <header style="background-color: #8B4513; padding: 15px 30px;">
        <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
            <div style="display: flex; align-items: center; gap: 15px;">
                <h1 style="margin: 0; font-size: 24px; color: #fff;">Ford's Barber Shop</h1>
            </div>
            <div style="display: flex; align-items: center; gap: 20px;">
                <a href="Default.aspx" style="text-decoration: none; color: #fff;">Home</a>
                <a href="About.aspx" style="text-decoration: none; color: #fff;">About</a>
                <a href="Services.aspx" style="text-decoration: none; color: #fff;">Services</a>
                <a href="Reviews.aspx" style="text-decoration: none; color: #fff;">Reviews</a>
                <a href="Contact.aspx" style="text-decoration: none; color: #fff;">Contact</a>
            </div>
        </div>
    </header>

    <!-- Logo Section -->
    <div class="logo-section" style="display: flex; justify-content: space-between; align-items: center; margin-top: 20px;">
        <div class="additional-menu" style="display: flex; align-items: center; gap: 20px;">
            <img src="Images/br.logof-modified.png" alt="Logo" style="width: 60px; height: 60px;" />
            <ul style="list-style: none; padding: 0; margin: 0; display: flex; gap: 20px;">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="openingHourDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Opening Hour
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="openingHourDropdown">
                        <li><a class="dropdown-item" href="#">Monday - Friday: 9 AM - 7 PM</a></li>
                        <li><a class="dropdown-item" href="#">Saturday: 10 AM - 5 PM</a></li>
                        <li><a class="dropdown-item" href="#">Sunday: Closed</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="galleryDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Gallery
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="galleryDropdown">
                        <li><a class="dropdown-item" href="#">Photos</a></li>
                        <li><a class="dropdown-item" href="#">Videos</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <!-- Main Content Section -->
    <main style="background: url('Images/bg_blrd.jpg') no-repeat center center; background-size: cover; padding: 50px; text-align: center; display: flex; justify-content: center; align-items: center; height: 100vh; box-sizing: border-box;">
        <section style="background-color: rgba(255, 255, 255, 0.8); padding: 20px; border-radius: 10px; max-width: 600px; width: 100%; text-align: center;">
            <h2 style="color: #8B4513; font-size: 2rem; margin-bottom: 15px;">Bring Back Good Looks!</h2>
            <p style="font-size: 1.1rem; color: #333; margin-bottom: 15px;">It's not just a haircut, it's an experience.</p>
            <p style="font-size: 1rem; color: #333; margin-bottom: 20px;">Located at Urgello St., Cebu City, Philippines</p>
            <a href="Services.aspx" style="background-color: #8B4513; color: #fff; padding: 15px 30px; text-decoration: none; border-radius: 5px; font-size: 1.1rem;">
                Book Appointment Now!
            </a>
        </section>
    </main>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</asp:Content>
