﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //protected void btnLogin_Click(object sender, EventArgs e)
    //{
    //    ClientScript.RegisterClientScriptBlock(GetType(), "sas", "<script> Swal.fire('It Worked!', '', 'success')</script>", true);
    //}

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //ClientScript.RegisterClientScriptBlock(GetType(), "sas", "<script> alert('Worked');</script>", true);
        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "anything", "demo()", true);
    }
}