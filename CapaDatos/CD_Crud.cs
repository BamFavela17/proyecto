using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.ConstrainedExecution;

namespace CapaDatos
{
    public class CD_Crud
    {
        private ConexionSQL conn = new ConexionSQL();

        SqlDataReader leer;
        DataTable tabla = new DataTable();
        SqlCommand comando = new SqlCommand();

        // CRUD de la tabla empleado
        public DataTable Mostrar()
        {

            comando.Connection = conn.AbrirConexion();
            comando.CommandText = "MostrarUsuarios";
            comando.CommandType = CommandType.StoredProcedure;
            leer = comando.ExecuteReader();
            tabla.Load(leer);
            conn.CerrarConexion();
            return tabla;
        }

        public void InsertarEmpleado(string nom, string ape, int tipo, DateTime fhN, DateTime fhC,string dir, string tel, string cor, int turno, string user, string pass)
        {
            //PROCEDIMNIENTO

            // abrimos coneccion
            comando.Connection = conn.AbrirConexion();
            // hacemos uso del procedure insertar
            comando.CommandText = "InsertarUsuarios";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Nombres", nom);
            comando.Parameters.AddWithValue("@Apellidos", ape);
            comando.Parameters.AddWithValue("@Puesto", tipo);
            comando.Parameters.AddWithValue("@FhNa", fhN);
            comando.Parameters.AddWithValue("@FhCon", fhC);
            comando.Parameters.AddWithValue("@Dir",dir );
            comando.Parameters.AddWithValue("@Tel", tel);
            comando.Parameters.AddWithValue("@cor", cor);
            comando.Parameters.AddWithValue("@idTurno", turno);
            comando.Parameters.AddWithValue("@usuario", user);
            comando.Parameters.AddWithValue("@contraseña", pass);
            

            comando.ExecuteNonQuery();

            comando.Parameters.Clear();

        }

        public void EditarEmpleado(string nom, string ape, int tipo, DateTime fhN, DateTime fhC, string dir, string tel, string cor, int turno, string user, string pass, string id)
        {
            // abrimos conexion 
            comando.Connection = conn.AbrirConexion();
            // hacemos uso del procedure editar
            comando.CommandText = "ActualizarUsuarios";
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Nombres", nom);
            comando.Parameters.AddWithValue("@Apellidos", ape);
            comando.Parameters.AddWithValue("@Puesto", tipo);
            comando.Parameters.AddWithValue("@FhNa", fhN);
            comando.Parameters.AddWithValue("@FhCon", fhC);
            comando.Parameters.AddWithValue("@Dir", dir);
            comando.Parameters.AddWithValue("@Tel", tel);
            comando.Parameters.AddWithValue("@cor", cor);
            comando.Parameters.AddWithValue("@idTurno", turno);
            comando.Parameters.AddWithValue("@usuario", user);
            comando.Parameters.AddWithValue("@contraseña", pass);
            comando.Parameters.AddWithValue("@id", id);

            comando.ExecuteNonQuery();

            comando.Parameters.Clear();
        }

        public void EliminarEmpleado(int id)
        {
            // abrimos coneccion
            comando.Connection = conn.AbrirConexion();
            // hacemos uso del procedure eliminar
            comando.CommandText = "borrarUsuarios";
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@id", id);

            comando.ExecuteNonQuery();

            comando.Parameters.Clear();
        }
    }
}
