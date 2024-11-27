using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;  // Make sure this is included

namespace barbershop.App_Code
{
    public class DatabaseHelper
    {
        // Change connection string to match the name in your Web.config
        private string connectionString = ConfigurationManager.ConnectionStrings["BarberAppointmentDB"].ConnectionString;

        public void InsertBarbersAndServices()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Insert into Barbers table
                string barbersSql = @"
                    INSERT INTO Barbers (Name, ImageUrl) VALUES 
                    ('No Preferences', 'Images/blue.jpg'),
                    ('Ian', 'Images/ian.png'),
                    ('Heaven', 'Images/heaven.png'),
                    ('Shanelle', 'Images/shanel.png'),
                    ('Erick', 'Images/oyao.png'),
                    ('Titus', 'Images/titus.png');
                ";

                using (SqlCommand cmd = new SqlCommand(barbersSql, conn))
                {
                    cmd.ExecuteNonQuery();
                }

                // Insert into Services table
                string servicesSql = @"
                    INSERT INTO Services (Name, Price, ImageUrl) VALUES 
                    ('Scalp Therapy', 850, 'Images/scalptheraphy.png'),
                    ('Beard Shave', 125, 'Images/breadshave.png'),
                    ('Haircut', 200, 'Images/haircut.png'),
                    ('Hair Coloring', 500, 'Images/haircoloring.png');
                ";

                using (SqlCommand cmd = new SqlCommand(servicesSql, conn))
                {
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
