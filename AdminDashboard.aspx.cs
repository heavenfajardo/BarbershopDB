using System;
using System.Data;
using System.Data.SqlClient;

namespace barbershop
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        private readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["BarberAppointmentDB"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAppointments();
            }
        }

        private void LoadAppointments()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT 
                C.CUS_FIRSTNAME + ' ' + C.CUS_LASTNAME AS CustomerName,
                A.APP_DATE AS AppointmentDate,
                A.APP_TIME AS AppointmentTime,
                B.BAR_FULLNAME AS BarberName,
                S.SER_NAME AS ServiceName,
                ST.STATUS_TYPE AS Status
            FROM APPOINTMENT A
            JOIN CUSTOMER C ON A.CUS_ID = C.CUS_ID
            LEFT JOIN BARBER B ON A.BAR_ID = B.BAR_ID
            JOIN [SERVICE] S ON A.SER_ID = S.SER_ID
            JOIN [STATUS] ST ON A.STATUS_ID = ST.STATUS_ID";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvAppointments.DataSource = dt;
                gvAppointments.DataBind();
            }
        }
    }
}