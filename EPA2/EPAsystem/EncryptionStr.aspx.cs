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

                AppraisalPage.SetListValue(DropDownList1, DBConnection.CurrentDB);
               var cDB = DropDownList1.SelectedValue; //   DBConnection.CurrentDB ;
                var constr = DBConnection.ConnectionSTR(cDB);
                TextObjStr.Text = constr;
                if (TextObjStr.Text.Substring(0, 12) == dBSource)
                {
                    ButtonEncryption.Enabled = true;
                }
                else
                {
                    ButtonEncryption.Enabled = false;
                }
            }
        }

        protected void ButtonEncryption_Click(object sender, EventArgs e)
        {
            TextEncrypStr.Text = mySymetricEncryption.GetEncryptedValue(TextObjStr.Text);

        }

        protected void ButtonDecryption_Click(object sender, EventArgs e)
        {
            if (TextObjStr.Text.Substring(0, 12) != dBSource)
                TextDecrypStr.Text = mySymetricEncryption.GetDecryptedValue(TextObjStr.Text);
            else
                TextDecrypStr.Text = mySymetricEncryption.GetDecryptedValue(TextEncrypStr.Text);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            var cDB = DropDownList1.SelectedValue; //   DBConnection.CurrentDB ;
            var constr = DBConnection.ConnectionSTR(cDB);
            TextObjStr.Text = constr;
            TextEncrypStr.Text = "";
            TextDecrypStr.Text = "";
            if (TextObjStr.Text.Substring(0, 12) == dBSource)
            {
                ButtonEncryption.Enabled = true;
            }
            else
            {
                ButtonEncryption.Enabled = false;
            }
        }
    }
}