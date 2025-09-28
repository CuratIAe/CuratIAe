using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PRUEBAS_LOGIN.Controllers
{
    public class PacientesController : Controller
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["CuratIAe2.0"].ConnectionString;

        public ActionResult UltimasConsultas()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM vw_PacientesUltimasConsultas";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.Fill(dt);
            }
            return View(dt);
        }
    }
}


