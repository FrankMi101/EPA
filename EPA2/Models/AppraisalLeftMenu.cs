using System.Web;
using System.Data;
using System.Web.Security;
using System.Web.UI;
/// <summary>
/// Summary description for WorkingProfile
/// </summary>
/// 
using DataAccess;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EPA2
{
    public class AppraisalLeftMenu : System.Web.UI.Page
    {
        public AppraisalLeftMenu()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static void BuildingMenu(ref HtmlGenericControl myDIV, string category, string userID, string appraisalYear, string appraisalSession, string appraisalPhase, string employeeID, string schoolCode, string role)
        {
            myDIV.InnerHtml = "";
            string Evaluation = WebConfig.getValuebyKey("EvaluationYear"); // "NE0,NE1,NE2,NE3,NE4";
            int aYear = System.Int32.Parse(appraisalYear);
            int openYear = System.Int32.Parse(WorkingProfile.OpenSchoolYear);
            string passApprYear = "No";
            if (aYear < openYear)
            { passApprYear = "Yes"; }

            DataSet myDS1 = AppraisalProcess.AppraisalMenuItem("0", userID, appraisalYear, schoolCode, employeeID, appraisalSession, category);
            string menuEnable = "Yes";
            foreach (DataRow row1 in myDS1.Tables[0].Rows)
            {
                string areaCode = row1["Appraisal_Area"].ToString();
                string areaText = row1["Appraisal_Text"].ToString();
                HtmlGenericControl myAreaTitle = new HtmlGenericControl("div");
                myAreaTitle.ID = "MenuTitle" + areaCode;


                string rate = "";
                switch (areaText)
                {
                    case "Improvement Plan":
                        rate = AppraisalDataAC.AppraisalRate(userID, appraisalYear, schoolCode, employeeID, appraisalSession, category, "SUM", "SUM61");
                        if (rate == "Unsatisfactory")
                        { menuEnable = "Yes"; }
                        else 
                         { menuEnable = "No"; }
                        break;
                    case "Enrichment Plan":
                        rate = AppraisalDataAC.AppraisalRate(userID, appraisalYear, schoolCode, employeeID, appraisalSession, category, "SUM", "SUM61");
                        if (rate == "Development Needed")
                        { menuEnable = "Yes"; }
                        else
                        { menuEnable = "No"; }
                        break;
                    case "Evidence Log":
                    case "Classroom Observation":
                    case "Summative Report":
                    case "Performance Plan":
                    case "Professional Dialog and Meeting":
                        if (Evaluation.IndexOf(appraisalPhase) == -1)
                        { menuEnable = "No"; }
                        break;
                    default:
                        menuEnable = "Yes";
                        break;
                }
                string areaLink = "<a href='Loading2.aspx?pID=Summary&aID=" + areaCode + "' target='GoPageiFrame' >" + areaText + "</a>";
                if (menuEnable == "No")
                {
                    myAreaTitle.Disabled = true;
                    myAreaTitle.Attributes.Add("class", "categoryDisable");
                    areaLink = areaText;
                }
                else
                {
                    myAreaTitle.Attributes.Add("class", "category");
                }

                myAreaTitle.InnerHtml = areaLink; // .InnerText = areaText;


                //  myDIV.Controls.Add(alink0);
                myDIV.Controls.Add(myAreaTitle);

                HtmlGenericControl myArea = new HtmlGenericControl("div");
                myArea.ID = "Menu" + areaCode;

                DataSet myDS2 = AppraisalProcess.AppraisalMenuItem("2", userID, appraisalYear, schoolCode, employeeID, appraisalSession, category, areaCode, appraisalPhase);

                HtmlGenericControl myUL = new HtmlGenericControl("ul");
                myUL.Attributes.Add("class", "leafMenu" + areaCode);


                foreach (DataRow row2 in myDS2.Tables[0].Rows)
                {
                    string pCode = row2["Appraisal_Code"].ToString();
                    string aText = row2["Appraisal_Text"].ToString();
                    string aImag = row2["Appraisal_img"].ToString();
                    string level = row2["TreeLevel"].ToString();
                    string contentPage = row2["Content_Page"].ToString();
                    HtmlGenericControl li = new HtmlGenericControl("li");
                    HtmlImage aimg = new HtmlImage();
                    aimg.Src = aImag;

                    HtmlAnchor alink = new HtmlAnchor();
                    alink.HRef = "Loading2.aspx?pID=" + pCode +"&aID=" + pCode;
                    alink.Target = "GoPageiFrame";
                    alink.InnerHtml = aText;
                    alink.Title = aText;
                    li.ID = "li_" + pCode;
                    li.Controls.Add(aimg);
                    li.Controls.Add(alink);

                    if (passApprYear == "Yes")
                    {
                        if (contentPage != "PDFPage")
                        {
                            alink.HRef = "";
                            alink.Disabled = true;
                            alink.Attributes.Add("class", "itemDisable");
                        }
                    }


                    DataSet myDS3 = AppraisalProcess.AppraisalMenuItem(pCode, userID, appraisalYear, schoolCode, employeeID, appraisalSession, category, areaCode, appraisalPhase);
                    if (myDS3.Tables[0].Rows.Count > 0)
                    {
                        HtmlGenericControl myUL2 = new HtmlGenericControl("ul");
                        myUL2.Attributes.Add("class", "Menulevel2");
                        foreach (DataRow row3 in myDS3.Tables[0].Rows)
                        {
                            pCode = row3["Appraisal_Code"].ToString();
                            aText = row3["Appraisal_Text"].ToString();
                            aImag = row3["Appraisal_img"].ToString();
                            level = row3["TreeLevel"].ToString();
                            HtmlGenericControl li2 = new HtmlGenericControl("li");
                            HtmlImage aimg2 = new HtmlImage();

                            aimg2.Src = aImag;

                            HtmlAnchor alink2 = new HtmlAnchor();
                            alink2.HRef = "Loading2.aspx?pID=" + pCode + "&aID=" + pCode;
                            alink2.Target = "GoPageiFrame";
                            alink2.InnerHtml = aText;
                            alink2.Title = aText;
                            li2.ID = "li_" + pCode;
                            li2.Controls.Add(aimg2);
                            li2.Controls.Add(alink2);
                            myUL2.Controls.Add(li2);

                            if (passApprYear == "Yes")
                            {
                                if (contentPage != "PDFPage")
                                {
                                    alink2.HRef = "";
                                    alink2.Disabled = true;
                                    alink2.Attributes.Add("class", "itemDisable");
                                }
                            }

                        }
                        li.Controls.Add(myUL2);

                    }
                    myUL.Controls.Add(li);
                    myArea.Controls.Add(myUL);
                }
                myDIV.Controls.Add(myArea);

            }
            // ************* for test postback purpose ************************
            //Button myButton = new Button();
            //myButton.ID = "btnPostBack";
            //myButton.Text = "Postback iFrame ";
            //myDIV.Controls.Add(myButton);
            // ****************************************************************
        }
        public static void BuildingTitleTab(ref HtmlGenericControl myDIV, string userID, string category, string area, string code)
        {
            myDIV.InnerHtml = "";

            string title = TitleContext.Content("Title", userID, category, area, code);       // AppraisalProcess.AppraisalPageTitle("0", category,area,code,role);
            HtmlGenericControl span = new HtmlGenericControl("span");
            span.ID = "title_" + code;
            span.Attributes.Add("class", "pageTitle");
            span.InnerText = title;
            span.Attributes.Add("title", category + "-" + area + "-" + code);
            myDIV.Controls.Add(span);
            HtmlImage img = new HtmlImage();
            img.ID = "img_" + code;
            img.Src = "../images/help2.png";
            img.Attributes.Add("class", "helpImg");


            myDIV.Controls.Add(img);
        }


    }
}