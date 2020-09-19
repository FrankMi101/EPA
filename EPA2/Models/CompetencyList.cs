using BLL;
using ClassLibrary;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EPA2
{
    public class CompetencyList
    {
        public CompetencyList() { }

        public static void BuildingList(ref HtmlGenericControl myUl, string userId, string schoolYear, string sessionID, string employeeId, string schoolCode, string category, string domainId)
        {
            //  myUL.InnerHtml = "";
            //   HtmlGenericControl ul = new HtmlGenericControl("ul");

            var parameter = new DomainCompetency()
            {
                UserID = userId,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                EmployeeID = employeeId,
                SessionID = sessionID,
                Category = category,
                DomainID = domainId
            };

            var cList = AppraisalContentsDomain.CommonList<AppraisalComptency>("CompetencyList", parameter);// AppraisalProcess.CompentencyList("List", userId, apprasilYear, schoolCode, employeeId, appraisalSession, category, domainId);
            BuldingListTree(myUl, cList);

        }
        public static void BuildingListForLog(ref HtmlGenericControl myUl, string userId, string schoolYear, string sessionID, string employeeId, string schoolCode, string category, string domainId)
        {


            var parameter = new DomainCompetency()
            {
                UserID = userId,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                EmployeeID = employeeId,
                SessionID = sessionID,
                Category = category,
                DomainID = domainId
            };

            var cList = AppraisalContentsDomain.CompetencyListForLOG(parameter);// AppraisalProcess.CompentencyList("List", userId, apprasilYear, schoolCode, employeeId, appraisalSession, category, domainId);
            BuldingListTree(myUl, cList);

        }
        private static void BuldingListTree(HtmlGenericControl myUl, List<AppraisalComptency> cList)
        {
            myUl.InnerHtml = "";

            foreach (AppraisalComptency row1 in cList)
            {
                string listCode = row1.Competency.ToString();
                string listText = row1.CompetencyName.ToString();
                string imgSign = row1.ContentSign.ToString();
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

                myUl.Controls.Add(li);
            }
            //    myDIV.Controls.Add(ul);

        }
        public static string ListCount(string userId, string schoolYear, string sessionID, string employeeId, string schoolCode, string category, string domainId)
        {
            var parameter = new DomainCompetency()
            {
                Operate = "ListCount",
                UserID = userId,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                EmployeeID = employeeId,
                SessionID = sessionID,
                Category = category,
                DomainID = domainId
            };

            string lCount = AppraisalContentsDomain.CompetencyListCount(parameter).ToString();// AppraisalProcess.CompentencyListCount("ListCount", userId, apprasilYear, schoolCode, employeeId, appraisalSession, category, domainId);
            return lCount;
        }

        public static void BuildingLookForsList(ref GridView myGv, string action, string category, string area, string itemCode, string userId, string schoolYear, string schoolCode, string sessionID, string employeeId, string domainId, string competencyId, string actionRole, string objRole)
        {

            if (action == "Get")
            {
                var parameter = new BuildLookForsList()
                {
                    Operate = "Get",
                    UserID = userId,
                    SchoolYear = schoolYear,
                    SchoolCode = schoolCode,
                    EmployeeID = employeeId,
                    SessionID = sessionID,
                    Category = category,
                    DomainID = domainId,
                    CompetencyID = competencyId,
                    ActionRole = actionRole,
                    ObjRole = objRole
                };
                var llist = AppraisalContentsDomain.CommonList<BuildLookForsList>("LookForsList", parameter);// AppraisalProcess.LookForsList(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, domainId, competencyId, actionRole, objRole);
                int tc = llist.Count;
                myGv.DataSource = llist;
                myGv.DataBind();

            }
            else
            {
                // string value = myText.Text;
                // string result = AppraisalDataDomain.DomainTextContentLOG(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, actionRole, value);
            }
        }
        public static string CurrerntCompetencyId(ref HtmlGenericControl contentCompetency, string domainId)
        {
            if (domainId == "6")
            {
                return "20";
            }
            else
            {
                foreach (Control c in contentCompetency.Controls)
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
