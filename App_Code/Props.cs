using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Propcs
/// </summary>
public class Props
{
    #region User 

    public string userName { get; set; }
    public string firstName { get; set; }
    public string lastName { get; set; }
    public string password { get; set; }
    public string email { get; set; }
    public string contact { get; set; }
    public string address { get; set; }
    public string dob { get; set; }
    public string userType { get; set; }
    public string isActive { get; set; }
    public string createBy { get; set; }
    public string createAt { get; set; }
    public string updateBy { get; set; }
    public string updateAt { get; set; }

    #endregion

    public Props()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}