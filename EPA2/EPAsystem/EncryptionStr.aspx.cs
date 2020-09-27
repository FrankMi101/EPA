using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
namespace EPA2.EPAsystem
{
    public partial class EncryptionStr : System.Web.UI.Page
    {
        const string dBSource = "Data Source=";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                TextEncrypStr.Text = "";
                TextDecrypStr.Text = "";
                TextObjStr.Text = "";


                AppraisalPage.SetListValue(DropDownList1, DBConnection.CurrentDB);
                var cDB = DropDownList1.SelectedValue; //   DBConnection.CurrentDB ;
                var constr = DBConnection.ConnectionSTR(cDB);
               
                if (constr.Substring(0, 12) == dBSource)
                {
                    ButtonEncryption.Enabled = true;
                    TextObjStr.Text = constr;
                }
                else
                {
                    TextEncrypStr.Text = constr;
                    ButtonEncryption.Enabled = false;
                }
            }
        }

        protected void ButtonEncryption_Click(object sender, EventArgs e)
        {
            TextEncrypStr.Text = GetMySymetricEncryption.GetMyEncryptedValue(TextObjStr.Text);

        }

        protected void ButtonDecryption_Click(object sender, EventArgs e)
        {
              TextDecrypStr.Text = GetMySymetricEncryption.GetMyDecryptedValue(TextEncrypStr.Text);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            var cDB = DropDownList1.SelectedValue; //   DBConnection.CurrentDB ;
 
            if (cDB == "Other")
            {
                ButtonEncryption.Enabled = true;
                ButtonEncryption.Enabled = true;
            }
            else
            {
                var constr = DBConnection.ConnectionSTR(cDB);
                if (constr.Substring(0, 12) == dBSource)
                {
                    ButtonEncryption.Enabled = true;
                    TextObjStr.Text = constr;
                }
                else
                {
                    TextEncrypStr.Text = constr;
                    ButtonEncryption.Enabled = false;
                }
            }


        }
    }
}