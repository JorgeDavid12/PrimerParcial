using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data; //imp
using System.Data.SqlClient; //imp

namespace CapaDatos
{
    public class CDEmpleados
    {
        Conexion conexion = new Conexion();

        public DataTable MtMostrarEmp()
        {
            string QryMostrarEmp = "uspMostrarEmpleados";
            SqlDataAdapter adapter = new SqlDataAdapter(QryMostrarEmp, conexion.MtdAbrirConexion());
            DataTable dtMostrarEmp = new DataTable();
            adapter.Fill(dtMostrarEmp);
            conexion.MtdCerrarConexion();
            return dtMostrarEmp;
        }

        public void CP_mtdAgregarEmp(string Nombre, string Apellido, DateTime FechaNacimiento, DateTime FechaContratacion, int DepartamentoID, string PuestoTrabajo, decimal Salario, string Estado)
        {

            string Usp_crear = "uspInsertEmpleados";
            SqlCommand cmd_InsertarEmp = new SqlCommand(Usp_crear, conexion.MtdAbrirConexion());
            cmd_InsertarEmp.CommandType = CommandType.StoredProcedure;

            cmd_InsertarEmp.Parameters.AddWithValue("@Nombre", Nombre);
            cmd_InsertarEmp.Parameters.AddWithValue("@Apellido", Apellido);
            cmd_InsertarEmp.Parameters.AddWithValue("@FechaNacimiento", FechaNacimiento.Date);
            cmd_InsertarEmp.Parameters.AddWithValue("@FechaContratacion", FechaContratacion.Date);
            cmd_InsertarEmp.Parameters.AddWithValue("@DepartamentoID", DepartamentoID);
            cmd_InsertarEmp.Parameters.AddWithValue("@PuestoTrabajo", PuestoTrabajo);
            cmd_InsertarEmp.Parameters.AddWithValue("@Salario", Salario);
            cmd_InsertarEmp.Parameters.AddWithValue("@Estado", Estado);
            cmd_InsertarEmp.ExecuteNonQuery();

            conexion.MtdCerrarConexion();

        }

        //public int CP_mtdActualizarEs(int EstudianteID, string Nombre, string Apellido, DateTime FechaNaci, DateTime FechaIns, int CarreraID, string Direccion, string Telefono, string Estado)
        //{
        //    int vContarRegistrosAfectados = 0;

        //    string vUspActualizarEs = "uspUpdateEstudiante";
        //    SqlCommand commActualizarEstu = new SqlCommand(vUspActualizarEs, conexion.MtdAbrirConexion());
        //    commActualizarEstu.CommandType = CommandType.StoredProcedure;

        //    commActualizarEstu.Parameters.AddWithValue("@EstudianteID", EstudianteID);
        //    commActualizarEstu.Parameters.AddWithValue("@Nombre", Nombre);
        //    commActualizarEstu.Parameters.AddWithValue("@Apellido", Apellido);
        //    commActualizarEstu.Parameters.AddWithValue("@FechaNacimiento", FechaNaci.Date);
        //    commActualizarEstu.Parameters.AddWithValue("@FechaInscripcion", FechaIns.Date);
        //    commActualizarEstu.Parameters.AddWithValue("@CarreraID", CarreraID);
        //    commActualizarEstu.Parameters.AddWithValue("@Direccion", Direccion);
        //    commActualizarEstu.Parameters.AddWithValue("@Telefono", Telefono);
        //    commActualizarEstu.Parameters.AddWithValue("@Estado", Estado);

        //    vContarRegistrosAfectados = commActualizarEstu.ExecuteNonQuery();

        //    conexion.MtdCerrarConexion();
        //    return vContarRegistrosAfectados;
        //}

        //public int CP_mtdEliminarEs(int codigo)
        //{
        //    int vCantidadRegistrosEliminados = 0;

        //    string vUspEliminarEs = "uspDeleteEstudiante";
        //    SqlCommand commEliminarEs = new SqlCommand(vUspEliminarEs, conexion.MtdAbrirConexion());
        //    commEliminarEs.CommandType = CommandType.StoredProcedure;

        //    commEliminarEs.Parameters.AddWithValue("@EstudianteID", codigo);

        //    vCantidadRegistrosEliminados = commEliminarEs.ExecuteNonQuery();
        //    conexion.MtdCerrarConexion();
        //    return vCantidadRegistrosEliminados;
        //}
    }
}
