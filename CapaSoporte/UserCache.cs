using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaSoporte
{
    public class UserCache
    {
        // get y set de datos usuario
        public static int id { get; set; }
        public static string nom { get; set; }
        public static string ape { get; set; }
        public static string lada { get; set; }
        public static string tel { get; set; }
        public static string coreo { get; set;}
        public static string sex { get; set;}
        public static string ciudad { get; set; }
        public static int idc { get; set; }
        public static DateTime fhC { get; set;}
        public static DateTime fhN { get; set;}
        public static string user { get; set;}
        public static string pass { get; set; }
        /// get y set de la tabla cargo
        public static string cargo { get; set; }
        public static string funcion { get; set; }
        public static decimal sueldo { get; set; }
    }
}
