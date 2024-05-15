using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
namespace CapaNegocio
{
    public class CN_Crud
    {
        CD_Crud objCD = new CD_Crud(); 

        public DataTable MostrarEmp()
        {
              
            DataTable tabla = new DataTable();
            tabla = objCD.Mostrar();
            return tabla;
        }
        public void InsertarEmp(string nom, string ape, int tipo, DateTime fhN, DateTime fhC, string dir, string tel, string cor, int turno, string user, string pass)
        {

            objCD.InsertarEmpleado(nom, ape, tipo, fhN, fhC, dir, tel, cor, turno, user, pass);
        }

        public void EditarEmp(string nom, string ape, int tipo, DateTime fhN, DateTime fhC, string dir, string tel, string cor, int turno, string user, string pass, string id)
        {
            objCD.EditarEmpleado(nom, ape, tipo, fhN, fhC, dir, tel, cor, turno, user, pass,id);
        }

        public void EliminarEmp(string id)
        {

            objCD.EliminarEmpleado(Convert.ToInt32(id));
        }
    }
}
