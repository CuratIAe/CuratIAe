USE [CuratIAeV]
GO

CREATE TABLE [dbo].[Archivos](
	[IdArchivo] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[NombreArchivo] [nvarchar](255) NULL,
	[Tipo] [nvarchar](50) NULL,
	[FechaSubida] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdArchivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditLog]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLog](
	[IdAudit] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Accion] [nvarchar](100) NULL,
	[TablaAfectada] [nvarchar](100) NULL,
	[Fecha] [datetime] NULL,
	[Detalles] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAudit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatBot]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatBot](
	[IdChat] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[Mensaje] [nvarchar](max) NOT NULL,
	[Fecha] [datetime] NULL,
	[Quien] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdChat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsultaDiagnosticos]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultaDiagnosticos](
	[IdConsultaDiag] [int] IDENTITY(1,1) NOT NULL,
	[IdConsulta] [int] NOT NULL,
	[Diagnostico] [nvarchar](255) NOT NULL,
	[Confianza] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsultaDiag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consultas]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultas](
	[IdConsulta] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[FechaConsulta] [datetime] NULL,
	[IdEstado] [int] NOT NULL,
	[IdGravedad] [int] NOT NULL,
	[Notas] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsultaSignosVitales]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultaSignosVitales](
	[IdConsSigno] [int] IDENTITY(1,1) NOT NULL,
	[IdConsulta] [int] NOT NULL,
	[IdSigno] [int] NOT NULL,
	[Valor] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsSigno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enfermedades]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enfermedades](
	[IdEnfermedad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEnfermedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnfermedadSintomas]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnfermedadSintomas](
	[IdEnfSintoma] [int] IDENTITY(1,1) NOT NULL,
	[IdEnfermedad] [int] NOT NULL,
	[IdSintoma] [int] NOT NULL,
	[Peso] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEnfSintoma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoConsulta]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoConsulta](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventosSalud]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventosSalud](
	[IdEvento] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoEvento] [int] NOT NULL,
	[Titulo] [nvarchar](200) NOT NULL,
	[Descripcion] [nvarchar](max) NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaFin] [datetime] NOT NULL,
	[Lugar] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialClinico]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialClinico](
	[IdHistorial] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[Notas] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialVacunas]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialVacunas](
	[IdHistorialVac] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[IdVacuna] [int] NOT NULL,
	[FechaAplicacion] [datetime] NULL,
	[Estado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHistorialVac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NivelGravedad]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NivelGravedad](
	[IdGravedad] [int] IDENTITY(1,1) NOT NULL,
	[Nivel] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGravedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[IdPaciente] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [nvarchar](150) NOT NULL,
	[NumeroIdentificacion] [nvarchar](50) NULL,
	[FechaNacimiento] [date] NULL,
	[Sexo] [nvarchar](20) NULL,
	[Direccion] [nvarchar](255) NULL,
	[Telefono] [nvarchar](20) NULL,
	[Correo] [nvarchar](100) NULL,
	[Latitud] [decimal](9, 6) NULL,
	[Longitud] [decimal](9, 6) NULL,
	[Comunidad] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[NumeroIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanAlimenticioDetalle]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanAlimenticioDetalle](
	[IdDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdPlan] [int] NOT NULL,
	[Alimento] [nvarchar](100) NULL,
	[Cantidad] [nvarchar](50) NULL,
	[Horario] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanesAlimenticios]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanesAlimenticios](
	[IdPlan] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RiesgosPaciente]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RiesgosPaciente](
	[IdRiesgo] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
	[NivelRiesgo] [nvarchar](50) NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRiesgo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RutinaEjercicioDetalle]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RutinaEjercicioDetalle](
	[IdDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdRutina] [int] NOT NULL,
	[Ejercicio] [nvarchar](100) NULL,
	[Series] [int] NULL,
	[Repeticiones] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RutinasEjercicio]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RutinasEjercicio](
	[IdRutina] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRutina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicioUnidad]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicioUnidad](
	[IdServicioUnidad] [int] IDENTITY(1,1) NOT NULL,
	[IdUnidad] [int] NOT NULL,
	[NombreServicio] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdServicioUnidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SignosVitalesCatalogo]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SignosVitalesCatalogo](
	[IdSigno] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Unidad] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSigno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sintomas]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sintomas](
	[IdSintoma] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSintoma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEvento]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEvento](
	[IdTipoEvento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnidadesSalud]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnidadesSalud](
	[IdUnidad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[Direccion] [nvarchar](255) NULL,
	[Telefono] [nvarchar](20) NULL,
	[Latitud] [decimal](9, 6) NULL,
	[Longitud] [decimal](9, 6) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUnidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioRoles]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioRoles](
	[IdUsuarioRol] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdRol] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuarioRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [nvarchar](150) NOT NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Clave] [nvarchar](255) NOT NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacunas]    Script Date: 27/09/2025 20:47:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacunas](
	[IdVacuna] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[Descripcion] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVacuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Archivos] ADD  DEFAULT (getdate()) FOR [FechaSubida]
GO
ALTER TABLE [dbo].[AuditLog] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[ChatBot] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[Consultas] ADD  DEFAULT (getdate()) FOR [FechaConsulta]
GO
ALTER TABLE [dbo].[EnfermedadSintomas] ADD  DEFAULT ((1.0)) FOR [Peso]
GO
ALTER TABLE [dbo].[HistorialClinico] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[HistorialVacunas] ADD  DEFAULT ('Aplicada') FOR [Estado]
GO
ALTER TABLE [dbo].[RiesgosPaciente] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[Archivos]  WITH CHECK ADD FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[AuditLog]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[ChatBot]  WITH CHECK ADD FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[ConsultaDiagnosticos]  WITH CHECK ADD FOREIGN KEY([IdConsulta])
REFERENCES [dbo].[Consultas] ([IdConsulta])
GO
ALTER TABLE [dbo].[Consultas]  WITH CHECK ADD FOREIGN KEY([IdEstado])
REFERENCES [dbo].[EstadoConsulta] ([IdEstado])
GO
ALTER TABLE [dbo].[Consultas]  WITH CHECK ADD FOREIGN KEY([IdGravedad])
REFERENCES [dbo].[NivelGravedad] ([IdGravedad])
GO
ALTER TABLE [dbo].[Consultas]  WITH CHECK ADD FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[Consultas]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[ConsultaSignosVitales]  WITH CHECK ADD FOREIGN KEY([IdConsulta])
REFERENCES [dbo].[Consultas] ([IdConsulta])
GO
ALTER TABLE [dbo].[ConsultaSignosVitales]  WITH CHECK ADD FOREIGN KEY([IdSigno])
REFERENCES [dbo].[SignosVitalesCatalogo] ([IdSigno])
GO
ALTER TABLE [dbo].[HistorialClinico]  WITH CHECK ADD FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[HistorialVacunas]  WITH CHECK ADD FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[HistorialVacunas]  WITH CHECK ADD FOREIGN KEY([IdVacuna])
REFERENCES [dbo].[Vacunas] ([IdVacuna])
GO
ALTER TABLE [dbo].[PlanAlimenticioDetalle]  WITH CHECK ADD FOREIGN KEY([IdPlan])
REFERENCES [dbo].[PlanesAlimenticios] ([IdPlan])
GO
ALTER TABLE [dbo].[RiesgosPaciente]  WITH CHECK ADD FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Pacientes] ([IdPaciente])
GO
ALTER TABLE [dbo].[RutinaEjercicioDetalle]  WITH CHECK ADD FOREIGN KEY([IdRutina])
REFERENCES [dbo].[RutinasEjercicio] ([IdRutina])
GO
ALTER TABLE [dbo].[ServicioUnidad]  WITH CHECK ADD FOREIGN KEY([IdUnidad])
REFERENCES [dbo].[UnidadesSalud] ([IdUnidad])
GO
ALTER TABLE [dbo].[UsuarioRoles]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([IdRol])
GO
ALTER TABLE [dbo].[UsuarioRoles]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarUsuario]    Script Date: 27/09/2025 20:47:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RegistrarUsuario](
    @NombreCompleto NVARCHAR(150),
    @Correo NVARCHAR(100),
    @Clave NVARCHAR(255),
    @FechaRegistro DATETIME,
    @registrado BIT OUTPUT,
    @Mensaje NVARCHAR(100) OUTPUT
)
AS
BEGIN
    IF (NOT EXISTS(SELECT 1 FROM Usuarios WHERE Correo = @Correo))
    BEGIN
        INSERT INTO Usuarios (NombreCompleto, Correo, Clave, FechaRegistro) 
        VALUES (@NombreCompleto, @Correo, @Clave, @FechaRegistro);

        SET @registrado = 1;
        SET @Mensaje = 'Usuario Registrado correctamente';
    END
    ELSE
    BEGIN
        SET @registrado = 0;
        SET @Mensaje = 'El correo ya está registrado';
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_validarUsuario]    Script Date: 27/09/2025 20:47:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_validarUsuario](
    @Correo NVARCHAR(100),
    @Clave NVARCHAR(255)
)
AS
BEGIN
    IF EXISTS(SELECT 1 FROM Usuarios WHERE Correo = @Correo AND Clave = @Clave)
    BEGIN
        SELECT IdUsuario, NombreCompleto, Correo
        FROM Usuarios 
        WHERE Correo = @Correo AND Clave = @Clave;
    END
    ELSE
    BEGIN
        SELECT 0 AS IdUsuario, '' AS NombreCompleto, '' AS Correo;
    END
END

