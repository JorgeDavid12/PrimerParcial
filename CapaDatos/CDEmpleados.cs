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

        public int CP_mtdActualizarEmp(int EmpleadoID, string Nombre, string Apellido, DateTime FechaNacimiento, DateTime FechaContratacion, int DepartamentoID, string PuestoTrabajo, decimal Salario, string Estado)
        {
            int vContarRegistrosAfectados = 0;

            string vUspActualizarEmp = "uspUpdateEmpleados";
            SqlCommand commActualizarEmp = new SqlCommand(vUspActualizarEmp, conexion.MtdAbrirConexion());
            commActualizarEmp.CommandType = CommandType.StoredProcedure;

            commActualizarEmp.Parameters.AddWithValue("@EmpleadoID", EmpleadoID);
            commActualizarEmp.Parameters.AddWithValue("@Nombre", Nombre);
            commActualizarEmp.Parameters.AddWithValue("@Apellido", Apellido);
            commActualizarEmp.Parameters.AddWithValue("@FechaNacimiento", FechaNacimiento.Date);
            commActualizarEmp.Parameters.AddWithValue("@FechaContratacion", FechaContratacion.Date);
            commActualizarEmp.Parameters.AddWithValue("@DepartamentoID", DepartamentoID);
            commActualizarEmp.Parameters.AddWithValue("@PuestoTrabajo", PuestoTrabajo);
            commActualizarEmp.Parameters.AddWithValue("@Salario", Salario);
            commActualizarEmp.Parameters.AddWithValue("@Estado", Estado);

            vContarRegistrosAfectados = commActualizarEmp.ExecuteNonQuery();

            conexion.MtdCerrarConexion();
            return vContarRegistrosAfectados;
        }

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
