using System;
using System.Web.UI;
using barbershop.App_Code;

namespace barbershop
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DatabaseHelper dbHelper = new DatabaseHelper();
            dbHelper.InsertBarbersAndServices();
        }
    }
}
