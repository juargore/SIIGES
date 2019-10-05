-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2018 a las 05:48:03
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `siiges`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academias`
--

CREATE TABLE `academias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `situacion_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `matricula` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adeudo_materias` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `descripcion_estatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archivo_certificado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archivo_nacimiento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archivo_curp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estatus_certificado` int(1) DEFAULT NULL,
  `estatus_nacimiento` int(1) DEFAULT NULL,
  `estatus_curp` int(1) DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_grupos`
--

CREATE TABLE `alumnos_grupos` (
  `id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `periodo_fecha_inicio` date NOT NULL,
  `periodo_fecha_fin` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_observaciones`
--

CREATE TABLE `alumno_observaciones` (
  `id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `observacion` text COLLATE utf8_unicode_ci NOT NULL,
  `etapa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id` int(11) NOT NULL,
  `infraestructura_id` int(11) NOT NULL,
  `docente_id` int(11) NOT NULL,
  `academia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `programa_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clave` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seriacion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `objetivo` text COLLATE utf8_unicode_ci,
  `temas` text COLLATE utf8_unicode_ci,
  `actividades` text COLLATE utf8_unicode_ci,
  `modelo_instruccional` text COLLATE utf8_unicode_ci,
  `horas_docente` int(11) NOT NULL,
  `horas_independiente` int(11) NOT NULL,
  `minimo_horas` int(11) NOT NULL,
  `minimo_creditos` int(11) NOT NULL,
  `creditos` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `grado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_autorizacion` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas_hemerobibliograficas`
--

CREATE TABLE `asignaturas_hemerobibliograficas` (
  `asignatura_id` int(11) NOT NULL,
  `hemerobibliografica_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asociaciones`
--

CREATE TABLE `asociaciones` (
  `id` int(11) NOT NULL,
  `evaluador_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_membresia` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacoras`
--

CREATE TABLE `bitacoras` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `entidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lugar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `asignatura_id` int(11) NOT NULL,
  `estatus_calificacion_id` int(11) DEFAULT NULL,
  `calificacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_examen` date DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_evaluacion_pregunta`
--

CREATE TABLE `categorias_evaluacion_pregunta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias_evaluacion_pregunta`
--

INSERT INTO `categorias_evaluacion_pregunta` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Revisión Técnica', NULL, '2018-10-08 00:00:00', NULL, NULL),
(2, 'Antecedentes académicos de ingreso', NULL, '2018-10-08 00:00:00', NULL, NULL),
(3, 'Perfil de ingreso', NULL, '2018-10-08 00:00:00', NULL, NULL),
(4, 'Proceso de selección de estudiantes', NULL, '2018-10-08 00:00:00', NULL, NULL),
(5, 'Perfil de egreso', NULL, '2018-10-08 00:00:00', NULL, NULL),
(6, 'Mapa curricular', NULL, '2018-10-08 00:00:00', NULL, NULL),
(7, 'Flexibilidad curricular', NULL, '2018-10-08 00:00:00', NULL, NULL),
(8, 'Objetivo general', NULL, '2018-10-08 00:00:00', NULL, NULL),
(9, 'Estructura del plan de estudios', NULL, '2018-10-08 00:00:00', NULL, NULL),
(10, 'Operación del plan de estudios a través de sus academias', NULL, '2018-10-08 00:00:00', NULL, NULL),
(11, 'Líneas de generación y aplicación de conocimiento', NULL, '2018-10-08 00:00:00', NULL, NULL),
(12, 'Actulización del plan de estudios', NULL, '2018-10-08 00:00:00', NULL, NULL),
(13, 'Proyecto de seguimiento a egresados', NULL, '2018-10-08 00:00:00', NULL, NULL),
(14, 'Vinculación con los colegios de profesionistas, academias, asocciaciones profesionales,etc.', NULL, '2018-10-08 00:00:00', NULL, NULL),
(15, 'Vigencia', NULL, '2018-10-08 00:00:00', NULL, NULL),
(16, 'Portada del programa de estudio', NULL, '2018-10-08 00:00:00', NULL, NULL),
(17, 'Contenido de cada asignatura', NULL, '2018-10-08 00:00:00', NULL, NULL),
(18, 'Objetivo general de cada asignatura', NULL, '2018-10-08 00:00:00', NULL, NULL),
(19, 'Modelo de diseño instruccional', NULL, '2018-10-08 00:00:00', NULL, NULL),
(20, 'Diseño instruccional y recursos de aprendizaje', NULL, '2018-10-08 00:00:00', NULL, NULL),
(21, 'Temas y subtemas o unidades de aprendizaje', NULL, '2018-10-08 00:00:00', NULL, NULL),
(22, 'Actividades de aprendizaje', NULL, '2018-10-08 00:00:00', NULL, NULL),
(23, 'Criterios de evalución y acreditación de la asignatura', NULL, '2018-10-08 00:00:00', NULL, NULL),
(24, 'Programa de seguimiento', NULL, '2018-10-08 00:00:00', NULL, NULL),
(25, 'Función de las tutorías', NULL, '2018-10-08 00:00:00', NULL, NULL),
(26, 'Tipo de tutorías e informe de resultados', NULL, '2018-10-08 00:00:00', NULL, NULL),
(27, 'Tasa de egreso', NULL, '2018-10-08 00:00:00', NULL, NULL),
(28, 'Base de datos para la titulación', NULL, '2018-10-08 00:00:00', NULL, NULL),
(29, 'Vinculación y movilidad académica', NULL, '2018-10-08 00:00:00', NULL, NULL),
(30, 'Perfil de los académicos', NULL, '2018-10-08 00:00:00', NULL, NULL),
(31, 'Programas de superación académica', NULL, '2018-10-08 00:00:00', NULL, NULL),
(32, 'Espacios y equipamento', NULL, '2018-10-08 00:00:00', NULL, NULL),
(33, 'Laboratorios y talleres', NULL, '2018-10-08 00:00:00', NULL, NULL),
(34, 'Laboratorio de cómputo', NULL, '2018-10-08 00:00:00', NULL, NULL),
(35, 'Información y documentación', NULL, '2018-10-08 00:00:00', NULL, NULL),
(36, 'Licencias de software', NULL, '2018-10-08 00:00:00', NULL, NULL),
(37, 'Sistemas de seguridad', NULL, '2018-10-08 00:00:00', NULL, NULL),
(38, 'Tecnologías de la información y comunicación', NULL, '2018-10-08 00:00:00', NULL, NULL),
(39, 'Acceso a internet con calidad en el servicio', NULL, '2018-10-08 00:00:00', NULL, NULL),
(40, 'Tecnologías para el aprendizaje y servicios administrativos a distancia', NULL, '2018-10-08 00:00:00', NULL, NULL),
(41, 'Potencialidad del programa', NULL, '2018-10-08 00:00:00', NULL, NULL),
(42, 'Plan de trabajo anul', NULL, '2018-10-08 00:00:00', NULL, NULL),
(43, 'Análisis FODA', NULL, '2018-10-08 00:00:00', NULL, NULL),
(44, 'Compromiso académico para consolidar el programa', NULL, '2018-10-08 00:00:00', NULL, NULL),
(45, 'Pertinencia, necesidades sociales y profesionales', NULL, '2018-10-08 00:00:00', NULL, NULL),
(46, 'Oferta y demanda', NULL, '2018-10-08 00:00:00', NULL, NULL),
(47, 'Fuentes de información', NULL, '2018-10-08 00:00:00', NULL, NULL),
(48, 'Objetivos particulares', NULL, '2018-10-08 00:00:00', NULL, NULL),
(49, 'Listado de asignaturas', NULL, '2018-10-08 00:00:00', NULL, NULL),
(50, 'Seriación', NULL, '2018-10-08 00:00:00', NULL, NULL),
(51, 'Bibliohemerografía', NULL, '2018-10-08 00:00:00', NULL, NULL),
(52, 'Titulación', NULL, '2018-10-08 00:00:00', NULL, NULL),
(53, 'Espacios para las tutorías', NULL, '2018-10-08 00:00:00', NULL, NULL),
(54, 'Plataforma educativa', NULL, '2018-10-08 00:00:00', NULL, NULL),
(55, 'Ideario institucional', NULL, '2018-10-16 00:00:00', NULL, NULL),
(56, 'Recursos para su operación', NULL, '2018-10-16 00:00:00', NULL, NULL),
(57, 'Fondos externo', NULL, '2018-10-16 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclos`
--

CREATE TABLE `ciclos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ciclos`
--

INSERT INTO `ciclos` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Semestral', NULL, '2018-11-19 00:00:00', NULL, NULL),
(2, 'Cuatrimestral', NULL, '2018-11-19 00:00:00', NULL, NULL),
(3, 'Anual', NULL, '2018-11-19 00:00:00', NULL, NULL),
(4, 'Semestral curriculum flexible', NULL, '2018-11-19 00:00:00', NULL, NULL),
(5, 'Cuatrimestral curriculum flexible', NULL, '2018-11-19 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclos_escolares`
--

CREATE TABLE `ciclos_escolares` (
  `id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ciclos_escolares`
--

INSERT INTO `ciclos_escolares` (`id`, `programa_id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2019A', 'Semestral', '2018-11-22 11:28:18', '2018-11-22 12:31:26', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cumplimientos`
--

CREATE TABLE `cumplimientos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `modalidad_id` int(11) NOT NULL,
  `porcentaje_cumplimiento` int(11) NOT NULL,
  `cumplimiento_minimo` int(11) NOT NULL,
  `cumplimiento_maximo` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cumplimientos`
--

INSERT INTO `cumplimientos` (`id`, `nombre`, `modalidad_id`, `porcentaje_cumplimiento`, `cumplimiento_minimo`, `cumplimiento_maximo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cumple al 100%', 2, 100, 387, 387, '2018-10-07 10:00:00', NULL, NULL),
(2, 'Aceptable con mínimas recomendaciones ( no requiere segunda revisión)', 2, 90, 348, 386, '2018-10-07 10:00:00', NULL, NULL),
(3, 'Aceptable con recomendaciones (Requiere segunda revisión)', 2, 80, 310, 347, '2018-10-07 10:00:00', NULL, NULL),
(4, 'No aceptable', 2, 70, 0, 309, '2018-10-07 10:00:00', NULL, NULL),
(5, 'Cumple al 100%', 3, 100, 387, 387, '2018-10-07 10:00:00', NULL, NULL),
(6, 'Aceptable con mínimas recomendaciones ( no requiere segunda revisión)', 3, 90, 348, 386, '2018-10-07 10:00:00', NULL, NULL),
(7, 'Aceptable con recomendaciones (Requiere segunda revisión)', 3, 80, 310, 347, '2018-10-07 10:00:00', NULL, NULL),
(8, 'No aceptable', 3, 70, 0, 309, '2018-10-07 10:00:00', NULL, NULL),
(9, 'Cumple al 100%', 1, 100, 344, 347, '2018-10-07 10:00:00', NULL, NULL),
(10, 'Aceptable con mínimas recomendaciones ( no requiere segunda revisión)', 1, 90, 309, 343, '2018-10-07 10:00:00', NULL, NULL),
(11, 'Aceptable con recomendaciones (Requiere segunda revisión)', 1, 80, 275, 308, '2018-10-07 10:00:00', NULL, NULL),
(12, 'No aceptable', 1, 70, 0, 274, '2018-10-07 10:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dictamenes`
--

CREATE TABLE `dictamenes` (
  `id` int(11) NOT NULL,
  `programa_evaluacion_id` int(11) NOT NULL,
  `dictamen_integral` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `recomendaciones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `evaluacion_apartado_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `es_aceptado` tinyint(1) NOT NULL,
  `tipo_docente` int(11) NOT NULL,
  `tipo_contratacion` int(11) NOT NULL,
  `antiguedad` int(11) DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`id`, `persona_id`, `es_aceptado`, `tipo_docente`, `tipo_contratacion`, `antiguedad`, `observaciones`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 28, 1, 1, 1, NULL, NULL, '2018-09-19 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id` int(11) NOT NULL,
  `tipo_entidad` int(11) NOT NULL,
  `entidad_id` int(11) NOT NULL,
  `tipo_documento` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `archivo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilios`
--

CREATE TABLE `domicilios` (
  `id` int(11) NOT NULL,
  `calle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numero_exterior` int(11) NOT NULL,
  `numero_interior` int(11) DEFAULT NULL,
  `colonia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `municipio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `codigo_postal` int(11) NOT NULL,
  `pais` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latitud` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitud` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `domicilios`
--

INSERT INTO `domicilios` (`id`, `calle`, `numero_exterior`, `numero_interior`, `colonia`, `municipio`, `estado`, `codigo_postal`, `pais`, `latitud`, `longitud`, `created_at`, `updated_at`, `deleted_at`) VALUES
(-1, 'WEBSERVICE', 0, 0, 'WEBSERVICE', 'WEBSERVICE', 'WEBSERVICE', 0, 'WEBSERVICE', '0', '0', '2018-11-04 09:00:00', NULL, NULL),
(1, 'SIN DATO', 0, 0, 'SIN DATO', 'SIN DATO', 'SIN DATO', 0, 'SIN DATO', '0', '0', '2018-11-04 09:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edificios_niveles`
--

CREATE TABLE `edificios_niveles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `edificios_niveles`
--

INSERT INTO `edificios_niveles` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'primer_piso', 'Primer piso', '2018-08-27 17:30:00', NULL, NULL),
(2, 'segundo_piso', 'Segundo piso', '2018-08-27 17:30:00', NULL, NULL),
(3, 'tercer_piso', 'Tercer piso', '2018-08-27 17:30:00', NULL, NULL),
(4, 'cuarto_piso', 'Cuarto piso', '2018-08-27 17:30:00', NULL, NULL),
(10, 'sotano', 'Sotano', '2018-08-27 17:30:00', NULL, NULL),
(20, 'planta_baja', 'Planta baja', '2018-08-27 17:30:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escalas`
--

CREATE TABLE `escalas` (
  `id` int(11) NOT NULL,
  `puntos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `escalas`
--

INSERT INTO `escalas` (`id`, `puntos`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '[{\"respuesta\":\"NA\",\"valor\":0},{\"respuesta\":\"NO\",\"valor\":0},{\"respuesta\":\"SI\",\"valor\":1}]', 'Escala dicotomica 2018', '2018-10-08 10:00:00', NULL, NULL),
(2, '[{\"respuesta\":\"NA\",\"valor\":0},{\"respuesta\":\"0\",\"valor\":0},{\"respuesta\":\"1\",\"valor\":1},{\"respuesta\":\"2\",\"valor\":2},{\"respuesta\":\"3\",\"valor\":3}]', 'Escala likert 2018', '2018-10-08 10:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `espejos`
--

CREATE TABLE `espejos` (
  `id` int(11) NOT NULL,
  `mixta_noescolarizada_id` int(11) NOT NULL,
  `proveedor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ancho_banda` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ubicacion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `periocidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url_espejo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `pais_id` int(11) NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `pais_id`, `estado`) VALUES
(1, 117, 'Aguascalientes'),
(2, 117, 'Baja California'),
(3, 117, 'Baja California Sur'),
(4, 117, 'Campeche'),
(5, 117, 'Coahuila de Zaragoza'),
(6, 117, 'Colima'),
(7, 117, 'Chiapas'),
(8, 117, 'Chihuahua'),
(9, 117, 'Distrito Federal'),
(10, 117, 'Durango'),
(11, 117, 'Guanajuato'),
(12, 117, 'Guerrero'),
(13, 117, 'Hidalgo'),
(14, 117, 'Jalisco'),
(15, 117, 'México'),
(16, 117, 'Michoacán de Ocampo'),
(17, 117, 'Morelos'),
(18, 117, 'Nayarit'),
(19, 117, 'Nuevo León'),
(20, 117, 'Oaxaca de Juárez'),
(21, 117, 'Puebla'),
(22, 117, 'Querétaro'),
(23, 117, 'Quintana Roo'),
(24, 117, 'San Luis Potosí'),
(25, 117, 'Sinaloa'),
(26, 117, 'Sonora'),
(27, 117, 'Tabasco'),
(28, 117, 'Tamaulipas'),
(29, 117, 'Tlaxcala'),
(30, 117, 'Veracruz de Ignacio de la Llave'),
(31, 117, 'Yucatán'),
(32, 117, 'Zacatecas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus_calificaciones`
--

CREATE TABLE `estatus_calificaciones` (
  `id` int(11) NOT NULL,
  `estatus` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus_inspeccion`
--

CREATE TABLE `estatus_inspeccion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estatus_inspeccion`
--

INSERT INTO `estatus_inspeccion` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nueva', 'Inspección asignada ', '2018-10-06', NULL, NULL),
(2, 'En proceso', 'inspección en proceso', '2018-10-06', NULL, NULL),
(3, 'Completa', 'Inspección completa', '2018-10-06', NULL, NULL),
(4, 'En observación\r\n', 'Inspección terminada pero por atender observaciones', '2018-10-06', NULL, NULL),
(5, 'Sincronizada', 'Acta de cierre expedida', '2018-10-06', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus_solicitudes`
--

CREATE TABLE `estatus_solicitudes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estatus_solicitudes`
--

INSERT INTO `estatus_solicitudes` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'COMPLETAR SOLICITUD', 'Solicitud en proceso de llenado', '2018-08-07 03:00:00', NULL, NULL),
(2, 'REVISIÓN DE DOCUMENTACIÓN', 'Solicitud en revisión de documentación', '2018-08-07 03:00:00', NULL, NULL),
(3, 'ENTREGAR DOCUMENTOS EN FÍSICOS', 'Cita generada y a la espera de entregar los formatos FDA01,FDA02 y FDA03', '2018-08-07 03:00:00', NULL, NULL),
(4, 'ASIGNACIÓN TÉCNICO-CURRICULAR', 'Progama en lista de espera para la asignación de un evaluador.', '2018-08-07 03:00:00', NULL, NULL),
(5, 'EVALUACIÓN TÉCNICO-CURRICULAR', 'Programa de estudios en proceso de la evaluación técnico-curricular.', '2018-08-07 03:00:00', NULL, NULL),
(6, 'ASIGNACIÓN INSPECCIÓN FÍSICA', 'Programa en espera de asignación de inspector(es) para realizar la inspección física en el plantel que se imparte el programa.', '2018-08-07 03:00:00', NULL, NULL),
(7, 'INSPECCIÓN FÍSICA', 'Programa en proceso de la inspección física', '2018-08-07 03:00:00', NULL, NULL),
(8, 'REVISIÓN DEL EXPEDIENTE', 'Programa bajo revisión del expediente', '2018-08-07 03:00:00', NULL, NULL),
(9, 'ACUERDO EN IMPRESIÓN', 'Programa en proceso de impresión del certifficado', '2018-08-07 03:00:00', NULL, NULL),
(10, 'RECOGER ACUERDO', 'Certifficado a la espera de ser recogido por el representante legal de la institución', '2018-08-07 03:00:00', NULL, NULL),
(11, 'RVOE ENTREGADO', 'Programa con RVOE activo', '2018-08-07 03:00:00', NULL, NULL),
(100, 'SOLICITUD RECHEZADA', 'Solicitud rechazada', '2018-08-07 03:00:00', NULL, NULL),
(200, 'ATENDER OBSERVACIONES', 'Atender las observaciones', '2018-08-07 03:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones`
--

CREATE TABLE `evaluaciones` (
  `id` int(11) NOT NULL,
  `asignatura_id` int(11) NOT NULL,
  `porcentaje` int(11) NOT NULL,
  `criterio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones_evaluacion_preguntas`
--

CREATE TABLE `evaluaciones_evaluacion_preguntas` (
  `id` int(11) NOT NULL,
  `programa_evaluacion_id` int(11) NOT NULL,
  `evaluacion_pregunta_id` int(11) NOT NULL,
  `escala_id` int(11) NOT NULL,
  `respuesta` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `comentarios` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_apartados`
--

CREATE TABLE `evaluacion_apartados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `evaluacion_apartados`
--

INSERT INTO `evaluacion_apartados` (`id`, `nombre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'FUNDAMENTACIÓN', '2018-10-07 10:00:00', NULL, NULL),
(2, 'PLAN DE ESTUDIOS', '2018-10-07 10:00:00', NULL, NULL),
(3, 'PROGRAMA DE ESTUDIOS', '2018-10-07 10:00:00', NULL, NULL),
(4, 'PROPUESTA BIBLIOGRÁFICA', '2018-10-07 10:00:00', NULL, NULL),
(5, 'TRAYECTORIA Y TUTORÍA ', '2018-10-07 10:00:00', NULL, NULL),
(6, 'VINCULACIÓN Y MOVILIDAD', '2018-10-07 10:00:00', NULL, NULL),
(7, 'PLANTILLA DOCENTE', '2018-10-07 10:00:00', NULL, NULL),
(8, 'INFRAESTRUCTURA ', '2018-10-07 10:00:00', NULL, NULL),
(9, 'TRASCENDENCIA, COBERTURA Y EVOLUCIÓN ', '2018-10-07 10:00:00', NULL, NULL),
(10, 'PLAN DE MEJORA', '2018-10-07 10:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_preguntas`
--

CREATE TABLE `evaluacion_preguntas` (
  `id` int(11) NOT NULL,
  `categoria_evaluacion_pregunta_id` int(11) NOT NULL,
  `evaluacion_apartado_id` int(11) NOT NULL,
  `modalidad_id` int(11) NOT NULL,
  `escala_id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_unicode_ci NOT NULL,
  `item` int(11) NOT NULL,
  `evidencia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `evaluacion_preguntas`
--

INSERT INTO `evaluacion_preguntas` (`id`, `categoria_evaluacion_pregunta_id`, `evaluacion_apartado_id`, `modalidad_id`, `escala_id`, `nombre`, `item`, `evidencia`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Fundamentación (FDP01)', '2018-10-08 10:00:00', NULL, NULL),
(2, 1, 1, 1, 1, '¿Se detectaron faltas de ortografía o redacción? ', 2, 'Fundamentación (FDP01)', '2018-10-08 10:00:00', NULL, NULL),
(3, 1, 1, 1, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Fundamentación (FDP01)', '2018-10-08 10:00:00', NULL, NULL),
(4, 45, 1, 1, 2, '¿En el estudio de pertinencia y factibilidad del programa educativo se identifican las necesidades sociales?', 8, 'Estudio de Pertinencia y Factibilidad.', '2018-10-08 10:00:00', NULL, NULL),
(5, 45, 1, 1, 2, '¿En el estudio de pertinencia y factibilidad del programa educativo se identifican las necesidades profesionales?', 9, 'Estudio de Pertinencia y Factibilidad.', '2018-10-08 10:00:00', NULL, NULL),
(6, 45, 1, 1, 2, '¿En el estudio de pertinencia y factibilidad del programa educativo se identifican las necesidades institucionales?', 10, 'Estudio de Pertinencia y Factibilidad.', '2018-10-08 10:00:00', NULL, NULL),
(7, 46, 1, 1, 2, '¿El estudio de oferta y demanda contiene un cuadro comparativo de programas educativos similares a nivel nacional?', 11, 'Estudio de oferta y demanda', '2018-10-08 10:00:00', NULL, NULL),
(8, 46, 1, 1, 2, '¿El estudio de oferta y demanda contiene un cuadro comparativo de programas educativos similares a nivel internacional?', 12, 'Estudio de oferta y demanda', '2018-10-08 10:00:00', NULL, NULL),
(9, 46, 1, 1, 2, '¿El estudio de oferta y demanda contiene un cuadro comparativo de programas educativos similares a nivel local?', 13, 'Estudio de oferta y demanda', '2018-10-08 10:00:00', NULL, NULL),
(10, 46, 1, 1, 2, '¿El estudio de oferta y demanda incluye la demanda potencial a quién va dirigido?', 14, 'Estudio de oferta y demanda', '2018-10-08 10:00:00', NULL, NULL),
(11, 1, 1, 1, 2, '¿Se citan las fuentes de información utilizadas y son actuales, encuentran actualizadas en la realización de los estudios de:                                                                            Pertinencia, factibilidad, oferta y demanda ?', 4, 'Fuentes de información', '2018-10-08 10:00:00', NULL, NULL),
(12, 1, 1, 1, 1, '¿Cuenta con la misión?', 5, 'Fundamentación (FDP01)', '2018-10-08 10:00:00', NULL, NULL),
(13, 1, 1, 1, 1, '¿La misión define cual es la razón de ser de la institución?', 6, 'Fundamentación (FDP01)', '2018-10-08 10:00:00', NULL, NULL),
(14, 1, 1, 1, 1, '¿Cuenta con la visión?', 7, 'Fundamentación (FDP01)', '2018-10-08 10:00:00', NULL, NULL),
(15, 1, 2, 1, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Plan de estudios (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(16, 1, 2, 1, 1, '¿Se detectaron faltas de ortografía o redacción?', 2, 'Plan de estudios (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(17, 1, 2, 1, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Plan de estudios (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(18, 1, 2, 1, 1, '¿Contiene nombre de la institución, nombre del plan de estudios, nombre del coordinador(a), perfil del coordinador(a) y duración del plan de estudios?', 4, 'Plan de estudios (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(19, 2, 2, 1, 2, '¿Se establece los antecedentes académicos para el ingreso?', 5, 'Antecedentes académicos de ingreso (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(20, 2, 2, 1, 2, '¿Los antecedentes de ingreso son adecuados a la naturaleza del programa educativo?', 6, 'Antecedentes académicos de ingreso (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(21, 2, 2, 1, 2, '¿Establece métodos de inducción donde dará a conocer al aspirante toda la información relativa al plan de estudios?', 7, 'Estructura del plan de estudios (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(22, 3, 2, 1, 2, '¿Establece el perfil de ingreso (conocimientos, habilidades y actitudes)?', 8, 'Perfil de ingreso (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(23, 3, 2, 1, 2, '¿Se definen las características del alumno mismas que permitirán lograr el objetivo del plan de estudios mediante la transformación del estudiante a lo largo del proceso de enseñanza-aprendizaje?', 9, 'Perfil de ingreso (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(24, 4, 2, 1, 2, '¿Establece el proceso de selección de estudiantes?', 10, 'Proceso de selección de estudiantes (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(25, 4, 2, 1, 2, 'Con base en los medios de verificación: ¿el proceso de selección de estudiantes, es rigurosamente académicos y toma en cuenta el perfil de ingreso?', 11, 'Proceso de selección de estudiantes (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(26, 5, 2, 1, 2, '¿El perfil de egreso es acorde al nivel de estudios?', 12, 'Plan de Estudios Perfil de Egreso (FDP02)', NULL, NULL, NULL),
(27, 5, 2, 1, 2, '¿Establece el perfil de egreso (conocimientos, habilidades y actitudes)?', 13, 'Plan de Estudios Perfil de Egreso (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(28, 6, 2, 1, 2, '¿El mapa curricular contiene: nombre de asignaturas con claves, periodo, unidades de aprendizaje obligatorias y optativas en el caso de que las proponga?', 14, 'Mapa Curricular (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(29, 6, 2, 1, 2, '¿El mapa curricular es adecuado para alcanzar los atributos del perfil de egreso?', 15, 'Mapa Curricular (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(30, 6, 2, 1, 2, '¿La estructura del mapa curricular (cursos, seminarios, trabajo de campo o experimental, actividades académicas mediadas por TIC), es la apropiada para cumplir con el proceso de enseñanza-aprendizaje?', 16, 'Mapa Curricular (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(31, 6, 2, 1, 2, ' ¿Se cuenta con la totalidad de los programas de estudio del mapa curricular autorizado por la Institución Educativa que propone el plan de estudio?', 17, 'Mapa Curricular (FDP02) Y (FDP03)', '2018-10-08 10:00:00', NULL, NULL),
(32, 7, 2, 1, 2, '¿La flexibilidad curricular permite al estudiante conjuntamente con su comité tutorial diseñar su trayectoria académica?', 18, 'Mapa Curricular (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(33, 8, 2, 1, 2, '¿Se describe el objetivo general y este expresa una descripción de los resultados que deben obtenerse en un proceso educativo y satisface necesidades sociales?', 19, 'Plan de Estudios, Objetivo General (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(34, 48, 2, 1, 2, '¿Se describen los objetivos particulares y estos se encuentran formulados como logros a mediano plazo del aprendizaje que se produce como consecuencia del proceso educativo?', 37, 'Plan de Estudios, Objetivo General y Objetivos Particulares (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(35, 48, 2, 1, 2, '¿Se encuentran expresados en función a las diversas necesidades que solventa el plan de estudio, y son congruentes con el objetivo general?', 38, 'Plan de Estudios, Objetivo General y Objetivos Particulares (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(36, 9, 2, 1, 2, '¿Se establecen correctamente las claves para cada asignatura?', 20, 'Estructura del Plan de Estudios (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(37, 9, 2, 1, 1, '¿La suma de las horas docentes son correctas, por cada cuatrimestre y por el total de cuatrimestres?', 21, 'Estructura del Plan de Estudios (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(38, 9, 2, 1, 1, '¿Las horas bajo la conducción de un docente son congruentes con la modalidad y nivel educativo solicitado? ', 22, 'Estructura del Plan de Estudios (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(39, 9, 2, 1, 1, '¿Considerando las horas de trabajo independiente son congruentes con la modalidad y nivel educativo solicitado?', 23, 'Estructura del Plan de Estudios (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(40, 9, 2, 1, 1, '¿El número de créditos es correcto de acuerdo al parámetro del nivel y modalidad solicitada?', 24, 'Estructura del Plan de Estudios (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(41, 9, 2, 1, 1, '¿El número de Los créditos son correctos de acuerdo a las horas docentes más las independientes por el factor .0625? ', 25, 'Estructura del Plan de Estudios (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(42, 9, 2, 1, 2, '¿El Plan de Estudios cuenta con una estructura que muestre la articulación entre sus componentes (objetivos, mapa curricular, contenido temático, formas de evaluación, flexibilidad entre otros)?', 26, 'Estructura del Plan de Estudios (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(43, 49, 2, 1, 2, '¿El contenido curricular es el apropiado para alcanzar el perfil de egreso propuesto?', 39, 'Listado de asignaturas (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(44, 50, 2, 1, 2, '¿Se presentan en una secuencia y organización tal que permite al educando aprender desde lo simple a lo complejo de manera coherente y sistemática, congruente con la prioridad de aprendizaje de los objetivos particulares?', 40, 'Seriación (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(45, 10, 2, 1, 2, '¿Se cuenta con un reglamento para el funcionamiento de las academias que sustentan los planes y programas de estudio?', 27, 'Operación del Plan de Estudios a través de sus Academias (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(46, 10, 2, 1, 2, '¿Se cuentan conformadas academias de acuerdo al plan de estudios presentado?', 28, 'Operación del Plan de Estudios a través de sus Academias (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(47, 10, 2, 1, 2, 'La conformación de la academia es:\r\na) Por área del conocimiento\r\nb) De forma general', 29, 'Operación del Plan de Estudios a través de sus Academias (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(48, 11, 2, 1, 2, '¿Las LGAC son congruentes con la naturaleza del programa educativo?', 30, 'Líneas de Generación y/o Aplicación del Conocimiento (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(49, 11, 2, 1, 2, '¿Proyecto donde se establece la participación de los estudiantes en proyectos (de investigación y/o trabajo profesional) derivados de las LGAC del programa educativo.', 31, 'Líneas de Generación y/o Aplicación del Conocimiento (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(50, 12, 2, 1, 2, '¿Se establecen mecanismos para la actualización periódica del Plan de Estudios?', 32, 'Actualización del Plan de Estudios (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(51, 13, 2, 1, 2, '¿El Proyecto de seguimiento de egresados es el adecuado?', 33, 'Proyecto de seguimiento de egresados. (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(52, 14, 2, 1, 2, '¿Se tienen establecidos convenios de colaboración con Colegios de Profesionistas, Asociaciones, Redes Académicas, etc., afines a la profesión de egreso?', 34, 'Convenios de vinculación', '2018-10-08 10:00:00', NULL, NULL),
(53, 14, 2, 1, 2, '¿Presenta evidencias?', 35, 'Convenios de vinculación', '2018-10-08 10:00:00', NULL, NULL),
(54, 15, 2, 1, 2, '¿Establece la propuesta vigencia, que corresponde al año de la convocatoria?', 36, 'Plan de estudios (FDP02)', '2018-10-08 10:00:00', NULL, NULL),
(55, 1, 3, 1, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Programas de Estudio (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(56, 1, 3, 1, 1, '¿Se detectaron faltas de ortografía o redacción?', 2, 'Programas de Estudio (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(57, 1, 3, 1, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Programas de Estudio (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(58, 1, 3, 1, 1, '¿Cuenta con el nombre, modalidad, logo de la institución, nombre del representante legal, domicilio, teléfono del plantel y vigencia?', 4, 'Programas de Estudio (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(59, 17, 3, 1, 1, '¿Se presenta en cada una de las asignaturas el nombre de la asignatura igual a como lo menciona el plan de estudios?', 5, 'Programas de Estudio. Contenido de cada asignatura (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(60, 17, 3, 1, 1, '¿Se presenta en cada una de las asignaturas el ciclo al que corresponde?', 6, 'Programas de Estudio. Contenido de cada asignatura (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(61, 17, 3, 1, 1, '¿Se presenta en cada una de las asignaturas la calve de la asignatura?', 7, 'Programas de Estudio. Contenido de cada asignatura (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(62, 17, 3, 1, 1, '¿Se presenta en cada una de las asignaturas los temas y subtemas?', 8, 'Programas de Estudio. Contenido de cada asignatura (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(63, 17, 3, 1, 1, '¿Se presenta en cada una de las asignaturas las actividades de aprendizaje?', 9, 'Programas de Estudio. Contenido de cada asignatura (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(64, 17, 3, 1, 1, '¿Se presenta en cada una de las asignaturas los criterios de evaluación y acreditación?', 10, 'Programas de Estudio. Contenido de cada asignatura (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(65, 18, 3, 1, 2, '¿Los contenidos de cada una de las asignaturas están diseñados de tal manera que los alumnos desarrollen los conocimientos y las habilidades necesarios para alcanzar los objetivos de aprendizaje tanto de la asignatura como del programa educativo propuesto', 11, 'Programas de Estudio (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(66, 18, 3, 1, 2, '¿Se presenta el objetivo general de la asignatura?', 12, 'Objetivos general de la asignatura (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(67, 18, 3, 1, 2, '¿Los objetivos de aprendizaje describen resultados que son susceptibles de medición?', 13, 'Objetivos general de la asignatura (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(68, 18, 3, 1, 2, '¿Los temas y subtemas o unidades de aprendizaje son congruentes con la temática a desarrollar en cada una de las asignaturas y con uno o más objetivos particulares del plan de estudios?', 14, 'Objetivos general de la asignatura (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(69, 21, 3, 1, 2, '¿Los temas y subtemas o unidades de aprendizaje son congruentes con la temática a desarrollar en cada una de las asignaturas y con uno o más objetivos particulares del plan de estudios?', 15, 'Temas y subtemas o unidades de aprendizaje (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(70, 21, 3, 1, 2, '¿La descripción de los temas y subtemas o unidades de aprendizaje son congruentes con el nombre y objetivo general de la asignatura?', 16, 'Temas y subtemas o unidades de aprendizaje (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(71, 21, 3, 1, 2, 'Los temas y subtemas o unidades de aprendizaje ¿Se presentan en una secuencia lógica y es alcanzable de acuerdo a la labor de los docentes, desempeño de los estudiantes y en el período señalado?', 17, 'Temas y subtemas o unidades de aprendizaje (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(72, 22, 3, 1, 2, '¿Las actividades de aprendizaje están dirigidas a desarrollar en los alumnos actividades y actitudes para la aplicación de los conocimientos teóricos?', 18, 'Programas de Estudio.  Actividades de aprendizaje (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(73, 22, 3, 1, 2, 'Las actividades de aprendizaje ¿permiten la identificación de las horas docente de las horas de trabajo independiente por parte de los alumnos?', 19, 'Programas de Estudio.  Actividades de aprendizaje (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(74, 23, 3, 1, 2, '¿Los criterios de evaluación y acreditación de la asignatura permiten evaluar el aprendizaje y habilidades adquiridas por el estudiante?', 20, 'Criterios de evaluación y acreditación. (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(75, 22, 3, 1, 2, '¿Los criterios de evaluación se diferencian entre cada una de las asignaturas?', 21, 'Criterios de evaluación y acreditación. (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(76, 1, 4, 1, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Bibliohemerografía (FDP04)', '2018-10-09 10:00:00', NULL, NULL),
(77, 1, 4, 1, 1, '¿Se detectaron faltas de ortografía o redacción?', 2, 'Bibliohemerografía (FDP04)', '2018-10-09 10:00:00', NULL, NULL),
(78, 1, 4, 1, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Bibliohemerografía (FDP04)', '2018-10-09 10:00:00', NULL, NULL),
(79, 51, 4, 1, 2, '¿Describe número total de ejemplares de la biblioteca institucional?', 4, 'Bibliohemerografía (FDP04)', '2018-10-09 10:00:00', NULL, NULL),
(80, 51, 4, 1, 2, '¿El acervo está clasificado con claves y nombre de asignatura idénticamente como lo menciona el plan de estudio?', 5, 'Bibliohemerografía (FDP04)', '2018-10-09 10:00:00', NULL, NULL),
(81, 51, 4, 1, 2, '¿El número de ejemplares es de acuerdo a la modalidad solicitada?', 6, 'Bibliohemerografía (FDP04)', '2018-10-09 10:00:00', NULL, NULL),
(82, 51, 4, 1, 2, '¿Cumple con el mínimo de títulos?', 7, 'Bibliohemerografía (FDP04)', '2018-10-09 10:00:00', NULL, NULL),
(83, 51, 4, 1, 2, '¿Cuenta con un acervo actualizado, con una vigencia no mayor de cinco años?', 8, 'Bibliohemerografía (FDP04)', '2018-10-09 10:00:00', NULL, NULL),
(84, 51, 4, 1, 2, '¿Se agregaron todas las asignaturas?', 9, 'Bibliohemerografía (FDP04)', '2018-10-09 10:00:00', NULL, NULL),
(85, 51, 4, 1, 2, '¿El nombre del libro, compilación publicación periódica o material multimedia es consistente con las características del curso?', 10, 'Bibliohemerografía (FDP04)', '2018-10-09 10:00:00', NULL, NULL),
(86, 51, 4, 1, 2, '¿El material bibliohemerográfico es el adecuado para el nivel de la asignatura?', 11, 'Bibliohemerografía (FDP04)', '2018-10-09 10:00:00', NULL, NULL),
(87, 51, 4, 1, 2, '¿Las publicaciones son realmente un apoyo para el aprendizaje y la consecución de los objetivos?', 12, 'Bibliohemerografía (FDP04)', '2018-10-09 10:00:00', NULL, NULL),
(88, 24, 5, 1, 2, 'Con base en los medios de verificación para la evaluación curricular ¿Es pertinente el proyecto de seguimiento de la trayectoria y tutoría académica de los estudiantes desde su ingreso hasta el egreso del programa?', 1, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-09 10:00:00', NULL, NULL),
(89, 25, 5, 1, 2, 'Las tutorias tienen una función:\r\na) Académica\r\nb) Administrativa\r\nc) Psicológica', 2, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-09 10:00:00', NULL, NULL),
(90, 26, 5, 1, 1, 'La tutoría se implementa de forma:\r\n-Individual\r\n-Grupal\r\nBajo la modalidad:\r\n·Presencial\r\n·Virtual\r\n·Mixta', 3, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-09 10:00:00', NULL, NULL),
(91, 26, 5, 1, 1, '¿Se elabora un informe de resultados?', 4, 'Informe de resultados', '2018-10-09 10:00:00', NULL, NULL),
(92, 27, 5, 1, 1, '¿Los formatos o instrumentos para el programa de tutorías son los adecuados?', 5, 'Trayectoria y tutoria académica', '2018-10-09 10:00:00', NULL, NULL),
(93, 27, 5, 1, 1, '¿El tiempo promedio con el que se prevé se gradúen los estudiantes es congruente con el establecido en el plan de estudios?', 6, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05) ', '2018-10-09 10:00:00', NULL, NULL),
(94, 52, 5, 1, 1, '¿La institución cuenta con bases de datos para emitir reportes estadísticos de titulación por cohorte generacional?', 7, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05) ', '2018-10-09 10:00:00', NULL, NULL),
(95, 52, 5, 1, 1, '¿La institución tiene proyectados reportes estadísticos de eficiencia terminal por cohorte generacional?', 8, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05) ', '2018-10-09 10:00:00', NULL, NULL),
(96, 52, 5, 1, 1, 'Modalidad de titulación que utilizan principalmente los alumnos del PE:\r\na) Desempeño académico\r\nb) Exámenes\r\nc)Producción de materiales educativos\r\nd) Investigación y estudios de posgrado\r\ne) Tesis, tesina e informes\r\nf) Demostración de habilidades', 9, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05) ', '2018-10-09 10:00:00', NULL, NULL),
(97, 29, 6, 1, 1, '¿Se cuenta con un proyecto que permita que los estudiantes y docentes puedan realizar movilidad tanto nacional como internacional en fortalecimiento a sus competencias profesionales?', 1, 'Proyecto de movilidad para el intercambio de los estudiantes y los docentes', '2018-10-09 10:00:00', NULL, NULL),
(98, 29, 6, 1, 1, '¿Se cuentan con convenios de vinculación con los diversos sectores para que los alumnos realicen su práctica profesional, servicio social, tesis de grado, entre otras actividades?', 2, 'Convenios de colaboración ', '2018-10-09 10:00:00', NULL, NULL),
(99, 1, 7, 1, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Plantilla de docentes (FDP06 ) y (FDP07)', '2018-10-09 10:00:00', NULL, NULL),
(100, 1, 7, 1, 1, '¿Menciona nombre de la institución, nombre del plan de estudio, modalidad, domicilio, teléfono, tipo de trámite, duración del programa?', 2, 'Plantilla de docentes (FDP06 ) y (FDP07)', '2018-10-09 10:00:00', NULL, NULL),
(101, 30, 7, 1, 2, '¿Los docentes cumplen con los lineamientos establecidos en el Instructivo de RVOE para garantizar la calidad del programa?', 3, 'Plantilla de docentes (FDP06) y (FDP07)', '2018-10-09 10:00:00', NULL, NULL),
(102, 30, 7, 1, 2, '¿Los docentes que participarán en el programa educativo cuenta con el perfil adecuado para el grado, nivel LGAC y orientación del programa educativo?', 4, 'Plantilla de docentes (FDP06) y (FDP07)', '2018-10-09 10:00:00', NULL, NULL),
(103, 30, 7, 1, 2, '¿Los docentes que no cuentan con el título necesario cumplen  con el perfil de equivalencias?', 5, 'Plantilla de docentes (FDP06) y (FDP07)', '2018-10-09 10:00:00', NULL, NULL),
(104, 30, 7, 1, 2, '¿El programa educativo cuenta con un proyecto de superación académica y es adecuado a la naturaleza del programa’?', 6, 'Programa de superación y/o actualización académica para la modalidad presencial ', '2018-10-09 10:00:00', NULL, NULL),
(105, 32, 8, 1, 2, '¿La disponibilidad y funcionalidad de los espacios destinados a profesores y estudiantes son adecuadas para el desarrollo del programa?', 8, 'Descripción de instalaciones  (FDA05)', '2018-10-09 10:00:00', NULL, NULL),
(106, 1, 8, 1, 1, '¿El plantel dispone de espacios individuales o grupales para las tutorías?', 1, 'Descripción de instalaciones  (FDA05)', '2018-10-09 10:00:00', NULL, NULL),
(107, 33, 8, 1, 2, '¿De acuerdo a la naturaleza del programa, los laboratorios realizan proyectos de investigación y/o desarrollo reflejados en la productividad académica del programa?', 9, 'Fotografías de los espacios', '2018-10-09 10:00:00', NULL, NULL),
(108, 1, 8, 1, 1, '¿Especificar los laboratorios y talleres con que cuentan para el programa educativo?', 2, 'Descripción de instalaciones (FDA05)', '2018-10-09 10:00:00', NULL, NULL),
(109, 1, 8, 1, 1, 'Existe laboratorio de cómputo para el programa educativo:\r\n  a)Porpio\r\n  b)Compartido', 3, 'Descripción de instalaciones (FDA05)', '2018-10-09 10:00:00', NULL, NULL),
(110, 1, 8, 1, 1, '¿Existe evidencia de la actualización y nuevas adquisiciones de acervos (digitales e impresos) de la biblioteca?', 4, 'Descripción de instalaciones (FDA05)', '2018-10-09 10:00:00', NULL, NULL),
(111, 1, 8, 1, 1, 'Número totales de ejemplares de la biblioteca', 5, 'Descripción de instalaciones (FDA05)', '2018-10-09 10:00:00', NULL, NULL),
(112, 1, 8, 1, 1, 'Número total de ejemplares para el programa educativo', 6, 'Descripción de instalaciones (FDA05)', '2018-10-09 10:00:00', NULL, NULL),
(113, 1, 8, 1, 1, '¿El número de ejemplares de la biblioteca básica son suficientes para la matrícula del programa educativo? Parámetro: 1 ejemplar por cada/10 alumnos.', 7, 'Descripción de instalaciones (FDA05)', '2018-10-09 10:00:00', NULL, NULL),
(114, 38, 8, 1, 2, '¿La infraestructura de las TIC es adecuada a las necesidades de desarrollo del programa educativo?', 10, 'Documento que mencione la infraestructura de las TIC con la que cuenta el programa educativo, portal web y plataformas educativas.(FDA05)', '2018-10-09 10:00:00', NULL, NULL),
(115, 38, 8, 1, 2, 'Los estudiantes y profesores tienen  acceso ágil y eficiente a redes nacionales e internacionales de información, bases de datos y publicaciones digitales.', 11, 'Evidencia del acervo y las suscripciones a bases de datos afines a la naturaleza del programa y de las licencias de software. (FDA05)', '2018-10-09 10:00:00', NULL, NULL),
(116, 38, 8, 1, 2, '¿Se tiene una plataforma educativa que garantice la adecuada comunicación entre el alumno y el tutor, de manera que dicho instrumento apoye realmente la actividad de aprendizaje?', 12, 'Plataforma educativa, portal web.', '2018-10-09 10:00:00', NULL, NULL),
(117, 1, 10, 1, 1, 'Se tiene establecido un plan de trabajo anual para el desarrollo de las actividades académicas del programa educativo.', 1, 'Plan de trabajo anual para el desarrollo del programa educativo. (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(118, 1, 10, 1, 1, 'En caso de tener un plan anual se consideran las actividades tales como:\r\na)Conferencias\r\nb)Talleres\r\nc)Actividades\r\nd)Seminarios o exposiciones', 2, 'Plan de trabajo anual para el desarrollo del programa educativo. (FDP03)', '2018-10-09 10:00:00', NULL, NULL),
(119, 43, 10, 1, 2, '¿El Plan de Mejora toma en cuenta el análisis FODA de la autoevaluación para su elaboración?', 3, 'Plan de mejora', '2018-10-09 10:00:00', NULL, NULL),
(120, 44, 10, 1, 2, '¿El Plan de Mejora manifiesta el compromiso académico para consolidar el programa educativo en el ámbito local y nacional?', 4, 'Plan de mejora', '2018-10-09 10:00:00', NULL, NULL),
(121, 1, 1, 2, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(122, 1, 1, 2, 1, '¿Se detectaron faltas de ortografía o redacción?', 2, 'Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(123, 1, 1, 2, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(124, 45, 1, 2, 2, 'En el estudio de pertinencia y factibilidad del programa educativo se identifican las necesidades: Sociales, profesionales e institucionales', 4, 'Estudio de Pertinencia y Factibilidad. Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(125, 46, 1, 2, 2, 'El estudio de oferta y demanda contiene un cuadro comparativo de programas educativos similares a nivel: Internacional,Nacional, Local y demanda potencial', 5, 'Estudio de oferta y demanda. Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(126, 47, 1, 2, 2, '¿Los estudios de pertinencia, factibilidad, oferta y demanda educativa se obtuvieron utilizando la versión más actualizada de fuentes de información?', 6, 'Fuentes de información. Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(127, 55, 1, 2, 1, '¿Cuenta con misión?', 7, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(128, 55, 1, 2, 1, '¿La misión define cual es la razón de ser de la institución?', 8, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(129, 55, 1, 2, 1, '¿Cuenta con la Visión?', 9, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(130, 55, 1, 2, 1, '¿La visión define a dónde se quiere llegar?', 10, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(131, 55, 1, 2, 1, '¿Se formula en tiempo presente como condiciones de efectividad ya alcanzadas?', 11, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(132, 55, 1, 2, 1, '¿Cuenta con Valores Institucionales?', 12, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(133, 55, 1, 2, 1, '¿Los valores institucionales son congruentes con la misión y la visión?', 13, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(134, 55, 1, 2, 1, '¿Describe la Historia de la Institución?', 14, 'Ideario institucional. Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(135, 56, 1, 2, 1, '¿Existe evidencia de que el programa cuenta con recursos institucionales para su operación? ', 15, 'Recursos para su operación. Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(136, 57, 1, 2, 2, '¿Presenta convenios o acciones de vinculación?', 16, 'Convenios . Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(137, 57, 1, 2, 2, '¿Los convenios son acordes al nivel y orientación del programa?', 17, 'Fundamentación (FDP01)', '2018-10-13 10:00:00', NULL, NULL),
(138, 1, 2, 2, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Plan de estudios (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(139, 1, 2, 2, 1, '¿Se detectaron faltas de ortografía o redacción?', 2, 'Plan de estudios (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(140, 1, 2, 2, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Plan de estudios (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(141, 1, 2, 2, 1, '¿Contiene nombre de la institución, nombre del Plan de Estudio, nombre del coordinador(a),  perfil del coordinador(a) y Duración del plan de estudio?', 4, 'Plan de estudios (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(142, 2, 2, 2, 2, '¿Se establece los antecedentes académicos para el ingreso?', 6, 'Antecedentes académicos para el ingreso. (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(143, 2, 2, 2, 2, '¿Estos son adecuados a la naturaleza del programa educativo?', 7, 'Antecedentes académicos para el ingreso. (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(144, 2, 2, 2, 2, '¿Establece Métodos de Inducción donde dará a conocer al aspirante  toda la información relativa al  plan de estudio?', 8, 'Antecedentes académicos para el ingreso. (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(145, 2, 2, 2, 2, '¿Se informa a los aspirantes las características del programa a fin de determinar si cuentan con la automotivación y el compromiso necesarios para emprender un aprendizaje en estas modalidades?', 9, 'Antecedentes académicos para el ingreso. (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(146, 2, 2, 2, 2, '¿Se informa a los aspirantes las características del programa a fin de determinar si tienen acceso a los requisitos tecnológicos mínimos exigidos por el diseño del programa?', 10, 'Antecedentes académicos para el ingreso. (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(147, 2, 2, 2, 2, 'Los aspirantes reciben (o tienen acceso a) información acerca de los programas, incluidos los requisitos de admisión, matrícula y cuotas, libros e insumos, requisitos técnicos y de supervisión de exámenes y servicios de apoyo para alumnos antes de la admisión y la inscripción en los cursos', 11, 'Antecedentes académicos para el ingreso. (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(148, 3, 2, 2, 2, '¿Establece el perfil de ingreso (conocimientos, habilidades y actitudes)?', 12, 'Perfil de Ingreso (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(149, 3, 2, 2, 2, '¿Se definen las características del alumno mismas que permitirán lograr el objetivo del plan de estudios mediante la transformación del estudiante a lo largo del proceso de enseñanza-aprendizaje?', 13, 'Perfil de Ingreso (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(150, 4, 2, 2, 2, '¿Establece el proceso de selección de estudiantes?', 14, ' Proceso de selección de estudiantes (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(151, 4, 2, 2, 2, 'Con base en los medios de verificación: ¿el proceso de selección de estudiantes, es rigurosamente académico?', 15, ' Proceso de selección de estudiantes (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(152, 4, 2, 2, 2, '¿Toma en cuenta el perfil de ingreso?', 16, ' Proceso de selección de estudiantes (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(153, 5, 2, 2, 2, '¿El perfil de egreso establece los conocimientos  habilidades y actitudes que los estudiantes deben tener al concluir sus estudios?', 17, 'Perfil de egreso (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(154, 5, 2, 2, 2, '¿El perfil de egreso es acorde al nivel de estudios?', 18, 'Perfil de egreso (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(155, 6, 2, 2, 1, '¿El mapa curricular contiene: nombre de asignaturas con claves, periodo, unidades de aprendizaje obligatorias y optativas en el caso de que las proponga?', 19, 'Mapa curricular (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(156, 6, 2, 2, 2, '¿El mapa curricular es adecuado para alcanzar los atributos del perfil de egreso?', 20, 'Mapa curricular (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(157, 6, 2, 2, 2, '¿La estructura del mapa curricular (cursos, seminarios, trabajo de campo o experimental, actividades académicas mediadas por TIC), es la apropiada para cumplir con el proceso de enseñanza-aprendizaje?', 21, 'Mapa curricular (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(158, 6, 2, 2, 2, '¿Se cuenta con la totalidad de los programas de estudio del mapa curricular autorizado por la Institución Educativa que propone el plan de estudio?', 22, 'Mapa curricular (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(159, 6, 2, 2, 2, '¿La flexibilidad curricular permite al estudiante conjuntamente con su comité tutorial diseñar su trayectoria académica?', 23, 'Mapa curricular (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(160, 8, 2, 2, 2, '¿Se describe el objetivo general y este expresa una descripción de los resultados que deben obtenerse en un proceso educativo y satisface necesidades sociales?', 24, 'Plan de Estudios, Objetivo General y Objetivos Particulares (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(161, 8, 2, 2, 2, '¿Se describen los objetivos particulares y estos se encuentran formulados como logros a mediano plazo del aprendizaje que se produce como consecuencia del proceso educativo?', 25, 'Plan de Estudios, Objetivo General y Objetivos Particulares (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(162, 8, 2, 2, 2, '¿Se encuentran expresados en función a las diversas necesidades que solventa el plan de estudio, y son congruentes con el objetivo genera?', 26, 'Plan de Estudios, Objetivo General y Objetivos Particulares (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(163, 9, 2, 2, 1, '¿Se establecen correctamente las claves para cada asignatura?', 27, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(164, 9, 2, 2, 1, 'La suma de las horas docentes son correctas, por cada cuatrimestre y por el total de cuatrimestres?', 28, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(165, 9, 2, 2, 1, '¿Las horas bajo la conducción de un docente son congruentes con la modalidad y nivel educativo solicitado?', 29, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(166, 9, 2, 2, 1, '¿Considerando las horas de trabajo independiente son congruentes con la modalidad y nivel educativo solicitado?', 30, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(167, 9, 2, 2, 1, '¿El número de créditos es correcto de acuerdo al parámetro del nivel y modalidad solicitada?', 31, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(168, 9, 2, 2, 1, '¿El número de Los créditos son correctos de acuerdo a las horas docentes más las independientes por el factor .0625?', 32, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(169, 9, 2, 2, 1, '¿El Plan de Estudios cuenta con una estructura que muestre la articulación entre sus componentes (objetivos, mapa curricular, contenido temático, formas de evaluación, flexibilidad entre otros)?', 33, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(170, 9, 2, 2, 2, '¿El contenido curricular es el apropiado para alcanzar el perfil de egreso propuesto?', 34, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(171, 9, 2, 2, 2, '¿Se presentan en una secuencia y organización tal que permite al educando aprender desde lo simple a lo complejo de manera coherente y sistemática, congruente con la prioridad de aprendizaje de los objetivos particulares?', 35, 'Estructura del Plan de Estudios (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(172, 10, 2, 2, 2, '¿Se cuenta con un reglamento para el funcionamiento de las academias que sustentan los planes y programas de estudio?', 36, 'Operación del Plan de Estudios a través de sus Academias (FDP02) (Reglas operación academia)', '2018-10-16 10:00:00', NULL, NULL),
(173, 10, 2, 2, 2, '¿Se cuentan conformadas academias de acuerdo al plan de estudios presentado?', 37, 'Operación del Plan de Estudios a través de sus Academias (FDP02) (Reglas operación academia)', '2018-10-16 10:00:00', NULL, NULL),
(174, 10, 2, 2, 2, 'La conformación de las academias es: Por área del conocimiento, De manera general', 38, 'Operación del Plan de Estudios a través de sus Academias (FDP02) (Reglas operación academia)', '2018-10-16 10:00:00', NULL, NULL),
(175, 11, 2, 2, 2, '¿Las LGAC son congruentes con la naturaleza del programa educativo?', 39, 'Líneas de Generación y/o Aplicación del Conocimiento (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(176, 11, 2, 2, 2, '¿Proyecto donde se establece la participación de los estudiantes en proyectos (de investigación y/o trabajo profesional) derivados de las LGAC del programa educativo?', 40, 'Líneas de Generación y/o Aplicación del Conocimiento (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(177, 12, 2, 2, 2, '¿Se establecen mecanismos para la actualización periódica del Plan de Estudios?', 41, 'Actualización del Plan de Estudios (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(178, 24, 2, 2, 2, '¿El Proyecto de seguimiento de egresados es el adecuado?', 44, 'Proyecto de seguimiento de egresados. (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(179, 14, 2, 2, 2, '¿Se tienen establecidos convenios de colaboración con Colegios de Profesionistas, Asociaciones, Redes Académicas, etc., afines a la profesión de egreso?', 42, '(Convenios)', '2018-10-16 10:00:00', NULL, NULL),
(180, 14, 2, 2, 2, '¿Presenta evidencias?', 43, '(Convenios)', '2018-10-16 10:00:00', NULL, NULL),
(181, 1, 2, 2, 1, '¿Establece la propuesta vigencia, que corresponde al año de la convocatoria?', 5, 'Plan de estudios (FDP02)', '2018-10-16 10:00:00', NULL, NULL),
(182, 1, 3, 2, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Programas de Estudio (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(183, 1, 3, 2, 1, '¿Se detectaron faltas de ortografía o redacción?', 2, 'Programas de Estudio (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(184, 1, 3, 2, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Programas de Estudio (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(185, 1, 3, 2, 1, '¿Cuenta con el nombre, modalidad, logo de la institución, nombre del representante legal, domicilio, teléfono del plantel y vigencia?', 4, 'Programas de Estudio (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(186, 3, 3, 2, 2, '¿Los contenidos de cada una de las asignaturas están diseñados de tal manera que los alumnos desarrollen los conocimientos y las habilidades necesarios para alcanzar los objetivos de aprendizaje tanto de la asignatura como del programa educativo propuesto?', 5, 'Programas de Estudio. (Asignaturas a detalle) (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(187, 3, 3, 2, 2, '¿Se presenta en cada una de las asignaturas los siguientes elementos de acuerdo al Instructivo de RVOE?: Nombre de la asignatura igual como lo menciona el plan de estudios, cliclo al que corresponde, clave de la asignatura, temas y subtemas, actividades de aprendizaje y criterios de procedimientos de evaluación/acreditación', 6, 'Programas de Estudio. (Asignaturas a detalle) (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(188, 3, 3, 2, 2, 'Los objetivos de aprendizaje describen resultados que son susceptibles de medición. ', 7, 'Programas de Estudio. (Asignaturas a detalle) (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(189, 3, 3, 2, 2, 'El Modelo de diseño instruccional establece los lineamientos o guías que lo norman.', 8, 'Programas de Estudio. (Asignaturas a detalle) (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(190, 3, 3, 2, 2, 'Se establecen los lineamientos y procesos mediante los cuales se diseñan las unidades, temas y actividades que favorecen el aprendizaje activo y colaborativo, así como el acceso a los contenidos en diferentes ambientes virtuales.', 9, 'Programas de Estudio. (Asignaturas a detalle) (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(191, 3, 3, 2, 2, 'Se consideran estrategias para garantizar que los recursos de aprendizaje consideren de manera integral aspectos pedagógicos, editoriales, técnicos y de diseño gráfico.', 10, 'Programas de Estudio. (Asignaturas a detalle) (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(192, 21, 3, 2, 2, '¿Los temas y subtemas son congruentes con la temática a desarrollar en cada una de las asignaturas y con uno o más objetivos particulares del plan de estudios', 11, 'Temas y subtemas o unidades de aprendizaje. (Asignaturas a detalle) (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(193, 21, 3, 2, 2, '¿La descripción de los temas y subtemas son congruentes con el nombre y objetivo general de la asignatura?', 12, 'Temas y subtemas o unidades de aprendizaje. (Asignaturas a detalle) (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(194, 21, 3, 2, 2, 'Los temas y subtemas ¿Se presentan en una secuencia lógica y es alcanzable de acuerdo a la labor de los docentes, desempeño de los estudiantes y en el período señalado?', 13, 'Temas y subtemas o unidades de aprendizaje. (Asignaturas a detalle) (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(195, 22, 3, 2, 2, '¿Las actividades de aprendizaje están dirigidas a desarrollar en los alumnos actividades y actitudes para la aplicación de los conocimientos teóricos?', 14, 'Actividades de aprendizaje. (Asignaturas a detalle) (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(196, 22, 3, 2, 2, 'Las actividades de aprendizaje ¿permiten la identificación de las horas docente de las horas de trabajo independiente por parte de los alumnos?', 15, 'Actividades de aprendizaje. (Asignaturas a detalle) (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(197, 23, 3, 2, 2, '¿En el diseño instruccional quedan claramente establecidas las actividades de aprendizaje, las formas de evaluación, las fechas de entrega, los productos a realizar entre otros, de manera tal que el estudiante pueda realizarlas de manera autónoma?', 16, 'Criterios de evaluación y acreditación. (Asignaturas a detalle) (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(198, 23, 3, 2, 2, '¿Los criterios de evaluación y acreditación de la asignatura permiten evaluar el aprendizaje y habilidades adquiridas por el estudiante?', 17, 'Criterios de evaluación y acreditación. (Asignaturas a detalle) (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(199, 23, 3, 2, 2, '¿Los criterios de evaluación se diferencian entre cada una de las asignaturas?', 18, 'Criterios de evaluación y acreditación. (Asignaturas a detalle) (FDP03)', '2018-10-16 10:00:00', NULL, NULL),
(200, 1, 4, 2, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 10:00:00', NULL, NULL),
(201, 1, 4, 2, 1, '¿Se detectaron faltas de ortografía o redacción?', 2, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 10:00:00', NULL, NULL),
(202, 1, 4, 2, 1, '¿El documento se encuentra en un solo archivo?', 3, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 10:00:00', NULL, NULL),
(203, 1, 4, 2, 1, '¿El acervo está clasificado  con claves y nombre de asignatura idénticamente como lo menciona el plan de estudio?', 4, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 10:00:00', NULL, NULL),
(204, 1, 4, 2, 1, '¿El número de ejemplares es de acuerdo a la modalidad solicitada?', 5, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 10:00:00', NULL, NULL),
(205, 1, 4, 2, 1, '¿Cumple con el mínimo de títulos? ', 6, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 10:00:00', NULL, NULL),
(206, 1, 4, 2, 1, '¿Cuenta con un acervo actualizado, con una vigencia no mayor de cinco años?', 7, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 10:00:00', NULL, NULL),
(207, 1, 4, 2, 1, '¿Se agregaron todas las asignaturas? ', 8, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 10:00:00', NULL, NULL),
(208, 1, 4, 2, 1, '¿El material bibliohemerográfico es el adecuado para el nivel de la asignatura?', 9, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 10:00:00', NULL, NULL),
(209, 51, 4, 2, 2, '¿Las publicaciones son realmente un apoyo para el aprendizaje y la consecución de los objetivos?', 10, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 10:00:00', NULL, NULL),
(210, 51, 4, 2, 2, '¿Existen mecanismos para promover y vigilar que los materiales utilizados en las unidades de aprendizaje cumplan con la normativa vigente en materia de derechos de autor?', 11, 'Propuesta hemerobibliografica (FDP04)', '2018-10-16 10:00:00', NULL, NULL),
(211, 24, 5, 2, 2, 'Con base en los medios de verificación para la evaluación curricular ¿Es pertinente el proyecto de seguimiento de la trayectoria académica de los estudiantes desde su ingreso hasta el egreso del programa?', 1, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-16 10:00:00', NULL, NULL),
(212, 25, 5, 2, 2, 'Las tutorías tienen una funcion: academica, administrativa o psicológica', 2, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-16 10:00:00', NULL, NULL),
(213, 26, 5, 2, 2, 'Las tutoría se implemente de forma: individual o grupal. Bajo la modalidad de : presencial, virtual o mixta', 3, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-16 10:00:00', NULL, NULL),
(214, 26, 5, 2, 2, '¿Se elabora un informe de resultados?', 4, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05) (Infrome de resultados)', '2018-10-16 10:00:00', NULL, NULL),
(215, 26, 5, 2, 2, '¿Los formatos o instrumentos para el programa de tutorías son los adecuados?', 5, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)(Instrumentos para tutoria)', '2018-10-16 10:00:00', NULL, NULL),
(216, 27, 5, 2, 2, '¿El tiempo promedio con el que se prevé se gradúen los estudiantes es congruente con el establecido en el plan de estudios?', 6, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-16 10:00:00', NULL, NULL),
(217, 28, 5, 2, 2, '¿La institución cuenta con bases de datos para emitir reportes estadísticos de titulación por cohorte generacional?', 7, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-16 10:00:00', NULL, NULL),
(218, 28, 5, 2, 2, '¿La institución tiene proyectados reportes estadísticos de eficiencia terminal por cohorte generacional?', 8, 'Trayectoria educativa y tutoría de los estudiantes. (FDP05)', '2018-10-16 10:00:00', NULL, NULL),
(219, 28, 5, 2, 2, 'Modalidad de titulación que utilizan principalmente los alumnos del PE: desempeño académico, exámenes, producción de materiales educativos, investigación y estudios de posgrados, tesis, tesina e informes o demostración de habilidades', 9, 'Trayectoria educativa y tutoría de los estudiantes. (Reglamento institucional)', '2018-10-16 10:00:00', NULL, NULL),
(220, 29, 6, 2, 2, '¿Se cuenta con un proyecto que permita que los estudiantes y docentes puedan realizar movilidad tanto nacional como internacional en fortalecimiento a sus competencias profesionales?', 1, '(Proyecto de vinculación y movilidad)', '2018-10-16 10:00:00', NULL, NULL),
(221, 29, 6, 2, 2, '¿Se cuentan con convenios de vinculación con los diversos sectores para que los alumnos realicen su práctica profesional, servicio social, tesis de grado, entre otras actividades?', 2, '(Convenios)', '2018-10-16 10:00:00', NULL, NULL),
(222, 1, 7, 2, 1, '¿Se cuenta con el formato establecido en el Instructivo Técnico para integrar el expediente de la solicitud de obtención de RVOE de Educación Superior?', 1, ' Plantilla de docentes (FDP06) (FDP07)', '2018-10-16 10:00:00', NULL, NULL),
(223, 1, 7, 2, 1, '¿Menciona nombre de la institución, nombre del plan de estudio, modalidad, domicilio, teléfono, tipo de trámite, duración del programa?', 2, ' Plantilla de docentes (FDP06) (FDP07)', '2018-10-16 10:00:00', NULL, NULL),
(224, 1, 7, 2, 1, '¿Los docentes cumplen con los lineamientos establecidos en el Instructivo de RVOE para garantizar la calidad del programa?', 3, ' Plantilla de docentes (FDP06) (FDP07)', '2018-10-16 10:00:00', NULL, NULL),
(225, 30, 7, 2, 2, '¿Los docentes que participarán en el programa educativo cuenta con el perfil adecuado para el grado, nivel LGAC y orientación del programa educativo?', 4, ' Plantilla de docentes (FDP06) (FDP07)', '2018-10-16 10:00:00', NULL, NULL),
(226, 30, 7, 2, 2, '¿Los docentes que no cuentan con el título necesario cumplen  con el perfil de equivalencias?', 5, ' Plantilla de docentes (FDP06) (FDP07)', '2018-10-16 10:00:00', NULL, NULL),
(227, 31, 7, 2, 2, '¿El programa educativo cuenta con un proyecto de superación académica y es adecuado a la naturaleza del programa’?', 6, '(Progrma de superación)', '2018-10-16 10:00:00', NULL, NULL),
(228, 32, 8, 2, 2, '¿La disponibilidad y funcionalidad de los espacios destinados a profesores y estudiantes son adecuadas para el desarrollo del programa?', 1, 'Descripción de instalaciones (FDA05)', '2018-10-16 10:00:00', NULL, NULL);
INSERT INTO `evaluacion_preguntas` (`id`, `categoria_evaluacion_pregunta_id`, `evaluacion_apartado_id`, `modalidad_id`, `escala_id`, `nombre`, `item`, `evidencia`, `created_at`, `updated_at`, `deleted_at`) VALUES
(229, 33, 8, 2, 2, '¿De acuerdo a la naturaleza del programa, los laboratorios realizan proyectos de investigación y/o desarrollo reflejados en la productividad académica del programa?', 2, 'Descripción de instalaciones (FDA05)', '2018-10-16 10:00:00', NULL, NULL),
(230, 33, 8, 2, 2, '¿Especificar los laboratorios y talleres con que cuentan para el programa educativo?', 3, 'Descripción de instalaciones (FDA05)', '2018-10-16 10:00:00', NULL, NULL),
(231, 33, 8, 2, 2, '¿Existe laboratorio de cómputo propio o campartido para el programa educativo?', 4, '(Fotografías)', '2018-10-16 10:00:00', NULL, NULL),
(232, 35, 8, 2, 2, '¿Existe evidencia de la actualización y nuevas adquisiciones de acervos (digitales e impresos) de la biblioteca?', 5, 'Propuesta Hemeroblibliográfica (FDP04)', '2018-10-16 10:00:00', NULL, NULL),
(233, 36, 8, 2, 2, '¿El software utilizado en la operación de los sistemas y servicios, tecnología educativa y producción de recursos didácticos digitales cuenta con licenciamiento?', 6, '(Licencias de software)', '2018-10-16 10:00:00', NULL, NULL),
(234, 37, 8, 2, 2, '¿Se cuentan con los recursos necesarios para impedir intrusión, robo de información, suplantaciones, afectaciones deliberadas a programas y bases de datos?', 7, '(Licencias de software)', '2018-10-16 10:00:00', NULL, NULL),
(235, 38, 8, 2, 2, '¿La infraestructura de las TIC es adecuada a las necesidades de desarrollo del programa educativo?', 8, 'Documento que mencione la infraestructura de las TIC con la que cuenta el programa educativo, portal web y plataformas educativas. (FDA05)', '2018-10-16 10:00:00', NULL, NULL),
(236, 38, 8, 2, 2, '¿Los estudiantes y profesores tienen  acceso ágil y eficiente a redes nacionales e internacionales de información, bases de datos y publicaciones digitales.', 9, 'Evidencia del acervo y las suscripciones a bases de datos afines a la naturaleza del programa y de las licencias de software. (FDA05)', '2018-10-16 10:00:00', NULL, NULL),
(237, 38, 8, 2, 2, '¿La accesibilidad de los espacios virtuales para estudiantes y asesores es adecuada?', 10, 'Evidencia del acervo y las suscripciones a bases de datos afines a la naturaleza del programa y de las licencias de software. (FDA05)', '2018-10-16 10:00:00', NULL, NULL),
(238, 38, 8, 2, 2, '¿Es adecuada la infraestructura de telecomunicaciones para dar servicios a estudiantes y asesores académicos?', 11, 'Evidencia del acervo y las suscripciones a bases de datos afines a la naturaleza del programa y de las licencias de software. (FDA05)', '2018-10-16 10:00:00', NULL, NULL),
(239, 38, 8, 2, 2, '¿Se cuenta con protocolos de seguridad de los espacios educativos y de la infraestructura tecnológica utilizada que permita garantizar la seguridad y privacidad de la información de la institución y de los usuarios?', 12, 'Protocolos de seguridad (FDA05)', '2018-10-16 10:00:00', NULL, NULL),
(240, 38, 8, 2, 2, '¿Existe un equipo de soporte que da respaldo profesional continuo y oportuno a la infraestructura tecnológica?', 13, '(FDA05)', '2018-10-16 10:00:00', NULL, NULL),
(241, 38, 8, 2, 2, '¿Se cuenta con enlaces a INTERNET que ofrezca la posibilidad de administrar con calidad el servicio del ancho de banda adecuada que asegure el acceso de los usuarios?', 14, '(FDA05)', '2018-10-16 10:00:00', NULL, NULL),
(242, 40, 8, 2, 2, '¿Se tiene una plataforma educativa que garantice la adecuada comunicación entre el alumno y el tutor, de manera que dicho instrumento apoye realmente la actividad de aprendizaje?', 15, '(FDA05)', '2018-10-16 10:00:00', NULL, NULL),
(243, 40, 8, 2, 2, '¿Los espacios de trabajo virtual son adecuados y suficientes para el desempeño de las actividades de acuerdo al modelo educativo definido por la institución?', 16, '(FDA05)', '2018-10-16 10:00:00', NULL, NULL),
(244, 40, 8, 2, 2, '¿La institución cuenta con una encuesta de satisfacción de usuarios que permita valorar la confiabilidad y usabilidad de los sistemas tecnológicos tales como plataforma de aprendizaje, administrativa, correo electrónico, video conferencia entre otros?', 17, '(FDA05)', '2018-10-16 10:00:00', NULL, NULL),
(245, 41, 9, 2, 2, '¿Los resultados del programa en cuanto a formación de recursos humanos contribuyen a la atención de las necesidades que dieron origen al programa?', 1, 'Fundamentación del Plan de Estudios (FDP01).', '2018-10-16 10:00:00', NULL, NULL),
(246, 41, 9, 2, 2, '¿Considerando la infraestructura, la composición de los docentes y la productividad académica del programa, los resultados y la cobertura son acordes a la potencialidad del programa?', 2, '(FDP01) (FDP02) (FDP03) (FDP04) (FDP05) (FDA05).', '2018-10-16 10:00:00', NULL, NULL),
(247, 41, 9, 2, 2, '¿La productividad académica del programa educativo es suficiente y congruente con las líneas de generación y/o aplicación del conocimiento?', 3, 'Líneas de generación y/o aplicación del conocimiento (FDP02).', '2018-10-16 10:00:00', NULL, NULL),
(248, 42, 10, 2, 2, 'Se tiene establecido un plan de trabajo anual para el desarrollo de las actividades académicas del programa educativo.', 1, '(Plan de mejora)', '2018-10-16 10:00:00', NULL, NULL),
(249, 42, 10, 2, 2, 'En caso de tener un plan anual se consideran las actividades tales como:\r\na)Conferencias,\r\nb)Talleres\r\nc)Actividades culturales o deportivas\r\nd)Seminarios o exposiciones\r\n', 2, '(Plan de mejora)', '2018-10-16 10:00:00', NULL, NULL),
(250, 43, 10, 2, 2, '¿El Plan de Mejora toma en cuenta el análisis FODA de la autoevaluación para su elaboración?', 3, '(Plan de mejora)', '2018-10-16 10:00:00', NULL, NULL),
(251, 44, 10, 2, 2, '¿El Plan de Mejora manifiesta el compromiso académico para consolidar el programa educativo en el ámbito local y nacional?', 4, '(Plan de mejora)', '2018-10-16 10:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_procesos`
--

CREATE TABLE `evaluacion_procesos` (
  `id` int(11) NOT NULL,
  `evaluador_id` int(11) NOT NULL,
  `registro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_proceso` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluadores`
--

CREATE TABLE `evaluadores` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `tipo_evaluador` int(11) NOT NULL,
  `especialidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `otros_registros` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logros` text COLLATE utf8_unicode_ci,
  `numero_evaluador` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluadores_modalidades`
--

CREATE TABLE `evaluadores_modalidades` (
  `id` int(11) NOT NULL,
  `evaluador_id` int(11) NOT NULL,
  `modalidad_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencias`
--

CREATE TABLE `experiencias` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `funcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `institucion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `periodo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formaciones`
--

CREATE TABLE `formaciones` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nivel` int(11) NOT NULL,
  `institucion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_graduado` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `id` int(11) NOT NULL,
  `ciclo_escolar_id` int(11) NOT NULL,
  `turno_id` int(11) NOT NULL,
  `grado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `grupo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `generacion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `generacion_fecha_inicio` date NOT NULL,
  `generacion_fecha_fin` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hemerobibliograficas`
--

CREATE TABLE `hemerobibliograficas` (
  `id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `autor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ejemplares` int(11) NOT NULL,
  `editorial` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anio` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `higienes`
--

CREATE TABLE `higienes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `higienes`
--

INSERT INTO `higienes` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'sanitarios_alumnos_hombres', 'Sanitarios exclusivos para el alumnado varón', '2018-08-29 00:00:00', NULL, NULL),
(2, 'sanitarios_alumnos_mujeres', 'Sanitarios exclusivos para el alumnado femenino', '2018-08-29 00:00:00', NULL, NULL),
(3, 'sanitarios_administrativos_hombres', 'Sanitarios exclusivos para el personal masculino administrativo', '2018-08-29 00:00:00', NULL, NULL),
(4, 'sanitarios_administrativos_mujeres', 'Sanitarios exclusivos para el personal femenino administrativo', '2018-08-29 00:00:00', NULL, NULL),
(5, 'personal_limpieza', 'Personas encargadas de la limpieza', '2018-08-29 00:00:00', NULL, NULL),
(6, 'cestos_basura', 'Cestos de basura', '2018-08-29 00:00:00', NULL, NULL),
(7, 'numero_aulas', 'Número de aulas en el plantel', '2018-08-29 00:00:00', NULL, NULL),
(8, 'butacas_aula', 'Butacas por aula', '2018-08-29 00:00:00', NULL, NULL),
(9, 'ventanas', 'Ventanas que pueden abrirse por aula', '2018-08-29 00:00:00', NULL, NULL),
(10, 'ventilador', 'Número de ventiladores en todo el plantel', '2018-08-29 00:00:00', NULL, NULL),
(11, 'acondicionado', 'Número de aires acondicionados en todo el plantel', '2018-08-29 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infraestructuras`
--

CREATE TABLE `infraestructuras` (
  `id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `tipo_instalacion_id` int(11) NOT NULL,
  `solicitud_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ubicacion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `capacidad` int(11) NOT NULL,
  `metros` int(11) NOT NULL,
  `recursos` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspecciones`
--

CREATE TABLE `inspecciones` (
  `id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `estatus_inspeccion_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `fecha_asignada` date NOT NULL,
  `resultado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `folio` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspecciones_inspeccion_preguntas`
--

CREATE TABLE `inspecciones_inspeccion_preguntas` (
  `id` int(11) NOT NULL,
  `inspeccion_id` int(11) NOT NULL,
  `inspeccion_pregunta_id` int(11) NOT NULL,
  `respuesta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion_apartados`
--

CREATE TABLE `inspeccion_apartados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_apartado` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inspeccion_apartados`
--

INSERT INTO `inspeccion_apartados` (`id`, `nombre`, `descripcion`, `tipo_apartado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'AULAS INDICADORES', 'Apartado que engloba a las aulas', 1, '2018-09-11 05:00:00', NULL, NULL),
(2, 'CONSTANCIA INFEJAL Y DICTAMEN DE PROTECCIÓN CIVIL ', 'N/A', 1, '2018-09-11 05:00:00', NULL, NULL),
(3, 'LABORATORIOS Y TALLERES', 'N/A', 1, '2018-09-10 05:00:00', NULL, NULL),
(4, 'BILBIOTECA', 'N/A', 1, '2018-09-10 05:00:00', NULL, NULL),
(5, 'INFRAESTRUCTURA - ESPACIOS FÍSICOS DE USO GENERAL', 'N/A', 1, '2018-09-11 05:00:00', NULL, NULL),
(6, 'CENTRO O LABORATORIO DE CÓMPUTO', 'N/A', 1, '2018-09-11 05:00:00', NULL, NULL),
(7, 'ÁREA ADMINISTRATIVA', 'N/A', 1, '2018-09-11 05:00:00', NULL, NULL),
(8, 'Características del inmueble', 'caracteristica_inmueble', 2, '2018-09-11 05:00:00', NULL, NULL),
(9, 'Edificios y/o niveles', 'planteles_edificios_niveles', 2, '2018-09-11 05:00:00', NULL, NULL),
(10, 'Sistema de seguridad', 'planteles_seguridad_sistemas', 2, '2018-09-11 05:00:00', NULL, NULL),
(11, 'Higiene en general', 'planteles_higienes', 2, '2018-09-11 05:00:00', NULL, NULL),
(12, 'Aulas', 'tipo_instalaciones', 2, '2018-09-11 05:00:00', NULL, NULL),
(13, 'Servicios sanitarios', 'planteles_higienes', 3, '2018-10-02 05:00:00', NULL, NULL),
(14, 'Centro de cómputo', 'tipo_instalaciones', 2, '2018-09-11 05:00:00', NULL, NULL),
(15, 'Centro de documentación o biblioteca', 'tipo_instalaciones', 0, '2018-09-11 05:00:00', NULL, NULL),
(16, 'Otros laboratorios y/o talleres', 'tipo_instalaciones', 0, '2018-09-11 05:00:00', NULL, NULL),
(17, 'Área administrativa', 'tipo_instalaciones', 0, '2018-09-11 05:00:00', NULL, NULL),
(18, 'Otras áreas', 'tipo_instalaciones', 0, '2018-09-11 05:00:00', NULL, NULL),
(19, 'Área para archivo muerto', 'tipo_instalaciones', 0, '2018-09-11 05:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion_categorias`
--

CREATE TABLE `inspeccion_categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instruccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inspeccion_categorias`
--

INSERT INTO `inspeccion_categorias` (`id`, `nombre`, `descripcion`, `instruccion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'AULAS', 'N/A', 'Verificar que la ventilación, iluminación y condiciones de mantenimiento de las aulas sean adecuadas.', '2018-09-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'AULAS EN EL PLANTEL', 'N/A', 'Verificar la adecuación\r\ndel tamaño y cantidad\r\nde las aulas conforme a\r\nla por grupo.', '2018-09-11 00:00:00', NULL, NULL),
(3, 'CONSTANCIA INFEJAL Y PROTECCIÓN CIVIL', 'N/A', 'Verificar que la constancia de INFEJAL y Dictamen de protección civil se encuentren en vigor en el plantel, así como las medidas de seguridad.', '2018-09-11 00:00:00', NULL, NULL),
(4, 'ELEMENTOS SEGURIDAD LABORATORIO O TALLER', 'N/A', 'Verificar la existencia y\r\nfuncionalidad de los\r\nelementos de seguridad\r\ny de identificación en el\r\nlaboratorio.', '2018-09-11 00:00:00', NULL, NULL),
(5, 'FUNCIONAMIENTO DE TALLER O LABORATORIO', 'N/A', 'Verificar que las\r\ninstalaciones\r\nhidráulicas, eléctricas y\r\nde gas funcionen\r\nadecuadamente.', '2018-09-11 00:00:00', NULL, NULL),
(6, 'CONDICIONES DE BIBLIOTECA', 'N/A', 'Verificar que la ventilación,\r\niluminación y condiciones de\r\nmantenimiento de la\r\nbiblioteca y sala de lectura\r\nsean adecuadas.', '2018-09-11 00:00:00', NULL, NULL),
(7, 'ELEMENTOS DE LA BIBLIOTECA', 'N/A', 'Verificar la existencia de los\r\nelementos de seguridad, de\r\nidentificación y registro en la\r\nbiblioteca.', '2018-09-11 00:00:00', NULL, NULL),
(8, 'DIMENSIONES BIBLIOTECA', 'N/A', 'Verificar la biblioteca cuente\r\ncon una superficie mínima\r\nnecesaria.', '2018-09-11 00:00:00', NULL, NULL),
(9, 'SANITARIOS', 'N/A', 'Verificar la\r\nexistencia,\r\nsuficiencia y\r\npertinencia, así\r\ncomo las condiciones\r\nde mantenimiento y\r\nseguridad de los\r\nespacios físicos de\r\nuso general que\r\nrequiere el programa\r\neducativo. ', '2018-09-11 00:00:00', NULL, NULL),
(10, 'ESPECIFICACIONES DE EQUIPO DE CÓMPUTO', 'N/A', 'Verificar las\r\ncondiciones\r\nnecesarias para el\r\ncentro o\r\nlaboratorio de\r\ncómputo.', '2018-09-11 00:00:00', NULL, NULL),
(11, 'IDENTIFICACIÓN DEL PLANTEL (EXTERIOR)', 'N/A', 'Verificar la presencia\r\nde la razón social de la\r\ninstitución y las\r\ncondiciones de\r\nmantenimiento de la\r\nfachada del plante.', '2018-09-11 00:00:00', NULL, NULL),
(12, 'IDENTIFICACIÓN DE LAS ÁREAS ADMINISTRATIVAS', 'N/A', 'Verificar que se\r\ncuente con las áreas\r\nque se indican.', '2018-09-11 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion_observaciones`
--

CREATE TABLE `inspeccion_observaciones` (
  `id` int(11) NOT NULL,
  `inspeccion_id` int(11) NOT NULL,
  `inspeccion_apartado_id` int(11) NOT NULL,
  `comentario` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion_preguntas`
--

CREATE TABLE `inspeccion_preguntas` (
  `id` int(11) NOT NULL,
  `pregunta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_inspeccion_tipo_pregunta` int(11) NOT NULL,
  `id_inspeccion_apartado` int(11) NOT NULL,
  `id_inspeccion_categoria` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inspeccion_preguntas`
--

INSERT INTO `inspeccion_preguntas` (`id`, `pregunta`, `id_inspeccion_tipo_pregunta`, `id_inspeccion_apartado`, `id_inspeccion_categoria`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '¿Las aulas tienen adecuada y suficiente ventilación?', 1, 1, 1, '2018-09-11 05:00:00', NULL, NULL),
(2, '¿Las aulas tienen adecuada y suficiente iluminación?', 1, 1, 1, '2018-09-11 05:00:00', NULL, NULL),
(3, '¿Son adecuadas las condiciones de mantenimiento y limpieza ? (Pisos, pintura, techos, muros, puertas, instalaciones eléctricas…)', 1, 1, 1, '2018-09-11 05:00:00', NULL, NULL),
(4, '¿Las aulas cuentan con nomenclatura?', 1, 1, 1, '2018-09-11 05:00:00', NULL, NULL),
(5, '¿Las aulas cuentas con pintarrón en buen estado?', 1, 1, 1, '2018-09-11 05:00:00', NULL, NULL),
(6, '¿Las aulas cuentan con botes de basura?', 1, 1, 1, '2018-09-11 05:00:00', NULL, NULL),
(7, 'Capacidad mínima de las aulas (personas):', 2, 1, 1, '2018-09-11 05:00:00', NULL, NULL),
(8, 'Capacidad máxima de las aulas (personas):', 2, 1, 1, '2018-09-11 05:00:00', NULL, NULL),
(9, '¿El plantel cuenta con las aulas suficientes para los grupos\r\nvigentes del programa educativo? ', 1, 1, 2, '2018-09-11 05:00:00', NULL, NULL),
(10, '¿Cuenta con constancia de INFEJAL actulizada?', 1, 2, 3, '2018-09-11 05:00:00', NULL, NULL),
(11, '¿Cuenta con el dictamen de protección civil actualizado?', 1, 2, 3, '2018-09-11 05:00:00', NULL, NULL),
(12, 'Número de extintores:', 2, 2, 3, '2018-09-11 05:00:00', NULL, NULL),
(13, '¿Los extintores cuentan con recarga vigente?', 1, 2, 3, '2018-09-11 05:00:00', NULL, NULL),
(14, '¿Se cuenta con señalamientos de evacuación?', 1, 2, 3, '2018-09-11 05:00:00', NULL, NULL),
(15, '¿El laboratorio cuenta con nomenclatura?', 1, 3, 4, '2018-09-11 05:00:00', NULL, NULL),
(16, '¿El laboratorio cuenta señalamientos de evacuación?', 1, 3, 4, '2018-09-11 05:00:00', NULL, NULL),
(17, '¿El laboratorio cuenta con extintor?', 1, 3, 4, '2018-09-11 05:00:00', NULL, NULL),
(18, '¿El laboratorio cuenta con reglamento de uso?', 1, 3, 4, '2018-09-11 05:00:00', NULL, NULL),
(19, '¿El laboratorio cuenta con horarios de atención?', 1, 3, 4, '2018-09-11 05:00:00', NULL, NULL),
(20, '¿El laboratorio se observa limpio e higiénico?', 1, 3, 4, '2018-09-11 05:00:00', NULL, NULL),
(21, '¿Se cuenta con laboratorios y talleres especiales?', 1, 3, 4, '2018-09-11 05:00:00', NULL, NULL),
(22, 'De ser positiva la respuesta en la pregunta anterior, indicar los nombres de los talleres o laboratorios:', 3, 3, 4, '2018-09-11 05:00:00', NULL, NULL),
(23, '¿ Se cuenta con una iluminación  adecuada y suficiente en el laboratorio?', 1, 3, 5, '2018-09-11 05:00:00', NULL, NULL),
(24, '¿ Se cuenta con una ventilación adecuada y suficiente en el laboratorio?', 1, 3, 5, '2018-09-11 05:00:00', NULL, NULL),
(25, '¿La biblioteca tiene adecuada y suficiente ventilación?', 1, 4, 6, '2018-09-11 05:00:00', NULL, NULL),
(26, '¿La biblioteca tiene adecuada y suficiente ventilación?', 1, 4, 6, '2018-09-11 05:00:00', NULL, NULL),
(27, '¿Son adecuadas las condiciones de mantenimiento y\r\nlimpieza?\r\n(Pisos, pintura, techos, muros, puertas…)', 1, 4, 6, '2018-09-11 05:00:00', NULL, NULL),
(28, '¿Cuenta con el acervo manifestado en el formato FDP04?', 1, 4, 6, '2018-09-11 05:00:00', NULL, NULL),
(29, '¿La biblioteca cuenta con nomenclatura?', 1, 4, 7, '2018-09-11 05:00:00', NULL, NULL),
(30, '¿La biblioteca cuenta con horarios de atención?', 1, 4, 7, '2018-09-11 05:00:00', NULL, NULL),
(31, '¿La biblioteca cuenta con mobilario adecuado y suficiente?', 1, 4, 7, '2018-09-11 05:00:00', NULL, NULL),
(32, '¿La biblioteca cuenta con reglamento interno?', 1, 4, 7, '2018-09-11 05:00:00', NULL, NULL),
(33, '¿La biblioteca cuenta con bitácora de registro de préstamo en la sala o domicilio?', 1, 4, 7, '2018-09-11 05:00:00', NULL, NULL),
(34, '¿La biblioteca cuenta con señalamientos de seguridad?', 1, 4, 7, '2018-09-11 05:00:00', NULL, NULL),
(35, '¿La biblioteca cuenta con extintor?', 1, 4, 7, '2018-09-11 05:00:00', NULL, NULL),
(36, 'Número de títulos:', 2, 4, 7, '2018-09-11 05:00:00', NULL, NULL),
(37, 'Número de volúmenes', 2, 4, 7, '2018-09-11 05:00:00', NULL, NULL),
(38, '¿Las dimensiones de la biblioteca son adecuadas?', 1, 4, 8, '2018-09-11 05:00:00', NULL, NULL),
(39, '¿Los sanitarios en general cuentan con señalización del espacio?', 1, 5, 9, '2018-09-11 05:00:00', NULL, NULL),
(40, '¿Los sanitarios en general se obervan limpios e higiénicos y funcionales?', 1, 5, 9, '2018-09-11 05:00:00', NULL, NULL),
(41, '¿Los sanitarios en general cuentan con suministro permanente de agua?', 1, 5, 9, '2018-09-11 05:00:00', NULL, NULL),
(42, '¿Los sanitarios en general cuentan con jabón y papel higiénico?', 1, 5, 9, '2018-09-11 05:00:00', NULL, NULL),
(43, 'Número de inodoros para estudiantes mujeres:', 2, 5, 9, '2018-09-11 05:00:00', NULL, NULL),
(44, 'Número de lavamanos en los baños de mujeres estudiantes:', 2, 5, 9, '2018-09-11 05:00:00', NULL, NULL),
(45, 'Número de inodoros para estudiantes hombres:', 2, 5, 9, '2018-09-11 05:00:00', NULL, NULL),
(46, 'Número de lavamanos en los baños de hombres estudiantes:', 2, 5, 9, '2018-09-11 05:00:00', NULL, NULL),
(47, 'Número de mingitorios en los baños de hombres estudiantes:', 2, 5, 9, '2018-09-11 05:00:00', NULL, NULL),
(48, 'Número de sanitarios para el personal administrativo hombres:', 2, 5, 9, '2018-09-11 05:00:00', NULL, NULL),
(49, 'Número de sanitarios para el personal administrativo mujeres:', 2, 5, 9, '2018-09-11 05:00:00', NULL, NULL),
(50, 'Núumero de computadoras:', 2, 6, 10, '2018-09-11 05:00:00', NULL, NULL),
(51, 'Sistema operativo del equipo de cómputo:', 3, 6, 10, '2018-09-11 05:00:00', NULL, NULL),
(52, 'Versión del sistema operativo del equipo de cómputo:', 3, 6, 10, '2018-09-11 05:00:00', NULL, NULL),
(53, 'Memoria RAM del equipo de cómputo:', 3, 6, 10, '2018-09-11 05:00:00', NULL, NULL),
(54, 'Capacidad del disco duro del equipo de cómputo:', 3, 6, 10, '2018-09-11 05:00:00', NULL, NULL),
(55, 'Se identifica claramente el plantel, nombre de la escuela ', 1, 6, 11, '2018-09-11 05:00:00', NULL, NULL),
(56, 'Se identifica claramente el número de domicilio ', 1, 6, 11, '2018-09-11 05:00:00', NULL, NULL),
(57, 'Se observa limpio e higiénico el exterior del plantel', 1, 6, 11, '2018-09-11 05:00:00', NULL, NULL),
(58, '¿La institución cuenta con área de recepción?', 1, 7, 12, '2018-09-11 05:00:00', NULL, NULL),
(59, '¿La institución cuenta con dirección?', 1, 7, 12, '2018-09-11 05:00:00', NULL, NULL),
(60, '¿La institución cuenta con área de control escolar?', 1, 7, 12, '2018-09-11 05:00:00', NULL, NULL),
(61, '¿La institución cuenta con sala(s) de maestros?', 1, 7, 12, '2018-09-11 05:00:00', NULL, NULL),
(62, '¿La institución cuenta con cubículo(s) de orientación educativa?', 1, 7, 12, '2018-09-11 05:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspeccion_tipo_preguntas`
--

CREATE TABLE `inspeccion_tipo_preguntas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inspeccion_tipo_preguntas`
--

INSERT INTO `inspeccion_tipo_preguntas` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'SI/NO', 'Tipo de pregunta SI o NO', '2018-09-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'NUMERICO', 'Tipo de pregunta entero', '2018-09-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'ABIERTA', 'Tipo de pregunta que recibe una cadena', '2018-09-10 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspectores`
--

CREATE TABLE `inspectores` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucionales`
--

CREATE TABLE `institucionales` (
  `id` int(11) NOT NULL,
  `evaluador_id` int(11) NOT NULL,
  `institucion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombramiento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `departamento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instituciones`
--

CREATE TABLE `instituciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `historia` text COLLATE utf8_unicode_ci,
  `vision` text COLLATE utf8_unicode_ci,
  `mision` text COLLATE utf8_unicode_ci,
  `valores_institucionales` text COLLATE utf8_unicode_ci,
  `es_nombre_autorizado` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mixta_noescolarizadas`
--

CREATE TABLE `mixta_noescolarizadas` (
  `id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `licencias_software` text COLLATE utf8_unicode_ci NOT NULL,
  `servicios_herramientas_educativas` text COLLATE utf8_unicode_ci NOT NULL,
  `sistemas_seguridad` text COLLATE utf8_unicode_ci NOT NULL,
  `direccionamiento_ip_publico` text COLLATE utf8_unicode_ci NOT NULL,
  `tecnologias_informacion_comunicacion` text COLLATE utf8_unicode_ci NOT NULL,
  `mantenimiento_plataforma` text COLLATE utf8_unicode_ci NOT NULL,
  `diagrama_plataforma` text COLLATE utf8_unicode_ci NOT NULL,
  `acceso_internet` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidades`
--

CREATE TABLE `modalidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `modalidades`
--

INSERT INTO `modalidades` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Escolarizada', 'Modalidad escolarizada de un programa de estudios', '2018-11-11 00:00:00', NULL, NULL),
(2, 'No escolarizada', 'Modalidad no escolarizada de un programa de estudios', '2018-11-21 00:00:00', NULL, NULL),
(3, 'Mixta', 'Modalidad mixta de un programa de estudios', '2018-11-21 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'solicitudes', 'Solicitudes', '2018-09-17 17:00:00', NULL, NULL),
(3, 'usuarios', 'Usuarios', '2018-09-17 17:00:00', NULL, NULL),
(4, 'solicitudes-estatus-solicitudes', 'Comentarios', '2018-09-17 17:00:00', NULL, NULL),
(5, 'programas', 'Programas', '2018-09-17 17:00:00', NULL, NULL),
(6, 'inspeccion-observaciones', 'Observaciones de Inspección', '2018-09-17 18:00:00', NULL, NULL),
(7, 'planteles', 'Planteles', '2018-09-17 18:00:00', NULL, NULL),
(8, 'inspecciones-inspeccion-preguntas', 'Respuestas de las preguntas de inspección', '2018-09-17 18:00:00', NULL, NULL),
(9, 'modulos-roles', 'Accesos', '2018-09-19 13:00:00', NULL, NULL),
(10, 'pagos', 'Pagos', '2018-09-30 13:00:00', NULL, NULL),
(11, 'curriculum', 'Curriculum para evaluadores', '2018-11-14 06:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos_roles`
--

CREATE TABLE `modulos_roles` (
  `id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `accion` int(11) NOT NULL COMMENT '1=Ver propios, 2=Ver Todo, 3=Ver detalles, 4=Crear, 5=Editar, 6=Eliminar',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `modulos_roles`
--

INSERT INTO `modulos_roles` (`id`, `modulo_id`, `rol_id`, `accion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 3, 1, '2018-09-17 17:00:00', NULL, NULL),
(2, 2, 3, 3, '2018-09-17 17:00:00', NULL, NULL),
(3, 2, 3, 4, '2018-09-17 17:00:00', NULL, NULL),
(4, 2, 3, 5, '2018-09-17 17:00:00', NULL, NULL),
(5, 2, 3, 6, '2018-09-17 17:00:00', NULL, NULL),
(6, 3, 3, 1, '2018-09-17 17:00:00', NULL, NULL),
(7, 3, 3, 3, '2018-09-17 17:00:00', NULL, NULL),
(8, 3, 3, 4, '2018-09-17 17:00:00', NULL, NULL),
(9, 3, 3, 5, '2018-09-17 17:00:00', NULL, NULL),
(10, 3, 3, 6, '2018-09-17 17:00:00', NULL, NULL),
(11, 2, 4, 1, '2018-09-17 16:00:00', NULL, NULL),
(12, 2, 4, 3, '2018-09-17 16:00:00', NULL, NULL),
(13, 2, 4, 5, '2018-09-17 16:00:00', NULL, NULL),
(14, 2, 7, 2, '2018-09-17 16:00:00', NULL, NULL),
(15, 2, 7, 3, '2018-09-17 16:00:00', NULL, NULL),
(16, 2, 7, 5, '2018-09-17 16:00:00', NULL, NULL),
(17, 2, 8, 2, '2018-09-17 16:00:00', NULL, NULL),
(18, 2, 8, 3, '2018-09-17 16:00:00', NULL, NULL),
(19, 4, 8, 2, '2018-09-17 16:00:00', NULL, NULL),
(20, 2, 9, 2, '2018-09-17 16:00:00', NULL, NULL),
(21, 2, 9, 3, '2018-09-17 16:00:00', NULL, NULL),
(22, 2, 9, 5, '2018-09-17 16:00:00', NULL, NULL),
(23, 5, 9, 5, '2018-09-17 16:00:00', NULL, NULL),
(24, 6, 6, 1, '2018-09-17 16:00:00', NULL, NULL),
(25, 6, 6, 3, '2018-09-17 16:00:00', NULL, NULL),
(26, 6, 6, 4, '2018-09-17 16:00:00', NULL, NULL),
(27, 7, 6, 1, '2018-09-17 16:00:00', NULL, NULL),
(28, 7, 6, 3, '2018-09-17 16:00:00', NULL, NULL),
(29, 8, 6, 1, '2018-09-17 16:00:00', NULL, NULL),
(30, 8, 6, 3, '2018-09-17 16:00:00', NULL, NULL),
(31, 8, 6, 4, '2018-09-17 16:00:00', NULL, NULL),
(33, 2, 2, 2, '2018-09-17 17:00:00', NULL, NULL),
(34, 2, 2, 3, '2018-09-17 17:00:00', NULL, NULL),
(35, 2, 2, 4, '2018-09-17 17:00:00', NULL, NULL),
(36, 2, 2, 5, '2018-09-17 17:00:00', NULL, NULL),
(37, 2, 2, 6, '2018-09-17 17:00:00', NULL, '2018-09-21 04:50:08'),
(38, 3, 2, 1, '2018-09-17 17:00:00', NULL, NULL),
(39, 3, 2, 2, '2018-09-17 17:00:00', NULL, NULL),
(40, 3, 2, 3, '2018-09-17 17:00:00', NULL, NULL),
(41, 3, 2, 4, '2018-09-17 17:00:00', NULL, NULL),
(42, 3, 2, 5, '2018-09-17 17:00:00', NULL, NULL),
(43, 3, 2, 6, '2018-09-17 17:00:00', NULL, NULL),
(44, 9, 2, 4, '2018-09-20 09:51:33', NULL, NULL),
(45, 9, 2, 5, '2018-09-20 09:52:49', NULL, NULL),
(46, 9, 2, 6, '2018-09-20 10:00:38', NULL, NULL),
(48, 2, 2, 1, '2018-09-20 11:59:46', NULL, '2018-09-20 12:03:01'),
(49, 2, 2, 1, '2018-09-20 12:03:10', NULL, '2018-09-20 12:03:22'),
(50, 2, 2, 1, '2018-09-20 12:03:29', NULL, NULL),
(51, 7, 2, 2, '2018-09-21 04:46:19', NULL, NULL),
(52, 2, 2, 6, '2018-09-21 04:50:28', NULL, NULL),
(53, 10, 2, 2, '2018-10-01 07:11:53', NULL, NULL),
(54, 10, 2, 4, '2018-10-01 07:12:05', NULL, '2018-10-02 03:04:47'),
(55, 10, 2, 5, '2018-10-01 07:12:14', NULL, NULL),
(56, 10, 2, 6, '2018-10-01 07:12:22', NULL, NULL),
(57, 10, 2, 4, '2018-10-02 03:05:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `municipio` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id`, `estado_id`, `municipio`) VALUES
(1, 1, 'Aguascalientes'),
(2, 1, 'San Francisco de los Romo'),
(3, 1, 'El Llano'),
(4, 1, 'Rincón de Romos'),
(5, 1, 'Cosío'),
(6, 1, 'San José de Gracia'),
(7, 1, 'Tepezalá'),
(8, 1, 'Pabellón de Arteaga'),
(9, 1, 'Asientos'),
(10, 1, 'Calvillo'),
(11, 1, 'Jesús María'),
(12, 2, 'Mexicali'),
(13, 2, 'Tecate'),
(14, 2, 'Tijuana'),
(15, 2, 'Playas de Rosarito'),
(16, 2, 'Ensenada'),
(17, 3, 'La Paz'),
(18, 3, 'Los Cabos'),
(19, 3, 'Comondú'),
(20, 3, 'Loreto'),
(21, 3, 'Mulegé'),
(22, 4, 'Campeche'),
(23, 4, 'Carmen'),
(24, 4, 'Palizada'),
(25, 4, 'Candelaria'),
(26, 4, 'Escárcega'),
(27, 4, 'Champotón'),
(28, 4, 'Hopelchén'),
(29, 4, 'Calakmul'),
(30, 4, 'Tenabo'),
(31, 4, 'Hecelchakán'),
(32, 4, 'Calkiní'),
(33, 5, 'Saltillo'),
(34, 5, 'Arteaga'),
(35, 5, 'Juárez'),
(36, 5, 'Progreso'),
(37, 5, 'Escobedo'),
(38, 5, 'San Buenaventura'),
(39, 5, 'Abasolo'),
(40, 5, 'Candela'),
(41, 5, 'Frontera'),
(42, 5, 'Monclova'),
(43, 5, 'Castaños'),
(44, 5, 'Ramos Arizpe'),
(45, 5, 'General Cepeda'),
(46, 5, 'Piedras Negras'),
(47, 5, 'Nava'),
(48, 5, 'Acuña'),
(49, 5, 'Múzquiz'),
(50, 5, 'Jiménez'),
(51, 5, 'Zaragoza'),
(52, 5, 'Morelos'),
(53, 5, 'Allende'),
(54, 5, 'Villa Unión'),
(55, 5, 'Guerrero'),
(56, 5, 'Hidalgo'),
(57, 5, 'Sabinas'),
(58, 5, 'San Juan de Sabinas'),
(59, 5, 'Torreón'),
(60, 5, 'Matamoros'),
(61, 5, 'Viesca'),
(62, 5, 'Ocampo'),
(63, 5, 'Nadadores'),
(64, 5, 'Sierra Mojada'),
(65, 5, 'Cuatro Ciénegas'),
(66, 5, 'Lamadrid'),
(67, 5, 'Sacramento'),
(68, 5, 'San Pedro'),
(69, 5, 'Francisco I. Madero'),
(70, 5, 'Parras'),
(71, 6, 'Colima'),
(72, 6, 'Tecomán'),
(73, 6, 'Manzanillo'),
(74, 6, 'Armería'),
(75, 6, 'Coquimatlán'),
(76, 6, 'Comala'),
(77, 6, 'Cuauhtémoc'),
(78, 6, 'Ixtlahuacán'),
(79, 6, 'Minatitlán'),
(80, 6, 'Villa de Álvarez'),
(81, 7, 'Tuxtla Gutiérrez'),
(82, 7, 'San Fernando'),
(83, 7, 'Berriozábal'),
(84, 7, 'Ocozocoautla de Espinosa'),
(85, 7, 'Suchiapa'),
(86, 7, 'Chiapa de Corzo'),
(87, 7, 'Osumacinta'),
(88, 7, 'San Cristóbal de las Casas'),
(89, 7, 'Chamula'),
(90, 7, 'Ixtapa'),
(91, 7, 'Zinacantán'),
(92, 7, 'Acala'),
(93, 7, 'Chiapilla'),
(94, 7, 'San Lucas'),
(95, 7, 'Teopisca'),
(96, 7, 'Amatenango del Valle'),
(97, 7, 'Chanal'),
(98, 7, 'Oxchuc'),
(99, 7, 'Huixtán'),
(100, 7, 'Tenejapa'),
(101, 7, 'Mitontic'),
(102, 7, 'Reforma'),
(103, 7, 'Juárez'),
(104, 7, 'Pichucalco'),
(105, 7, 'Sunuapa'),
(106, 7, 'Ostuacán'),
(107, 7, 'Francisco León'),
(108, 7, 'Ixtacomitán'),
(109, 7, 'Solosuchiapa'),
(110, 7, 'Ixtapangajoya'),
(111, 7, 'Tecpatán'),
(112, 7, 'Copainalá'),
(113, 7, 'Chicoasén'),
(114, 7, 'Coapilla'),
(115, 7, 'Pantepec'),
(116, 7, 'Tapalapa'),
(117, 7, 'Ocotepec'),
(118, 7, 'Chapultenango'),
(119, 7, 'Amatán'),
(120, 7, 'Huitiupán'),
(121, 7, 'Ixhuatán'),
(122, 7, 'Tapilula'),
(123, 7, 'Rayón'),
(124, 7, 'Pueblo Nuevo Solistahuacán'),
(125, 7, 'Jitotol'),
(126, 7, 'Bochil'),
(127, 7, 'Soyaló'),
(128, 7, 'San Juan Cancuc'),
(129, 7, 'Sabanilla'),
(130, 7, 'Simojovel'),
(131, 7, 'San Andrés Duraznal'),
(132, 7, 'El Bosque'),
(133, 7, 'Chalchihuitán'),
(134, 7, 'Larráinzar'),
(135, 7, 'Santiago el Pinar'),
(136, 7, 'Chenalhó'),
(137, 7, 'Aldama'),
(138, 7, 'Pantelhó'),
(139, 7, 'Sitalá'),
(140, 7, 'Salto de Agua'),
(141, 7, 'Tila'),
(142, 7, 'Tumbalá'),
(143, 7, 'Yajalón'),
(144, 7, 'Ocosingo'),
(145, 7, 'Chilón'),
(146, 7, 'Benemérito de las Américas'),
(147, 7, 'Marqués de Comillas'),
(148, 7, 'Palenque'),
(149, 7, 'La Libertad'),
(150, 7, 'Catazajá'),
(151, 7, 'Comitán de Domínguez'),
(152, 7, 'Tzimol'),
(153, 7, 'Chicomuselo'),
(154, 7, 'Bella Vista'),
(155, 7, 'Frontera Comalapa'),
(156, 7, 'La Trinitaria'),
(157, 7, 'La Independencia'),
(158, 7, 'Maravilla Tenejapa'),
(159, 7, 'Las Margaritas'),
(160, 7, 'Altamirano'),
(161, 7, 'Venustiano Carranza'),
(162, 7, 'Totolapa'),
(163, 7, 'Nicolás Ruíz'),
(164, 7, 'Las Rosas'),
(165, 7, 'La Concordia'),
(166, 7, 'Angel Albino Corzo'),
(167, 7, 'Montecristo de Guerrero'),
(168, 7, 'Socoltenango'),
(169, 7, 'Cintalapa'),
(170, 7, 'Jiquipilas'),
(171, 7, 'Arriaga'),
(172, 7, 'Villaflores'),
(173, 7, 'Tonalá'),
(174, 7, 'Villa Corzo'),
(175, 7, 'Pijijiapan'),
(176, 7, 'Mapastepec'),
(177, 7, 'Acapetahua'),
(178, 7, 'Acacoyagua'),
(179, 7, 'Escuintla'),
(180, 7, 'Villa Comaltitlán'),
(181, 7, 'Huixtla'),
(182, 7, 'Mazatán'),
(183, 7, 'Huehuetán'),
(184, 7, 'Tuzantán'),
(185, 7, 'Tapachula'),
(186, 7, 'Suchiate'),
(187, 7, 'Frontera Hidalgo'),
(188, 7, 'Metapa'),
(189, 7, 'Tuxtla Chico'),
(190, 7, 'Unión Juárez'),
(191, 7, 'Cacahoatán'),
(192, 7, 'Motozintla'),
(193, 7, 'Mazapa de Madero'),
(194, 7, 'Amatenango de la Frontera'),
(195, 7, 'Bejucal de Ocampo'),
(196, 7, 'La Grandeza'),
(197, 7, 'El Porvenir'),
(198, 7, 'Siltepec'),
(199, 8, 'Chihuahua'),
(200, 8, 'Cuauhtémoc'),
(201, 8, 'Riva Palacio'),
(202, 8, 'Aquiles Serdán'),
(203, 8, 'Bachíniva'),
(204, 8, 'Guerrero'),
(205, 8, 'Nuevo Casas Grandes'),
(206, 8, 'Ascensión'),
(207, 8, 'Janos'),
(208, 8, 'Casas Grandes'),
(209, 8, 'Galeana'),
(210, 8, 'Buenaventura'),
(211, 8, 'Gómez Farías'),
(212, 8, 'Ignacio Zaragoza'),
(213, 8, 'Madera'),
(214, 8, 'Namiquipa'),
(215, 8, 'Temósachic'),
(216, 8, 'Matachí'),
(217, 8, 'Juárez'),
(218, 8, 'Guadalupe'),
(219, 8, 'Praxedis G. Guerrero'),
(220, 8, 'Ahumada'),
(221, 8, 'Coyame del Sotol'),
(222, 8, 'Ojinaga'),
(223, 8, 'Aldama'),
(224, 8, 'Julimes'),
(225, 8, 'Manuel Benavides'),
(226, 8, 'Delicias'),
(227, 8, 'Rosales'),
(228, 8, 'Meoqui'),
(229, 8, 'Dr. Belisario Domínguez'),
(230, 8, 'Satevó'),
(231, 8, 'San Francisco de Borja'),
(232, 8, 'Nonoava'),
(233, 8, 'Guachochi'),
(234, 8, 'Bocoyna'),
(235, 8, 'Cusihuiriachi'),
(236, 8, 'Gran Morelos'),
(237, 8, 'Santa Isabel'),
(238, 8, 'Carichí'),
(239, 8, 'Uruachi'),
(240, 8, 'Ocampo'),
(241, 8, 'Moris'),
(242, 8, 'Chínipas'),
(243, 8, 'Maguarichi'),
(244, 8, 'Guazapares'),
(245, 8, 'Batopilas'),
(246, 8, 'Urique'),
(247, 8, 'Morelos'),
(248, 8, 'Guadalupe y Calvo'),
(249, 8, 'San Francisco del Oro'),
(250, 8, 'Rosario'),
(251, 8, 'Huejotitán'),
(252, 8, 'El Tule'),
(253, 8, 'Balleza'),
(254, 8, 'Santa Bárbara'),
(255, 8, 'Camargo'),
(256, 8, 'Saucillo'),
(257, 8, 'Valle de Zaragoza'),
(258, 8, 'La Cruz'),
(259, 8, 'San Francisco de Conchos'),
(260, 8, 'Hidalgo del Parral'),
(261, 8, 'Allende'),
(262, 8, 'López'),
(263, 8, 'Matamoros'),
(264, 8, 'Jiménez'),
(265, 8, 'Coronado'),
(266, 9, 'Álvaro Obregón'),
(267, 9, 'Azcapotzalco'),
(268, 9, 'Benito Juárez'),
(269, 9, 'Coyoacán'),
(270, 9, 'Cuajimalpa de Morelos'),
(271, 9, 'Cuauhtémoc'),
(272, 9, 'Gustavo A. Madero'),
(273, 9, 'Iztacalco'),
(274, 9, 'Iztapalapa'),
(275, 9, 'La Magdalena Contreras'),
(276, 9, 'Miguel Hidalgo'),
(277, 9, 'Milpa Alta'),
(278, 9, 'Tláhuac'),
(279, 9, 'Tlalpan'),
(280, 9, 'Venustiano Carranza'),
(281, 9, 'Xochimilco'),
(282, 10, 'Durango'),
(283, 10, 'Canatlán'),
(284, 10, 'Nuevo Ideal'),
(285, 10, 'Coneto de Comonfort'),
(286, 10, 'San Juan del Río'),
(287, 10, 'Canelas'),
(288, 10, 'Topia'),
(289, 10, 'Tamazula'),
(290, 10, 'Santiago Papasquiaro'),
(291, 10, 'Otáez'),
(292, 10, 'San Dimas'),
(293, 10, 'Guadalupe Victoria'),
(294, 10, 'Peñón Blanco'),
(295, 10, 'Pánuco de Coronado'),
(296, 10, 'Poanas'),
(297, 10, 'Nombre de Dios'),
(298, 10, 'Vicente Guerrero'),
(299, 10, 'Súchil'),
(300, 10, 'Pueblo Nuevo'),
(301, 10, 'Mezquital'),
(302, 10, 'Gómez Palacio'),
(303, 10, 'Lerdo'),
(304, 10, 'Mapimí'),
(305, 10, 'Tlahualilo'),
(306, 10, 'Hidalgo'),
(307, 10, 'Ocampo'),
(308, 10, 'Guanaceví'),
(309, 10, 'San Bernardo'),
(310, 10, 'Indé'),
(311, 10, 'San Pedro del Gallo'),
(312, 10, 'Tepehuanes'),
(313, 10, 'El Oro'),
(314, 10, 'Nazas'),
(315, 10, 'San Luis del Cordero'),
(316, 10, 'Rodeo'),
(317, 10, 'Cuencamé'),
(318, 10, 'Santa Clara'),
(319, 10, 'San Juan de Guadalupe'),
(320, 10, 'General Simón Bolívar'),
(321, 11, 'Guanajuato'),
(322, 11, 'Silao de la Victoria'),
(323, 11, 'Romita'),
(324, 11, 'San Francisco del Rincón'),
(325, 11, 'Purísima del Rincón'),
(326, 11, 'Manuel Doblado'),
(327, 11, 'Irapuato'),
(328, 11, 'Salamanca'),
(329, 11, 'Pueblo Nuevo'),
(330, 11, 'Pénjamo'),
(331, 11, 'Cuerámaro'),
(332, 11, 'Abasolo'),
(333, 11, 'Huanímaro'),
(334, 11, 'León'),
(335, 11, 'San Felipe'),
(336, 11, 'Ocampo'),
(337, 11, 'San Miguel de Allende'),
(338, 11, 'Dolores Hidalgo Cuna de la Independencia Nacional'),
(339, 11, 'San Diego de la Unión'),
(340, 11, 'San Luis de la Paz'),
(341, 11, 'Victoria'),
(342, 11, 'Xichú'),
(343, 11, 'Atarjea'),
(344, 11, 'Santa Catarina'),
(345, 11, 'Doctor Mora'),
(346, 11, 'Tierra Blanca'),
(347, 11, 'San José Iturbide'),
(348, 11, 'Celaya'),
(349, 11, 'Apaseo el Grande'),
(350, 11, 'Comonfort'),
(351, 11, 'Santa Cruz de Juventino Rosas'),
(352, 11, 'Villagrán'),
(353, 11, 'Cortazar'),
(354, 11, 'Valle de Santiago'),
(355, 11, 'Jaral del Progreso'),
(356, 11, 'Apaseo el Alto'),
(357, 11, 'Jerécuaro'),
(358, 11, 'Coroneo'),
(359, 11, 'Acámbaro'),
(360, 11, 'Tarimoro'),
(361, 11, 'Tarandacuao'),
(362, 11, 'Moroleón'),
(363, 11, 'Salvatierra'),
(364, 11, 'Yuriria'),
(365, 11, 'Santiago Maravatío'),
(366, 11, 'Uriangato'),
(367, 12, 'Chilpancingo de los Bravo'),
(368, 12, 'General Heliodoro Castillo'),
(369, 12, 'Leonardo Bravo'),
(370, 12, 'Tixtla de Guerrero'),
(371, 12, 'Ayutla de los Libres'),
(372, 12, 'Mochitlán'),
(373, 12, 'Quechultenango'),
(374, 12, 'Tecoanapa'),
(375, 12, 'Acapulco de Juárez'),
(376, 12, 'Juan R. Escudero'),
(377, 12, 'San Marcos'),
(378, 12, 'Iguala de la Independencia'),
(379, 12, 'Huitzuco de los Figueroa'),
(380, 12, 'Tepecoacuilco de Trujano'),
(381, 12, 'Eduardo Neri'),
(382, 12, 'Taxco de Alarcón'),
(383, 12, 'Buenavista de Cuéllar'),
(384, 12, 'Tetipac'),
(385, 12, 'Pilcaya'),
(386, 12, 'Teloloapan'),
(387, 12, 'Ixcateopan de Cuauhtémoc'),
(388, 12, 'Pedro Ascencio Alquisiras'),
(389, 12, 'General Canuto A. Neri'),
(390, 12, 'Arcelia'),
(391, 12, 'Apaxtla'),
(392, 12, 'Cuetzala del Progreso'),
(393, 12, 'Cocula'),
(394, 12, 'Tlapehuala'),
(395, 12, 'Cutzamala de Pinzón'),
(396, 12, 'Pungarabato'),
(397, 12, 'Tlalchapa'),
(398, 12, 'Coyuca de Catalán'),
(399, 12, 'Ajuchitlán del Progreso'),
(400, 12, 'Zirándaro'),
(401, 12, 'San Miguel Totolapan'),
(402, 12, 'La Unión de Isidoro Montes de Oca'),
(403, 12, 'Petatlán'),
(404, 12, 'Coahuayutla de José María Izazaga'),
(405, 12, 'Zihuatanejo de Azueta'),
(406, 12, 'Técpan de Galeana'),
(407, 12, 'Atoyac de Álvarez'),
(408, 12, 'Benito Juárez'),
(409, 12, 'Coyuca de Benítez'),
(410, 12, 'Olinalá'),
(411, 12, 'Atenango del Río'),
(412, 12, 'Copalillo'),
(413, 12, 'Cualác'),
(414, 12, 'Chilapa de Álvarez'),
(415, 12, 'José Joaquín de Herrera'),
(416, 12, 'Ahuacuotzingo'),
(417, 12, 'Zitlala'),
(418, 12, 'Mártir de Cuilapan'),
(419, 12, 'Huamuxtitlán'),
(420, 12, 'Xochihuehuetlán'),
(421, 12, 'Alpoyeca'),
(422, 12, 'Tlapa de Comonfort'),
(423, 12, 'Tlalixtaquilla de Maldonado'),
(424, 12, 'Xalpatláhuac'),
(425, 12, 'Zapotitlán Tablas'),
(426, 12, 'Acatepec'),
(427, 12, 'Atlixtac'),
(428, 12, 'Copanatoyac'),
(429, 12, 'Malinaltepec'),
(430, 12, 'Iliatenco'),
(431, 12, 'Tlacoapa'),
(432, 12, 'Atlamajalcingo del Monte'),
(433, 12, 'San Luis Acatlán'),
(434, 12, 'Metlatónoc'),
(435, 12, 'Cochoapa el Grande'),
(436, 12, 'Alcozauca de Guerrero'),
(437, 12, 'Ometepec'),
(438, 12, 'Tlacoachistlahuaca'),
(439, 12, 'Xochistlahuaca'),
(440, 12, 'Florencio Villarreal'),
(441, 12, 'Cuautepec'),
(442, 12, 'Copala'),
(443, 12, 'Azoyú'),
(444, 12, 'Juchitán'),
(445, 12, 'Marquelia'),
(446, 12, 'Cuajinicuilapa'),
(447, 12, 'Igualapa'),
(448, 13, 'Pachuca de Soto'),
(449, 13, 'Mineral del Chico'),
(450, 13, 'Mineral del Monte'),
(451, 13, 'Ajacuba'),
(452, 13, 'San Agustín Tlaxiaca'),
(453, 13, 'Mineral de la Reforma'),
(454, 13, 'Zapotlán de Juárez'),
(455, 13, 'Jacala de Ledezma'),
(456, 13, 'Pisaflores'),
(457, 13, 'Pacula'),
(458, 13, 'La Misión'),
(459, 13, 'Chapulhuacán'),
(460, 13, 'Ixmiquilpan'),
(461, 13, 'Zimapán'),
(462, 13, 'Nicolás Flores'),
(463, 13, 'Cardonal'),
(464, 13, 'Tasquillo'),
(465, 13, 'Alfajayucan'),
(466, 13, 'Huichapan'),
(467, 13, 'Tecozautla'),
(468, 13, 'Nopala de Villagrán'),
(469, 13, 'Actopan'),
(470, 13, 'Santiago de Anaya'),
(471, 13, 'San Salvador'),
(472, 13, 'Francisco I. Madero'),
(473, 13, 'El Arenal'),
(474, 13, 'Mixquiahuala de Juárez'),
(475, 13, 'Progreso de Obregón'),
(476, 13, 'Chilcuautla'),
(477, 13, 'Tezontepec de Aldama'),
(478, 13, 'Tlahuelilpan'),
(479, 13, 'Tula de Allende'),
(480, 13, 'Tepeji del Río de Ocampo'),
(481, 13, 'Chapantongo'),
(482, 13, 'Tepetitlán'),
(483, 13, 'Tetepango'),
(484, 13, 'Tlaxcoapan'),
(485, 13, 'Atitalaquia'),
(486, 13, 'Atotonilco de Tula'),
(487, 13, 'Huejutla de Reyes'),
(488, 13, 'San Felipe Orizatlán'),
(489, 13, 'Jaltocán'),
(490, 13, 'Huautla'),
(491, 13, 'Atlapexco'),
(492, 13, 'Huazalingo'),
(493, 13, 'Yahualica'),
(494, 13, 'Xochiatipan'),
(495, 13, 'Molango de Escamilla'),
(496, 13, 'Tepehuacán de Guerrero'),
(497, 13, 'Lolotla'),
(498, 13, 'Tlanchinol'),
(499, 13, 'Tlahuiltepa'),
(500, 13, 'Juárez Hidalgo'),
(501, 13, 'Zacualtipán de Ángeles'),
(502, 13, 'Calnali'),
(503, 13, 'Xochicoatlán'),
(504, 13, 'Tianguistengo'),
(505, 13, 'Atotonilco el Grande'),
(506, 13, 'Eloxochitlán'),
(507, 13, 'Metztitlán'),
(508, 13, 'San Agustín Metzquititlán'),
(509, 13, 'Metepec'),
(510, 13, 'Huehuetla'),
(511, 13, 'San Bartolo Tutotepec'),
(512, 13, 'Agua Blanca de Iturbide'),
(513, 13, 'Tenango de Doria'),
(514, 13, 'Huasca de Ocampo'),
(515, 13, 'Acatlán'),
(516, 13, 'Omitlán de Juárez'),
(517, 13, 'Epazoyucan'),
(518, 13, 'Tulancingo de Bravo'),
(519, 13, 'Acaxochitlán'),
(520, 13, 'Cuautepec de Hinojosa'),
(521, 13, 'Santiago Tulantepec de Lugo Guerrero'),
(522, 13, 'Singuilucan'),
(523, 13, 'Tizayuca'),
(524, 13, 'Zempoala'),
(525, 13, 'Tolcayuca'),
(526, 13, 'Villa de Tezontepec'),
(527, 13, 'Apan'),
(528, 13, 'Tlanalapa'),
(529, 13, 'Almoloya'),
(530, 13, 'Emiliano Zapata'),
(531, 13, 'Tepeapulco'),
(532, 14, 'Guadalajara'),
(533, 14, 'Zapopan'),
(534, 14, 'San Cristóbal de la Barranca'),
(535, 14, 'Ixtlahuacán del Río'),
(536, 14, 'Tala'),
(537, 14, 'El Arenal'),
(538, 14, 'Amatitán'),
(539, 14, 'Tonalá'),
(540, 14, 'Zapotlanejo'),
(541, 14, 'Acatic'),
(542, 14, 'Cuquío'),
(543, 14, 'San Pedro Tlaquepaque'),
(544, 14, 'Tlajomulco de Zúñiga'),
(545, 14, 'El Salto'),
(546, 14, 'Acatlán de Juárez'),
(547, 14, 'Villa Corona'),
(548, 14, 'Zacoalco de Torres'),
(549, 14, 'Atemajac de Brizuela'),
(550, 14, 'Jocotepec'),
(551, 14, 'Ixtlahuacán de los Membrillos'),
(552, 14, 'Juanacatlán'),
(553, 14, 'Chapala'),
(554, 14, 'Poncitlán'),
(555, 14, 'Zapotlán del Rey'),
(556, 14, 'Huejuquilla el Alto'),
(557, 14, 'Mezquitic'),
(558, 14, 'Villa Guerrero'),
(559, 14, 'Bolaños'),
(560, 14, 'Totatiche'),
(561, 14, 'Colotlán'),
(562, 14, 'Santa María de los Ángeles'),
(563, 14, 'Huejúcar'),
(564, 14, 'Chimaltitán'),
(565, 14, 'San Martín de Bolaños'),
(566, 14, 'Tequila'),
(567, 14, 'Hostotipaquillo'),
(568, 14, 'Magdalena'),
(569, 14, 'Etzatlán'),
(570, 14, 'San Marcos'),
(571, 14, 'San Juanito de Escobedo'),
(572, 14, 'Ameca'),
(573, 14, 'Ahualulco de Mercado'),
(574, 14, 'Teuchitlán'),
(575, 14, 'San Martín Hidalgo'),
(576, 14, 'Guachinango'),
(577, 14, 'Mixtlán'),
(578, 14, 'Mascota'),
(579, 14, 'San Sebastián del Oeste'),
(580, 14, 'San Juan de los Lagos'),
(581, 14, 'Jalostotitlán'),
(582, 14, 'San Miguel el Alto'),
(583, 14, 'San Julián'),
(584, 14, 'Arandas'),
(585, 14, 'San Ignacio Cerro Gordo'),
(586, 14, 'Teocaltiche'),
(587, 14, 'Villa Hidalgo'),
(588, 14, 'Encarnación de Díaz'),
(589, 14, 'Yahualica de González Gallo'),
(590, 14, 'Mexticacán'),
(591, 14, 'Cañadas de Obregón'),
(592, 14, 'Valle de Guadalupe'),
(593, 14, 'Lagos de Moreno'),
(594, 14, 'Ojuelos de Jalisco'),
(595, 14, 'Unión de San Antonio'),
(596, 14, 'San Diego de Alejandría'),
(597, 14, 'Tepatitlán de Morelos'),
(598, 14, 'Tototlán'),
(599, 14, 'Atotonilco el Alto'),
(600, 14, 'Ocotlán'),
(601, 14, 'Jamay'),
(602, 14, 'La Barca'),
(603, 14, 'Ayotlán'),
(604, 14, 'Jesús María'),
(605, 14, 'Degollado'),
(606, 14, 'Unión de Tula'),
(607, 14, 'Ayutla'),
(608, 14, 'Atenguillo'),
(609, 14, 'Cuautla'),
(610, 14, 'Atengo'),
(611, 14, 'Talpa de Allende'),
(612, 14, 'Puerto Vallarta'),
(613, 14, 'Cabo Corrientes'),
(614, 14, 'Tomatlán'),
(615, 14, 'Cocula'),
(616, 14, 'Tecolotlán'),
(617, 14, 'Tenamaxtlán'),
(618, 14, 'Juchitlán'),
(619, 14, 'Chiquilistlán'),
(620, 14, 'Ejutla'),
(621, 14, 'El Limón'),
(622, 14, 'El Grullo'),
(623, 14, 'Tonaya'),
(624, 14, 'Tuxcacuesco'),
(625, 14, 'Villa Purificación'),
(626, 14, 'La Huerta'),
(627, 14, 'Autlán de Navarro'),
(628, 14, 'Casimiro Castillo'),
(629, 14, 'Cuautitlán de García Barragán'),
(630, 14, 'Cihuatlán'),
(631, 14, 'Zapotlán el Grande'),
(632, 14, 'Gómez Farías'),
(633, 14, 'Concepción de Buenos Aires'),
(634, 14, 'Atoyac'),
(635, 14, 'Techaluta de Montenegro'),
(636, 14, 'Teocuitatlán de Corona'),
(637, 14, 'Sayula'),
(638, 14, 'Tapalpa'),
(639, 14, 'Amacueca'),
(640, 14, 'Tizapán el Alto'),
(641, 14, 'Tuxcueca'),
(642, 14, 'La Manzanilla de la Paz'),
(643, 14, 'Mazamitla'),
(644, 14, 'Valle de Juárez'),
(645, 14, 'Quitupan'),
(646, 14, 'Zapotiltic'),
(647, 14, 'Tamazula de Gordiano'),
(648, 14, 'San Gabriel'),
(649, 14, 'Tolimán'),
(650, 14, 'Zapotitlán de Vadillo'),
(651, 14, 'Tuxpan'),
(652, 14, 'Tonila'),
(653, 14, 'Pihuamo'),
(654, 14, 'Tecalitlán'),
(655, 14, 'Jilotlán de los Dolores'),
(656, 14, 'Santa María del Oro'),
(657, 15, 'Toluca'),
(658, 15, 'Acambay de Ruíz Castañeda'),
(659, 15, 'Aculco'),
(660, 15, 'Temascalcingo'),
(661, 15, 'Atlacomulco'),
(662, 15, 'Timilpan'),
(663, 15, 'Morelos'),
(664, 15, 'El Oro'),
(665, 15, 'San Felipe del Progreso'),
(666, 15, 'San José del Rincón'),
(667, 15, 'Jocotitlán'),
(668, 15, 'Ixtlahuaca'),
(669, 15, 'Jiquipilco'),
(670, 15, 'Temoaya'),
(671, 15, 'Almoloya de Juárez'),
(672, 15, 'Villa Victoria'),
(673, 15, 'Villa de Allende'),
(674, 15, 'Donato Guerra'),
(675, 15, 'Ixtapan del Oro'),
(676, 15, 'Santo Tomás'),
(677, 15, 'Otzoloapan'),
(678, 15, 'Zacazonapan'),
(679, 15, 'Valle de Bravo'),
(680, 15, 'Amanalco'),
(681, 15, 'Temascaltepec'),
(682, 15, 'Zinacantepec'),
(683, 15, 'Tejupilco'),
(684, 15, 'Luvianos'),
(685, 15, 'San Simón de Guerrero'),
(686, 15, 'Amatepec'),
(687, 15, 'Tlatlaya'),
(688, 15, 'Sultepec'),
(689, 15, 'Texcaltitlán'),
(690, 15, 'Coatepec Harinas'),
(691, 15, 'Villa Guerrero'),
(692, 15, 'Zacualpan'),
(693, 15, 'Almoloya de Alquisiras'),
(694, 15, 'Ixtapan de la Sal'),
(695, 15, 'Tonatico'),
(696, 15, 'Zumpahuacán'),
(697, 15, 'Lerma'),
(698, 15, 'Xonacatlán'),
(699, 15, 'Otzolotepec'),
(700, 15, 'San Mateo Atenco'),
(701, 15, 'Metepec'),
(702, 15, 'Mexicaltzingo'),
(703, 15, 'Calimaya'),
(704, 15, 'Chapultepec'),
(705, 15, 'San Antonio la Isla'),
(706, 15, 'Tenango del Valle'),
(707, 15, 'Rayón'),
(708, 15, 'Joquicingo'),
(709, 15, 'Tenancingo'),
(710, 15, 'Malinalco'),
(711, 15, 'Ocuilan'),
(712, 15, 'Atizapán'),
(713, 15, 'Almoloya del Río'),
(714, 15, 'Texcalyacac'),
(715, 15, 'Tianguistenco'),
(716, 15, 'Xalatlaco'),
(717, 15, 'Capulhuac'),
(718, 15, 'Ocoyoacac'),
(719, 15, 'Huixquilucan'),
(720, 15, 'Atizapán de Zaragoza'),
(721, 15, 'Naucalpan de Juárez'),
(722, 15, 'Tlalnepantla de Baz'),
(723, 15, 'Polotitlán'),
(724, 15, 'Jilotepec'),
(725, 15, 'Soyaniquilpan de Juárez'),
(726, 15, 'Villa del Carbón'),
(727, 15, 'Chapa de Mota'),
(728, 15, 'Nicolás Romero'),
(729, 15, 'Isidro Fabela'),
(730, 15, 'Jilotzingo'),
(731, 15, 'Tepotzotlán'),
(732, 15, 'Coyotepec'),
(733, 15, 'Huehuetoca'),
(734, 15, 'Cuautitlán Izcalli'),
(735, 15, 'Teoloyucan'),
(736, 15, 'Cuautitlán'),
(737, 15, 'Melchor Ocampo'),
(738, 15, 'Tultitlán'),
(739, 15, 'Tultepec'),
(740, 15, 'Ecatepec de Morelos'),
(741, 15, 'Zumpango'),
(742, 15, 'Tequixquiac'),
(743, 15, 'Apaxco'),
(744, 15, 'Hueypoxtla'),
(745, 15, 'Coacalco de Berriozábal'),
(746, 15, 'Tecámac'),
(747, 15, 'Jaltenco'),
(748, 15, 'Tonanitla'),
(749, 15, 'Nextlalpan'),
(750, 15, 'Teotihuacán'),
(751, 15, 'San Martín de las Pirámides'),
(752, 15, 'Acolman'),
(753, 15, 'Otumba'),
(754, 15, 'Axapusco'),
(755, 15, 'Nopaltepec'),
(756, 15, 'Temascalapa'),
(757, 15, 'Tezoyuca'),
(758, 15, 'Chiautla'),
(759, 15, 'Papalotla'),
(760, 15, 'Tepetlaoxtoc'),
(761, 15, 'Texcoco'),
(762, 15, 'Chiconcuac'),
(763, 15, 'Atenco'),
(764, 15, 'Chimalhuacán'),
(765, 15, 'Chicoloapan'),
(766, 15, 'La Paz'),
(767, 15, 'Ixtapaluca'),
(768, 15, 'Chalco'),
(769, 15, 'Valle de Chalco Solidaridad'),
(770, 15, 'Temamatla'),
(771, 15, 'Cocotitlán'),
(772, 15, 'Tlalmanalco'),
(773, 15, 'Ayapango'),
(774, 15, 'Tenango del Aire'),
(775, 15, 'Ozumba'),
(776, 15, 'Juchitepec'),
(777, 15, 'Tepetlixpa'),
(778, 15, 'Amecameca'),
(779, 15, 'Atlautla'),
(780, 15, 'Ecatzingo'),
(781, 15, 'Nezahualcóyotl'),
(782, 16, 'Morelia'),
(783, 16, 'Huaniqueo'),
(784, 16, 'Coeneo'),
(785, 16, 'Quiroga'),
(786, 16, 'Tzintzuntzan'),
(787, 16, 'Lagunillas'),
(788, 16, 'Acuitzio'),
(789, 16, 'Madero'),
(790, 16, 'Puruándiro'),
(791, 16, 'José Sixto Verduzco'),
(792, 16, 'Angamacutiro'),
(793, 16, 'Panindícuaro'),
(794, 16, 'Zacapu'),
(795, 16, 'Tlazazalca'),
(796, 16, 'Purépero'),
(797, 16, 'Jiménez'),
(798, 16, 'Morelos'),
(799, 16, 'Huandacareo'),
(800, 16, 'Cuitzeo'),
(801, 16, 'Chucándiro'),
(802, 16, 'Copándaro'),
(803, 16, 'Tarímbaro'),
(804, 16, 'Santa Ana Maya'),
(805, 16, 'Álvaro Obregón'),
(806, 16, 'Zinapécuaro'),
(807, 16, 'Indaparapeo'),
(808, 16, 'Queréndaro'),
(809, 16, 'Sahuayo'),
(810, 16, 'Briseñas'),
(811, 16, 'Cojumatlán de Régules'),
(812, 16, 'Venustiano Carranza'),
(813, 16, 'Pajacuarán'),
(814, 16, 'Vista Hermosa'),
(815, 16, 'Tanhuato'),
(816, 16, 'Yurécuaro'),
(817, 16, 'Ixtlán'),
(818, 16, 'La Piedad'),
(819, 16, 'Numarán'),
(820, 16, 'Churintzio'),
(821, 16, 'Zináparo'),
(822, 16, 'Penjamillo'),
(823, 16, 'Marcos Castellanos'),
(824, 16, 'Jiquilpan'),
(825, 16, 'Villamar'),
(826, 16, 'Chavinda'),
(827, 16, 'Zamora'),
(828, 16, 'Ecuandureo'),
(829, 16, 'Tangancícuaro'),
(830, 16, 'Chilchota'),
(831, 16, 'Jacona'),
(832, 16, 'Tangamandapio'),
(833, 16, 'Cotija'),
(834, 16, 'Tocumbo'),
(835, 16, 'Tingüindín'),
(836, 16, 'Uruapan'),
(837, 16, 'Charapan'),
(838, 16, 'Paracho'),
(839, 16, 'Cherán'),
(840, 16, 'Nahuatzen'),
(841, 16, 'Tingambato'),
(842, 16, 'Los Reyes'),
(843, 16, 'Peribán'),
(844, 16, 'Tancítaro'),
(845, 16, 'Nuevo Parangaricutiro'),
(846, 16, 'Buenavista'),
(847, 16, 'Tepalcatepec'),
(848, 16, 'Aguililla'),
(849, 16, 'Apatzingán'),
(850, 16, 'Parácuaro'),
(851, 16, 'Coahuayana'),
(852, 16, 'Chinicuila'),
(853, 16, 'Coalcomán de Vázquez Pallares'),
(854, 16, 'Aquila'),
(855, 16, 'Tumbiscatío'),
(856, 16, 'Arteaga'),
(857, 16, 'Lázaro Cárdenas'),
(858, 16, 'Epitacio Huerta'),
(859, 16, 'Contepec'),
(860, 16, 'Tlalpujahua'),
(861, 16, 'Hidalgo'),
(862, 16, 'Maravatío'),
(863, 16, 'Irimbo'),
(864, 16, 'Senguio'),
(865, 16, 'Charo'),
(866, 16, 'Tzitzio'),
(867, 16, 'Tiquicheo de Nicolás Romero'),
(868, 16, 'Aporo'),
(869, 16, 'Angangueo'),
(870, 16, 'Tuxpan'),
(871, 16, 'Ocampo'),
(872, 16, 'Jungapeo'),
(873, 16, 'Zitácuaro'),
(874, 16, 'Tuzantla'),
(875, 16, 'Juárez'),
(876, 16, 'Susupuato'),
(877, 16, 'Pátzcuaro'),
(878, 16, 'Erongarícuaro'),
(879, 16, 'Huiramba'),
(880, 16, 'Tacámbaro'),
(881, 16, 'Turicato'),
(882, 16, 'Ziracuaretiro'),
(883, 16, 'Taretan'),
(884, 16, 'Gabriel Zamora'),
(885, 16, 'Nuevo Urecho'),
(886, 16, 'Múgica'),
(887, 16, 'Salvador Escalante'),
(888, 16, 'Ario'),
(889, 16, 'La Huacana'),
(890, 16, 'Churumuco'),
(891, 16, 'Nocupétaro'),
(892, 16, 'Carácuaro'),
(893, 16, 'Huetamo'),
(894, 16, 'San Lucas'),
(895, 17, 'Cuernavaca'),
(896, 17, 'Huitzilac'),
(897, 17, 'Tepoztlán'),
(898, 17, 'Tlalnepantla'),
(899, 17, 'Tlayacapan'),
(900, 17, 'Jiutepec'),
(901, 17, 'Temixco'),
(902, 17, 'Miacatlán'),
(903, 17, 'Coatlán del Río'),
(904, 17, 'Tetecala'),
(905, 17, 'Mazatepec'),
(906, 17, 'Amacuzac'),
(907, 17, 'Puente de Ixtla'),
(908, 17, 'Ayala'),
(909, 17, 'Yautepec'),
(910, 17, 'Cuautla'),
(911, 17, 'Emiliano Zapata'),
(912, 17, 'Tlaltizapán de Zapata'),
(913, 17, 'Zacatepec'),
(914, 17, 'Xochitepec'),
(915, 17, 'Tetela del Volcán'),
(916, 17, 'Yecapixtla'),
(917, 17, 'Totolapan'),
(918, 17, 'Atlatlahucan'),
(919, 17, 'Ocuituco'),
(920, 17, 'Temoac'),
(921, 17, 'Zacualpan'),
(922, 17, 'Jojutla'),
(923, 17, 'Tepalcingo'),
(924, 17, 'Jonacatepec'),
(925, 17, 'Axochiapan'),
(926, 17, 'Jantetelco'),
(927, 17, 'Tlaquiltenango'),
(928, 18, 'Tepic'),
(929, 18, 'Tuxpan'),
(930, 18, 'Santiago Ixcuintla'),
(931, 18, 'Acaponeta'),
(932, 18, 'Tecuala'),
(933, 18, 'Huajicori'),
(934, 18, 'Del Nayar'),
(935, 18, 'La Yesca'),
(936, 18, 'Ruíz'),
(937, 18, 'Rosamorada'),
(938, 18, 'Compostela'),
(939, 18, 'Bahía de Banderas'),
(940, 18, 'San Blas'),
(941, 18, 'Xalisco'),
(942, 18, 'San Pedro Lagunillas'),
(943, 18, 'Santa María del Oro'),
(944, 18, 'Jala'),
(945, 18, 'Ahuacatlán'),
(946, 18, 'Ixtlán del Río'),
(947, 18, 'Amatlán de Cañas'),
(948, 19, 'Monterrey'),
(949, 19, 'Anáhuac'),
(950, 19, 'Lampazos de Naranjo'),
(951, 19, 'Mina'),
(952, 19, 'Bustamante'),
(953, 19, 'Sabinas Hidalgo'),
(954, 19, 'Villaldama'),
(955, 19, 'Vallecillo'),
(956, 19, 'Parás'),
(957, 19, 'Salinas Victoria'),
(958, 19, 'Ciénega de Flores'),
(959, 19, 'Hidalgo'),
(960, 19, 'Abasolo'),
(961, 19, 'Higueras'),
(962, 19, 'General Zuazua'),
(963, 19, 'Agualeguas'),
(964, 19, 'General Treviño'),
(965, 19, 'Cerralvo'),
(966, 19, 'Melchor Ocampo'),
(967, 19, 'García'),
(968, 19, 'General Escobedo'),
(969, 19, 'Santa Catarina'),
(970, 19, 'San Pedro Garza García'),
(971, 19, 'San Nicolás de los Garza'),
(972, 19, 'El Carmen'),
(973, 19, 'Apodaca'),
(974, 19, 'Pesquería'),
(975, 19, 'Marín'),
(976, 19, 'Doctor González'),
(977, 19, 'Los Ramones'),
(978, 19, 'Los Herreras'),
(979, 19, 'Los Aldamas'),
(980, 19, 'Doctor Coss'),
(981, 19, 'General Bravo'),
(982, 19, 'China'),
(983, 19, 'Guadalupe'),
(984, 19, 'Juárez'),
(985, 19, 'Santiago'),
(986, 19, 'Allende'),
(987, 19, 'General Terán'),
(988, 19, 'Cadereyta Jiménez'),
(989, 19, 'Montemorelos'),
(990, 19, 'Rayones'),
(991, 19, 'Linares'),
(992, 19, 'Iturbide'),
(993, 19, 'Galeana'),
(994, 19, 'Hualahuises'),
(995, 19, 'Doctor Arroyo'),
(996, 19, 'Aramberri'),
(997, 19, 'General Zaragoza'),
(998, 19, 'Mier y Noriega'),
(999, 20, 'Oaxaca de Juárez'),
(1000, 20, 'Villa de Etla'),
(1001, 20, 'San Juan Bautista Atatlahuca'),
(1002, 20, 'San Jerónimo Sosola'),
(1003, 20, 'San Juan Bautista Jayacatlán'),
(1004, 20, 'San Francisco Telixtlahuaca'),
(1005, 20, 'Santiago Tenango'),
(1006, 20, 'San Pablo Huitzo'),
(1007, 20, 'San Juan del Estado'),
(1008, 20, 'Magdalena Apasco'),
(1009, 20, 'Santiago Suchilquitongo'),
(1010, 20, 'San Juan Bautista Guelache'),
(1011, 20, 'Reyes Etla'),
(1012, 20, 'Nazareno Etla'),
(1013, 20, 'San Andrés Zautla'),
(1014, 20, 'San Agustín Etla'),
(1015, 20, 'Soledad Etla'),
(1016, 20, 'Santo Tomás Mazaltepec'),
(1017, 20, 'Guadalupe Etla'),
(1018, 20, 'San Pablo Etla'),
(1019, 20, 'San Felipe Tejalápam'),
(1020, 20, 'San Lorenzo Cacaotepec'),
(1021, 20, 'Santa María Peñoles'),
(1022, 20, 'Santiago Tlazoyaltepec'),
(1023, 20, 'Tlalixtac de Cabrera'),
(1024, 20, 'San Jacinto Amilpas'),
(1025, 20, 'San Andrés Huayápam'),
(1026, 20, 'San Agustín Yatareni'),
(1027, 20, 'Santo Domingo Tomaltepec'),
(1028, 20, 'Santa María del Tule'),
(1029, 20, 'San Juan Bautista Tuxtepec'),
(1030, 20, 'Loma Bonita'),
(1031, 20, 'San José Independencia'),
(1032, 20, 'Cosolapa'),
(1033, 20, 'Acatlán de Pérez Figueroa'),
(1034, 20, 'San Miguel Soyaltepec'),
(1035, 20, 'Ayotzintepec'),
(1036, 20, 'San Pedro Ixcatlán'),
(1037, 20, 'San José Chiltepec'),
(1038, 20, 'San Felipe Jalapa de Díaz'),
(1039, 20, 'Santa María Jacatepec'),
(1040, 20, 'San Lucas Ojitlán'),
(1041, 20, 'San Juan Bautista Valle Nacional'),
(1042, 20, 'San Felipe Usila'),
(1043, 20, 'Huautla de Jiménez'),
(1044, 20, 'Santa María Chilchotla'),
(1045, 20, 'Santa Ana Ateixtlahuaca'),
(1046, 20, 'San Lorenzo Cuaunecuiltitla'),
(1047, 20, 'San Francisco Huehuetlán'),
(1048, 20, 'San Pedro Ocopetatillo'),
(1049, 20, 'Santa Cruz Acatepec'),
(1050, 20, 'Eloxochitlán de Flores Magón'),
(1051, 20, 'Santiago Texcalcingo'),
(1052, 20, 'Teotitlán de Flores Magón'),
(1053, 20, 'Santa María Teopoxco'),
(1054, 20, 'San Martín Toxpalan'),
(1055, 20, 'San Jerónimo Tecóatl'),
(1056, 20, 'Santa María la Asunción'),
(1057, 20, 'Huautepec'),
(1058, 20, 'San Juan Coatzóspam'),
(1059, 20, 'San Lucas Zoquiápam'),
(1060, 20, 'San Antonio Nanahuatípam'),
(1061, 20, 'San José Tenango'),
(1062, 20, 'San Mateo Yoloxochitlán'),
(1063, 20, 'San Bartolomé Ayautla'),
(1064, 20, 'Mazatlán Villa de Flores'),
(1065, 20, 'San Juan de los Cués'),
(1066, 20, 'Santa María Tecomavaca'),
(1067, 20, 'Santa María Ixcatlán'),
(1068, 20, 'San Juan Bautista Cuicatlán'),
(1069, 20, 'Cuyamecalco Villa de Zaragoza'),
(1070, 20, 'Santa Ana Cuauhtémoc'),
(1071, 20, 'Chiquihuitlán de Benito Juárez'),
(1072, 20, 'San Pedro Teutila'),
(1073, 20, 'San Miguel Santa Flor'),
(1074, 20, 'Santa María Tlalixtac'),
(1075, 20, 'San Andrés Teotilálpam'),
(1076, 20, 'San Francisco Chapulapa'),
(1077, 20, 'Concepción Pápalo'),
(1078, 20, 'Santos Reyes Pápalo'),
(1079, 20, 'San Juan Bautista Tlacoatzintepec'),
(1080, 20, 'Santa María Pápalo'),
(1081, 20, 'San Juan Tepeuxila'),
(1082, 20, 'San Pedro Sochiápam'),
(1083, 20, 'Valerio Trujano'),
(1084, 20, 'San Pedro Jocotipac'),
(1085, 20, 'Santa María Texcatitlán'),
(1086, 20, 'San Pedro Jaltepetongo'),
(1087, 20, 'Santiago Nacaltepec'),
(1088, 20, 'Natividad'),
(1089, 20, 'San Juan Quiotepec'),
(1090, 20, 'San Pedro Yólox'),
(1091, 20, 'Santiago Comaltepec'),
(1092, 20, 'Abejones'),
(1093, 20, 'San Pablo Macuiltianguis'),
(1094, 20, 'Ixtlán de Juárez'),
(1095, 20, 'San Juan Atepec'),
(1096, 20, 'San Pedro Yaneri'),
(1097, 20, 'San Miguel Aloápam'),
(1098, 20, 'Teococuilco de Marcos Pérez'),
(1099, 20, 'Santa Ana Yareni'),
(1100, 20, 'San Juan Evangelista Analco'),
(1101, 20, 'Santa María Jaltianguis'),
(1102, 20, 'San Miguel del Río'),
(1103, 20, 'San Juan Chicomezúchil'),
(1104, 20, 'Capulálpam de Méndez'),
(1105, 20, 'Nuevo Zoquiápam'),
(1106, 20, 'Santiago Xiacuí'),
(1107, 20, 'Guelatao de Juárez'),
(1108, 20, 'Santa Catarina Ixtepeji'),
(1109, 20, 'San Miguel Yotao'),
(1110, 20, 'Santa Catarina Lachatao'),
(1111, 20, 'San Miguel Amatlán'),
(1112, 20, 'Santa María Yavesía'),
(1113, 20, 'Santiago Laxopa'),
(1114, 20, 'San Ildefonso Villa Alta'),
(1115, 20, 'Santiago Camotlán'),
(1116, 20, 'San Juan Yaeé'),
(1117, 20, 'Santiago Lalopa'),
(1118, 20, 'San Juan Yatzona'),
(1119, 20, 'Villa Talea de Castro'),
(1120, 20, 'Tanetze de Zaragoza'),
(1121, 20, 'San Juan Juquila Vijanos'),
(1122, 20, 'San Cristóbal Lachirioag'),
(1123, 20, 'Santa María Temaxcalapa'),
(1124, 20, 'Santo Domingo Roayaga'),
(1125, 20, 'Santa María Yalina'),
(1126, 20, 'San Andrés Solaga'),
(1127, 20, 'San Juan Tabaá'),
(1128, 20, 'San Melchor Betaza'),
(1129, 20, 'San Andrés Yaá'),
(1130, 20, 'San Bartolomé Zoogocho'),
(1131, 20, 'San Baltazar Yatzachi el Bajo'),
(1132, 20, 'Santiago Zoochila'),
(1133, 20, 'Villa Hidalgo'),
(1134, 20, 'San Francisco Cajonos'),
(1135, 20, 'San Mateo Cajonos'),
(1136, 20, 'San Pedro Cajonos'),
(1137, 20, 'Santo Domingo Xagacía'),
(1138, 20, 'San Pablo Yaganiza'),
(1139, 20, 'Santiago Choápam'),
(1140, 20, 'Santiago Jocotepec'),
(1141, 20, 'San Juan Lalana'),
(1142, 20, 'Santiago Yaveo'),
(1143, 20, 'San Juan Petlapa'),
(1144, 20, 'San Juan Comaltepec'),
(1145, 20, 'Heroica Ciudad de Huajuapan de León'),
(1146, 20, 'Santiago Chazumba'),
(1147, 20, 'Cosoltepec'),
(1148, 20, 'San Pedro y San Pablo Tequixtepec'),
(1149, 20, 'San Juan Bautista Suchitepec'),
(1150, 20, 'Santa Catarina Zapoquila'),
(1151, 20, 'Santiago Miltepec'),
(1152, 20, 'San Jerónimo Silacayoapilla'),
(1153, 20, 'Zapotitlán Palmas'),
(1154, 20, 'San Andrés Dinicuiti'),
(1155, 20, 'Santiago Cacaloxtepec'),
(1156, 20, 'Asunción Cuyotepeji'),
(1157, 20, 'Santa María Camotlán'),
(1158, 20, 'Santiago Huajolotitlán'),
(1159, 20, 'Santiago Tamazola'),
(1160, 20, 'San Juan Cieneguilla'),
(1161, 20, 'Zapotitlán Lagunas'),
(1162, 20, 'San Juan Ihualtepec'),
(1163, 20, 'San Nicolás Hidalgo'),
(1164, 20, 'Guadalupe de Ramírez'),
(1165, 20, 'San Andrés Tepetlapa'),
(1166, 20, 'San Miguel Ahuehuetitlán'),
(1167, 20, 'San Mateo Nejápam'),
(1168, 20, 'San Juan Bautista Tlachichilco'),
(1169, 20, 'Tezoatlán de Segura y Luna'),
(1170, 20, 'Fresnillo de Trujano'),
(1171, 20, 'Santiago Ayuquililla'),
(1172, 20, 'San José Ayuquila'),
(1173, 20, 'San Martín Zacatepec'),
(1174, 20, 'San Miguel Amatitlán'),
(1175, 20, 'Mariscala de Juárez'),
(1176, 20, 'Santa Cruz Tacache de Mina'),
(1177, 20, 'San Simón Zahuatlán'),
(1178, 20, 'San Marcos Arteaga'),
(1179, 20, 'San Jorge Nuchita'),
(1180, 20, 'Santos Reyes Yucuná'),
(1181, 20, 'Santo Domingo Tonalá'),
(1182, 20, 'Santo Domingo Yodohino'),
(1183, 20, 'San Juan Bautista Coixtlahuaca'),
(1184, 20, 'Tepelmeme Villa de Morelos'),
(1185, 20, 'Concepción Buenavista'),
(1186, 20, 'Santiago Ihuitlán Plumas'),
(1187, 20, 'Tlacotepec Plumas'),
(1188, 20, 'San Francisco Teopan'),
(1189, 20, 'Santa Magdalena Jicotlán'),
(1190, 20, 'San Mateo Tlapiltepec'),
(1191, 20, 'San Miguel Tequixtepec'),
(1192, 20, 'San Miguel Tulancingo'),
(1193, 20, 'Santiago Tepetlapa'),
(1194, 20, 'San Cristóbal Suchixtlahuaca'),
(1195, 20, 'Santa María Nativitas'),
(1196, 20, 'Silacayoápam'),
(1197, 20, 'Santiago Yucuyachi'),
(1198, 20, 'San Lorenzo Victoria'),
(1199, 20, 'San Agustín Atenango'),
(1200, 20, 'Calihualá'),
(1201, 20, 'Santa Cruz de Bravo'),
(1202, 20, 'Ixpantepec Nieves'),
(1203, 20, 'San Francisco Tlapancingo'),
(1204, 20, 'Santiago del Río'),
(1205, 20, 'San Pedro y San Pablo Teposcolula'),
(1206, 20, 'La Trinidad Vista Hermosa'),
(1207, 20, 'Villa de Tamazulápam del Progreso'),
(1208, 20, 'San Pedro Nopala'),
(1209, 20, 'Teotongo'),
(1210, 20, 'San Antonio Acutla'),
(1211, 20, 'Villa Tejúpam de la Unión'),
(1212, 20, 'Santo Domingo Tonaltepec'),
(1213, 20, 'Villa de Chilapa de Díaz'),
(1214, 20, 'San Antonino Monte Verde'),
(1215, 20, 'San Andrés Lagunas'),
(1216, 20, 'San Pedro Yucunama'),
(1217, 20, 'San Juan Teposcolula'),
(1218, 20, 'San Bartolo Soyaltepec'),
(1219, 20, 'Santiago Yolomécatl'),
(1220, 20, 'San Sebastián Nicananduta'),
(1221, 20, 'Santo Domingo Tlatayápam'),
(1222, 20, 'Santa María Nduayaco'),
(1223, 20, 'San Vicente Nuñú'),
(1224, 20, 'San Pedro Topiltepec'),
(1225, 20, 'Santiago Nejapilla'),
(1226, 20, 'Asunción Nochixtlán'),
(1227, 20, 'San Miguel Huautla'),
(1228, 20, 'San Miguel Chicahua'),
(1229, 20, 'Santa María Apazco'),
(1230, 20, 'Santiago Apoala'),
(1231, 20, 'Santa María Chachoápam'),
(1232, 20, 'San Pedro Coxcaltepec Cántaros'),
(1233, 20, 'Santiago Huauclilla'),
(1234, 20, 'Santo Domingo Yanhuitlán'),
(1235, 20, 'San Andrés Sinaxtla'),
(1236, 20, 'San Juan Yucuita'),
(1237, 20, 'San Juan Sayultepec'),
(1238, 20, 'Santiago Tillo'),
(1239, 20, 'San Francisco Chindúa'),
(1240, 20, 'San Mateo Etlatongo'),
(1241, 20, 'Santa Inés de Zaragoza'),
(1242, 20, 'Santiago Juxtlahuaca'),
(1243, 20, 'San Miguel Tlacotepec'),
(1244, 20, 'San Sebastián Tecomaxtlahuaca'),
(1245, 20, 'Santos Reyes Tepejillo'),
(1246, 20, 'San Juan Mixtepec -Dto. 08 -'),
(1247, 20, 'San Martín Peras'),
(1248, 20, 'Coicoyán de las Flores'),
(1249, 20, 'Heroica Ciudad de Tlaxiaco'),
(1250, 20, 'San Juan Ñumí'),
(1251, 20, 'San Pedro Mártir Yucuxaco'),
(1252, 20, 'San Martín Huamelúlpam'),
(1253, 20, 'Santa Cruz Tayata'),
(1254, 20, 'Santiago Nundiche'),
(1255, 20, 'Santa María del Rosario'),
(1256, 20, 'San Juan Achiutla'),
(1257, 20, 'Santa Catarina Tayata'),
(1258, 20, 'San Cristóbal Amoltepec'),
(1259, 20, 'San Miguel Achiutla'),
(1260, 20, 'San Martín Itunyoso'),
(1261, 20, 'Magdalena Peñasco'),
(1262, 20, 'San Bartolomé Yucuañe'),
(1263, 20, 'Santa Cruz Nundaco'),
(1264, 20, 'San Agustín Tlacotepec'),
(1265, 20, 'Santo Tomás Ocotepec'),
(1266, 20, 'San Antonio Sinicahua'),
(1267, 20, 'San Mateo Peñasco'),
(1268, 20, 'Santa María Tataltepec'),
(1269, 20, 'San Pedro Molinos'),
(1270, 20, 'Santa María Yosoyúa'),
(1271, 20, 'San Juan Teita'),
(1272, 20, 'Magdalena Jaltepec'),
(1273, 20, 'Magdalena Yodocono de Porfirio Díaz'),
(1274, 20, 'San Miguel Tecomatlán'),
(1275, 20, 'Magdalena Zahuatlán'),
(1276, 20, 'San Francisco Nuxaño'),
(1277, 20, 'San Pedro Tidaá'),
(1278, 20, 'San Francisco Jaltepetongo'),
(1279, 20, 'Santiago Tilantongo'),
(1280, 20, 'San Juan Diuxi'),
(1281, 20, 'San Andrés Nuxiño'),
(1282, 20, 'San Juan Tamazola'),
(1283, 20, 'Santo Domingo Nuxaá'),
(1284, 20, 'Yutanduchi de Guerrero'),
(1285, 20, 'San Pedro Teozacoalco'),
(1286, 20, 'San Miguel Piedras'),
(1287, 20, 'San Mateo Sindihui'),
(1288, 20, 'Heroica Ciudad de Juchitán de Zaragoza'),
(1289, 20, 'Ciudad Ixtepec'),
(1290, 20, 'El Espinal'),
(1291, 20, 'Santo Domingo Ingenio'),
(1292, 20, 'Santa María Xadani'),
(1293, 20, 'Santiago Niltepec'),
(1294, 20, 'San Dionisio del Mar'),
(1295, 20, 'Asunción Ixtaltepec'),
(1296, 20, 'San Francisco del Mar'),
(1297, 20, 'Unión Hidalgo'),
(1298, 20, 'San Miguel Chimalapa'),
(1299, 20, 'Santo Domingo Zanatepec'),
(1300, 20, 'Reforma de Pineda'),
(1301, 20, 'San Francisco Ixhuatán'),
(1302, 20, 'San Pedro Tapanatepec'),
(1303, 20, 'Chahuites'),
(1304, 20, 'Santiago Zacatepec'),
(1305, 20, 'Santo Domingo Tepuxtepec'),
(1306, 20, 'San Juan Cotzocón'),
(1307, 20, 'San Juan Mazatlán'),
(1308, 20, 'Totontepec Villa de Morelos'),
(1309, 20, 'Mixistlán de la Reforma'),
(1310, 20, 'Santa María Tlahuitoltepec'),
(1311, 20, 'Santa María Alotepec'),
(1312, 20, 'Santiago Atitlán'),
(1313, 20, 'Tamazulápam del Espíritu Santo'),
(1314, 20, 'San Pedro y San Pablo Ayutla'),
(1315, 20, 'Santa María Tepantlali'),
(1316, 20, 'San Miguel Quetzaltepec'),
(1317, 20, 'Asunción Cacalotepec'),
(1318, 20, 'San Pedro Ocotepec'),
(1319, 20, 'San Lucas Camotlán'),
(1320, 20, 'Santiago Ixcuintepec'),
(1321, 20, 'Matías Romero Avendaño'),
(1322, 20, 'San Juan Guichicovi'),
(1323, 20, 'Santo Domingo Petapa'),
(1324, 20, 'Santa María Chimalapa'),
(1325, 20, 'Santa María Petapa'),
(1326, 20, 'El Barrio de la Soledad'),
(1327, 20, 'Tlacolula de Matamoros'),
(1328, 20, 'San Sebastián Abasolo'),
(1329, 20, 'Villa Díaz Ordaz'),
(1330, 20, 'Santa María Guelacé'),
(1331, 20, 'Teotitlán del Valle'),
(1332, 20, 'San Francisco Lachigoló'),
(1333, 20, 'San Sebastián Teitipac'),
(1334, 20, 'Santa Ana del Valle'),
(1335, 20, 'San Pablo Villa de Mitla'),
(1336, 20, 'Santiago Matatlán'),
(1337, 20, 'Santo Domingo Albarradas'),
(1338, 20, 'Rojas de Cuauhtémoc'),
(1339, 20, 'San Juan Teitipac'),
(1340, 20, 'Santa Cruz Papalutla'),
(1341, 20, 'Magdalena Teitipac'),
(1342, 20, 'San Jerónimo Tlacochahuaya'),
(1343, 20, 'San Juan Guelavía'),
(1344, 20, 'San Lucas Quiaviní'),
(1345, 20, 'San Juan del Río'),
(1346, 20, 'San Bartolomé Quialana'),
(1347, 20, 'San Lorenzo Albarradas'),
(1348, 20, 'San Pedro Totolápam'),
(1349, 20, 'San Pedro Quiatoni'),
(1350, 20, 'Santa María Zoquitlán'),
(1351, 20, 'San Dionisio Ocotepec'),
(1352, 20, 'San Carlos Yautepec'),
(1353, 20, 'San Juan Juquila Mixes'),
(1354, 20, 'Nejapa de Madero'),
(1355, 20, 'Santa Ana Tavela'),
(1356, 20, 'San Juan Lajarcia'),
(1357, 20, 'San Bartolo Yautepec'),
(1358, 20, 'Santa María Ecatepec'),
(1359, 20, 'Asunción Tlacolulita'),
(1360, 20, 'San Pedro Mártir Quiechapa'),
(1361, 20, 'Santa María Quiegolani'),
(1362, 20, 'Santa Catarina Quioquitani'),
(1363, 20, 'Santa Catalina Quierí'),
(1364, 20, 'Salina Cruz'),
(1365, 20, 'Santiago Lachiguiri'),
(1366, 20, 'Santa María Jalapa del Marqués'),
(1367, 20, 'Santa María Totolapilla'),
(1368, 20, 'Santiago Laollaga'),
(1369, 20, 'Guevea de Humboldt'),
(1370, 20, 'Santo Domingo Chihuitán'),
(1371, 20, 'Santa María Guienagati'),
(1372, 20, 'Magdalena Tequisistlán'),
(1373, 20, 'Magdalena Tlacotepec'),
(1374, 20, 'San Pedro Comitancillo'),
(1375, 20, 'Santa María Mixtequilla'),
(1376, 20, 'Santo Domingo Tehuantepec'),
(1377, 20, 'San Pedro Huamelula'),
(1378, 20, 'San Pedro Huilotepec'),
(1379, 20, 'San Mateo del Mar'),
(1380, 20, 'San Blas Atempa'),
(1381, 20, 'Santiago Astata'),
(1382, 20, 'San Miguel Tenango'),
(1383, 20, 'Miahuatlán de Porfirio Díaz'),
(1384, 20, 'San Nicolás'),
(1385, 20, 'San Simón Almolongas'),
(1386, 20, 'San Luis Amatlán'),
(1387, 20, 'San José Lachiguiri'),
(1388, 20, 'Sitio de Xitlapehua'),
(1389, 20, 'San Francisco Logueche'),
(1390, 20, 'Santa Ana'),
(1391, 20, 'Santa Cruz Xitla'),
(1392, 20, 'Monjas'),
(1393, 20, 'San Ildefonso Amatlán'),
(1394, 20, 'Santa Catarina Cuixtla'),
(1395, 20, 'San José del Peñasco'),
(1396, 20, 'San Cristóbal Amatlán'),
(1397, 20, 'San Juan Mixtepec -Dto. 26 -'),
(1398, 20, 'San Pedro Mixtepec -Dto. 26 -'),
(1399, 20, 'Santa Lucía Miahuatlán'),
(1400, 20, 'San Jerónimo Coatlán'),
(1401, 20, 'San Sebastián Coatlán'),
(1402, 20, 'San Pablo Coatlán'),
(1403, 20, 'San Mateo Río Hondo'),
(1404, 20, 'Santo Tomás Tamazulapan'),
(1405, 20, 'San Andrés Paxtlán'),
(1406, 20, 'Santa María Ozolotepec'),
(1407, 20, 'San Miguel Coatlán'),
(1408, 20, 'San Sebastián Río Hondo'),
(1409, 20, 'San Miguel Suchixtepec'),
(1410, 20, 'Santo Domingo Ozolotepec'),
(1411, 20, 'San Francisco Ozolotepec'),
(1412, 20, 'Santiago Xanica'),
(1413, 20, 'San Marcial Ozolotepec'),
(1414, 20, 'San Juan Ozolotepec'),
(1415, 20, 'San Pedro Pochutla'),
(1416, 20, 'Santo Domingo de Morelos'),
(1417, 20, 'Santa Catarina Loxicha'),
(1418, 20, 'San Agustín Loxicha'),
(1419, 20, 'San Baltazar Loxicha'),
(1420, 20, 'Santa María Colotepec'),
(1421, 20, 'San Bartolomé Loxicha'),
(1422, 20, 'Santa María Tonameca'),
(1423, 20, 'Candelaria Loxicha'),
(1424, 20, 'Pluma Hidalgo'),
(1425, 20, 'San Pedro el Alto'),
(1426, 20, 'San Mateo Piñas'),
(1427, 20, 'Santa María Huatulco'),
(1428, 20, 'San Miguel del Puerto'),
(1429, 20, 'Putla Villa de Guerrero'),
(1430, 20, 'Constancia del Rosario'),
(1431, 20, 'Mesones Hidalgo'),
(1432, 20, 'Santa María Zacatepec'),
(1433, 20, 'San Pedro Amuzgos'),
(1434, 20, 'La Reforma'),
(1435, 20, 'Santa María Ipalapa'),
(1436, 20, 'Chalcatongo de Hidalgo'),
(1437, 20, 'Santa María Yucuhiti'),
(1438, 20, 'San Esteban Atatlahuca'),
(1439, 20, 'Santa Catarina Ticuá'),
(1440, 20, 'Santiago Nuyoó'),
(1441, 20, 'Santa Catarina Yosonotú'),
(1442, 20, 'San Miguel el Grande'),
(1443, 20, 'Santo Domingo Ixcatlán'),
(1444, 20, 'San Pablo Tijaltepec'),
(1445, 20, 'Santa Cruz Tacahua'),
(1446, 20, 'Santa Lucía Monteverde'),
(1447, 20, 'San Andrés Cabecera Nueva'),
(1448, 20, 'Santa María Yolotepec'),
(1449, 20, 'Santiago Yosondúa'),
(1450, 20, 'Santa Cruz Itundujia'),
(1451, 20, 'Zimatlán de Álvarez'),
(1452, 20, 'San Bernardo Mixtepec'),
(1453, 20, 'Santa Cruz Mixtepec'),
(1454, 20, 'San Miguel Mixtepec'),
(1455, 20, 'Santa María Atzompa'),
(1456, 20, 'San Andrés Ixtlahuaca'),
(1457, 20, 'Santa Cruz Amilpas'),
(1458, 20, 'Santa Cruz Xoxocotlán'),
(1459, 20, 'Santa Lucía del Camino'),
(1460, 20, 'San Pedro Ixtlahuaca'),
(1461, 20, 'San Antonio de la Cal'),
(1462, 20, 'San Agustín de las Juntas'),
(1463, 20, 'San Pablo Huixtepec'),
(1464, 20, 'Ánimas Trujano'),
(1465, 20, 'San Jacinto Tlacotepec'),
(1466, 20, 'San Raymundo Jalpan'),
(1467, 20, 'Trinidad Zaachila'),
(1468, 20, 'Santa María Coyotepec'),
(1469, 20, 'San Bartolo Coyotepec'),
(1470, 20, 'Santa Inés Yatzeche'),
(1471, 20, 'Ciénega de Zimatlán'),
(1472, 20, 'San Antonio Huitepec'),
(1473, 20, 'Villa de Zaachila'),
(1474, 20, 'San Sebastián Tutla'),
(1475, 20, 'San Miguel Peras'),
(1476, 20, 'San Pablo Cuatro Venados'),
(1477, 20, 'Santa Inés del Monte'),
(1478, 20, 'Santa Gertrudis'),
(1479, 20, 'San Antonino el Alto'),
(1480, 20, 'Magdalena Mixtepec'),
(1481, 20, 'Santa Catarina Quiané'),
(1482, 20, 'Ayoquezco de Aldama'),
(1483, 20, 'Santa Ana Tlapacoyan'),
(1484, 20, 'Santa Cruz Zenzontepec'),
(1485, 20, 'San Francisco Cahuacuá'),
(1486, 20, 'San Mateo Yucutindoo'),
(1487, 20, 'Santiago Textitlán'),
(1488, 20, 'Santiago Amoltepec'),
(1489, 20, 'Santa María Zaniza'),
(1490, 20, 'Santo Domingo Teojomulco'),
(1491, 20, 'Cuilápam de Guerrero'),
(1492, 20, 'Villa Sola de Vega'),
(1493, 20, 'Santa María Lachixío'),
(1494, 20, 'San Vicente Lachixío'),
(1495, 20, 'San Lorenzo Texmelúcan'),
(1496, 20, 'Santa María Sola'),
(1497, 20, 'San Francisco Sola'),
(1498, 20, 'San Ildefonso Sola'),
(1499, 20, 'Santiago Minas'),
(1500, 20, 'Heroica Ciudad de Ejutla de Crespo'),
(1501, 20, 'San Martín Tilcajete'),
(1502, 20, 'Santo Tomás Jalieza'),
(1503, 20, 'San Juan Chilateca'),
(1504, 20, 'Ocotlán de Morelos'),
(1505, 20, 'Santa Ana Zegache'),
(1506, 20, 'Santiago Apóstol'),
(1507, 20, 'San Antonino Castillo Velasco'),
(1508, 20, 'Asunción Ocotlán'),
(1509, 20, 'San Pedro Mártir'),
(1510, 20, 'San Dionisio Ocotlán'),
(1511, 20, 'Magdalena Ocotlán'),
(1512, 20, 'San Miguel Tilquiápam'),
(1513, 20, 'Santa Catarina Minas'),
(1514, 20, 'San Baltazar Chichicápam'),
(1515, 20, 'San Pedro Apóstol'),
(1516, 20, 'Santa Lucía Ocotlán'),
(1517, 20, 'San Jerónimo Taviche'),
(1518, 20, 'San Andrés Zabache'),
(1519, 20, 'San José del Progreso'),
(1520, 20, 'Yaxe'),
(1521, 20, 'San Pedro Taviche'),
(1522, 20, 'San Martín de los Cansecos'),
(1523, 20, 'San Martín Lachilá'),
(1524, 20, 'La Pe'),
(1525, 20, 'La Compañía'),
(1526, 20, 'Coatecas Altas'),
(1527, 20, 'San Juan Lachigalla'),
(1528, 20, 'San Agustín Amatengo'),
(1529, 20, 'Taniche'),
(1530, 20, 'San Miguel Ejutla'),
(1531, 20, 'Yogana'),
(1532, 20, 'San Vicente Coatlán'),
(1533, 20, 'Santiago Pinotepa Nacional'),
(1534, 20, 'San Juan Cacahuatepec'),
(1535, 20, 'San Juan Bautista Lo de Soto'),
(1536, 20, 'Mártires de Tacubaya'),
(1537, 20, 'San Sebastián Ixcapa'),
(1538, 20, 'San Antonio Tepetlapa'),
(1539, 20, 'Santa María Cortijo'),
(1540, 20, 'Santiago Llano Grande'),
(1541, 20, 'San Miguel Tlacamama'),
(1542, 20, 'Santiago Tapextla'),
(1543, 20, 'San José Estancia Grande'),
(1544, 20, 'Santo Domingo Armenta'),
(1545, 20, 'Santiago Jamiltepec'),
(1546, 20, 'San Pedro Atoyac'),
(1547, 20, 'San Juan Colorado'),
(1548, 20, 'Santiago Ixtayutla'),
(1549, 20, 'San Pedro Jicayán'),
(1550, 20, 'Pinotepa de Don Luis'),
(1551, 20, 'San Lorenzo'),
(1552, 20, 'San Agustín Chayuco'),
(1553, 20, 'San Andrés Huaxpaltepec'),
(1554, 20, 'Santa Catarina Mechoacán'),
(1555, 20, 'Santiago Tetepec'),
(1556, 20, 'Santa María Huazolotitlán'),
(1557, 20, 'Villa de Tututepec de Melchor Ocampo'),
(1558, 20, 'Tataltepec de Valdés'),
(1559, 20, 'San Juan Quiahije'),
(1560, 20, 'San Miguel Panixtlahuaca'),
(1561, 20, 'Santa Catarina Juquila'),
(1562, 20, 'San Pedro Juchatengo'),
(1563, 20, 'Santiago Yaitepec'),
(1564, 20, 'San Juan Lachao'),
(1565, 20, 'Santa María Temaxcaltepec'),
(1566, 20, 'Santos Reyes Nopala'),
(1567, 20, 'San Gabriel Mixtepec'),
(1568, 20, 'San Pedro Mixtepec -Dto. 22 -'),
(1569, 21, 'Puebla'),
(1570, 21, 'Tlaltenango'),
(1571, 21, 'San Miguel Xoxtla'),
(1572, 21, 'Juan C. Bonilla'),
(1573, 21, 'Coronango'),
(1574, 21, 'Cuautlancingo'),
(1575, 21, 'San Pedro Cholula'),
(1576, 21, 'San Andrés Cholula'),
(1577, 21, 'Ocoyucan'),
(1578, 21, 'Amozoc'),
(1579, 21, 'Francisco Z. Mena'),
(1580, 21, 'Pantepec'),
(1581, 21, 'Venustiano Carranza'),
(1582, 21, 'Jalpan'),
(1583, 21, 'Tlaxco'),
(1584, 21, 'Tlacuilotepec'),
(1585, 21, 'Xicotepec'),
(1586, 21, 'Pahuatlán'),
(1587, 21, 'Honey'),
(1588, 21, 'Naupan'),
(1589, 21, 'Huauchinango'),
(1590, 21, 'Ahuazotepec'),
(1591, 21, 'Juan Galindo'),
(1592, 21, 'Tlaola'),
(1593, 21, 'Zihuateutla'),
(1594, 21, 'Jopala'),
(1595, 21, 'Tlapacoya'),
(1596, 21, 'Chignahuapan'),
(1597, 21, 'Zacatlán'),
(1598, 21, 'Chiconcuautla'),
(1599, 21, 'Ahuacatlán'),
(1600, 21, 'Tepetzintla'),
(1601, 21, 'San Felipe Tepatlán'),
(1602, 21, 'Amixtlán'),
(1603, 21, 'Tepango de Rodríguez'),
(1604, 21, 'Zongozotla'),
(1605, 21, 'Hermenegildo Galeana'),
(1606, 21, 'Olintla'),
(1607, 21, 'Coatepec'),
(1608, 21, 'Camocuautla'),
(1609, 21, 'Hueytlalpan'),
(1610, 21, 'Zapotitlán de Méndez'),
(1611, 21, 'Huitzilan de Serdán'),
(1612, 21, 'Xochitlán de Vicente Suárez'),
(1613, 21, 'Huehuetla'),
(1614, 21, 'Ixtepec'),
(1615, 21, 'Atlequizayan'),
(1616, 21, 'Tenampulco'),
(1617, 21, 'Tuzamapan de Galeana'),
(1618, 21, 'Caxhuacan'),
(1619, 21, 'Jonotla'),
(1620, 21, 'Zoquiapan'),
(1621, 21, 'Nauzontla'),
(1622, 21, 'Cuetzalan del Progreso'),
(1623, 21, 'Ayotoxco de Guerrero'),
(1624, 21, 'Hueytamalco'),
(1625, 21, 'Acateno'),
(1626, 21, 'Cuautempan'),
(1627, 21, 'Aquixtla'),
(1628, 21, 'Tetela de Ocampo'),
(1629, 21, 'Xochiapulco'),
(1630, 21, 'Zacapoaxtla'),
(1631, 21, 'Zaragoza'),
(1632, 21, 'Ixtacamaxtitlán'),
(1633, 21, 'Zautla'),
(1634, 21, 'Ocotepec'),
(1635, 21, 'Libres'),
(1636, 21, 'Teziutlán'),
(1637, 21, 'Tlatlauquitepec'),
(1638, 21, 'Yaonáhuac'),
(1639, 21, 'Hueyapan'),
(1640, 21, 'Teteles de Avila Castillo'),
(1641, 21, 'Atempan'),
(1642, 21, 'Chignautla'),
(1643, 21, 'Xiutetelco'),
(1644, 21, 'Cuyoaco'),
(1645, 21, 'Tepeyahualco'),
(1646, 21, 'San Martín Texmelucan'),
(1647, 21, 'Tlahuapan'),
(1648, 21, 'San Matías Tlalancaleca'),
(1649, 21, 'San Salvador el Verde'),
(1650, 21, 'San Felipe Teotlalcingo'),
(1651, 21, 'Chiautzingo'),
(1652, 21, 'Huejotzingo'),
(1653, 21, 'Domingo Arenas'),
(1654, 21, 'Calpan'),
(1655, 21, 'San Nicolás de los Ranchos'),
(1656, 21, 'Atlixco'),
(1657, 21, 'Nealtican'),
(1658, 21, 'San Jerónimo Tecuanipan'),
(1659, 21, 'San Gregorio Atzompa'),
(1660, 21, 'Tochimilco'),
(1661, 21, 'Tianguismanalco'),
(1662, 21, 'Santa Isabel Cholula'),
(1663, 21, 'Huaquechula'),
(1664, 21, 'San Diego la Mesa Tochimiltzingo'),
(1665, 21, 'Tepeojuma'),
(1666, 21, 'Izúcar de Matamoros'),
(1667, 21, 'Atzitzihuacán'),
(1668, 21, 'Acteopan'),
(1669, 21, 'Cohuecan'),
(1670, 21, 'Tepemaxalco'),
(1671, 21, 'Tlapanalá'),
(1672, 21, 'Tepexco'),
(1673, 21, 'Tilapa'),
(1674, 21, 'Chietla'),
(1675, 21, 'Atzala'),
(1676, 21, 'Teopantlán'),
(1677, 21, 'San Martín Totoltepec'),
(1678, 21, 'Xochiltepec'),
(1679, 21, 'Epatlán'),
(1680, 21, 'Ahuatlán'),
(1681, 21, 'Coatzingo'),
(1682, 21, 'Santa Catarina Tlaltempan'),
(1683, 21, 'Chigmecatitlán'),
(1684, 21, 'Zacapala'),
(1685, 21, 'Tepexi de Rodríguez'),
(1686, 21, 'Teotlalco'),
(1687, 21, 'Jolalpan'),
(1688, 21, 'Huehuetlán el Chico'),
(1689, 21, 'Chiautla'),
(1690, 21, 'Cohetzala'),
(1691, 21, 'Xicotlán'),
(1692, 21, 'Chila de la Sal'),
(1693, 21, 'Ixcamilpa de Guerrero'),
(1694, 21, 'Albino Zertuche'),
(1695, 21, 'Tulcingo'),
(1696, 21, 'Tehuitzingo'),
(1697, 21, 'Cuayuca de Andrade'),
(1698, 21, 'Santa Inés Ahuatempan'),
(1699, 21, 'Axutla'),
(1700, 21, 'Chinantla'),
(1701, 21, 'Ahuehuetitla'),
(1702, 21, 'San Pablo Anicano'),
(1703, 21, 'Tecomatlán'),
(1704, 21, 'Piaxtla'),
(1705, 21, 'Guadalupe'),
(1706, 21, 'Ixcaquixtla'),
(1707, 21, 'Coyotepec'),
(1708, 21, 'Xayacatlán de Bravo'),
(1709, 21, 'Totoltepec de Guerrero'),
(1710, 21, 'Acatlán'),
(1711, 21, 'San Jerónimo Xayacatlán'),
(1712, 21, 'San Pedro Yeloixtlahuaca'),
(1713, 21, 'Petlalcingo'),
(1714, 21, 'San Miguel Ixitlán'),
(1715, 21, 'Chila'),
(1716, 21, 'Rafael Lara Grajales'),
(1717, 21, 'San José Chiapa'),
(1718, 21, 'Oriental'),
(1719, 21, 'San Nicolás Buenos Aires'),
(1720, 21, 'Guadalupe Victoria'),
(1721, 21, 'Tlachichuca'),
(1722, 21, 'Lafragua'),
(1723, 21, 'Chilchotla'),
(1724, 21, 'Quimixtlán'),
(1725, 21, 'Chichiquila'),
(1726, 21, 'Tepatlaxco de Hidalgo'),
(1727, 21, 'Acajete'),
(1728, 21, 'Nopalucan'),
(1729, 21, 'Mazapiltepec de Juárez'),
(1730, 21, 'Soltepec'),
(1731, 21, 'Acatzingo'),
(1732, 21, 'San Salvador el Seco'),
(1733, 21, 'General Felipe Ángeles'),
(1734, 21, 'Aljojuca'),
(1735, 21, 'San Juan Atenco'),
(1736, 21, 'Tepeaca'),
(1737, 21, 'Cuautinchán'),
(1738, 21, 'Tecali de Herrera'),
(1739, 21, 'Mixtla'),
(1740, 21, 'Santo Tomás Hueyotlipan'),
(1741, 21, 'Tzicatlacoyan'),
(1742, 21, 'Huehuetlán el Grande'),
(1743, 21, 'La Magdalena Tlatlauquitepec'),
(1744, 21, 'San Juan Atzompa'),
(1745, 21, 'Huatlatlauca'),
(1746, 21, 'Los Reyes de Juárez'),
(1747, 21, 'Cuapiaxtla de Madero'),
(1748, 21, 'San Salvador Huixcolotla'),
(1749, 21, 'Quecholac'),
(1750, 21, 'Tecamachalco'),
(1751, 21, 'Palmar de Bravo'),
(1752, 21, 'Chalchicomula de Sesma'),
(1753, 21, 'Atzitzintla'),
(1754, 21, 'Esperanza'),
(1755, 21, 'Cañada Morelos'),
(1756, 21, 'Tlanepantla'),
(1757, 21, 'Tochtepec'),
(1758, 21, 'Atoyatempan'),
(1759, 21, 'Tepeyahualco de Cuauhtémoc'),
(1760, 21, 'Huitziltepec'),
(1761, 21, 'Molcaxac'),
(1762, 21, 'Xochitlán Todos Santos'),
(1763, 21, 'Yehualtepec'),
(1764, 21, 'Tlacotepec de Benito Juárez'),
(1765, 21, 'Juan N. Méndez'),
(1766, 21, 'Tehuacán'),
(1767, 21, 'Tepanco de López'),
(1768, 21, 'Chapulco'),
(1769, 21, 'Santiago Miahuatlán'),
(1770, 21, 'Nicolás Bravo'),
(1771, 21, 'Atexcal'),
(1772, 21, 'San Antonio Cañada'),
(1773, 21, 'Zapotitlán'),
(1774, 21, 'San Gabriel Chilac'),
(1775, 21, 'Caltepec'),
(1776, 21, 'Vicente Guerrero'),
(1777, 21, 'Ajalpan'),
(1778, 21, 'Eloxochitlán'),
(1779, 21, 'Zoquitlán'),
(1780, 21, 'San Sebastián Tlacotepec'),
(1781, 21, 'Altepexi'),
(1782, 21, 'Zinacatepec'),
(1783, 21, 'San José Miahuatlán'),
(1784, 21, 'Coxcatlán'),
(1785, 21, 'Coyomeapan'),
(1786, 22, 'Querétaro'),
(1787, 22, 'El Marqués'),
(1788, 22, 'Colón'),
(1789, 22, 'Pinal de Amoles'),
(1790, 22, 'Jalpan de Serra'),
(1791, 22, 'Landa de Matamoros'),
(1792, 22, 'Arroyo Seco'),
(1793, 22, 'Peñamiller'),
(1794, 22, 'Cadereyta de Montes'),
(1795, 22, 'San Joaquín'),
(1796, 22, 'Tolimán'),
(1797, 22, 'Ezequiel Montes'),
(1798, 22, 'Pedro Escobedo'),
(1799, 22, 'Tequisquiapan'),
(1800, 22, 'San Juan del Río'),
(1801, 22, 'Amealco de Bonfil'),
(1802, 22, 'Corregidora'),
(1803, 22, 'Huimilpan'),
(1804, 23, 'Othón P. Blanco'),
(1805, 23, 'Felipe Carrillo Puerto'),
(1806, 23, 'Lázaro Cárdenas'),
(1807, 23, 'Isla Mujeres'),
(1808, 23, 'Benito Juárez'),
(1809, 23, 'Cozumel');
INSERT INTO `municipios` (`id`, `estado_id`, `municipio`) VALUES
(1810, 23, 'Solidaridad'),
(1811, 23, 'Tulum'),
(1812, 23, 'José María Morelos'),
(1813, 23, 'Bacalar'),
(1814, 24, 'San Luis Potosí'),
(1815, 24, 'Soledad de Graciano Sánchez'),
(1816, 24, 'Cerro de San Pedro'),
(1817, 24, 'Ahualulco'),
(1818, 24, 'Mexquitic de Carmona'),
(1819, 24, 'Villa de Arriaga'),
(1820, 24, 'Vanegas'),
(1821, 24, 'Cedral'),
(1822, 24, 'Catorce'),
(1823, 24, 'Charcas'),
(1824, 24, 'Salinas'),
(1825, 24, 'Santo Domingo'),
(1826, 24, 'Villa de Ramos'),
(1827, 24, 'Matehuala'),
(1828, 24, 'Villa de la Paz'),
(1829, 24, 'Villa de Guadalupe'),
(1830, 24, 'Guadalcázar'),
(1831, 24, 'Moctezuma'),
(1832, 24, 'Venado'),
(1833, 24, 'Villa de Arista'),
(1834, 24, 'Villa Hidalgo'),
(1835, 24, 'Armadillo de los Infante'),
(1836, 24, 'Ciudad Valles'),
(1837, 24, 'Ebano'),
(1838, 24, 'Tamuín'),
(1839, 24, 'El Naranjo'),
(1840, 24, 'Ciudad del Maíz'),
(1841, 24, 'Alaquines'),
(1842, 24, 'Cárdenas'),
(1843, 24, 'Cerritos'),
(1844, 24, 'Villa Juárez'),
(1845, 24, 'San Nicolás Tolentino'),
(1846, 24, 'Villa de Reyes'),
(1847, 24, 'Zaragoza'),
(1848, 24, 'Santa María del Río'),
(1849, 24, 'Tierra Nueva'),
(1850, 24, 'Rioverde'),
(1851, 24, 'Ciudad Fernández'),
(1852, 24, 'San Ciro de Acosta'),
(1853, 24, 'Tamasopo'),
(1854, 24, 'Rayón'),
(1855, 24, 'Aquismón'),
(1856, 24, 'Lagunillas'),
(1857, 24, 'Santa Catarina'),
(1858, 24, 'Tancanhuitz'),
(1859, 24, 'Tanlajás'),
(1860, 24, 'San Vicente Tancuayalab'),
(1861, 24, 'San Antonio'),
(1862, 24, 'Tanquián de Escobedo'),
(1863, 24, 'Tampamolón Corona'),
(1864, 24, 'Coxcatlán'),
(1865, 24, 'Huehuetlán'),
(1866, 24, 'Xilitla'),
(1867, 24, 'Axtla de Terrazas'),
(1868, 24, 'Tampacán'),
(1869, 24, 'San Martín Chalchicuautla'),
(1870, 24, 'Tamazunchale'),
(1871, 24, 'Matlapa'),
(1872, 25, 'Culiacán'),
(1873, 25, 'Navolato'),
(1874, 25, 'Badiraguato'),
(1875, 25, 'Cosalá'),
(1876, 25, 'Mocorito'),
(1877, 25, 'Guasave'),
(1878, 25, 'Ahome'),
(1879, 25, 'Salvador Alvarado'),
(1880, 25, 'Angostura'),
(1881, 25, 'Choix'),
(1882, 25, 'El Fuerte'),
(1883, 25, 'Sinaloa'),
(1884, 25, 'Mazatlán'),
(1885, 25, 'Escuinapa'),
(1886, 25, 'Concordia'),
(1887, 25, 'Elota'),
(1888, 25, 'Rosario'),
(1889, 25, 'San Ignacio'),
(1890, 26, 'Hermosillo'),
(1891, 26, 'San Miguel de Horcasitas'),
(1892, 26, 'Carbó'),
(1893, 26, 'San Luis Río Colorado'),
(1894, 26, 'Puerto Peñasco'),
(1895, 26, 'General Plutarco Elías Calles'),
(1896, 26, 'Caborca'),
(1897, 26, 'Altar'),
(1898, 26, 'Tubutama'),
(1899, 26, 'Atil'),
(1900, 26, 'Oquitoa'),
(1901, 26, 'Sáric'),
(1902, 26, 'Benjamín Hill'),
(1903, 26, 'Trincheras'),
(1904, 26, 'Pitiquito'),
(1905, 26, 'Nogales'),
(1906, 26, 'Imuris'),
(1907, 26, 'Santa Cruz'),
(1908, 26, 'Magdalena'),
(1909, 26, 'Naco'),
(1910, 26, 'Agua Prieta'),
(1911, 26, 'Fronteras'),
(1912, 26, 'Nacozari de García'),
(1913, 26, 'Bavispe'),
(1914, 26, 'Bacerac'),
(1915, 26, 'Huachinera'),
(1916, 26, 'Nácori Chico'),
(1917, 26, 'Granados'),
(1918, 26, 'Bacadéhuachi'),
(1919, 26, 'Cumpas'),
(1920, 26, 'Huásabas'),
(1921, 26, 'Moctezuma'),
(1922, 26, 'Villa Hidalgo'),
(1923, 26, 'Santa Ana'),
(1924, 26, 'Cananea'),
(1925, 26, 'Arizpe'),
(1926, 26, 'Cucurpe'),
(1927, 26, 'Bacoachi'),
(1928, 26, 'San Pedro de la Cueva'),
(1929, 26, 'Divisaderos'),
(1930, 26, 'Tepache'),
(1931, 26, 'Villa Pesqueira'),
(1932, 26, 'Opodepe'),
(1933, 26, 'Huépac'),
(1934, 26, 'Banámichi'),
(1935, 26, 'Ures'),
(1936, 26, 'Aconchi'),
(1937, 26, 'Baviácora'),
(1938, 26, 'San Felipe de Jesús'),
(1939, 26, 'Rayón'),
(1940, 26, 'Cajeme'),
(1941, 26, 'Navojoa'),
(1942, 26, 'Huatabampo'),
(1943, 26, 'Bácum'),
(1944, 26, 'Etchojoa'),
(1945, 26, 'Benito Juárez'),
(1946, 26, 'Empalme'),
(1947, 26, 'Guaymas'),
(1948, 26, 'San Ignacio Río Muerto'),
(1949, 26, 'La Colorada'),
(1950, 26, 'Mazatán'),
(1951, 26, 'Suaqui Grande'),
(1952, 26, 'Sahuaripa'),
(1953, 26, 'San Javier'),
(1954, 26, 'Soyopa'),
(1955, 26, 'Bacanora'),
(1956, 26, 'Arivechi'),
(1957, 26, 'Rosario'),
(1958, 26, 'Quiriego'),
(1959, 26, 'Onavas'),
(1960, 26, 'Alamos'),
(1961, 26, 'Yécora'),
(1962, 27, 'Centro'),
(1963, 27, 'Jalpa de Méndez'),
(1964, 27, 'Nacajuca'),
(1965, 27, 'Comalcalco'),
(1966, 27, 'Huimanguillo'),
(1967, 27, 'Cárdenas'),
(1968, 27, 'Paraíso'),
(1969, 27, 'Cunduacán'),
(1970, 27, 'Macuspana'),
(1971, 27, 'Centla'),
(1972, 27, 'Jonuta'),
(1973, 27, 'Teapa'),
(1974, 27, 'Jalapa'),
(1975, 27, 'Tacotalpa'),
(1976, 27, 'Tenosique'),
(1977, 27, 'Balancán'),
(1978, 27, 'Emiliano Zapata'),
(1979, 28, 'Victoria'),
(1980, 28, 'Llera'),
(1981, 28, 'Güémez'),
(1982, 28, 'Casas'),
(1983, 28, 'Matamoros'),
(1984, 28, 'Valle Hermoso'),
(1985, 28, 'San Fernando'),
(1986, 28, 'Cruillas'),
(1987, 28, 'San Nicolás'),
(1988, 28, 'Soto la Marina'),
(1989, 28, 'Jiménez'),
(1990, 28, 'San Carlos'),
(1991, 28, 'Abasolo'),
(1992, 28, 'Padilla'),
(1993, 28, 'Hidalgo'),
(1994, 28, 'Mainero'),
(1995, 28, 'Villagrán'),
(1996, 28, 'Tula'),
(1997, 28, 'Jaumave'),
(1998, 28, 'Miquihuana'),
(1999, 28, 'Bustamante'),
(2000, 28, 'Palmillas'),
(2001, 28, 'Ocampo'),
(2002, 28, 'Nuevo Laredo'),
(2003, 28, 'Miguel Alemán'),
(2004, 28, 'Guerrero'),
(2005, 28, 'Mier'),
(2006, 28, 'Gustavo Díaz Ordaz'),
(2007, 28, 'Camargo'),
(2008, 28, 'Reynosa'),
(2009, 28, 'Río Bravo'),
(2010, 28, 'Méndez'),
(2011, 28, 'Burgos'),
(2012, 28, 'Tampico'),
(2013, 28, 'Ciudad Madero'),
(2014, 28, 'Altamira'),
(2015, 28, 'Aldama'),
(2016, 28, 'González'),
(2017, 28, 'Xicoténcatl'),
(2018, 28, 'Gómez Farías'),
(2019, 28, 'El Mante'),
(2020, 28, 'Antiguo Morelos'),
(2021, 28, 'Nuevo Morelos'),
(2022, 29, 'Tlaxcala'),
(2023, 29, 'Ixtacuixtla de Mariano Matamoros'),
(2024, 29, 'Santa Ana Nopalucan'),
(2025, 29, 'Panotla'),
(2026, 29, 'Totolac'),
(2027, 29, 'Tepeyanco'),
(2028, 29, 'Santa Isabel Xiloxoxtla'),
(2029, 29, 'San Juan Huactzinco'),
(2030, 29, 'Calpulalpan'),
(2031, 29, 'Sanctórum de Lázaro Cárdenas'),
(2032, 29, 'Benito Juárez'),
(2033, 29, 'Hueyotlipan'),
(2034, 29, 'Tlaxco'),
(2035, 29, 'Nanacamilpa de Mariano Arista'),
(2036, 29, 'Españita'),
(2037, 29, 'Apizaco'),
(2038, 29, 'Atlangatepec'),
(2039, 29, 'Muñoz de Domingo Arenas'),
(2040, 29, 'Tetla de la Solidaridad'),
(2041, 29, 'Xaltocan'),
(2042, 29, 'San Lucas Tecopilco'),
(2043, 29, 'Yauhquemehcan'),
(2044, 29, 'Xaloztoc'),
(2045, 29, 'Tocatlán'),
(2046, 29, 'Tzompantepec'),
(2047, 29, 'San José Teacalco'),
(2048, 29, 'Huamantla'),
(2049, 29, 'Terrenate'),
(2050, 29, 'Lázaro Cárdenas'),
(2051, 29, 'Emiliano Zapata'),
(2052, 29, 'Atltzayanca'),
(2053, 29, 'Cuapiaxtla'),
(2054, 29, 'El Carmen Tequexquitla'),
(2055, 29, 'Ixtenco'),
(2056, 29, 'Ziltlaltépec de Trinidad Sánchez Santos'),
(2057, 29, 'Apetatitlán de Antonio Carvajal'),
(2058, 29, 'Amaxac de Guerrero'),
(2059, 29, 'Santa Cruz Tlaxcala'),
(2060, 29, 'Cuaxomulco'),
(2061, 29, 'Contla de Juan Cuamatzi'),
(2062, 29, 'Tepetitla de Lardizábal'),
(2063, 29, 'Natívitas'),
(2064, 29, 'Santa Apolonia Teacalco'),
(2065, 29, 'Tetlatlahuca'),
(2066, 29, 'San Damián Texóloc'),
(2067, 29, 'San Jerónimo Zacualpan'),
(2068, 29, 'Zacatelco'),
(2069, 29, 'San Lorenzo Axocomanitla'),
(2070, 29, 'Santa Catarina Ayometla'),
(2071, 29, 'Xicohtzinco'),
(2072, 29, 'Papalotla de Xicohténcatl'),
(2073, 29, 'Chiautempan'),
(2074, 29, 'La Magdalena Tlaltelulco'),
(2075, 29, 'San Francisco Tetlanohcan'),
(2076, 29, 'Teolocholco'),
(2077, 29, 'Acuamanala de Miguel Hidalgo'),
(2078, 29, 'Santa Cruz Quilehtla'),
(2079, 29, 'Mazatecochco de José María Morelos'),
(2080, 29, 'Tenancingo'),
(2081, 29, 'San Pablo del Monte'),
(2082, 30, 'Xalapa'),
(2083, 30, 'Tlalnelhuayocan'),
(2084, 30, 'Xico'),
(2085, 30, 'Ixhuacán de los Reyes'),
(2086, 30, 'Ayahualulco'),
(2087, 30, 'Perote'),
(2088, 30, 'Banderilla'),
(2089, 30, 'Rafael Lucio'),
(2090, 30, 'Acajete'),
(2091, 30, 'Las Vigas de Ramírez'),
(2092, 30, 'Villa Aldama'),
(2093, 30, 'Tlacolulan'),
(2094, 30, 'Tonayán'),
(2095, 30, 'Coacoatzintla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `niveles`
--

INSERT INTO `niveles` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'BA', 'Bachillerato', '2018-08-20 00:00:00', NULL, NULL),
(2, 'LI', 'Licenciatura', '2018-08-20 00:00:00', NULL, NULL),
(3, 'TSU', 'Técnico Superior Universitario', '2018-08-20 00:00:00', NULL, NULL),
(4, 'ES', 'Especialidad', '2018-08-20 00:00:00', NULL, NULL),
(5, 'MA', 'Maestría ', '2018-08-20 00:00:00', NULL, NULL),
(6, 'DO', 'Doctorado', '2018-08-20 00:00:00', NULL, NULL),
(7, 'EC', 'Educación continua', '2018-08-01 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtitulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mensaje` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficios`
--

CREATE TABLE `oficios` (
  `id` int(11) NOT NULL,
  `folio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `documento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `solicitud_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficio_detalles`
--

CREATE TABLE `oficio_detalles` (
  `id` int(11) NOT NULL,
  `oficio_id` int(11) NOT NULL,
  `propiedad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detalle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `solicitud_id` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `concepto` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cobertura` int(11) NOT NULL,
  `fecha_pago` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id` int(11) NOT NULL,
  `pais` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id`, `pais`) VALUES
(1, 'Afganistán'),
(2, 'Albania'),
(3, 'Alemania'),
(4, 'Andorra'),
(5, 'Angola'),
(6, 'Antigua y Barbuda'),
(7, 'Arabia Saudita'),
(8, 'Argelia'),
(9, 'Argentina'),
(10, 'Armenia'),
(11, 'Australia'),
(12, 'Austria'),
(13, 'Azerbaiyán'),
(14, 'Bahamas'),
(15, 'Bangladés'),
(16, 'Barbados'),
(17, 'Baréin'),
(18, 'Bélgica'),
(19, 'Belice'),
(20, 'Benín'),
(21, 'Bielorrusia'),
(22, 'Birmania'),
(23, 'Bolivia'),
(24, 'Bosnia y Herzegovina'),
(25, 'Botsuana'),
(26, 'Brasil'),
(27, 'Brunéi'),
(28, 'Bulgaria'),
(29, 'Burkina Faso'),
(30, 'Burundi'),
(31, 'Bután'),
(32, 'Cabo Verde'),
(33, 'Camboya'),
(34, 'Camerún'),
(35, 'Canadá'),
(36, 'Catar'),
(37, 'Chad'),
(38, 'Chile'),
(39, 'China'),
(40, 'Chipre'),
(41, 'Ciudad del Vaticano'),
(42, 'Colombia'),
(43, 'Comoras'),
(44, 'Corea del Norte'),
(45, 'Corea del Sur'),
(46, 'Costa de Marfil'),
(47, 'Costa Rica'),
(48, 'Croacia'),
(49, 'Cuba'),
(50, 'Dinamarca'),
(51, 'Dominica'),
(52, 'Ecuador'),
(53, 'Egipto'),
(54, 'El Salvador'),
(55, 'Emiratos Árabes Unidos'),
(56, 'Eritrea'),
(57, 'Eslovaquia'),
(58, 'Eslovenia'),
(59, 'España'),
(60, 'Estados Unidos'),
(61, 'Estonia'),
(62, 'Etiopía'),
(63, 'Filipinas'),
(64, 'Finlandia'),
(65, 'Fiyi'),
(66, 'Francia'),
(67, 'Gabón'),
(68, 'Gambia'),
(69, 'Georgia'),
(70, 'Ghana'),
(71, 'Granada'),
(72, 'Grecia'),
(73, 'Guatemala'),
(74, 'Guyana'),
(75, 'Guinea'),
(76, 'Guinea Ecuatorial'),
(77, 'Guinea-Bisáu'),
(78, 'Haití'),
(79, 'Honduras'),
(80, 'Hungría'),
(81, 'India'),
(82, 'Indonesia'),
(83, 'Irak'),
(84, 'Irán'),
(85, 'Irlanda'),
(86, 'Islandia'),
(87, 'Islas Marshall'),
(88, 'Islas Salomón'),
(89, 'Israel'),
(90, 'Italia'),
(91, 'Jamaica'),
(92, 'Japón'),
(93, 'Jordania'),
(94, 'Kazajistán'),
(95, 'Kenia'),
(96, 'Kirguistán'),
(97, 'Kiribati'),
(98, 'Kuwait'),
(99, 'Laos'),
(100, 'Lesoto'),
(101, 'Letonia'),
(102, 'Líbano'),
(103, 'Liberia'),
(104, 'Libia'),
(105, 'Liechtenstein'),
(106, 'Lituania'),
(107, 'Luxemburgo'),
(108, 'Madagascar'),
(109, 'Malasia'),
(110, 'Malaui'),
(111, 'Maldivas'),
(112, 'Malí'),
(113, 'Malta'),
(114, 'Marruecos'),
(115, 'Mauricio'),
(116, 'Mauritania'),
(117, 'México'),
(118, 'Micronesia'),
(119, 'Moldavia'),
(120, 'Mónaco'),
(121, 'Mongolia'),
(122, 'Montenegro'),
(123, 'Mozambique'),
(124, 'Namibia'),
(125, 'Nauru'),
(126, 'Nepal'),
(127, 'Nicaragua'),
(128, 'Níger'),
(129, 'Nigeria'),
(130, 'Noruega'),
(131, 'Nueva Zelanda'),
(132, 'Omán'),
(133, 'Países Bajos'),
(134, 'Pakistán'),
(135, 'Palaos'),
(136, 'Panamá'),
(137, 'Papúa Nueva Guinea'),
(138, 'Paraguay'),
(139, 'Perú'),
(140, 'Polonia'),
(141, 'Portugal'),
(142, 'Reino Unido'),
(143, 'República Centroafricana'),
(144, 'República Checa'),
(145, 'República de Macedonia'),
(146, 'República del Congo'),
(147, 'República Democrática del Congo'),
(148, 'República Dominicana'),
(149, 'República Sudafricana'),
(150, 'Ruanda'),
(151, 'Rumanía'),
(152, 'Rusia'),
(153, 'Samoa'),
(154, 'San Cristóbal y Nieves'),
(155, 'San Marino'),
(156, 'San Vicente y las Granadinas'),
(157, 'Santa Lucía'),
(158, 'Santo Tomé y Príncipe'),
(159, 'Senegal'),
(160, 'Serbia'),
(161, 'Seychelles'),
(162, 'Sierra Leona'),
(163, 'Singapur'),
(164, 'Siria'),
(165, 'Somalia'),
(166, 'Sri Lanka'),
(167, 'Suazilandia'),
(168, 'Sudán'),
(169, 'Sudán del Sur'),
(170, 'Suecia'),
(171, 'Suiza'),
(172, 'Surinam'),
(173, 'Tailandia'),
(174, 'Tanzania'),
(175, 'Tayikistán'),
(176, 'Timor Oriental'),
(177, 'Togo'),
(178, 'Tonga'),
(179, 'Trinidad y Tobago'),
(180, 'Túnez'),
(181, 'Turkmenistán'),
(182, 'Turquía'),
(183, 'Tuvalu'),
(184, 'Ucrania'),
(185, 'Uganda'),
(186, 'Uruguay'),
(187, 'Uzbekistán'),
(188, 'Vanuatu'),
(189, 'Venezuela'),
(190, 'Vietnam'),
(191, 'Yemen'),
(192, 'Yibuti'),
(193, 'Zambia'),
(194, 'Zimbabue'),
(195, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL,
  `evaluador_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `aplica` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(11) NOT NULL,
  `domicilio_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido_paterno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido_materno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nacionalidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `celular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `curp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rfc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ine` int(11) DEFAULT NULL,
  `titulo_cargo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fotografia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `domicilio_id`, `nombre`, `apellido_paterno`, `apellido_materno`, `fecha_nacimiento`, `sexo`, `nacionalidad`, `correo`, `telefono`, `celular`, `curp`, `rfc`, `ine`, `titulo_cargo`, `fotografia`, `created_at`, `updated_at`, `deleted_at`) VALUES
(-1, -1, 'WEBSERVICE', 'WEBSERVICE', 'WEBSERVICE', '1999-01-01', 'WEBSERVICE', 'WEBSERVICE', 'WEBSERVICE', 'WEBSERVICE', 'WEBSERVICE', 'WEBSERVICE', 'WEBSERVICE', 0, 'WEBSERVICE', 'WEBSERVICE', '2018-11-04 08:00:00', NULL, NULL),
(1, 1, 'SIN DATO', 'SIN DATO', 'SIN DATO', '1999-01-01', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 'SIN DATO', 0, 'SIN DATO', 'SIN DATO', '2018-11-04 08:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planteles`
--

CREATE TABLE `planteles` (
  `id` int(11) NOT NULL,
  `institucion_id` int(11) NOT NULL,
  `domicilio_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `email1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dimensiones` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redes_sociales` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `convenios_bibliotecas_virtuales` text COLLATE utf8_unicode_ci NOT NULL,
  `especificaciones` text COLLATE utf8_unicode_ci NOT NULL,
  `clave_centro_trabajo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono3` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `paginaweb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caracteristica_inmueble` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planteles_edificios_niveles`
--

CREATE TABLE `planteles_edificios_niveles` (
  `id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `edificio_nivel_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planteles_higienes`
--

CREATE TABLE `planteles_higienes` (
  `id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `higiene_id` int(11) NOT NULL,
  `cantidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planteles_seguridad_sistemas`
--

CREATE TABLE `planteles_seguridad_sistemas` (
  `id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `seguridad_sistema_id` int(11) NOT NULL,
  `cantidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantel_dictamenes`
--

CREATE TABLE `plantel_dictamenes` (
  `id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_emision` date NOT NULL,
  `autoridad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `id` int(11) NOT NULL,
  `evaluador_id` int(11) DEFAULT NULL,
  `ciclo_id` int(11) NOT NULL,
  `nivel_id` int(11) NOT NULL,
  `solicitud_id` int(11) NOT NULL,
  `modalidad_id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `duracion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `objetivos` text COLLATE utf8_unicode_ci NOT NULL,
  `antecedentes` text COLLATE utf8_unicode_ci NOT NULL,
  `creditos` int(11) NOT NULL,
  `minimo_horas_optativas` int(11) DEFAULT NULL,
  `minimo_creditos_optativas` int(11) DEFAULT NULL,
  `vigencia` date NOT NULL,
  `acuerdo_rvoe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` int(11) NOT NULL,
  `actualizacion` text COLLATE utf8_unicode_ci NOT NULL,
  `seguimiento_egresados` text COLLATE utf8_unicode_ci NOT NULL,
  `total_alumnos_otros_roves` int(11) NOT NULL,
  `convenios_vinculacion` text COLLATE utf8_unicode_ci NOT NULL,
  `fuentes_informacion` text COLLATE utf8_unicode_ci NOT NULL,
  `estudio_oferta_demanda` text COLLATE utf8_unicode_ci NOT NULL,
  `lineas_generacion_aplicacion_conocimiento` text COLLATE utf8_unicode_ci NOT NULL,
  `necesidad_profesional` text COLLATE utf8_unicode_ci NOT NULL,
  `necesidad_institucional` text COLLATE utf8_unicode_ci NOT NULL,
  `recursos_operacion` text COLLATE utf8_unicode_ci NOT NULL,
  `necesidad_social` text COLLATE utf8_unicode_ci NOT NULL,
  `antecedente_academico` text COLLATE utf8_unicode_ci NOT NULL,
  `perfil_ingreso` text COLLATE utf8_unicode_ci NOT NULL,
  `perfil_egreso` text COLLATE utf8_unicode_ci NOT NULL,
  `metodos_induccion` text COLLATE utf8_unicode_ci NOT NULL,
  `proceso_seleccion` text COLLATE utf8_unicode_ci NOT NULL,
  `mapa_curricular` text COLLATE utf8_unicode_ci NOT NULL,
  `flexibilidad_curricular` text COLLATE utf8_unicode_ci NOT NULL,
  `objetivo_general` text COLLATE utf8_unicode_ci NOT NULL,
  `objetivos_particulares` text COLLATE utf8_unicode_ci NOT NULL,
  `fecha_asignacion_evaluador` date DEFAULT NULL,
  `calificacion_minima` int(11) DEFAULT NULL,
  `calificacion_maxima` int(11) DEFAULT NULL,
  `calificacion_aprobatoria` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas_turnos`
--

CREATE TABLE `programas_turnos` (
  `id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `turno_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_evaluaciones`
--

CREATE TABLE `programa_evaluaciones` (
  `id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `cumplimiento_id` int(11) NOT NULL,
  `evaluador_id` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cumplimiento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valoracion` text COLLATE utf8_unicode_ci NOT NULL,
  `numero` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `volumen` int(11) DEFAULT NULL,
  `pais` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `editorial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otros` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ratificacion_nombres`
--

CREATE TABLE `ratificacion_nombres` (
  `id` int(11) NOT NULL,
  `institucion_id` int(11) NOT NULL,
  `acuerdo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `autoridad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_propuesto1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_propuesto2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_propuesto3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_solicitado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_autorizado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_autorizacion` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respaldos`
--

CREATE TABLE `respaldos` (
  `id` int(11) NOT NULL,
  `mixta_noescolarizada_id` int(11) NOT NULL,
  `proceso` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `periodicidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `medios_almacenamiento` text COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'nuevo', 'Usuario Nuevo', '2018-09-12 16:00:00', NULL, NULL),
(2, 'admin', 'Administrador', '2018-09-12 16:00:00', NULL, NULL),
(3, 'representante', 'Representante Legal', '2018-09-12 16:00:00', NULL, NULL),
(4, 'gestor', 'Gestor', '2018-09-12 16:00:00', NULL, NULL),
(5, 'evaluador', 'Evaluador', '2018-09-12 16:00:00', NULL, NULL),
(6, 'inspector', 'Inspector', '2018-09-12 16:00:00', NULL, NULL),
(7, 'control_documental', 'Revisión de documentos', '2018-09-17 17:00:00', NULL, NULL),
(8, 'sicyt_lectura', 'Sicyt de consulta', '2018-09-17 16:00:00', NULL, NULL),
(9, 'sicyt_editar', 'Sicyt para editar', '2018-09-17 16:00:00', NULL, NULL),
(10, 'comite_evaluacion', 'Comité de evaluación', '2018-11-11 07:00:00', NULL, NULL),
(11, 'jefe_inspector', 'Jefe de inspectores', '2018-11-11 07:00:00', NULL, NULL),
(12, 'ce', 'Control Escolar', '2018-11-11 07:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salud_instituciones`
--

CREATE TABLE `salud_instituciones` (
  `id` int(11) NOT NULL,
  `plantel_id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiempo` time NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguridad_sistemas`
--

CREATE TABLE `seguridad_sistemas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `seguridad_sistemas`
--

INSERT INTO `seguridad_sistemas` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'recubrimiento_plastico', 'Recubriminetos plásticos en pisos y escalones', '2018-08-29 00:00:00', NULL, NULL),
(2, 'alarma', 'Alarma contra incendios y/o terremotos', '2018-08-29 00:00:00', NULL, NULL),
(3, 'senal_evacuacion', 'Señalamientos de evacuación', '2018-08-29 00:00:00', NULL, NULL),
(4, 'botiquin', 'Botiquines', '2018-08-29 00:00:00', NULL, NULL),
(5, 'escalera_emergencia', 'Escaleras de emergencia', '2018-08-29 00:00:00', NULL, NULL),
(6, 'area_seguridad', 'Áreas de seguridad', '2018-08-29 00:00:00', NULL, NULL),
(7, 'extintor', 'Extintores', '2018-08-29 00:00:00', NULL, NULL),
(8, 'punto_reunion', 'Puntos de reunión para evacuación', '2018-08-29 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `situaciones`
--

CREATE TABLE `situaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `letra` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `situaciones`
--

INSERT INTO `situaciones` (`id`, `nombre`, `descripcion`, `letra`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Activo', 'Activo', 'A', '2018-09-18 00:00:00', NULL, NULL),
(2, 'Inactivo', 'Inactivo', 'I', '2018-09-18 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id` int(11) NOT NULL,
  `tipo_solicitud_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estatus_solicitud_id` int(11) NOT NULL,
  `cita` datetime DEFAULT NULL,
  `folio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_estatus_solicitudes`
--

CREATE TABLE `solicitudes_estatus_solicitudes` (
  `id` int(11) NOT NULL,
  `estatus_solicitud_id` int(11) NOT NULL,
  `solicitud_id` int(11) NOT NULL,
  `comentario` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes_usuarios`
--

CREATE TABLE `solicitudes_usuarios` (
  `id` int(11) NOT NULL,
  `solicitud_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testigos`
--

CREATE TABLE `testigos` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `inspeccion_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_instalaciones`
--

CREATE TABLE `tipo_instalaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_instalaciones`
--

INSERT INTO `tipo_instalaciones` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Aula', 'Aulas', '2018-08-08 00:00:00', NULL, NULL),
(2, 'Cubículo', 'Área administrativa', '2018-08-08 00:00:00', NULL, NULL),
(3, 'Auditorio', 'Área administrativa', '2018-08-08 00:00:00', NULL, NULL),
(4, 'Laboratorio físico', 'Otros laboratorios y/o talleres', '2018-08-08 00:00:00', NULL, NULL),
(5, 'Laboratorio virtual', 'Laboratorio virtual', '2018-08-08 00:00:00', NULL, NULL),
(6, 'Taller físico', 'Otros talleres', '2018-08-08 00:00:00', NULL, NULL),
(7, 'Taller virtual', 'Taller virtual', '2018-08-08 00:00:00', NULL, NULL),
(8, 'Laboratorio de cómputo', 'Centro de cómputo', '2018-08-08 00:00:00', NULL, NULL),
(9, 'Biblioteca física', 'Centro de documentación o biblioteca', '2018-08-08 00:00:00', NULL, NULL),
(10, 'Biblioteca virtual', 'Biblioteca virtual', '2018-08-08 00:00:00', NULL, NULL),
(11, 'Otros', 'Otras áreas', '2018-09-11 00:00:00', NULL, NULL),
(12, 'Área administrativa', 'Área administrativa', '2018-09-11 00:00:00', NULL, NULL),
(13, 'Archivo muerto', 'Área para el archivo muerto', '2018-09-11 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_solicitudes`
--

CREATE TABLE `tipo_solicitudes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_solicitudes`
--

INSERT INTO `tipo_solicitudes` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nueva solicitud', 'Trámite para un nuevo RVOE', '2018-08-08 00:00:00', NULL, NULL),
(2, 'Modificación del plan de estudios', 'Modificación a planes y programas de estudios', '2018-08-08 00:00:00', NULL, NULL),
(3, 'Cambio domicilio', 'Cambio de domicilio de un RVOE ya existente', '2018-08-08 00:00:00', NULL, NULL),
(4, 'Cambio de representante legal', 'Cambio de representante legal', '2018-08-08 00:00:00', NULL, '2018-11-23 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trayectorias`
--

CREATE TABLE `trayectorias` (
  `id` int(11) NOT NULL,
  `programa_id` int(11) NOT NULL,
  `programa_seguimiento` text COLLATE utf8_unicode_ci NOT NULL,
  `tipo_tutoria` text COLLATE utf8_unicode_ci NOT NULL,
  `estadistica_titulacion` text COLLATE utf8_unicode_ci NOT NULL,
  `funcion_tutorial` text COLLATE utf8_unicode_ci NOT NULL,
  `modalidades_titulacion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tasa_egreso` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Matutino', 'Turno matutino', '2018-08-20 00:00:00', NULL, NULL),
(2, 'Vespertino', 'Turno vespertino', '2018-08-20 00:00:00', NULL, NULL),
(3, 'Nocturno', 'Turno nocturno', '2018-08-20 00:00:00', NULL, NULL),
(4, 'Mixto', 'Turno mixto', '2018-08-20 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `usuario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  `token_notificaciones` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `persona_id`, `rol_id`, `usuario`, `contrasena`, `estatus`, `token_notificaciones`, `created_at`, `updated_at`, `deleted_at`) VALUES
(-1, -1, 1, 'WEBSERVICE', 'WEBSERVICE', 0, 'WEBSERVICE', '2018-11-28 08:00:00', NULL, NULL),
(1, 1, 1, 'SIN DATO', 'SIN DATO', 0, 'SIN DATO', '2018-11-28 08:00:00', NULL, NULL),
(2, 1, 2, 'admin', '202cb962ac59075b964b07152d234b70', 3, NULL, '2018-11-28 08:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_usuarios`
--

CREATE TABLE `usuario_usuarios` (
  `id` int(11) NOT NULL,
  `principal_id` int(11) NOT NULL,
  `secundario_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `validaciones`
--

CREATE TABLE `validaciones` (
  `id` int(11) NOT NULL,
  `alumno_id` int(11) NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_institucion_emisora` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_expedicion` date NOT NULL,
  `documento_retenido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `folio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `oficio_respuesta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `oficio_envio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_acreditacion` date NOT NULL,
  `plan_anterior` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `clave_centro_trabajo_emisor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_envio_oficio` date NOT NULL,
  `fecha_respuesta` date NOT NULL,
  `situacion_documento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `observaciones` text COLLATE utf8_unicode_ci,
  `fecha_actualizacion` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `valumnos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `valumnos` (
`clave_centro_trabajo` varchar(255)
,`nombre_ies` varchar(255)
,`alumno_id` int(11)
,`matricula` varchar(255)
,`nombre` varchar(255)
,`apellido_paterno` varchar(255)
,`apellido_materno` varchar(255)
,`curp` varchar(255)
,`carrera` varchar(255)
,`acuerdo_rvoe` varchar(255)
,`modalidad` varchar(255)
,`promedio` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vkardex`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vkardex` (
`grado` varchar(255)
,`alumno_id` int(11)
,`nombre` varchar(255)
,`calificacion` varchar(255)
,`tipo` int(11)
,`created_at` datetime
,`updated_at` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vpagos_instituciones_solicitudes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vpagos_instituciones_solicitudes` (
`institucion_id` int(11)
,`nombre_institucion` varchar(255)
,`usuario_id` int(11)
,`solicitud_id` int(11)
,`folio_solicitud` varchar(255)
,`pago_id` int(11)
,`concepto` varchar(255)
,`monto` decimal(10,2)
,`cobertura` int(11)
,`fecha_pago` date
);

-- --------------------------------------------------------

--
-- Estructura para la vista `valumnos`
--
DROP TABLE IF EXISTS `valumnos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`glasspro`@`localhost` SQL SECURITY DEFINER VIEW `valumnos`  AS  select `planteles`.`clave_centro_trabajo` AS `clave_centro_trabajo`,`instituciones`.`nombre` AS `nombre_ies`,`alumnos`.`id` AS `alumno_id`,`alumnos`.`matricula` AS `matricula`,`personas`.`nombre` AS `nombre`,`personas`.`apellido_paterno` AS `apellido_paterno`,`personas`.`apellido_materno` AS `apellido_materno`,`personas`.`curp` AS `curp`,`programas`.`nombre` AS `carrera`,`programas`.`acuerdo_rvoe` AS `acuerdo_rvoe`,`modalidades`.`nombre` AS `modalidad`,avg(`calificaciones`.`calificacion`) AS `promedio` from ((((((`alumnos` join `personas` on((`alumnos`.`persona_id` = `personas`.`id`))) join `programas` on((`alumnos`.`programa_id` = `programas`.`id`))) join `planteles` on((`programas`.`plantel_id` = `planteles`.`id`))) join `instituciones` on((`planteles`.`institucion_id` = `instituciones`.`id`))) join `modalidades` on((`programas`.`modalidad_id` = `modalidades`.`id`))) join `calificaciones` on((`alumnos`.`id` = `calificaciones`.`alumno_id`))) group by `calificaciones`.`alumno_id` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vkardex`
--
DROP TABLE IF EXISTS `vkardex`;

CREATE ALGORITHM=UNDEFINED DEFINER=`glasspro`@`localhost` SQL SECURITY DEFINER VIEW `vkardex`  AS  select `asignaturas`.`grado` AS `grado`,`calificaciones`.`alumno_id` AS `alumno_id`,`asignaturas`.`nombre` AS `nombre`,`calificaciones`.`calificacion` AS `calificacion`,`calificaciones`.`tipo` AS `tipo`,`calificaciones`.`created_at` AS `created_at`,`calificaciones`.`updated_at` AS `updated_at` from (`calificaciones` join `asignaturas` on((`calificaciones`.`asignatura_id` = `asignaturas`.`id`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vpagos_instituciones_solicitudes`
--
DROP TABLE IF EXISTS `vpagos_instituciones_solicitudes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`glasspro`@`localhost` SQL SECURITY DEFINER VIEW `vpagos_instituciones_solicitudes`  AS  select `i`.`id` AS `institucion_id`,`i`.`nombre` AS `nombre_institucion`,`i`.`usuario_id` AS `usuario_id`,`s`.`id` AS `solicitud_id`,`s`.`folio` AS `folio_solicitud`,`p`.`id` AS `pago_id`,`p`.`concepto` AS `concepto`,`p`.`monto` AS `monto`,`p`.`cobertura` AS `cobertura`,`p`.`fecha_pago` AS `fecha_pago` from ((`instituciones` `i` join `solicitudes` `s`) join `pagos` `p`) where (isnull(`i`.`deleted_at`) and isnull(`s`.`deleted_at`) and isnull(`p`.`deleted_at`) and (`i`.`usuario_id` = `s`.`usuario_id`) and (`s`.`id` = `p`.`solicitud_id`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `academias`
--
ALTER TABLE `academias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`),
  ADD KEY `situacion_id` (`situacion_id`);

--
-- Indices de la tabla `alumnos_grupos`
--
ALTER TABLE `alumnos_grupos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumno_id` (`alumno_id`),
  ADD KEY `grupo_id` (`grupo_id`);

--
-- Indices de la tabla `alumno_observaciones`
--
ALTER TABLE `alumno_observaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumno_id` (`alumno_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `infraestructura_id` (`infraestructura_id`),
  ADD KEY `docente_id` (`docente_id`),
  ADD KEY `programa_id` (`programa_id`);

--
-- Indices de la tabla `asignaturas_hemerobibliograficas`
--
ALTER TABLE `asignaturas_hemerobibliograficas`
  ADD KEY `asignatura_id` (`asignatura_id`),
  ADD KEY `hemerobibliografica_id` (`hemerobibliografica_id`);

--
-- Indices de la tabla `asociaciones`
--
ALTER TABLE `asociaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluador_id` (`evaluador_id`);

--
-- Indices de la tabla `bitacoras`
--
ALTER TABLE `bitacoras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumno_id` (`alumno_id`),
  ADD KEY `asignatura_id` (`asignatura_id`),
  ADD KEY `estatus_calificacion_id` (`estatus_calificacion_id`);

--
-- Indices de la tabla `categorias_evaluacion_pregunta`
--
ALTER TABLE `categorias_evaluacion_pregunta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciclos`
--
ALTER TABLE `ciclos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciclos_escolares`
--
ALTER TABLE `ciclos_escolares`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cumplimientos`
--
ALTER TABLE `cumplimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modalidad_id` (`modalidad_id`);

--
-- Indices de la tabla `dictamenes`
--
ALTER TABLE `dictamenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programa_evaluacion_id` (`programa_evaluacion_id`),
  ADD KEY `evaluacion_apartado_id` (`evaluacion_apartado_id`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `domicilios`
--
ALTER TABLE `domicilios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `edificios_niveles`
--
ALTER TABLE `edificios_niveles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `escalas`
--
ALTER TABLE `escalas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `espejos`
--
ALTER TABLE `espejos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mixta_noescolarizada_id` (`mixta_noescolarizada_id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estatus_calificaciones`
--
ALTER TABLE `estatus_calificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estatus_inspeccion`
--
ALTER TABLE `estatus_inspeccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estatus_solicitudes`
--
ALTER TABLE `estatus_solicitudes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asignatura_id` (`asignatura_id`);

--
-- Indices de la tabla `evaluaciones_evaluacion_preguntas`
--
ALTER TABLE `evaluaciones_evaluacion_preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programa_evaluacion_id` (`programa_evaluacion_id`),
  ADD KEY `evaluacion_pregunta_id` (`evaluacion_pregunta_id`),
  ADD KEY `escala_id` (`escala_id`);

--
-- Indices de la tabla `evaluacion_apartados`
--
ALTER TABLE `evaluacion_apartados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluacion_preguntas`
--
ALTER TABLE `evaluacion_preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluacion_apartado_id` (`evaluacion_apartado_id`),
  ADD KEY `modalidad_id` (`modalidad_id`),
  ADD KEY `categoria_evaluacion_pregunta_id` (`categoria_evaluacion_pregunta_id`),
  ADD KEY `escala_id` (`escala_id`);

--
-- Indices de la tabla `evaluacion_procesos`
--
ALTER TABLE `evaluacion_procesos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluador_id` (`evaluador_id`);

--
-- Indices de la tabla `evaluadores`
--
ALTER TABLE `evaluadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `evaluadores_modalidades`
--
ALTER TABLE `evaluadores_modalidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluador_id` (`evaluador_id`),
  ADD KEY `modalidad_id` (`modalidad_id`);

--
-- Indices de la tabla `experiencias`
--
ALTER TABLE `experiencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `formaciones`
--
ALTER TABLE `formaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `turno_id` (`turno_id`);

--
-- Indices de la tabla `hemerobibliograficas`
--
ALTER TABLE `hemerobibliograficas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plantel_id` (`plantel_id`);

--
-- Indices de la tabla `higienes`
--
ALTER TABLE `higienes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `infraestructuras`
--
ALTER TABLE `infraestructuras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plantel_id` (`plantel_id`),
  ADD KEY `tipo_instalacion_id` (`tipo_instalacion_id`);

--
-- Indices de la tabla `inspecciones`
--
ALTER TABLE `inspecciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programa_id` (`programa_id`);

--
-- Indices de la tabla `inspecciones_inspeccion_preguntas`
--
ALTER TABLE `inspecciones_inspeccion_preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inspeccion_id` (`inspeccion_id`),
  ADD KEY `inspeccion_pregunta_id` (`inspeccion_pregunta_id`);

--
-- Indices de la tabla `inspeccion_apartados`
--
ALTER TABLE `inspeccion_apartados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inspeccion_categorias`
--
ALTER TABLE `inspeccion_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inspeccion_observaciones`
--
ALTER TABLE `inspeccion_observaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inspeccion_id` (`inspeccion_id`),
  ADD KEY `inspeccion_apartado_id` (`inspeccion_apartado_id`);

--
-- Indices de la tabla `inspeccion_preguntas`
--
ALTER TABLE `inspeccion_preguntas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_inspeccion_tipo_pregunta` (`id_inspeccion_tipo_pregunta`),
  ADD KEY `id_inspeccion_categoria` (`id_inspeccion_categoria`),
  ADD KEY `id_inspeccion_apartado` (`id_inspeccion_apartado`);

--
-- Indices de la tabla `inspeccion_tipo_preguntas`
--
ALTER TABLE `inspeccion_tipo_preguntas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inspectores`
--
ALTER TABLE `inspectores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`),
  ADD KEY `programa_id` (`programa_id`);

--
-- Indices de la tabla `institucionales`
--
ALTER TABLE `institucionales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluador_id` (`evaluador_id`);

--
-- Indices de la tabla `instituciones`
--
ALTER TABLE `instituciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `mixta_noescolarizadas`
--
ALTER TABLE `mixta_noescolarizadas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modalidades`
--
ALTER TABLE `modalidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modulos_roles`
--
ALTER TABLE `modulos_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modulo_id` (`modulo_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oficios`
--
ALTER TABLE `oficios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oficio_detalles`
--
ALTER TABLE `oficio_detalles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `solicitud_id` (`solicitud_id`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluador_id` (`evaluador_id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `domicilio_id` (`domicilio_id`);

--
-- Indices de la tabla `planteles`
--
ALTER TABLE `planteles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institucion_id` (`institucion_id`),
  ADD KEY `domicilio_id` (`domicilio_id`),
  ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `planteles_edificios_niveles`
--
ALTER TABLE `planteles_edificios_niveles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `planteles_higienes`
--
ALTER TABLE `planteles_higienes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `planteles_seguridad_sistemas`
--
ALTER TABLE `planteles_seguridad_sistemas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plantel_dictamenes`
--
ALTER TABLE `plantel_dictamenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plantel_id` (`plantel_id`);

--
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluador_id` (`evaluador_id`),
  ADD KEY `ciclo_id` (`ciclo_id`),
  ADD KEY `nivel_id` (`nivel_id`),
  ADD KEY `solicitud_id` (`solicitud_id`),
  ADD KEY `modalidad_id` (`modalidad_id`),
  ADD KEY `plantel_id` (`plantel_id`),
  ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `programas_turnos`
--
ALTER TABLE `programas_turnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programa_id` (`programa_id`),
  ADD KEY `turno_id` (`turno_id`);

--
-- Indices de la tabla `programa_evaluaciones`
--
ALTER TABLE `programa_evaluaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cumplimiento_id` (`cumplimiento_id`),
  ADD KEY `evaluador_id` (`evaluador_id`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`);

--
-- Indices de la tabla `ratificacion_nombres`
--
ALTER TABLE `ratificacion_nombres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institucion_id` (`institucion_id`);

--
-- Indices de la tabla `respaldos`
--
ALTER TABLE `respaldos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mixta_noescolarizada_id` (`mixta_noescolarizada_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salud_instituciones`
--
ALTER TABLE `salud_instituciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plantel_id` (`plantel_id`);

--
-- Indices de la tabla `seguridad_sistemas`
--
ALTER TABLE `seguridad_sistemas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `situaciones`
--
ALTER TABLE `situaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_solicitud_id` (`tipo_solicitud_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `estatus_solicitud_id` (`estatus_solicitud_id`);

--
-- Indices de la tabla `solicitudes_estatus_solicitudes`
--
ALTER TABLE `solicitudes_estatus_solicitudes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estatus_solicitud_id` (`estatus_solicitud_id`),
  ADD KEY `solicitud_id` (`solicitud_id`);

--
-- Indices de la tabla `solicitudes_usuarios`
--
ALTER TABLE `solicitudes_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `testigos`
--
ALTER TABLE `testigos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_id` (`persona_id`),
  ADD KEY `inspeccion_id` (`inspeccion_id`);

--
-- Indices de la tabla `tipo_instalaciones`
--
ALTER TABLE `tipo_instalaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_solicitudes`
--
ALTER TABLE `tipo_solicitudes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trayectorias`
--
ALTER TABLE `trayectorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programa_id` (`programa_id`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuarios_usuario_unique` (`usuario`),
  ADD KEY `persona_id` (`persona_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- Indices de la tabla `usuario_usuarios`
--
ALTER TABLE `usuario_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `validaciones`
--
ALTER TABLE `validaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alumno_id` (`alumno_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `academias`
--
ALTER TABLE `academias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumnos_grupos`
--
ALTER TABLE `alumnos_grupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alumno_observaciones`
--
ALTER TABLE `alumno_observaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asociaciones`
--
ALTER TABLE `asociaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bitacoras`
--
ALTER TABLE `bitacoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias_evaluacion_pregunta`
--
ALTER TABLE `categorias_evaluacion_pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `ciclos`
--
ALTER TABLE `ciclos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ciclos_escolares`
--
ALTER TABLE `ciclos_escolares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cumplimientos`
--
ALTER TABLE `cumplimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `dictamenes`
--
ALTER TABLE `dictamenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `domicilios`
--
ALTER TABLE `domicilios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `edificios_niveles`
--
ALTER TABLE `edificios_niveles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `escalas`
--
ALTER TABLE `escalas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `espejos`
--
ALTER TABLE `espejos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `estatus_calificaciones`
--
ALTER TABLE `estatus_calificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estatus_inspeccion`
--
ALTER TABLE `estatus_inspeccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estatus_solicitudes`
--
ALTER TABLE `estatus_solicitudes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evaluaciones_evaluacion_preguntas`
--
ALTER TABLE `evaluaciones_evaluacion_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evaluacion_apartados`
--
ALTER TABLE `evaluacion_apartados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `evaluacion_preguntas`
--
ALTER TABLE `evaluacion_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT de la tabla `evaluacion_procesos`
--
ALTER TABLE `evaluacion_procesos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evaluadores`
--
ALTER TABLE `evaluadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evaluadores_modalidades`
--
ALTER TABLE `evaluadores_modalidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `experiencias`
--
ALTER TABLE `experiencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formaciones`
--
ALTER TABLE `formaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hemerobibliograficas`
--
ALTER TABLE `hemerobibliograficas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `higienes`
--
ALTER TABLE `higienes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `infraestructuras`
--
ALTER TABLE `infraestructuras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inspecciones`
--
ALTER TABLE `inspecciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inspecciones_inspeccion_preguntas`
--
ALTER TABLE `inspecciones_inspeccion_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inspeccion_apartados`
--
ALTER TABLE `inspeccion_apartados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `inspeccion_categorias`
--
ALTER TABLE `inspeccion_categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `inspeccion_observaciones`
--
ALTER TABLE `inspeccion_observaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inspeccion_preguntas`
--
ALTER TABLE `inspeccion_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `inspeccion_tipo_preguntas`
--
ALTER TABLE `inspeccion_tipo_preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `inspectores`
--
ALTER TABLE `inspectores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `institucionales`
--
ALTER TABLE `institucionales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `instituciones`
--
ALTER TABLE `instituciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mixta_noescolarizadas`
--
ALTER TABLE `mixta_noescolarizadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modalidades`
--
ALTER TABLE `modalidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `modulos_roles`
--
ALTER TABLE `modulos_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2096;

--
-- AUTO_INCREMENT de la tabla `niveles`
--
ALTER TABLE `niveles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `oficios`
--
ALTER TABLE `oficios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `oficio_detalles`
--
ALTER TABLE `oficio_detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `planteles`
--
ALTER TABLE `planteles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planteles_edificios_niveles`
--
ALTER TABLE `planteles_edificios_niveles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planteles_higienes`
--
ALTER TABLE `planteles_higienes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `planteles_seguridad_sistemas`
--
ALTER TABLE `planteles_seguridad_sistemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plantel_dictamenes`
--
ALTER TABLE `plantel_dictamenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programas`
--
ALTER TABLE `programas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programas_turnos`
--
ALTER TABLE `programas_turnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programa_evaluaciones`
--
ALTER TABLE `programa_evaluaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ratificacion_nombres`
--
ALTER TABLE `ratificacion_nombres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `respaldos`
--
ALTER TABLE `respaldos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `salud_instituciones`
--
ALTER TABLE `salud_instituciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seguridad_sistemas`
--
ALTER TABLE `seguridad_sistemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `situaciones`
--
ALTER TABLE `situaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudes_estatus_solicitudes`
--
ALTER TABLE `solicitudes_estatus_solicitudes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudes_usuarios`
--
ALTER TABLE `solicitudes_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `testigos`
--
ALTER TABLE `testigos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_instalaciones`
--
ALTER TABLE `tipo_instalaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tipo_solicitudes`
--
ALTER TABLE `tipo_solicitudes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `trayectorias`
--
ALTER TABLE `trayectorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario_usuarios`
--
ALTER TABLE `usuario_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `validaciones`
--
ALTER TABLE `validaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `alumnos_ibfk_2` FOREIGN KEY (`situacion_id`) REFERENCES `situaciones` (`id`),
  ADD CONSTRAINT `alumnos_ibfk_3` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `alumnos_ibfk_4` FOREIGN KEY (`situacion_id`) REFERENCES `situaciones` (`id`);

--
-- Filtros para la tabla `alumnos_grupos`
--
ALTER TABLE `alumnos_grupos`
  ADD CONSTRAINT `alumnos_grupos_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `alumnos_grupos_ibfk_2` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`),
  ADD CONSTRAINT `alumnos_grupos_ibfk_3` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `alumnos_grupos_ibfk_4` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`);

--
-- Filtros para la tabla `alumno_observaciones`
--
ALTER TABLE `alumno_observaciones`
  ADD CONSTRAINT `alumno_observaciones_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `alumno_observaciones_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `alumno_observaciones_ibfk_3` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `alumno_observaciones_ibfk_4` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD CONSTRAINT `asignaturas_ibfk_1` FOREIGN KEY (`infraestructura_id`) REFERENCES `infraestructuras` (`id`),
  ADD CONSTRAINT `asignaturas_ibfk_2` FOREIGN KEY (`docente_id`) REFERENCES `docentes` (`id`);

--
-- Filtros para la tabla `asignaturas_hemerobibliograficas`
--
ALTER TABLE `asignaturas_hemerobibliograficas`
  ADD CONSTRAINT `asignaturas_hemerobibliograficas_ibfk_1` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id`),
  ADD CONSTRAINT `asignaturas_hemerobibliograficas_ibfk_2` FOREIGN KEY (`hemerobibliografica_id`) REFERENCES `hemerobibliograficas` (`id`);

--
-- Filtros para la tabla `asociaciones`
--
ALTER TABLE `asociaciones`
  ADD CONSTRAINT `asociaciones_ibfk_1` FOREIGN KEY (`evaluador_id`) REFERENCES `evaluadores` (`id`);

--
-- Filtros para la tabla `bitacoras`
--
ALTER TABLE `bitacoras`
  ADD CONSTRAINT `bitacoras_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id`),
  ADD CONSTRAINT `calificaciones_ibfk_3` FOREIGN KEY (`estatus_calificacion_id`) REFERENCES `estatus_calificaciones` (`id`),
  ADD CONSTRAINT `calificaciones_ibfk_4` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `calificaciones_ibfk_5` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id`),
  ADD CONSTRAINT `calificaciones_ibfk_6` FOREIGN KEY (`estatus_calificacion_id`) REFERENCES `estatus_calificaciones` (`id`);

--
-- Filtros para la tabla `cumplimientos`
--
ALTER TABLE `cumplimientos`
  ADD CONSTRAINT `cumplimientos_ibfk_1` FOREIGN KEY (`modalidad_id`) REFERENCES `modalidades` (`id`);

--
-- Filtros para la tabla `dictamenes`
--
ALTER TABLE `dictamenes`
  ADD CONSTRAINT `dictamenes_ibfk_1` FOREIGN KEY (`programa_evaluacion_id`) REFERENCES `programa_evaluaciones` (`id`),
  ADD CONSTRAINT `dictamenes_ibfk_2` FOREIGN KEY (`evaluacion_apartado_id`) REFERENCES `evaluacion_apartados` (`id`);

--
-- Filtros para la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `docentes_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `docentes_ibfk_2` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `espejos`
--
ALTER TABLE `espejos`
  ADD CONSTRAINT `espejos_ibfk_1` FOREIGN KEY (`mixta_noescolarizada_id`) REFERENCES `mixta_noescolarizadas` (`id`);

--
-- Filtros para la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD CONSTRAINT `evaluaciones_ibfk_1` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id`);

--
-- Filtros para la tabla `evaluaciones_evaluacion_preguntas`
--
ALTER TABLE `evaluaciones_evaluacion_preguntas`
  ADD CONSTRAINT `evaluaciones_evaluacion_preguntas_ibfk_1` FOREIGN KEY (`programa_evaluacion_id`) REFERENCES `programa_evaluaciones` (`id`),
  ADD CONSTRAINT `evaluaciones_evaluacion_preguntas_ibfk_2` FOREIGN KEY (`evaluacion_pregunta_id`) REFERENCES `evaluacion_preguntas` (`id`),
  ADD CONSTRAINT `evaluaciones_evaluacion_preguntas_ibfk_3` FOREIGN KEY (`escala_id`) REFERENCES `escalas` (`id`);

--
-- Filtros para la tabla `evaluacion_procesos`
--
ALTER TABLE `evaluacion_procesos`
  ADD CONSTRAINT `evaluacion_procesos_ibfk_1` FOREIGN KEY (`evaluador_id`) REFERENCES `evaluadores` (`id`);

--
-- Filtros para la tabla `evaluadores`
--
ALTER TABLE `evaluadores`
  ADD CONSTRAINT `evaluadores_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `evaluadores_modalidades`
--
ALTER TABLE `evaluadores_modalidades`
  ADD CONSTRAINT `evaluadores_modalidades_ibfk_1` FOREIGN KEY (`evaluador_id`) REFERENCES `evaluadores` (`id`),
  ADD CONSTRAINT `evaluadores_modalidades_ibfk_2` FOREIGN KEY (`modalidad_id`) REFERENCES `modalidades` (`id`);

--
-- Filtros para la tabla `experiencias`
--
ALTER TABLE `experiencias`
  ADD CONSTRAINT `experiencias_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `formaciones`
--
ALTER TABLE `formaciones`
  ADD CONSTRAINT `formaciones_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_2` FOREIGN KEY (`turno_id`) REFERENCES `turnos` (`id`);

--
-- Filtros para la tabla `hemerobibliograficas`
--
ALTER TABLE `hemerobibliograficas`
  ADD CONSTRAINT `hemerobibliograficas_ibfk_1` FOREIGN KEY (`plantel_id`) REFERENCES `planteles` (`id`),
  ADD CONSTRAINT `hemerobibliograficas_ibfk_2` FOREIGN KEY (`plantel_id`) REFERENCES `planteles` (`id`);

--
-- Filtros para la tabla `infraestructuras`
--
ALTER TABLE `infraestructuras`
  ADD CONSTRAINT `infraestructuras_ibfk_1` FOREIGN KEY (`plantel_id`) REFERENCES `planteles` (`id`),
  ADD CONSTRAINT `infraestructuras_ibfk_2` FOREIGN KEY (`tipo_instalacion_id`) REFERENCES `tipo_instalaciones` (`id`);

--
-- Filtros para la tabla `inspecciones_inspeccion_preguntas`
--
ALTER TABLE `inspecciones_inspeccion_preguntas`
  ADD CONSTRAINT `inspecciones_inspeccion_preguntas_ibfk_1` FOREIGN KEY (`inspeccion_id`) REFERENCES `inspecciones` (`id`),
  ADD CONSTRAINT `inspecciones_inspeccion_preguntas_ibfk_2` FOREIGN KEY (`inspeccion_pregunta_id`) REFERENCES `inspeccion_preguntas` (`id`);

--
-- Filtros para la tabla `inspeccion_observaciones`
--
ALTER TABLE `inspeccion_observaciones`
  ADD CONSTRAINT `inspeccion_observaciones_ibfk_1` FOREIGN KEY (`inspeccion_id`) REFERENCES `inspecciones` (`id`),
  ADD CONSTRAINT `inspeccion_observaciones_ibfk_2` FOREIGN KEY (`inspeccion_apartado_id`) REFERENCES `inspeccion_apartados` (`id`);

--
-- Filtros para la tabla `inspeccion_preguntas`
--
ALTER TABLE `inspeccion_preguntas`
  ADD CONSTRAINT `inspeccion_preguntas_ibfk_1` FOREIGN KEY (`id_inspeccion_tipo_pregunta`) REFERENCES `inspeccion_tipo_preguntas` (`id`),
  ADD CONSTRAINT `inspeccion_preguntas_ibfk_2` FOREIGN KEY (`id_inspeccion_apartado`) REFERENCES `inspeccion_apartados` (`id`),
  ADD CONSTRAINT `inspeccion_preguntas_ibfk_3` FOREIGN KEY (`id_inspeccion_categoria`) REFERENCES `inspeccion_categorias` (`id`);

--
-- Filtros para la tabla `inspectores`
--
ALTER TABLE `inspectores`
  ADD CONSTRAINT `inspectores_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `institucionales`
--
ALTER TABLE `institucionales`
  ADD CONSTRAINT `institucionales_ibfk_1` FOREIGN KEY (`evaluador_id`) REFERENCES `evaluadores` (`id`);

--
-- Filtros para la tabla `instituciones`
--
ALTER TABLE `instituciones`
  ADD CONSTRAINT `instituciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `modulos_roles`
--
ALTER TABLE `modulos_roles`
  ADD CONSTRAINT `modulos_roles_ibfk_1` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`id`),
  ADD CONSTRAINT `modulos_roles_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`id`);

--
-- Filtros para la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD CONSTRAINT `perfiles_ibfk_1` FOREIGN KEY (`evaluador_id`) REFERENCES `evaluadores` (`id`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`domicilio_id`) REFERENCES `domicilios` (`id`);

--
-- Filtros para la tabla `planteles`
--
ALTER TABLE `planteles`
  ADD CONSTRAINT `planteles_ibfk_1` FOREIGN KEY (`institucion_id`) REFERENCES `instituciones` (`id`),
  ADD CONSTRAINT `planteles_ibfk_2` FOREIGN KEY (`domicilio_id`) REFERENCES `domicilios` (`id`),
  ADD CONSTRAINT `planteles_ibfk_3` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `plantel_dictamenes`
--
ALTER TABLE `plantel_dictamenes`
  ADD CONSTRAINT `plantel_dictamenes_ibfk_1` FOREIGN KEY (`plantel_id`) REFERENCES `planteles` (`id`);

--
-- Filtros para la tabla `programas_turnos`
--
ALTER TABLE `programas_turnos`
  ADD CONSTRAINT `programas_turnos_ibfk_2` FOREIGN KEY (`turno_id`) REFERENCES `turnos` (`id`);

--
-- Filtros para la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `publicaciones_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `ratificacion_nombres`
--
ALTER TABLE `ratificacion_nombres`
  ADD CONSTRAINT `ratificacion_nombres_ibfk_1` FOREIGN KEY (`institucion_id`) REFERENCES `instituciones` (`id`);

--
-- Filtros para la tabla `respaldos`
--
ALTER TABLE `respaldos`
  ADD CONSTRAINT `respaldos_ibfk_1` FOREIGN KEY (`mixta_noescolarizada_id`) REFERENCES `mixta_noescolarizadas` (`id`);

--
-- Filtros para la tabla `salud_instituciones`
--
ALTER TABLE `salud_instituciones`
  ADD CONSTRAINT `salud_instituciones_ibfk_1` FOREIGN KEY (`plantel_id`) REFERENCES `planteles` (`id`);

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`tipo_solicitud_id`) REFERENCES `tipo_solicitudes` (`id`),
  ADD CONSTRAINT `solicitudes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `solicitudes_ibfk_3` FOREIGN KEY (`estatus_solicitud_id`) REFERENCES `estatus_solicitudes` (`id`);

--
-- Filtros para la tabla `solicitudes_estatus_solicitudes`
--
ALTER TABLE `solicitudes_estatus_solicitudes`
  ADD CONSTRAINT `solicitudes_estatus_solicitudes_ibfk_1` FOREIGN KEY (`estatus_solicitud_id`) REFERENCES `estatus_solicitudes` (`id`),
  ADD CONSTRAINT `solicitudes_estatus_solicitudes_ibfk_2` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitudes` (`id`);

--
-- Filtros para la tabla `testigos`
--
ALTER TABLE `testigos`
  ADD CONSTRAINT `testigos_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `testigos_ibfk_2` FOREIGN KEY (`inspeccion_id`) REFERENCES `inspecciones` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `validaciones`
--
ALTER TABLE `validaciones`
  ADD CONSTRAINT `validaciones_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`),
  ADD CONSTRAINT `validaciones_ibfk_2` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
