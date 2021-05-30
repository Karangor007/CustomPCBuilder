using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Propcs
/// </summary>
public class Props
{
    #region Client Side Image Source
    public static string imageClientSource()
    {
        return "assets/images/";
    }

    #endregion

    #region User 
    public string id { get; set; }
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

    #region RAM
    public string ram_id { get; set; }
    public string ram_brand { get; set; }
    public string ram_size { get; set; }
    public string ram_type { get; set; }
    public string ram_price { get; set; }
    public string ram_stock { get; set; }
    public string ram_img { get; set; }
    public string ram_frequency { get; set; }
    public string ram_channel { get; set; }
    public string ram_model { get; set; }
    #endregion

    #region Platform
    public string platform_id { get; set; }
    public string platform_name { get; set; }
    public string platform_brand { get; set; }
    public string platform_image { get; set; }
    #endregion

    #region Processor
    public string processor_id { get; set; }
    public string processor_model { get; set; }
    public string processor_brand { get; set; }
    public string processor_clock_speed { get; set; }
    public string processor_socket_type { get; set; }
    public string processor_price { get; set; }
    public string processor_stock { get; set; }
    public string processor_image { get; set; }
    #endregion

    #region MotherBoard
    public string motherboard_id { get; set; }
    public string motherboard_brand { get; set; }
    public string motherboard_model { get; set; }
    public string motherboard_storage { get; set; }
    public string motherboard_stock { get; set; }
    public string motherboard_price { get; set; }
    public string motherboard_image { get; set; }

    #endregion

    #region GPU
    public string GPU_id { get; set; }
    public string GPU_model { get; set; }
    public string GPU_brand { get; set; }
    public string GPU_ramType { get; set; }
    public string GPU_ramSize { get; set; }
    public string GPU_interface { get; set; }
    public string GPU_image { get; set; }
    public string GPU_price { get; set; }
    public string GPU_stock { get; set; }

    #endregion

    #region SMPS   
    public string SMPS_id { get; set; }
    public string SMPS_model { get; set; }
    public string SMPS_brand { get; set; }
    public string SMPS_wattage { get; set; }
    public string SMPS_price { get; set; }
    public string SMPS_stock { get; set; }
    public string SMPS_image { get; set; }
    #endregion

    #region Cooler
    public string Cooler_id { get; set; }
    public string Cooler_model { get; set; }
    public string Cooler_brand { get; set; }
    public string Cooler_wattage { get; set; }
    public string Cooler_price { get; set; }
    public string Cooler_stock { get; set; }
    public string Cooler_image { get; set; }
    #endregion

    #region Storage
    public string Storage_id { get; set; }
    public string Storage_brand { get; set; }
    public string Storage_model { get; set; }
    public string Storage_size { get; set; }
    public string Storage_interface { get; set; }
    public string Storage_price { get; set; }
    public string Storage_stock { get; set; }
    public string Storage_image { get; set; }

    #endregion

    #region Wifi
    public string WiFi_id { get; set; }
    public string WiFi_model { get; set; }
    public string WiFi_brand { get; set; }
    public string WiFi_speed { get; set; }
    public string WiFi_interface { get; set; }
    public string WiFi_image { get; set; }
    public string WiFi_stock { get; set; }
    public string WiFi_price { get; set; }
    #endregion

    #region Pre Built PC
    public string pre_id            { get; set; }
    public string pre_model         { get; set; }
    public string pre_brand         { get; set; }
    public string pre_cooler        { get; set; }
    public string pre_cpu           { get; set; }
    public string pre_details       { get; set; }
    public string pre_gpu           { get; set; }
    public string pre_image         { get; set; }
    public string pre_in_stock      { get; set; }
    public string pre_motherboard   { get; set; }
    public string pre_pcCase        { get; set; }
    public string pre_pcType        { get; set; }
    public string pre_platform      { get; set; }
    public string pre_price         { get; set; }
    public string pre_ram           { get; set; }
    public string pre_smps          { get; set; }
    public string pre_storage1      { get; set; }
    public string pre_storage2      { get; set; }
    public string pre_wattage       { get; set; }
    public string pre_wifiCard      { get; set; }    
    #endregion

    #region Mail
    public string mailName { get; set; }
    public string mailEmail { get; set; }
    public string mailContact { get; set; }
    public string mailMessage { get; set; }
    #endregion
    public Props()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}