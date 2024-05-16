using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class UserModel
    {
        CD_Usuarios userdata = new CD_Usuarios();
        public bool LoginUser(string user, string pass)
        {
            return userdata.Login(user, pass);
        }
        public void Cargo(int cargo)
        {
            userdata.Cargo(cargo);
        }
    }
}
