<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="barbershop.Services" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Services - Ford's Barber Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-image: url('Images/bg_blrd.jpg');
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
    }

    .container {
        max-width: 900px;
        margin-top: 50px;
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }

    .header {
        background-color: #8B4513;
        padding: 15px 30px;
        color: white;
    }

    .header h1 {
        margin: 0;
        font-size: 24px;
    }

    .services-section {
        margin-top: 30px;
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.9);
        border-radius: 10px;
    }

    .services-container {
        border: 1px solid #ccc;
        padding: 20px;
        background-color: #f8f8f8;
        border-radius: 10px;
    }

    .service-option {
        display: flex;
        align-items: center;
        gap: 15px;
        margin-bottom: 20px;
    }

    .service-option img {
        width: 80px;
        height: 80px;
        border-radius: 10px;
    }

    .service-option span {
        display: block;
    }

    .service-option span:first-of-type {
        font-weight: bold;
        font-size: 18px;
    }

    .service-option span:last-of-type {
        color: #888;
    }

    .next-button {
        margin-top: 30px;
        text-align: center;
    }

    .appointment-overlay, .guest-info-container {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 9999;
        justify-content: center;
        align-items: center;
        overflow: auto;
    }

    .appointment-container, .guest-info-container {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: row;
    }

    .close-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        background-color: #8B4513;
        color: white;
        padding: 5px 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .book-now-btn {
        background-color: #8B4513;
        color: white;
        padding: 15px 30px;
        text-align: center;
        border-radius: 5px;
        cursor: pointer;
        border: none;
    }

    .guest-info-container input {
        width: 100%;
        margin-bottom: 15px;
    }

    .guest-info-container button {
        width: 100%;
        background-color: #8B4513;
        color: white;
        padding: 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    #barberList {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
        justify-content: center;
        align-items: center;
    }

    #barberList img {
        width: 100px;
        height: 100px;
        cursor: pointer;
        border-radius: 50%;
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s ease;
    }

    #barberList img:hover {
        transform: scale(1.1);
    }

    #barberList p {
        margin-top: 8px;
        font-weight: bold;
    }

    #barberSelectionOverlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 9999;
        justify-content: center;
        align-items: center;
    }

    #barberSelectionOverlay .appointment-container {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        max-width: 600px;
        width: 90%;
    }

    #barberSelectionOverlay .appointment-container {
        flex-direction: column;
        text-align: center;
    }

    .total-price {
        font-weight: bold;
        margin-top: 20px;
    }

     .guest-info-container {
        display: none;
        flex-direction: column;
        gap: 15px;
        width: 100%;
    }

    .guest-info-container input {
        width: 100%;
    }
</style>
</head>
<body>
    <header class="header">
        <div class="d-flex justify-content-between align-items-center">
            <h1>Ford's Barber Shop</h1>
            <nav>
                <a href="Default.aspx" class="text-white text-decoration-none mx-3">Home</a>
                <a href="About.aspx" class="text-white text-decoration-none mx-3">About</a>
                <a href="Services.aspx" class="text-white text-decoration-none mx-3">Services</a>
                <a href="Reviews.aspx" class="text-white text-decoration-none mx-3">Reviews</a>
                <a href="Contact.aspx" class="text-white text-decoration-none mx-3">Contact</a>
            </nav>
        </div>
    </header>

  <div class="container" style="margin-top: 100px;">
        <div class="services-section">
            <h2 class="text-center text-primary mb-4">Services</h2>
            <form id="servicesForm">
                <div class="services-container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="service-option">
                                <input type="checkbox" id="scalp-therapy" name="service" value="850" onchange="updateSummary()" />
                                <label for="scalp-therapy">
                                    <img src="Images/scalptheraphy.png" alt="Scalp Therapy" />
                                    <div>
                                        <span>Scalp Therapy</span>
                                        <span>₱850.00</span>
                                    </div>
                                </label>
                            </div>
                            <div class="service-option">
                                <input type="checkbox" id="beard-shave" name="service" value="125" onchange="updateSummary()" />
                                <label for="beard-shave">
                                    <img src="Images/breadshave.png" alt="Beard Shave" />
                                    <div>
                                        <span>Beard Shave</span>
                                        <span>₱125.00</span>
                                    </div>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="service-option">
                                <input type="checkbox" id="haircut" name="service" value="200" onchange="updateSummary()" />
                                <label for="haircut">
                                    <img src="Images/haircut.png" alt="Haircut" />
                                    <div>
                                        <span>Haircut</span>
                                        <span>₱200.00</span>
                                    </div>
                                </label>
                            </div>
                            <div class="service-option">
                                <input type="checkbox" id="hair-coloring" name="service" value="500" onchange="updateSummary()" />
                                <label for="hair-coloring">
                                    <img src="Images/haircoloring.png" alt="Hair Coloring" />
                                    <div>
                                        <span>Hair Coloring</span>
                                        <span>₱500.00</span>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
            <div class="text-center next-button">
                <button type="button" class="btn btn-primary" onclick="showAppointmentContainer()">Next</button>
            </div>
        </div>
    </div>

  
    <div class="appointment-overlay" id="appointmentOverlay">
        <div class="appointment-container">
            <button class="close-btn" onclick="closeAppointmentContainer()">X</button>
            <div class="left-side">
                <h2>Book Your Appointment</h2>
                <form id="appointmentForm">
                    <label for="date">Appointment Date</label>
                    <input type="date" id="appointmentDate" class="form-control" required />
                    <label for="time" class="mt-3">Appointment Time</label>
                    <input type="time" id="appointmentTime" class="form-control" required />
                    <label for="barber" class="mt-3">Preferred Barber</label>
                    <input type="text" id="preferredBarber" class="form-control" readonly onclick="openBarberSelection()" placeholder="Select Barber" />
                    <div class="total-price">
                        <p><strong>Total Price: </strong><span id="totalPrice">₱0.00</span></p>
                    </div>
                </form>
                <div class="appointment-footer">
                    <button class="book-now-btn" onclick="showGuestInfoContainer()">Book Now</button>
                </div>
            </div>
        </div>
    </div>

    <div class="appointment-overlay" id="guestInfoOverlay">
        <div class="guest-info-container">
            <h2>Guest Information</h2>
            <form id="guestInfoForm">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" class="form-control" required />
                
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" class="form-control" required />
                
                <label for="email">Email</label>
                <input type="email" id="email" class="form-control" required />

                <button type="button" class="book-now-btn" onclick="submitGuestInfo()">Submit</button>
            </form>
        </div>
    </div>

    <!-- Barber Selection Overlay -->
    <div class="appointment-overlay" id="barberSelectionOverlay">
        <div class="appointment-container">
            <button class="close-btn" onclick="closeBarberSelection()">X</button>
            <h2 class="text-center mb-4">Select a Barber</h2>
            <div id="barberList"></div>
        </div>
    </div>

    <script>
        let selectedServices = [];
        function updateSummary() {
            selectedServices = [];
            const services = document.querySelectorAll('input[name="service"]:checked');
            let total = 0;
            let summary = "<h3>Summary</h3>";
            services.forEach((service) => {
                const label = service.nextElementSibling.querySelector("span").textContent;
                const value = service.value;
                summary += `<p>${label}: ₱${value}</p>`;
                selectedServices.push(label);
                total += parseFloat(value);
            });
            document.getElementById("totalPrice").textContent = `₱${total}`;
            document.getElementById("summaryList").innerHTML = summary;
        }

        function showAppointmentContainer() {
            document.getElementById("appointmentOverlay").style.display = "flex";
        }

        function closeAppointmentContainer() {
            document.getElementById("appointmentOverlay").style.display = "none";
        }

        function showGuestInfoContainer() {
            document.getElementById("guestInfoOverlay").style.display = "flex";
        }

        function submitGuestInfo() {
            const firstName = document.getElementById("firstName").value;
            const lastName = document.getElementById("lastName").value;
            const email = document.getElementById("email").value;
            if (!firstName || !lastName || !email) {
                alert("Please fill in all the guest information!");
                return;
            }
            alert(`Appointment booked successfully for ${firstName} ${lastName} with email ${email}.`);
            closeGuestInfoContainer();
        }

        function closeGuestInfoContainer() {
            document.getElementById("guestInfoOverlay").style.display = "none";
        }

        function openBarberSelection() {
            document.getElementById("barberSelectionOverlay").style.display = "flex";
            const barbers = [
                { id: 1, name: "No Preferences", image: "Images/blue.jpg" },
                { id: 2, name: "Ian", image: "Images/ian.png" },
                { id: 3, name: "Heaven", image: "Images/heaven.png" },
                { id: 4, name: "Shanelle", image: "Images/shanel.png" },
                { id: 5, name: "Erick", image: "Images/oyao.png" },
                { id: 6, name: "Titus", image: "Images/titus.png" },
            ];
            let content = "";
            barbers.forEach((barber) => {
                content += `
                <div class="text-center">
                    <img src="${barber.image}" alt="${barber.name}" onclick="selectBarber('${barber.name}')" />
                    <p>${barber.name}</p>
                </div>`;
            });
            document.getElementById("barberList").innerHTML = content;
        }

        function closeBarberSelection() {
            document.getElementById("barberSelectionOverlay").style.display = "none";
        }

        function selectBarber(barberName) {
            document.getElementById("preferredBarber").value = barberName;
            closeBarberSelection();
        }
    </script>
</body>
</html>