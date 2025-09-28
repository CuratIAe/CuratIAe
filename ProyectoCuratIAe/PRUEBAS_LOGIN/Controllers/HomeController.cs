using PRUEBAS_LOGIN.Models;
using PRUEBAS_LOGIN.Permisos;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace PRUEBAS_LOGIN.Controllers
{
    [ValidarSesion]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Página de descripción.";
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Página de contacto.";
            return View();
        }

        public ActionResult Geo()
        {
            ViewBag.Message = "Página de Geolocalización.";
            return View();
        }

        public ActionResult Historial()
        {
            var historial = new List<HistorialMedico>
    {
        // Ejemplo 1: Consulta General (igual a tu ejemplo)
        new HistorialMedico {
            Id = 1,
            Fecha = new DateTime(2025, 3, 15, 10, 30, 0),
            TipoConsulta = "Consulta",
            Titulo = "Control de rutina - Medicina General",
            Sintomas = "Control anual, chequeo general",
            Diagnostico = "Estado de salud óptimo",
            Recomendaciones = "Mantener actividad física regular y dieta balanceada",
            Medicamentos = "Multivitamínico, Vitamina D",
            MedicoNombre = "Dr. Roberto Mendoza",
            Especialidad = "Medicina General"
        },
        
        // Ejemplo 2: Diagnóstico IA (nuevo)
        new HistorialMedico {
            Id = 2,
            Fecha = new DateTime(2025, 3, 10, 15, 15, 0),
            TipoConsulta = "Diagnostico",
            Titulo = "Análisis de síntomas respiratorios",
            Sintomas = "Tos seca, fiebre leve, malestar general",
            Diagnostico = "Infección viral leve",
            Recomendaciones = "Reposo, hidratación, monitoreo de temperatura",
            Medicamentos = "Paracetamol, Reposo",
            MedicoNombre = "Dr. CuratIAe",
            Especialidad = "Asistente de Diagnóstico"
        },
        
        // Ejemplo 3: Emergencia (nuevo)
        new HistorialMedico {
            Id = 3,
            Fecha = new DateTime(2025, 3, 5, 20, 45, 0),
            TipoConsulta = "Emergencia",
            Titulo = "Lesión deportiva - Tobillo",
            Sintomas = "Dolor agudo, inflamación, dificultad para caminar",
            Diagnostico = "Esguince de tobillo grado I",
            Recomendaciones = "Reposo, hielo, compresión, elevación. Próxima cita: 12 Mar 2025 - Control evolutivo",
            Medicamentos = "Ibuprofeno, Analgésico tópico",
            MedicoNombre = "Dra. Teresa Rodríguez",
            Especialidad = "Traumatología"
        }
    };

            return View(historial);
        }


        public ActionResult Chat()
        {
            return View();
        }

        public ActionResult Informacion()
        {
            return View();
        }

        public ActionResult Clinicas()
        {
            return View();
        }

        public ActionResult Alimentacion()
        {
            return View();
        }

        public ActionResult Vacunacion()
        {
            return View();
        }

        public ActionResult Programas()
        {
            return View();
        }


        public ActionResult Calendario()
        {
            return View();
        }

        public ActionResult CerrarSesion()
        {
            Session.Clear();
            Session.Abandon();
            return RedirectToAction("Login", "Acceso");
        }
    }
}
