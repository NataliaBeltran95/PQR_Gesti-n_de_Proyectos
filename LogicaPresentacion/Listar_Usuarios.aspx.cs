using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;


public partial class Presentacion_Listar_Usuarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public void llenar(int id_rol) {
        Usuario conexion = new Usuario();
        GV_usuarios.DataSource = conexion.consultarUsuario(id_rol);
        GV_usuarios.DataBind();



    }

    
    

}