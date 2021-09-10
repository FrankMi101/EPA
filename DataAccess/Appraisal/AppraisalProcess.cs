using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
namespace DataAccess
{
    public class AppraisalProcess
    {

        public AppraisalProcess()
        { }
        public static string AppraisalActionRole(string category, string userRole, string workingUserID, string LoginUserID )
        {
            string aRole = "Appraisee";
            switch (userRole)
            {
                case "Teacher":
                    aRole = "Appraisee";
                    break;
                case "Admin":
                    aRole = "Appraiser";
                    break;
                case "Principal":
                    if (category == "PPA")
                        {
                            if (LoginUserID == workingUserID)
                                { aRole = "Appraisee"; }
                                else
                                { aRole = "Appraiser"; }
                        }
                    else
                        { aRole = "Appraiser"; }
                    break;
                case "VP":
                    if (category == "PPA")
                    { aRole = "Appraisee"; }
                    else
                    { aRole = "Appraiser"; }
                    break;
                case "SO":
                    if (category == "PPA")
                    { 
                      aRole = "Appraiser";   
                        }
                    else
                    { aRole = "Supervisory"; }
                    break;
                    

                default:
                    aRole = "Appraisee";
                    break;
            }
            return aRole;
        }
        public static DataSet AppraisalCategorye(string operate, string userID, string schoolYear)
        {
            string SP = "dbo.EPA_Appr_AppraisalCategory";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[3];
            myBaseParameters.SetupBaseParameters(ref myPara, operate, userID, schoolYear);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static DataSet CheckCompleteStatus(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string appraisalCategory, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_CheckSteps";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID, appraisalCategory, area, itemCode);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static DataSet AppraisalMenuItem(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string appraisalCategory)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_StepMenu";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[7];
            myBaseParameters.SetupBaseParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID, appraisalCategory);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static DataSet AppraisalMenuItem(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string appraisalCategory, string appraisalArea, string appraisalPhase)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_StepMenu";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID, appraisalCategory, appraisalArea);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 8, 10, "@ItemCode", appraisalPhase);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
       public static string AppraisalAreaTitle(string operate, string userID, string appraisalCategory, string appraisalArea)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_AreaTitle";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[4];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, appraisalCategory, appraisalArea);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string AppraisalAreaTitle(string operate, string userID, string appraisalCategory, string appraisalArea,string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_AreaTitle";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[5];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, appraisalCategory, appraisalArea, itemCode);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string AppraisalPageItem(string operate, string userID, string appraisalCategory, string appraisalArea, string appraisalCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_GoPage";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[5];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, appraisalCategory, appraisalArea, appraisalCode);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
          public static string AppraisalPageTitle(string operate, string userID, string appraisalCategory, string appraisalArea, string appraisalCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_GoPage";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[5];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, appraisalCategory, appraisalArea, appraisalCode);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string CheckPageViewPermission(string operate, string userID, string schoolyear, string schoolcode, string sessionID, string employeeID, string category, string area, string code, string userAppraisalRole)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_CheckViewPermission";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[10];
            myBaseParameters.SetupBaseParameters(ref myPara, "Get", userID, schoolyear, schoolcode, employeeID, sessionID, category, area, code);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@UserApprRole", userAppraisalRole);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string CheckPageViewPermission(string operate, string userID, string schoolyear, string schoolcode, string sessionID, string employeeID, string category, string area, string code, string userAppraisalRole, string value)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_CheckViewPermission";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[11];
            myBaseParameters.SetupBaseParameters(ref myPara, "Save", userID, schoolyear, schoolcode, employeeID, sessionID, category, area,code);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@UserApprRole", userAppraisalRole);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 10, "@Value", value);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string CheckPDFViewPermission(string CheckType, string userID, string schoolyear, string schoolcode, string employeeID, string sessionID, string category, string area, string itemCode, string userRole)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_CheckViewPDF";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[10];
            myBaseParameters.SetupBaseParameters(ref myPara, "Get", userID, schoolyear, schoolcode, employeeID, sessionID, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@UserRole", userRole);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string CheckPageViewStepsGo(string operate, string userID, string schoolyear, string schoolcode, string sessionID, string employeeID, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_CheckViewStepsGo";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, "Get", userID, schoolyear, schoolcode, employeeID, sessionID, category, area, itemCode);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string CheckAppraiseeAdmin(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string userRole)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_CheckAppraiseeAdmin";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[8];
            myBaseParameters.SetupBaseParameters(ref myPara, "Check", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 10, "@UserRole", userRole);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string CompentencyListCount(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string appraisalCategory, string domainID)
        {                      
            string SP = "dbo.EPA_Appr_AppraisalProcess_CompentencyList";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[8];
            myBaseParameters.SetupBaseParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID, appraisalCategory);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 10, "@DomainID", domainID);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static DataTable CompentencyList(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string appraisalCategory, string domainID)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_CompentencyList";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[8];
            myBaseParameters.SetupBaseParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID, appraisalCategory);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 10, "@DomainID", domainID);
            return SetSQLParameter.getMyDataSet(SP, myPara).Tables[0];
        }
        public static DataTable CompentencyListForLOG(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string appraisalCategory, string domainID)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_CompentencyListForLOG";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[8];
            myBaseParameters.SetupBaseParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID, appraisalCategory);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 10, "@DomainID", domainID);
            return SetSQLParameter.getMyDataSet(SP, myPara).Tables[0];
        }

        public static string Rubrics(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string appraisalCategory, string domainID, string competencyID)
        {
            string SP = "dbo.EPA_Appr_DomainCompetencyRubric";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID, appraisalCategory);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 10, "@DomainID", domainID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 8, 10, "@CompetencyID", competencyID);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        //public static string SignOffComplete(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string userRole)
        //{
        //    string SP = "dbo.EPA_Appr_AppraisalProcess_SignOffComplete";
        //    MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[8];
        //    myBaseParameters.SetupBaseParameters(ref myPara, "Check", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area);
        //    SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 10, "@UserRole", userRole);
        //    return SetSQLParameter.getMyDataValue(SP, myPara);

        //}

        public static DataSet LookForsList(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string category, string area, string itemCode, string domainID, string competencyID,string actionRole, string objRole)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_LookForsList";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[14];
            SetupThisParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID, category, area, itemCode, domainID, competencyID, "0", actionRole, objRole);
        

            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string LookForsList(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string category, string area, string itemCode, string domainID, string competencyID, string actionRole, string lookForID, string check, string logDate,string allowview)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_LookForsList";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[17];
            SetupThisParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID, category,area,itemCode, domainID, competencyID,lookForID, actionRole, actionRole);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 14, 10, "@LogDate", logDate);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 15, 1, "@LogCheck", check);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 16, 1, "@AllowView", allowview);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string LookForsList(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string category, string area, string itemCode, string domainID, string competencyID, string actionRole, string lookForID, string check, string logDate, string allowview,string comments)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_LookForsList";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[18];
            SetupThisParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID, category, area, itemCode, domainID, competencyID, lookForID, actionRole, actionRole);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 14, 10, "@LogDate", logDate);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 15, 1, "@LogCheck", check);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 16, 1, "@AllowView", allowview);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 17, 500, "@Comments", comments);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        private static void SetupThisParameters(ref MyADO.MyParameterDB[] myPara, string action, string userID, string schoolYear, string  schoolCode, string employeeID, string sessionID, string category, string area, string itemCode, string domainID, string competencyID, string lookForID,string actionRole,string objRole)
        {
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, schoolYear, schoolCode, employeeID, sessionID, category, area, itemCode, domainID, competencyID, lookForID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 12, 10, "@ActionRole", actionRole);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 13, 10, "@ObjRole", objRole);
        }
    }
}
