/// <summary>
/// Summary description for WorkingProfile
/// </summary>
/// 
using BLL;
using ClassLibrary;
using System.Collections.Generic;
using System.Web.UI.HtmlControls;

namespace EPA2
{
    //public class AppraisalLeftMenu : System.Web.UI.Page
    //{
    //    public AppraisalLeftMenu()
    //    {
    //        //
    //        // TODO: Add constructor logic here
    //        //
    //    }

    //    public static void BuildingMenu(ref HtmlGenericControl myDiv, string category, string userId, string appraisalYear, string appraisalSession, string appraisalPhase, string employeeId, string schoolCode, string role)
    //    {
    //        myDiv.InnerHtml = "";
    //        string evaluation = WebConfig.getValuebyKey("EvaluationYear"); // "NE0,NE1,NE2,NE3,NE4";
    //        int aYear = System.Int32.Parse(appraisalYear);
    //        int openYear = System.Int32.Parse(WorkingProfile.OpenSchoolYear);
    //        string passApprYear = "No";
    //        if (aYear < openYear)
    //        { passApprYear = "Yes"; }

    //        DataSet myDs1 = AppraisalProcess.AppraisalMenuItem("0", userId, appraisalYear, schoolCode, employeeId, appraisalSession, category);
    //        string menuEnable = "Yes";
    //        foreach (DataRow row1 in myDs1.Tables[0].Rows)
    //        {
    //            string areaCode = row1["AppraisalArea"].ToString();
    //            string areaText = row1["AppraisalText"].ToString();
    //            HtmlGenericControl myAreaTitle = new HtmlGenericControl("div");
    //            myAreaTitle.ID = "MenuTitle" + areaCode;


    //            string rate = AppraisalProcess.AppraisalRate(userId, appraisalYear, schoolCode, employeeId, appraisalSession, category, "SUM", "SUM61");
    //            switch (areaText)
    //            {
    //                case "Improvement Plan":
    //                     if (rate == "Unsatisfactory")
    //                    { menuEnable = "Yes"; }
    //                    else
    //                    { menuEnable = "No"; }
    //                    break;
    //                case "Enrichment Plan":
    //                     if (rate == "Development Needed")
    //                    { menuEnable = "Yes"; }
    //                    else
    //                    { menuEnable = "No"; }
    //                    break;
    //                case "Evidence Log":
    //                case "Classroom Observation":
    //                case "Summative Report":
    //                case "Performance Plan":
    //                case "Professional Dialog and Meeting":
    //                    if (evaluation.IndexOf(appraisalPhase) == -1)
    //                    { menuEnable = "No"; }
    //                    break;
    //                default:
    //                    menuEnable = "Yes";
    //                    break;
    //            }
    //            string areaLink = "<a href='Loading2.aspx?pID=Summary&aID=" + areaCode + "' target='GoPageiFrame' >" + areaText + "</a>";
    //            if (menuEnable == "No")
    //            {
    //                myAreaTitle.Disabled = true;
    //                myAreaTitle.Attributes.Add("class", "categoryDisable");
    //                areaLink = areaText;
    //            }
    //            else
    //            {
    //                myAreaTitle.Attributes.Add("class", "category");
    //            }

    //            myAreaTitle.InnerHtml = areaLink; // .InnerText = areaText;


    //            //  myDIV.Controls.Add(alink0);
    //            myDiv.Controls.Add(myAreaTitle);

    //            HtmlGenericControl myArea = new HtmlGenericControl("div");
    //            myArea.ID = "Menu" + areaCode;

    //            DataSet myDs2 = AppraisalProcess.AppraisalMenuItem("2", userId, appraisalYear, schoolCode, employeeId, appraisalSession, category, areaCode, appraisalPhase);

    //            HtmlGenericControl myUl = new HtmlGenericControl("ul");
    //            myUl.Attributes.Add("class", "leafMenu" + areaCode);


    //            foreach (DataRow row2 in myDs2.Tables[0].Rows)
    //            {
    //                string pCode = row2["AppraisalCode"].ToString();
    //                string aText = row2["AppraisalText"].ToString();
    //                string aImag = row2["AppraisalImage"].ToString();
    //                string level = row2["TreeLevel"].ToString();
    //                string contentPage = row2["ContentPage"].ToString();
    //                HtmlGenericControl li = new HtmlGenericControl("li");
    //                HtmlImage aimg = new HtmlImage();
    //                HtmlAnchor alink = new HtmlAnchor();

    //                li = Getli(alink, aimg, li, myUl, passApprYear, contentPage, aImag, pCode, aText);

    //                DataSet myDs3 = AppraisalProcess.AppraisalMenuItem(pCode, userId, appraisalYear, schoolCode, employeeId, appraisalSession, category, areaCode, appraisalPhase);
    //                if (myDs3.Tables[0].Rows.Count > 0)
    //                {
    //                    HtmlGenericControl myUl2 = new HtmlGenericControl("ul");
    //                    myUl2.Attributes.Add("class", "Menulevel2");
    //                    HtmlGenericControl myUlChild = GetUi(myUl2, myDs3, passApprYear);
    //                    li.Controls.Add(myUlChild);
    //                }
    //                myUl.Controls.Add(li);
    //                myArea.Controls.Add(myUl);
    //            }
    //            myDiv.Controls.Add(myArea);

    //        }
    //        // ************* for test postback purpose ************************
    //        //Button myButton = new Button();
    //        //myButton.ID = "btnPostBack";
    //        //myButton.Text = "Postback iFrame ";
    //        //myDIV.Controls.Add(myButton);
    //        // ****************************************************************
    //    }
    //    private static HtmlGenericControl GetUi(HtmlGenericControl myUl2, DataSet myDs3, string passApprYear)
    //    {

    //        foreach (DataRow row3 in myDs3.Tables[0].Rows)
    //        {
    //            string pCode = row3["AppraisalCode"].ToString();
    //            string aText = row3["AppraisalText"].ToString();
    //            string aImag = row3["AppraisalImage"].ToString();
    //            string level = row3["TreeLevel"].ToString();
    //            string contentPage = row3["ContentPage"].ToString();
    //            HtmlGenericControl li = new HtmlGenericControl("li");
    //            HtmlImage aimg = new HtmlImage();
    //            HtmlAnchor alink = new HtmlAnchor();
    //            li = Getli(alink, aimg, li, myUl2, passApprYear, contentPage, aImag, pCode, aText);
    //        }
    //        return myUl2;
    //    }
    //    private static HtmlGenericControl Getli(HtmlAnchor alink2, HtmlImage aimg2, HtmlGenericControl li2, HtmlGenericControl myUl2, string passApprYear, string contentPage, string aImage, string pCode, string aText)
    //    {
    //        aimg2.Src = aImage;
    //        alink2.HRef = "Loading2.aspx?pID=" + pCode + "&aID=" + pCode;
    //        alink2.Target = "GoPageiFrame";
    //        alink2.InnerHtml = aText;
    //        alink2.Title = aText;
    //        li2.ID = "li_" + pCode;
    //        li2.Controls.Add(aimg2);
    //        li2.Controls.Add(alink2);
    //        myUl2.Controls.Add(li2);

    //        if (passApprYear == "Yes")
    //        {
    //            if (contentPage != "PDFPage")
    //            {
    //                alink2.HRef = "";
    //                alink2.Disabled = true;
    //                alink2.Attributes.Add("class", "itemDisable");
    //            }
    //        }

    //        return li2;
    //    }
    //    public static void BuildingTitleTab(ref HtmlGenericControl myDiv, string userId, string category, string area, string code)
    //    {
    //        myDiv.InnerHtml = "";

    //        string title = BLL.TitleContext.Content("Title", userId, category, area, code);       // AppraisalProcess.AppraisalPageTitle("0", category,area,code,role);
    //        HtmlGenericControl span = new HtmlGenericControl("span");
    //        span.ID = "title_" + code;
    //        span.Attributes.Add("class", "pageTitle");
    //        span.InnerText = title;
    //        span.Attributes.Add("title", category + "-" + area + "-" + code);
    //        myDiv.Controls.Add(span);
    //        HtmlImage img = new HtmlImage();
    //        img.ID = "img_" + code;
    //        img.Src = "../images/help2.png";
    //        img.Attributes.Add("class", "helpImg");


    //        myDiv.Controls.Add(img);
    //    }




    //    public static void BuildingMenu22(ref HtmlGenericControl myDiv, string category, string userId, string appraisalYear, string appraisalSession, string appraisalPhase, string employeeId, string schoolCode, string role)
    //    {
    //        myDiv.InnerHtml = "";
    //        string evaluation = WebConfig.getValuebyKey("EvaluationYear"); // "NE0,NE1,NE2,NE3,NE4";
    //        int aYear = System.Int32.Parse(appraisalYear);
    //        int openYear = System.Int32.Parse(WorkingProfile.OpenSchoolYear);
    //        string passApprYear = "No";
    //        if (aYear < openYear)
    //        { passApprYear = "Yes"; }

    //        DataSet myDs1 = AppraisalProcess.AppraisalMenuItem("0", userId, appraisalYear, schoolCode, employeeId, appraisalSession, category);
    //        string menuEnable = "Yes";
    //        foreach (DataRow row1 in myDs1.Tables[0].Rows)
    //        {
    //            string areaCode = row1["AppraisalArea"].ToString();
    //            string areaText = row1["AppraisalText"].ToString();
    //            HtmlGenericControl myAreaTitle = new HtmlGenericControl("div");
    //            myAreaTitle.ID = "MenuTitle" + areaCode;


    //            string rate = "";
    //            switch (areaText)
    //            {
    //                case "Improvement Plan":
    //                    rate = AppraisalProcess.AppraisalRate(userId, appraisalYear, schoolCode, employeeId, appraisalSession, category, "SUM", "SUM61");
    //                    if (rate == "Unsatisfactory")
    //                    { menuEnable = "Yes"; }
    //                    else
    //                    { menuEnable = "No"; }
    //                    break;
    //                case "Enrichment Plan":
    //                    rate = AppraisalProcess.AppraisalRate(userId, appraisalYear, schoolCode, employeeId, appraisalSession, category, "SUM", "SUM61");
    //                    if (rate == "Development Needed")
    //                    { menuEnable = "Yes"; }
    //                    else
    //                    { menuEnable = "No"; }
    //                    break;
    //                case "Evidence Log":
    //                case "Classroom Observation":
    //                case "Summative Report":
    //                case "Performance Plan":
    //                case "Professional Dialog and Meeting":
    //                    if (evaluation.IndexOf(appraisalPhase) == -1)
    //                    { menuEnable = "No"; }
    //                    break;
    //                default:
    //                    menuEnable = "Yes";
    //                    break;
    //            }
    //            string areaLink = "<a href='Loading2.aspx?pID=Summary&aID=" + areaCode + "' target='GoPageiFrame' >" + areaText + "</a>";
    //            if (menuEnable == "No")
    //            {
    //                myAreaTitle.Disabled = true;
    //                myAreaTitle.Attributes.Add("class", "categoryDisable");
    //                areaLink = areaText;
    //            }
    //            else
    //            {
    //                myAreaTitle.Attributes.Add("class", "category");
    //            }

    //            myAreaTitle.InnerHtml = areaLink; // .InnerText = areaText;


    //            //  myDIV.Controls.Add(alink0);
    //            myDiv.Controls.Add(myAreaTitle);

    //            HtmlGenericControl myArea = new HtmlGenericControl("div");
    //            myArea.ID = "Menu" + areaCode;

    //            DataSet myDs2 = AppraisalProcess.AppraisalMenuItem("2", userId, appraisalYear, schoolCode, employeeId, appraisalSession, category, areaCode, appraisalPhase);

    //            HtmlGenericControl myUl = new HtmlGenericControl("ul");
    //            myUl.Attributes.Add("class", "leafMenu" + areaCode);


    //            foreach (DataRow row2 in myDs2.Tables[0].Rows)
    //            {
    //                string pCode = row2["AppraisalCode"].ToString();
    //                string aText = row2["AppraisalText"].ToString();
    //                string aImag = row2["AppraisalImage"].ToString();
    //                string level = row2["TreeLevel"].ToString();
    //                string contentPage = row2["ContentPage"].ToString();
    //                HtmlGenericControl li = new HtmlGenericControl("li");
    //                HtmlImage aimg = new HtmlImage();
    //                aimg.Src = aImag;

    //                HtmlAnchor alink = new HtmlAnchor();
    //                alink.HRef = "Loading2.aspx?pID=" + pCode + "&aID=" + pCode;
    //                alink.Target = "GoPageiFrame";
    //                alink.InnerHtml = aText;
    //                alink.Title = aText;
    //                li.ID = "li_" + pCode;
    //                li.Controls.Add(aimg);
    //                li.Controls.Add(alink);

    //                if (passApprYear == "Yes")
    //                {
    //                    if (contentPage != "PDFPage")
    //                    {
    //                        alink.HRef = "";
    //                        alink.Disabled = true;
    //                        alink.Attributes.Add("class", "itemDisable");
    //                    }
    //                }


    //                DataSet myDs3 = AppraisalProcess.AppraisalMenuItem(pCode, userId, appraisalYear, schoolCode, employeeId, appraisalSession, category, areaCode, appraisalPhase);
    //                if (myDs3.Tables[0].Rows.Count > 0)
    //                {
    //                    HtmlGenericControl myUl2 = new HtmlGenericControl("ul");
    //                    myUl2.Attributes.Add("class", "Menulevel2");
    //                    foreach (DataRow row3 in myDs3.Tables[0].Rows)
    //                    {
    //                        pCode = row3["AppraisalCode"].ToString();
    //                        aText = row3["AppraisalText"].ToString();
    //                        aImag = row3["AppraisalImage"].ToString();
    //                        level = row3["TreeLevel"].ToString();
    //                        HtmlGenericControl li2 = new HtmlGenericControl("li");
    //                        HtmlImage aimg2 = new HtmlImage();
    //                        HtmlAnchor alink2 = new HtmlAnchor();

    //                        aimg2.Src = aImag;
    //                        alink2.HRef = "Loading2.aspx?pID=" + pCode + "&aID=" + pCode;
    //                        alink2.Target = "GoPageiFrame";
    //                        alink2.InnerHtml = aText;
    //                        alink2.Title = aText;
    //                        li2.ID = "li_" + pCode;
    //                        li2.Controls.Add(aimg2);
    //                        li2.Controls.Add(alink2);
    //                        myUl2.Controls.Add(li2);

    //                        if (passApprYear == "Yes")
    //                        {
    //                            if (contentPage != "PDFPage")
    //                            {
    //                                alink2.HRef = "";
    //                                alink2.Disabled = true;
    //                                alink2.Attributes.Add("class", "itemDisable");
    //                            }
    //                        }

    //                    }
    //                    li.Controls.Add(myUl2);

    //                }
    //                myUl.Controls.Add(li);
    //                myArea.Controls.Add(myUl);
    //            }
    //            myDiv.Controls.Add(myArea);

    //        }
    //        // ************* for test postback purpose ************************
    //        //Button myButton = new Button();
    //        //myButton.ID = "btnPostBack";
    //        //myButton.Text = "Postback iFrame ";
    //        //myDIV.Controls.Add(myButton);
    //        // ****************************************************************
    //    }


    //}
    public class AppraisalLeftMenuFromList : BaseData
    {
        public AppraisalLeftMenuFromList()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static void BuildingMenu(ref HtmlGenericControl myDiv, AppraisalComment parameter,string queryStr)
        {
            myDiv.InnerHtml = "";
            int aYear = System.Int32.Parse(parameter.SchoolYear);
            int openYear = System.Int32.Parse(WorkingProfile.OpenSchoolYear);
            string passApprYear = "No";
            if (aYear < openYear)
            { passApprYear = "Yes"; }

            List<AppraisalDefinition> myList = AppraisalActivity.AppraisalMenuItem(parameter);// .  DataSet myDS1 = AppraisalProcess.AppraisalMenuItem("0", userID, appraisalYear, schoolCode, employeeID, appraisalSession, category);
            foreach (var item in myList)
            {
                string areaCode = item.AppraisalArea;
                string areaText = item.AppraisalText;
                HtmlGenericControl myAreaTitle = new HtmlGenericControl("div");
                myAreaTitle.ID = "MenuTitle" + areaCode;

                parameter.Area = "SUM";
                parameter.ItemCode = "SUM61";
 
                string areaLink = "<a href='Loading2.aspx?pID=SummaryTree&aID=" + areaCode + "' target='GoPageiFrame' >" + areaText + "</a>";
  
                if (  GetMenuEnable(areaText, areaCode, parameter) == "No")
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
                myDiv.Controls.Add(myAreaTitle);

                HtmlGenericControl myArea = new HtmlGenericControl("div");
                myArea.ID = "Menu" + areaCode;
                parameter.Operate = "2";
                parameter.Area = areaCode;
                List<AppraisalDefinition> myList2 = AppraisalActivity.AppraisalMenuItem(parameter);

                //  DataSet myDS2 = AppraisalProcess.AppraisalMenuItem("2", userID, appraisalYear, schoolCode, employeeID, appraisalSession, category, areaCode, appraisalPhase);

                HtmlGenericControl myUl = new HtmlGenericControl("ul");
                myUl.Attributes.Add("class", "leafMenu" + areaCode);


                foreach (var item2 in myList2)
                {
                    string pCode = item2.AppraisalCode;//   row2["AppraisalCode"].ToString();
                    string aText = item2.AppraisalText;//  row2["AppraisalText"].ToString();
                    string aImag = item2.AppraisalImage;// row2["AppraisalImage"].ToString();
                    string level = item2.TreeLevel; // .trow2["TreeLevel"].ToString();
                    string contentPage = item2.ContentPage;// row2["ContentPage"].ToString();
                    HtmlGenericControl li = new HtmlGenericControl("li");
                    HtmlImage aimg = new HtmlImage();
                    HtmlAnchor alink = new HtmlAnchor();

                    li = Getli(alink, aimg, li, myUl, passApprYear, contentPage, aImag, pCode, aText,queryStr);

                    parameter.Operate = pCode;
                    List<AppraisalDefinition> myList3 = AppraisalActivity.AppraisalMenuItem(parameter);
                    //   DataSet myDS3 = AppraisalProcess.AppraisalMenuItem(pCode, userID, appraisalYear, schoolCode, employeeID, appraisalSession, category, areaCode, appraisalPhase);
                    if (myList3.Count > 0)
                    {
                        HtmlGenericControl myUl2 = new HtmlGenericControl("ul");
                        myUl2.Attributes.Add("class", "Menulevel2");
                        HtmlGenericControl myUlChild = GetUL(myUl2, myList3, passApprYear,queryStr);
                        li.Controls.Add(myUlChild);
                    }
                    myUl.Controls.Add(li);
                    myArea.Controls.Add(myUl);
                }
                myDiv.Controls.Add(myArea);

            }
            // ************* for test postback purpose ************************
            //Button myButton = new Button();
            //myButton.ID = "btnPostBack";
            //myButton.Text = "Postback iFrame ";
            //myDIV.Controls.Add(myButton);
            // ****************************************************************
        }

        private static string GetMenuEnable(string areaText, string areaCode,  AppraisalComment parameter)
        {
            string rate = AppraisalContents.AppraisalRate(parameter);
            string menuEnable = "No";
            if (areaText.IndexOf("Summative Report") != -1) areaText = "Summative Report";
            switch (areaText)
            {
                case "Improvement Plan":
                    if (rate == "Unsatisfactory") menuEnable = "Yes";
                    break;
                case "Enrichment Plan":
                     if (rate == "Development Needed") menuEnable = "Yes";
                    break;
                case "Evidence Log":
                case "Classroom Observation":
                case "Summative Report":
                case "Performance Plan":
                case "Professional Dialog and Meeting":
                    string evaluation = WebConfig.getValuebyKey("EvaluationYear"); // "NE0,NE1,NE2,NE3,NE4";
                    if (evaluation.IndexOf(parameter.Phase) != -1) menuEnable = "Yes";
                    break;
                default:
                    menuEnable = "Yes";
                    break;
            }
            return menuEnable;
            //  string rate = AppraisalContents.AppraisalRate(parameter);
            //string menuEnable = "Yes";

            //switch (areaText)
            //{
            //    case "Improvement Plan":
            //        if (rate == "Unsatisfactory")
            //        { menuEnable = "Yes"; }
            //        else
            //        { menuEnable = "No"; }
            //        break;
            //    case "Enrichment Plan":
            //        rate = AppraisalContents.AppraisalRate(parameter);
            //        if (rate == "Development Needed")
            //        { menuEnable = "Yes"; }
            //        else
            //        { menuEnable = "No"; }
            //        break;
            //    case "Evidence Log":
            //    case "Classroom Observation":
            //    case "Summative Report":
            //    case "Performance Plan":
            //    case "Professional Dialog and Meeting":
            //        if (evaluation.IndexOf(parameter.Phase) == -1)
            //        { menuEnable = "No"; }
            //        break;
            //    default:
            //        menuEnable = "Yes";
            //        break;
            //}


        }
        //public static void BuildingMenu(ref HtmlGenericControl myDiv, string category, string userId, string appraisalYear, string appraisalSession, string appraisalPhase, string employeeId, string schoolCode, string role)
        //{
        //    myDiv.InnerHtml = "";
        //    string evaluation = WebConfig.getValuebyKey("EvaluationYear"); // "NE0,NE1,NE2,NE3,NE4";
        //    int aYear = System.Int32.Parse(appraisalYear);
        //    int openYear = System.Int32.Parse(WorkingProfile.OpenSchoolYear);
        //    string passApprYear = "No";
        //    if (aYear < openYear)
        //    { passApprYear = "Yes"; }
        //    var parameter = new AppraisalComment()
        //    {
        //        Operate = "0",
        //        UserID = userId,
        //        SchoolYear = appraisalYear,
        //        SchoolCode = schoolCode,
        //        EmployeeID = employeeId,
        //        SessionID = appraisalSession,
        //        Category = category,
        //        Area = "",
        //        ItemCode = ""
        //    };


        //    List<AppraisalDefinition> myList = AppraisalActivity.AppraisalMenuItem(parameter);// .  DataSet myDS1 = AppraisalProcess.AppraisalMenuItem("0", userID, appraisalYear, schoolCode, employeeID, appraisalSession, category);
        //    string menuEnable = "Yes";
        //    foreach (var item in myList)
        //    {
        //        string areaCode = item.AppraisalArea;
        //        string areaText = item.AppraisalText;
        //        HtmlGenericControl myAreaTitle = new HtmlGenericControl("div");
        //        myAreaTitle.ID = "MenuTitle" + areaCode;


        //        string rate = AppraisalProcess.AppraisalRate(userId, appraisalYear, schoolCode, employeeId, appraisalSession, category, "SUM", "SUM61");
        //        switch (areaText)
        //        {
        //            case "Improvement Plan":
        //                if (rate == "Unsatisfactory")
        //                { menuEnable = "Yes"; }
        //                else
        //                { menuEnable = "No"; }
        //                break;
        //            case "Enrichment Plan":
        //                if (rate == "Development Needed")
        //                { menuEnable = "Yes"; }
        //                else
        //                { menuEnable = "No"; }
        //                break;
        //            case "Evidence Log":
        //            case "Classroom Observation":
        //            case "Summative Report":
        //            case "Performance Plan":
        //            case "Professional Dialog and Meeting":
        //                if (evaluation.IndexOf(appraisalPhase) == -1)
        //                { menuEnable = "No"; }
        //                break;
        //            default:
        //                menuEnable = "Yes";
        //                break;
        //        }
        //        string areaLink = "<a href='Loading2.aspx?pID=Summary&aID=" + areaCode + "' target='GoPageiFrame' >" + areaText + "</a>";
        //        if (menuEnable == "No")
        //        {
        //            myAreaTitle.Disabled = true;
        //            myAreaTitle.Attributes.Add("class", "categoryDisable");
        //            areaLink = areaText;
        //        }
        //        else
        //        {
        //            myAreaTitle.Attributes.Add("class", "category");
        //        }

        //        myAreaTitle.InnerHtml = areaLink; // .InnerText = areaText;


        //        //  myDIV.Controls.Add(alink0);
        //        myDiv.Controls.Add(myAreaTitle);

        //        HtmlGenericControl myArea = new HtmlGenericControl("div");
        //        myArea.ID = "Menu" + areaCode;
        //        parameter.Operate = "2";
        //        parameter.Area = areaCode;
        //        List<AppraisalDefinition> myList2 = AppraisalActivity.AppraisalMenuItem(parameter);

        //        //  DataSet myDS2 = AppraisalProcess.AppraisalMenuItem("2", userID, appraisalYear, schoolCode, employeeID, appraisalSession, category, areaCode, appraisalPhase);

        //        HtmlGenericControl myUl = new HtmlGenericControl("ul");
        //        myUl.Attributes.Add("class", "leafMenu" + areaCode);


        //        foreach (var item2 in myList2)
        //        {
        //            string pCode = item2.AppraisalCode;//   row2["AppraisalCode"].ToString();
        //            string aText = item2.AppraisalText;//  row2["AppraisalText"].ToString();
        //            string aImag = item2.AppraisalImage;// row2["AppraisalImage"].ToString();
        //            string level = item2.TreeLevel; // .trow2["TreeLevel"].ToString();
        //            string contentPage = item2.ContentPage;// row2["ContentPage"].ToString();
        //            HtmlGenericControl li = new HtmlGenericControl("li");
        //            HtmlImage aimg = new HtmlImage();
        //            HtmlAnchor alink = new HtmlAnchor();

        //            li = Getli(alink, aimg, li, myUl, passApprYear, contentPage, aImag, pCode, aText,"");

        //            parameter.Operate = pCode;
        //            List<AppraisalDefinition> myList3 = AppraisalActivity.AppraisalMenuItem(parameter);
        //            //   DataSet myDS3 = AppraisalProcess.AppraisalMenuItem(pCode, userID, appraisalYear, schoolCode, employeeID, appraisalSession, category, areaCode, appraisalPhase);
        //            if (myList3.Count > 0)
        //            {
        //                HtmlGenericControl myUl2 = new HtmlGenericControl("ul");
        //                myUl2.Attributes.Add("class", "Menulevel2");
        //                HtmlGenericControl myUlChild = GetUi(myUl2, myList3, passApprYear);
        //                li.Controls.Add(myUlChild);
        //            }
        //            myUl.Controls.Add(li);
        //            myArea.Controls.Add(myUl);
        //        }
        //        myDiv.Controls.Add(myArea);

        //    }
        //    // ************* for test postback purpose ************************
        //    //Button myButton = new Button();
        //    //myButton.ID = "btnPostBack";
        //    //myButton.Text = "Postback iFrame ";
        //    //myDIV.Controls.Add(myButton);
        //    // ****************************************************************
        //}
        private static HtmlGenericControl GetUL(HtmlGenericControl myUl2, List<AppraisalDefinition> myList, string passApprYear, string queryStr)
        {

            foreach (var item in myList)
            {
                string pCode = item.AppraisalCode;// row3["AppraisalCode"].ToString();
                string aText = item.AppraisalText;//  row3["AppraisalText"].ToString();
                string aImag = item.AppraisalImage;// row3["AppraisalImage"].ToString();
                string level = item.TreeLevel;// row3["TreeLevel"].ToString();
                string contentPage = item.ContentPage;// row3["ContentPage"].ToString();
                HtmlGenericControl li = new HtmlGenericControl("li");
                HtmlImage aimg = new HtmlImage();
                HtmlAnchor alink = new HtmlAnchor();
                li = Getli(alink, aimg, li, myUl2, passApprYear, contentPage, aImag, pCode, aText, queryStr);
            }
            return myUl2;
        }
        private static HtmlGenericControl Getli(HtmlAnchor alink2, HtmlImage aimg2, HtmlGenericControl li2, HtmlGenericControl myUl2, string passApprYear, string contentPage, string aImage, string pCode, string aText,string queryStr)
        {
            aimg2.Src = aImage;
            alink2.HRef = "Loading2.aspx?pID=" + pCode + "&aID=" + pCode + "&" + queryStr;
            alink2.Target = "GoPageiFrame";
            alink2.InnerHtml = aText;
            alink2.Title = aText;
            li2.ID = "li_" + pCode;
            li2.Controls.Add(aimg2);
            li2.Controls.Add(alink2);
            myUl2.Controls.Add(li2);

            if (passApprYear == "Yes")
            {
                if (contentPage != "PDFPage")
                {
                    alink2.HRef = "";
                    alink2.Disabled = true;
                    alink2.Attributes.Add("class", "itemDisable");
                }
            }

            return li2;
        }



        //public static void BuildingMenu22(ref HtmlGenericControl myDiv, string category, string userId, string appraisalYear, string appraisalSession, string appraisalPhase, string employeeId, string schoolCode, string role)
        //{
        //    myDiv.InnerHtml = "";
        //    string evaluation = WebConfig.getValuebyKey("EvaluationYear"); // "NE0,NE1,NE2,NE3,NE4";
        //    int aYear = System.Int32.Parse(appraisalYear);
        //    int openYear = System.Int32.Parse(WorkingProfile.OpenSchoolYear);
        //    string passApprYear = "No";
        //    if (aYear < openYear)
        //    { passApprYear = "Yes"; }

        //    DataSet myDs1 = AppraisalProcess.AppraisalMenuItem("0", userId, appraisalYear, schoolCode, employeeId, appraisalSession, category);
        //    string menuEnable = "Yes";
        //    foreach (DataRow row1 in myDs1.Tables[0].Rows)
        //    {
        //        string areaCode = row1["AppraisalArea"].ToString();
        //        string areaText = row1["AppraisalText"].ToString();
        //        HtmlGenericControl myAreaTitle = new HtmlGenericControl("div");
        //        myAreaTitle.ID = "MenuTitle" + areaCode;


        //        string rate = AppraisalProcess.AppraisalRate(userId, appraisalYear, schoolCode, employeeId, appraisalSession, category, "SUM", "SUM61");
        //        switch (areaText)
        //        {
        //            case "Improvement Plan":
        //                 if (rate == "Unsatisfactory")
        //                { menuEnable = "Yes"; }
        //                else
        //                { menuEnable = "No"; }
        //                break;
        //            case "Enrichment Plan":
        //                 if (rate == "Development Needed")
        //                { menuEnable = "Yes"; }
        //                else
        //                { menuEnable = "No"; }
        //                break;
        //            case "Evidence Log":
        //            case "Classroom Observation":
        //            case "Summative Report":
        //            case "Performance Plan":
        //            case "Professional Dialog and Meeting":
        //                if (evaluation.IndexOf(appraisalPhase) == -1)
        //                { menuEnable = "No"; }
        //                break;
        //            default:
        //                menuEnable = "Yes";
        //                break;
        //        }
        //        string areaLink = "<a href='Loading2.aspx?pID=Summary&aID=" + areaCode + "' target='GoPageiFrame' >" + areaText + "</a>";
        //        if (menuEnable == "No")
        //        {
        //            myAreaTitle.Disabled = true;
        //            myAreaTitle.Attributes.Add("class", "categoryDisable");
        //            areaLink = areaText;
        //        }
        //        else
        //        {
        //            myAreaTitle.Attributes.Add("class", "category");
        //        }

        //        myAreaTitle.InnerHtml = areaLink; // .InnerText = areaText;


        //        //  myDIV.Controls.Add(alink0);
        //        myDiv.Controls.Add(myAreaTitle);

        //        HtmlGenericControl myArea = new HtmlGenericControl("div");
        //        myArea.ID = "Menu" + areaCode;

        //        DataSet myDs2 = AppraisalProcess.AppraisalMenuItem("2", userId, appraisalYear, schoolCode, employeeId, appraisalSession, category, areaCode, appraisalPhase);

        //        HtmlGenericControl myUl = new HtmlGenericControl("ul");
        //        myUl.Attributes.Add("class", "leafMenu" + areaCode);


        //        foreach (DataRow row2 in myDs2.Tables[0].Rows)
        //        {
        //            string pCode = row2["AppraisalCode"].ToString();
        //            string aText = row2["AppraisalText"].ToString();
        //            string aImag = row2["AppraisalImage"].ToString();
        //            string level = row2["TreeLevel"].ToString();
        //            string contentPage = row2["ContentPage"].ToString();
        //            HtmlGenericControl li = new HtmlGenericControl("li");
        //            HtmlImage aimg = new HtmlImage();
        //            aimg.Src = aImag;

        //            HtmlAnchor alink = new HtmlAnchor();
        //            alink.HRef = "Loading2.aspx?pID=" + pCode + "&aID=" + pCode;
        //            alink.Target = "GoPageiFrame";
        //            alink.InnerHtml = aText;
        //            alink.Title = aText;
        //            li.ID = "li_" + pCode;
        //            li.Controls.Add(aimg);
        //            li.Controls.Add(alink);

        //            if (passApprYear == "Yes")
        //            {
        //                if (contentPage != "PDFPage")
        //                {
        //                    alink.HRef = "";
        //                    alink.Disabled = true;
        //                    alink.Attributes.Add("class", "itemDisable");
        //                }
        //            }


        //            DataSet myDs3 = AppraisalProcess.AppraisalMenuItem(pCode, userId, appraisalYear, schoolCode, employeeId, appraisalSession, category, areaCode, appraisalPhase);
        //            if (myDs3.Tables[0].Rows.Count > 0)
        //            {
        //                HtmlGenericControl myUl2 = new HtmlGenericControl("ul");
        //                myUl2.Attributes.Add("class", "Menulevel2");
        //                foreach (DataRow row3 in myDs3.Tables[0].Rows)
        //                {
        //                    pCode = row3["AppraisalCode"].ToString();
        //                    aText = row3["AppraisalText"].ToString();
        //                    aImag = row3["AppraisalImage"].ToString();
        //                    level = row3["TreeLevel"].ToString();
        //                    HtmlGenericControl li2 = new HtmlGenericControl("li");
        //                    HtmlImage aimg2 = new HtmlImage();
        //                    HtmlAnchor alink2 = new HtmlAnchor();

        //                    aimg2.Src = aImag;
        //                    alink2.HRef = "Loading2.aspx?pID=" + pCode + "&aID=" + pCode;
        //                    alink2.Target = "GoPageiFrame";
        //                    alink2.InnerHtml = aText;
        //                    alink2.Title = aText;
        //                    li2.ID = "li_" + pCode;
        //                    li2.Controls.Add(aimg2);
        //                    li2.Controls.Add(alink2);
        //                    myUl2.Controls.Add(li2);

        //                    if (passApprYear == "Yes")
        //                    {
        //                        if (contentPage != "PDFPage")
        //                        {
        //                            alink2.HRef = "";
        //                            alink2.Disabled = true;
        //                            alink2.Attributes.Add("class", "itemDisable");
        //                        }
        //                    }

        //                }
        //                li.Controls.Add(myUl2);

        //            }
        //            myUl.Controls.Add(li);
        //            myArea.Controls.Add(myUl);
        //        }
        //        myDiv.Controls.Add(myArea);

        //    }
        //    // ************* for test postback purpose ************************
        //    //Button myButton = new Button();
        //    //myButton.ID = "btnPostBack";
        //    //myButton.Text = "Postback iFrame ";
        //    //myDIV.Controls.Add(myButton);
        //    // ****************************************************************
        //}


    }
}