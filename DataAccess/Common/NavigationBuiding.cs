using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.HtmlControls;

namespace DataAccess
{
    public class NavigationBuilding
    {
        public NavigationBuilding() { }

        public static void Tab(ref HtmlGenericControl myDIVTab, string vType, string userID, string schoolYear, string role, string grade)
        {
            try
            {
                HtmlGenericControl myUL = new HtmlGenericControl("ul");
                DataSet myData = AppraisalProcess.AppraisalCategorye("Category", userID, schoolYear);

                int tabCount = myData.Tables[0].Rows.Count;
                foreach (DataRow row in myData.Tables[0].Rows)
                {
                    string TabText1 = row["Category"].ToString();

                    HtmlGenericControl myli = new HtmlGenericControl("li");
                    myli.ID = row["CategoryID"].ToString();
                    HtmlAnchor aLink = new HtmlAnchor();
                    aLink.InnerText = TabText1;
                    aLink.ID = row["CategoryID"].ToString();
                    aLink.HRef = "#"; // "javascript:Naction();"
                    if (row[""].ToString() == grade)
                    {
                        myli.Attributes.Add("class", "liTabHS");
                        aLink.Attributes.Add("class", "aLinkTabHS");
                    }
                    else
                    {
                        myli.Attributes.Add("class", "liTabH");
                        aLink.Attributes.Add("class", "aLinkTabH");
                    }

                    if (TabText1.Length > 9)
                    {
                        myli.Style.Add("width", "100");
                    }
                    else
                    {
                        if (TabText1.Length > 9)
                        {
                            myli.Style.Add("width", "80");
                        }
                        else
                        {
                            myli.Style.Add("width", "60");  
                        }
                    }
                    myli.InnerText = "";

                    myli.Controls.Add(aLink);
                    myUL.Controls.Add(myli);

                }


                myDIVTab.Controls.Add(myUL);

            }
            catch (Exception ex)
            {
                var ms = ex.Message;
            }
        }
    }

}
