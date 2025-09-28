using System;

namespace PRUEBAS_LOGIN.Models
{
    public class HistorialMedico
    {
        public int Id { get; set; }
        public DateTime Fecha { get; set; }
        public string TipoConsulta { get; set; }
        public string Titulo { get; set; }
        public string Sintomas { get; set; }
        public string Diagnostico { get; set; }
        public string Recomendaciones { get; set; }
        public string Medicamentos { get; set; }
        public string MedicoNombre { get; set; }
        public string Especialidad { get; set; }
    }

}
