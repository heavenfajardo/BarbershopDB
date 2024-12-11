using System;
using System.Data.SqlClient;
using System.Web.Services;

namespace barbershop
{
    public partial class Services : System.Web.UI.Page
    {
        private static readonly string connectionString = "Data Source=LAPTOP-PFFT1KR8\\SQLEXPRESS;Initial Catalog=BARBER_APPOINTMENT_SYSTEM;Integrated Security=True;TrustServerCertificate=True";

        [WebMethod(EnableSession = false)]
        public static string SaveGuestInfo(string firstName, string lastName, string email)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "INSERT INTO CUSTOMER (CUS_FIRSTNAME, CUS_LASTNAME, CUS_EMAIL) VALUES (@FirstName, @LastName, @Email)";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@FirstName", firstName);
                        cmd.Parameters.AddWithValue("@LastName", lastName);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.ExecuteNonQuery();
                    }
                }
                return "Success";
            }
            catch (Exception ex)
            {
                return $"Error: {ex.Message}";
            }
        }
    }
}
