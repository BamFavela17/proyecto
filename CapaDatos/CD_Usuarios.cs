using CapaSoporte;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_Usuarios
    {
        private ConexionSQL conn = new ConexionSQL();
        public bool Login(string user, string pass)
        {
            using (conn.AbrirConexion())
            {
                using (var command = new SqlCommand())
                {
                    string consulta = "select * from Empleados where Usuario = '" + user + "' and Contraseña = '" + pass + "'";
                    SqlCommand cmd = new SqlCommand(consulta, conn.AbrirConexion());
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            UserCache.id = reader.GetInt32(0);
                            UserCache.nom = reader.GetString(1);
                            UserCache.ape = reader.GetString(2);
                            UserCache.lada = reader.GetString(3);
                            UserCache.tel = reader.GetString(4);
                            UserCache.coreo = reader.GetString(5);
                            UserCache.sex = reader.GetString(6);
                            UserCache.ciudad = reader.GetString(7);
                            UserCache.idc = reader.GetInt32(8);
                            UserCache.fhC = reader.GetDateTime(9);
                            UserCache.fhN = reader.GetDateTime(10);
                            UserCache.user = reader.GetString(11);
                            UserCache.pass = reader.GetString(12);
                        }
                        return true;
                    }
                    else
                        return false;
                }
            }
        }
        public void Cargo(int id)
        {
            using (conn.AbrirConexion())
            {
                using (var command = new SqlCommand())
                {
                    string consulta = "select * from Cargo where idC = '" + id + "'";
                    SqlCommand cmd = new SqlCommand(consulta, conn.AbrirConexion());
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            UserCache.cargo = reader.GetString(1);
                            UserCache.funcion = reader.GetString(2);
                            UserCache.sueldo = reader.GetDecimal(3);
                        }

                    }
                }
            }
        }
    }
}

