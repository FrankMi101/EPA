using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using DataAccess;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace EPA2
{
    public class CompetencyList
    {
        public CompetencyList() { }

        public static void BuildingList(ref HtmlGenericControl myUL,  string userID, string apprasilYear, string appraisalSession, string employeeID, string schoolCode, string category, string domainID)
        {
            myUL.InnerHtml = "";
         //   HtmlGenericControl ul = new HtmlGenericControl("ul");

            DataTable cTable = AppraisalProcess.CompentencyList("List", userID, apprasilYear, schoolCode, employeeID, appraisalSession, category, domainID);
            foreach (DataRow row1 in cTable.Rows)
            {
                string listCode = row1["Appraisal_Competency"].ToString();
                string listText = row1["Appraisal_CompetencyName"].ToString();
                string imgSign = row1["ContentSign"].ToString();
                HtmlGenericControl li = new HtmlGenericControl("li");

                HtmlImage aimg = new HtmlImage();
                aimg.Src = imgSign;
                aimg.ID = "img_" + listCode;
                HtmlAnchor alink = new HtmlAnchor();
                alink.ID = listCode;
                alink.HRef = "#";
                alink.Target = "";
                alink.InnerHtml = listText;
                alink.Attributes.Add("class", "cList");

                li.ID = "li_" + listCode;
                li.Controls.Add(aimg);
                li.Controls.Add(alink);

                myUL.Controls.Add(li); 
            }
        //    myDIV.Controls.Add(ul);

        }
        public static void BuildingListForLOG(ref HtmlGenericControl myUL, string userID, string apprasilYear, string appraisalSession, string employeeID, string schoolCode, string category, string domainID)
        {
            myUL.InnerHtml = "";
            //   HtmlGenericControl ul = new HtmlGenericControl("ul");

            DataTable cTable = AppraisalProcess.CompentencyListForLOG("List", userID, apprasilYear, schoolCode, employeeID, appraisalSession, category, domainID);
            foreach (DataRow row1 in cTable.Rows)
            {
                string listCode = row1["Appraisal_Competency"].ToString();
                string listText = row1["Appraisal_CompetencyName"].ToString();
                string imgSign = row1["ContentSign"].ToString();
                HtmlGenericControl li = new HtmlGenericControl("li");

                HtmlImage aimg = new HtmlImage();
                aimg.Src = imgSign;
                aimg.ID = "img_" + listCode;
                HtmlAnchor alink = new HtmlAnchor();
                alink.ID = listCode;
                alink.HRef = "#";
                alink.Target = "";
                alink.InnerHtml = listText;
                alink.Attributes.Add("class", "cList");

                li.ID = "li_" + listCode;
                li.Controls.Add(aimg);
                li.Controls.Add(alink);

                myUL.Controls.Add(li);
            }
            //    myDIV.Controls.Add(ul);

        }
        public static string listCount(string userID, string apprasilYear, string appraisalSession, string employeeID, string schoolCode, string category, string domainID)
        {
            string lCount = AppraisalProcess.CompentencyListCount("ListCount", userID, apprasilYear, schoolCode, employeeID, appraisalSession, category, domainID);
            return   lCount;
        }

        public static void BuildingLookForsList(ref GridView myGV, string action, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID, string domainID, string competencyID, string actionRole,string objRole)
        {

            if (action == "Get")
            {
                DataSet DS = AppraisalProcess.LookForsList(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area,itemCode,domainID, competencyID, actionRole,objRole);
                int tc = DS.Tables[0].Rows.Count; 
                myGV.DataSource = DS;
                myGV.DataBind();

            }
            else
            {
                // string value = myText.Text;
                // string result = AppraisalDataDomain.DomainTextContentLOG(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, actionRole, value);
            }
        }
        public static  string CurrerntCompetencyID(ref HtmlGenericControl ContentCompetency, string DomainID )
        {
            if (DomainID == "6")
            {
                return "20";
            }
            else
            {                         
                foreach (Control c in ContentCompetency.Controls)
                {
                    foreach (Control childc in c.Controls)
                    {
                        if (childc is HtmlAnchor)
                        {
                            return childc.ID;
                        }
                    }
                }
                return "1";
            }

        }
    }


}
