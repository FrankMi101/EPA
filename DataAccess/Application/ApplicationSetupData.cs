using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
namespace DataAccess
{
    public class ApplicationSetupData
    {

        public ApplicationSetupData()
        { }
     
        public static DataSet UserRoleManagement(string operate, string userID, string   category, string area)
        {
            string SP = "dbo.EPA_sys_ApplicationRole";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[4];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, category,area);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string UserRoleManagement(string operate, string userID, string category, string area, string IDs, string roleCode,string roleName,string comments,string active)
        {
            string SP = "dbo.EPA_sys_ApplicationRole";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
            SetupThisParameters(ref myPara, operate, userID, category, area, IDs, roleCode, roleName, comments, active);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        
     
        public static DataSet UsersManagement(string operate, string userID, string category, string area)
        {
            string SP = "dbo.EPA_sys_ApplicationUsers";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[4];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, category, area);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string UsersManagement(string operate, string userID, string category, string area, string IDs, string userCode, string userName, string userRole,string comments, string active)
        {
            string SP = "dbo.EPA_sys_ApplicationUsers";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[10];
            SetupThisParameters(ref myPara, operate, userID, category, area, IDs, userCode, userName, comments, active);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 100, "@UserRole", userRole);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static DataSet UsersManagementMultipleSchool(string operate, string userID, string category, string area,string schoolyear)
        {
            string SP = "dbo.EPA_sys_ApplicationUsersMultipleSchool";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
            myBaseParametersC.SetupBaseParameters(ref myPara, operate, userID, category, area, schoolyear);
             return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string UsersManagementMultipleSchool(string operate, string userID, string category, string area, string schoolyear, string IDs, string principalID, string schoolcode,   string comments, string active)
        {
            string SP = "dbo.EPA_sys_ApplicationUsersMultipleSchool";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[10];
            myBaseParametersC.SetupBaseParameters(ref myPara, operate, userID, category, area, schoolyear,schoolcode,IDs);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 30, "@PrincipalID", principalID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 8, 250, "@Comments", comments);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 1, "@Active", active);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static DataSet SchoolDistrict(string operate, string userID, string category, string area)
        {
            string SP = "dbo.EPA_ORG_DistrictList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[4];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, category, area);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string SchoolDistrict(string operate, string userID, string category, string area, string IDs, string districtCode, string districtName, string comments, string active)
        {
            string SP = "dbo.EPA_ORG_DistrictList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
            SetupThisParameters(ref myPara, operate, userID, category, area, IDs, districtCode, districtName, comments, active);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static DataSet RegionAreaList(string operate, string userID, string category, string area)
        {
            string SP = "dbo.EPA_ORG_RegionAreaList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[4];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, category, area);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string RegionAreaList(string operate, string userID, string category, string area, string IDs, string regionCode, string regionName, string comments, string active, string district, string superID, string officer)
        {
            string SP = "dbo.EPA_ORG_RegionAreaList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[12];
            SetupThisParameters(ref myPara, operate, userID, category, area, IDs, regionCode, regionName, comments, active);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 30, "@District", district);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 30, "@SuperID", superID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 30, "@Officer", officer);
  
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static DataSet SchoolList(string operate, string userID, string category, string area)
        {
            string SP = "dbo.EPA_ORG_SchoolsList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[4];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, category, area);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static DataSet SchoolInformation(string operate, string userID, string category, string area,string IDs)
        {
            string SP = "dbo.EPA_ORG_SchoolsList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, category, area);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 10, "@IDs", IDs);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string SchoolInformation(string operate, string userID, string category, string area, string IDs,string code)
        {
            string SP = "dbo.EPA_ORG_SchoolsList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, category, area);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 10, "@IDs", IDs);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 20, "@Code", code);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string SchoolInformation(string operate, string userID, string category, string area, string IDs, string schoolCode, string schoolName, string comments, string active, string district, string header, string areacode,string panel,string tpa, string ppa)
        {
            string SP = "dbo.EPA_ORG_SchoolsList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[15];
            SetupThisParameters(ref myPara, operate, userID, category, area,IDs, schoolCode, schoolName, comments, active);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 30, "@District", district);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 30, "@Header", header);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 30, "@AreaCode", areacode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 12, 10, "@Panel", panel);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 13, 1, "@TPA", tpa);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 14, 1, "@PPA", ppa);


            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static DataSet SystemItems(string operate, string userID,string category,string itemType)
        {
            string SP = "dbo.EPA_sys_SystemItemsList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[4];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, category, itemType);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string SystemItems(string operate, string userID, string category, string itemType, string IDs, string code, string name, string comments, string active,string steps, string keyPoint)
        {
            string SP = "dbo.EPA_sys_SystemItemsList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[11];
            SetupThisParameters(ref myPara, operate, userID, category, itemType, IDs, code, name, comments, active);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 50, "@Orders", steps);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 50, "@KeyPoint", keyPoint);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static DataSet Category(string operate, string userID)
        {
            string SP = "dbo.EPA_sys_CategoryList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[4];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, "", "");
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string Category(string operate, string userID, string IDs, string code, string name, string comments, string active)
        {
            string SP = "dbo.EPA_sys_CategoryList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
            SetupThisParameters(ref myPara, operate, userID, "", "", IDs,code, name, comments, active);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
      
        public static DataSet Domain(string operate, string userID, string category, string area)
        {
            string SP = "dbo.EPA_sys_DomainList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[4];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, category, area);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string Domain(string operate, string userID, string category, string area, string IDs, string domainCode, string domainName,  string comments, string active)
        {
            string SP = "dbo.EPA_sys_DomainList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
            SetupThisParameters(ref myPara, operate, userID, category, area, IDs, domainCode, domainName, comments, active);
 
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static DataSet Competency(string operate, string userID, string category, string area)
        {
            string SP = "dbo.EPA_sys_DomainCompetencyList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[4];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, category, area);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string Competency(string operate, string userID, string category, string area, string IDs, string code, string name, string comments, string active,string TPA,string NTP,string LTO)
        {
            string SP = "dbo.EPA_sys_DomainCompetencyList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[12];
            SetupThisParameters(ref myPara, operate, userID, category, area, IDs, code, name, comments, active);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 1, "@TPA", TPA);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 1, "@NTP", NTP);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 1, "@LTO", LTO);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static DataSet LookFors(string operate, string userID, string category, string area,string competencyID)
        {
            string SP = "dbo.EPA_sys_DomainCompetencyLookForsList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, category, area);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 10, "@competencyID", competencyID);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string LookFors(string operate, string userID, string category, string area, string competencyID, string IDs, string code, string name, string comments, string active)
        {
            string SP = "dbo.EPA_sys_DomainCompetencyLookForsList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[10];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, category, area);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 10, "@competencyID", competencyID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 10, "@IDs", IDs);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 6, 20, "@Code", code);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 100, "@Name", name);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 8, 250, "@Comments", comments);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 1, "@Active", active);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static DataSet CommentsBank(string operate, string userID, string category, string area, string type, string owner)
        {
            string SP = "dbo.EPA_sys_CommentsBankList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, category, area);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 30, "@Type", type);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 30, "@Owner", owner);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string CommentsBank(string operate, string userID, string category, string area, string type, string owner, string IDs, string domainID, string shared, string comments, string active)
        {
            string SP = "dbo.EPA_sys_CommentsBankList";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[11];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, category, area);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 30, "@Type", type);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 30, "@Owner", owner);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 6, 10, "@IDs", IDs);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 10, "@DomainID", domainID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 8, 50, "@Shared", shared);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 250, "@Comments", comments);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 1, "@Active", active);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        private static void SetupThisParameters(ref myCommon.MyParameterDB[] myPara, string action, string userID, string category, string area, string IDs, string code, string name, string comments, string active)
        {
            myBaseParametersB.SetupBaseParameters(ref myPara, action, userID, category, area);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 10, "@IDs", IDs);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 20, "@Code", code);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 6, 100, "@Name", name);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 250, "@Comments", comments);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 8, 1, "@Active", active);
        }
         public static string Statements(string action, string userID, string schoolyear, string schoolcode, string category, string area )
        {
            string SP = "dbo.EPA_sys_Statement";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
            myBaseParametersC.SetupBaseParameters(ref myPara, action, userID, category, area, schoolyear, schoolcode);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static DataSet Statements(string action, string userID, string schoolyear, string schoolcode, string category, string area,string IDs)
        {  
            string SP = "dbo.EPA_sys_Statement";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[7];
            myBaseParametersC.SetupBaseParameters(ref myPara, action, userID, category, area, schoolyear, schoolcode,IDs);
             return SetSQLParameter.getMyDataSet(SP, myPara);
        }

        public static string Statements(string action, string userID, string schoolyear, string schoolcode, string category, string area, string IDs, string statement, string topic, string startDate, string endDate)
        {
            string SP = "dbo.EPA_sys_Statement";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[11];
            myBaseParametersC.SetupBaseParameters(ref myPara, action, userID, category, area, schoolyear, schoolcode, IDs);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 2500, "@Statement", statement);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 8, 250, "@Subject", topic);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@StartDate", startDate);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 10, "@EndDate", endDate);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
    }
}
