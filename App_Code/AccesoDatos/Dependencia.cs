using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using MySql.Data.MySqlClient;

/// <summary>
/// Descripción breve de Dependencia
/// </summary>
public class Dependencia
{
	public Dependencia()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public DataTable Select()
    {
        MySqlConnection dataConnection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);
        DataTable dataTable = new DataTable();
        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_LISTAR_DEPENDENCIAS", dataConnection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataConnection.Open();
            dataAdapter.Fill(dataTable);
        }
        catch (Exception e)
        {
            throw e;
        }
        finally
        {
            if (dataConnection != null)
            {
                dataConnection.Close();
            }
        }
        return dataTable;
    }
    public void CrearDependencia(BO_Dependencia BOdependencia)
    {
        MySqlConnection conection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);

        try
        {
            conection.Open();
            MySqlCommand command = new MySqlCommand("SP_CREAR_DEPENDENCIA", conection);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("Nom", MySqlDbType.VarChar, 20).Value = BOdependencia.Nombre;
            command.Parameters.Add("Dire", MySqlDbType.VarChar, 30).Value = BOdependencia.Direccion;
            command.Parameters.Add("Tele", MySqlDbType.Int16, 7).Value = BOdependencia.Telefono;

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
}
