using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using MySql.Data.MySqlClient;


/// <summary>
/// Descripción breve de Roles
/// </summary>
public class Roles
{
	public Roles()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public DataTable SelectActivo()
    {
        MySqlConnection dataConnection = new MySqlConnection(ConfigurationManager.ConnectionStrings["localhost"].ConnectionString);
        DataTable dataTable = new DataTable();
        
        try
        {
            MySqlDataAdapter dataAdapter = new MySqlDataAdapter("SP_LISTAR_ROL", dataConnection);
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
}
