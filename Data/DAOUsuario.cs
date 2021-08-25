using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;
using NpgsqlTypes;
using Utilitarios;
using MySql.Data.MySqlClient;


namespace Data
{
    public class DAOUsuario
    {
        public DAOUsuario()
        {
            //
            // TODO: Agregar aquí la lógica del constructor
            //
        }
        public DataTable Login(string Nombre, string Password)
        {
            DataTable Usuario = new DataTable();
            MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringMySql"].ConnectionString);

            try
            {
                MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_LOGIN", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("Nom", MySqlDbType.VarChar, 20).Value = Nombre;
                dataAdapter.SelectCommand.Parameters.Add("Pass", MySqlDbType.VarChar, 12).Value = Password;

                conection.Open();
                dataAdapter.Fill(Usuario);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return Usuario;
        }
        public void CrearUsuario(BO_Usuario BOusuario)
        {
            MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringMySql"].ConnectionString);

            try
            {
                conection.Open();
                MySqlCommand command = new MySqlCommand("SP_CREAR_USUARIO", conection);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("Ced", MySqlDbType.Int16, 10).Value = BOusuario.Cedula;
                command.Parameters.Add("Ape", MySqlDbType.VarChar, 30).Value = BOusuario.Apellidos;
                command.Parameters.Add("Nom", MySqlDbType.VarChar, 30).Value = BOusuario.Nombres;
                command.Parameters.Add("Fecha", MySqlDbType.Datetime).Value = BOusuario.Fecha;
                command.Parameters.Add("Eda", MySqlDbType.Int16, 2).Value = BOusuario.Edad;
                command.Parameters.Add("Con", MySqlDbType.VarChar, 12).Value = BOusuario.Contra;
                command.Parameters.Add("Corr", MySqlDbType.VarChar, 20).Value = BOusuario.Correo;
                command.Parameters.Add("IdRol", MySqlDbType.Int16, 3).Value = BOusuario.IdRol;
                command.Parameters.Add("IdDep", MySqlDbType.Int16, 3).Value = BOusuario.IdDep;
                command.Parameters.Add("Logg", MySqlDbType.VarChar, 20).Value = BOusuario.Loggin;

                command.ExecuteNonQuery();

            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
        }
        public DataTable Datos()
        {
            DataTable Usuario = new DataTable();
            MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["pepito"].ConnectionString);

            try
            {
                MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_Notas", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                conection.Open();
                dataAdapter.Fill(Usuario);
            }
            catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {
                if (conection != null)
                {
                    conection.Close();
                }
            }
            return Usuario;
        }

    }
}