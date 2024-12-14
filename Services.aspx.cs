using System;
using System.Data.SqlClient;
using System.Web.Services;
using System.Configuration;

namespace barbershop
{
    public partial class Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialization logic (if required)
        }

        [WebMethod]
        public static string SaveAppointment(
            string firstName,
            string lastName,
            string email,
            string selectedServices,
            string appointmentDate,
            string appointmentTime,
            string barberName)
        {
            try
            {
                // Parse appointment date and time
                DateTime appDateTime = DateTime.Parse($"{appointmentDate} {appointmentTime}");

                // Connection string from web.config
                string connectionString = ConfigurationManager.ConnectionStrings["BarberAppointmentDB"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Insert customer into CUSTOMER table if not exists
                    string insertCustomerQuery = @"
                        IF NOT EXISTS (SELECT 1 FROM CUSTOMER WHERE CUS_EMAIL = @Email)
                        BEGIN
                            INSERT INTO CUSTOMER (CUS_FIRSTNAME, CUS_LASTNAME, CUS_EMAIL)
                            VALUES (@FirstName, @LastName, @Email)
                        END";

                    using (SqlCommand cmd = new SqlCommand(insertCustomerQuery, connection))
                    {
                        cmd.Parameters.AddWithValue("@FirstName", firstName);
                        cmd.Parameters.AddWithValue("@LastName", lastName);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.ExecuteNonQuery();
                    }

                    // Retrieve customer ID
                    string getCustomerIdQuery = "SELECT CUS_ID FROM CUSTOMER WHERE CUS_EMAIL = @Email";
                    int customerId;
                    using (SqlCommand cmd = new SqlCommand(getCustomerIdQuery, connection))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        customerId = (int)cmd.ExecuteScalar();
                    }

                    // Retrieve barber ID (if selected)
                    int? barberId = null;
                    if (!string.IsNullOrEmpty(barberName) && barberName != "No Preferences")
                    {
                        string getBarberIdQuery = "SELECT BAR_ID FROM BARBER WHERE BAR_FULLNAME = @BarberName";
                        using (SqlCommand cmd = new SqlCommand(getBarberIdQuery, connection))
                        {
                            cmd.Parameters.AddWithValue("@BarberName", barberName);
                            object result = cmd.ExecuteScalar();
                            if (result != null)
                            {
                                barberId = (int)result;
                            }
                        }
                    }

                    // Split selected services
                    string[] services = selectedServices.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

                    // Insert appointments for each selected service
                    foreach (var serviceName in services)
                    {
                        string getServiceIdQuery = "SELECT SER_ID FROM [SERVICE] WHERE SER_NAME = @ServiceName";
                        int serviceId;

                        using (SqlCommand cmd = new SqlCommand(getServiceIdQuery, connection))
                        {
                            cmd.Parameters.AddWithValue("@ServiceName", serviceName.Trim());
                            object result = cmd.ExecuteScalar();
                            if (result == null)
                            {
                                throw new Exception($"Service '{serviceName}' not found in the database.");
                            }
                            serviceId = (int)result;
                        }

                        // Insert into APPOINTMENT table
                        string insertAppointmentQuery = @"
                            INSERT INTO APPOINTMENT (CUS_ID, APP_DATE, BAR_ID, SER_ID, STATUS_ID)
                            VALUES (@CustomerId, @AppDateTime, @BarberId, @ServiceId, 1)";

                        using (SqlCommand cmd = new SqlCommand(insertAppointmentQuery, connection))
                        {
                            cmd.Parameters.AddWithValue("@CustomerId", customerId);
                            cmd.Parameters.AddWithValue("@AppDateTime", appDateTime);
                            cmd.Parameters.AddWithValue("@BarberId", (object)barberId ?? DBNull.Value);
                            cmd.Parameters.AddWithValue("@ServiceId", serviceId);
                            cmd.ExecuteNonQuery();
                        }
                    }
                }

                return "Appointment saved successfully!";
            }
            catch (Exception ex)
            {
                return $"Error saving appointment: {ex.Message}";
            }
        }
    }
}
