using System;
using System.Text;
using System.Web.Mvc;
using PRUEBAS_LOGIN.Models;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.Configuration;

namespace PRUEBAS_LOGIN.Controllers
{
    public class AccesoController : Controller
    {

        //static string cadena = "Data Source=DESKTOP-KUN3IR9;Database=CuratIAe2.0;User Id=sa;Password=Paquito2025;";
        //static string cadena = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=CuratIAe2.0;Integrated Security=True;";
        private static string cadena = ConfigurationManager.ConnectionStrings["conexion"].ToString();
        // GET: Acceso/Login
        public ActionResult Login()
        {
            return View();
        }

        // GET: Acceso/Registrar
        public ActionResult Registrar()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Registrar(Usuario oUsuario)
        {
            bool registrado;
            string mensaje;

            if (oUsuario.Clave == oUsuario.ConfirmarClave)
            {
                oUsuario.Clave = ConvertirSha256(oUsuario.Clave);
            }
            else
            {
                ViewData["Mensaje"] = "Las contraseñas no coinciden";
                return View();
            }

            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("sp_RegistrarUsuario", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@NombreCompleto", oUsuario.NombreCompleto);
                cmd.Parameters.AddWithValue("@Correo", oUsuario.Correo);
                cmd.Parameters.AddWithValue("@Clave", oUsuario.Clave);
                cmd.Parameters.AddWithValue("@FechaRegistro", DateTime.Now);

                cmd.Parameters.Add("@registrado", SqlDbType.Bit).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 100).Direction = ParameterDirection.Output;

                cn.Open();
                cmd.ExecuteNonQuery();

                registrado = Convert.ToBoolean(cmd.Parameters["@registrado"].Value);
                mensaje = cmd.Parameters["@Mensaje"].Value.ToString();
            }

            ViewData["Mensaje"] = mensaje;

            if (registrado)
            {
                return RedirectToAction("Login", "Acceso");
            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult Login(Usuario oUsuario)
        {
            oUsuario.Clave = ConvertirSha256(oUsuario.Clave);

            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("sp_validarUsuario", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Correo", oUsuario.Correo);
                cmd.Parameters.AddWithValue("@Clave", oUsuario.Clave);

                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    oUsuario.IdUsuario = Convert.ToInt32(dr["IdUsuario"]);
                    oUsuario.NombreCompleto = dr["NombreCompleto"].ToString();
                    oUsuario.Correo = dr["Correo"].ToString();
                }
                else
                {
                    oUsuario.IdUsuario = 0;
                }
            }

            if (oUsuario.IdUsuario != 0)
            {
                Session["usuario"] = oUsuario;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewData["Mensaje"] = "Usuario o contraseña incorrectos";
                return View();
            }
        }

        public static string ConvertirSha256(string texto)
        {
            StringBuilder Sb = new StringBuilder();
            using (SHA256 hash = SHA256Managed.Create())
            {
                Encoding enc = Encoding.UTF8;
                byte[] result = hash.ComputeHash(enc.GetBytes(texto));

                foreach (byte b in result)
                    Sb.Append(b.ToString("x2"));
            }
            return Sb.ToString();
        }
    }
}
