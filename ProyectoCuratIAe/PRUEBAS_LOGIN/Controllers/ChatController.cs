using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PRUEBAS_LOGIN.Controllers
{
    public class ChatController : Controller
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["CuratIAe2.0"].ConnectionString;

        [HttpPost]
        public JsonResult GuardarMensaje(int idPaciente, string mensaje, string quien)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO ChatBot (IdPaciente, Mensaje, Quien) VALUES (@idPaciente, @mensaje, @quien)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@idPaciente", idPaciente);
                cmd.Parameters.AddWithValue("@mensaje", mensaje);
                cmd.Parameters.AddWithValue("@quien", quien);

                con.Open();
                cmd.ExecuteNonQuery();
            }
            return Json(new { success = true });
        }
    }
}