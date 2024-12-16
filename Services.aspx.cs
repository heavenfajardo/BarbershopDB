using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Configuration;

namespace barbershop
{
    public partial class Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static string SaveAppointment(string firstName, string lastName, string email, string selectedServices, string appointmentDate, string appointmentTime, string barberName)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BarberShopConnectionString"].ToString();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    // INSERT query with default values for missing fields
                    string query = @"INSERT INTO Appointments 
                             (FirstName, LastName, Email, SelectedServices, AppointmentDate, AppointmentTime, BarberName) 
                             VALUES (@FirstName, @LastName, @Email, 
                                     ISNULL(@SelectedServices, 'N/A'), 
                                     ISNULL(@AppointmentDate, '1900-01-01'), 
                                     ISNULL(@AppointmentTime, '00:00:00'), 
                                     ISNULL(@BarberName, 'N/A'))";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@FirstName", firstName);
                        cmd.Parameters.AddWithValue("@LastName", lastName);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@SelectedServices", string.IsNullOrEmpty(selectedServices) ? (object)DBNull.Value : selectedServices);
                        cmd.Parameters.AddWithValue("@AppointmentDate", string.IsNullOrEmpty(appointmentDate) ? (object)DBNull.Value : DateTime.Parse(appointmentDate));
                        cmd.Parameters.AddWithValue("@AppointmentTime", string.IsNullOrEmpty(appointmentTime) ? (object)DBNull.Value : TimeSpan.Parse(appointmentTime));
                        cmd.Parameters.AddWithValue("@BarberName", string.IsNullOrEmpty(barberName) ? (object)DBNull.Value : barberName);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            return "Appointment saved successfully!";
                        }
                        else
                        {
                            return "Failed to save appointment.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    return "Error: " + ex.Message;
                }
            }
        }
    }
}