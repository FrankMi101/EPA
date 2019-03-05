using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class SPandParameters
    {

        public SPandParameters()
        {

        }
        public static string GetValue<T>()
        {
           
            var typeName = (typeof(T)).Name;
            string pForComments = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category, @Area, @ItemCode";
            string pForDomain = pForComments + ",@DomainID, @CompetencyID";
            switch (typeName)
            {
                case "AppraisalComment":
                   return  "dbo.EPA_Appr_AppraisalData_Text" + pForComments + ", @Value";
                case "AppraisalCompetency":
                    return "dbo.EPA_Appr_AppraisalData_TextCompetency" + pForDomain + ", @Rate, @Value";
                case "AppraisalDate":
                    return "dbo.EPA_Appr_AppraisalData_ObservationDate2" + pForComments + ", @Date, @Value";
                case "ObservationList":
                    return "dbo.EPA_Appr_AppraisalData_ObservationList" + pForDomain + ", @Check, @Value";
                default:
                    return "";
            }

        }
        public static string GetValue<T>(string action)
        {
            var typeName = (typeof(T)).Name;
             switch (typeName)
            {
                case "AppraisalComment":
                    return AppraisalCommentMethod.GetSP(action);
                case "AppraisalCompetency":
                    return AppraisalCompetencyCommentMethod.GetSP(action);
                case "AppraisalDate":
                    return AppraisalDateMethod.GetSP(action);
  
                case "DomainList":
                    return DomainListMethod.GetSP(action); //  "dbo.EPA_sys_DomainList" + pSystemSetup;
                case "CompetencyList":
                    return CompetencyListMethod.GetSP(action); // "dbo.EPA_sys_DomainCompetencyList" + pSystemSetup;
                case "LookForsList":
                    return LookForsListMethod.GetSP(action);//  "dbo.EPA_sys_DomainCompetencyLookForsList" + pSystemSetup + ", @CompetencyID";

                default:
                    return "";
            }

        }
        public static string GetList<T>()
        {
            var typeName = (typeof(T)).Name;
            string pForList = " @Operate, @UserID, @SchoolYear, @SchoolCode, @SearchBy, @SearchValue";
            string pCompetencyComments = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category, @Area, @ItemCode, @DomainID, @CompetencyID";
            // string pSystemSetup = " @Operate, @UserID, @Category, @Area, @IDs, @Code, @Name, @Comments, @Active";

            switch (typeName)
            {
                case "AppraisalList":
                    return "dbo.EPA_Appr_AppraisalStaffList" + pForList;
                case "AppraisalStaffList":
                    return "dbo.EPA_ORG_StaffList" + pForList;
                case "AppraisalHistory":
                    return "dbo.EPA_Appr_AppraisalStaffHistory" + pForList;
                case "AppraisalNotice":
                    return "dbo.EPA_Appr_AppraisalStaffListNotice" + pForList + ", @NoticeType, @NoticeArea";
                case "CommonList":
                    return "dbo.EPA_sys_getListsValuePara" + " @Operate, @UserID, @Para1, @Para2, @Para3";
                case "CommonListSchool":
                    return "dbo.EPA_sys_getSchoolList" + " @Operate, @UserID, @Para1, @Para2, @Para3";
                case "ObservationList":
                    return "dbo.EPA_Appr_AppraisalData_ObservationList" + pCompetencyComments;
                case "DomainList":
                    return DomainListMethod.GetSP("Get"); //  "dbo.EPA_sys_DomainList" + pSystemSetup;
                case "CompetencyList":
                    return CompetencyListMethod.GetSP("Get"); // "dbo.EPA_sys_DomainCompetencyList" + pSystemSetup;
                case "LookForsList":
                    return LookForsListMethod.GetSP("Get");//  "dbo.EPA_sys_DomainCompetencyLookForsList" + pSystemSetup + ", @CompetencyID";
                default:
                    return "";
            }
        }
        public static string GetList<T>(string action)
        {
            var typeName = (typeof(T)).Name;
            string pForList = " @Operate, @UserID, @SchoolYear, @SchoolCode, @SearchBy, @SearchValue";
            string pCompetencyComments = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category, @Area, @ItemCode, @DomainID, @CompetencyID";
            string pSystemSetup = " @Operate, @UserID, @Category, @Area, @IDs, @Code, @Name, @Comments, @Active";

            switch (typeName)
            {
                case "AppraisalList":
                    return "dbo.EPA_Appr_AppraisalStaffList" + pForList;
                case "AppraisalStaffList":
                    return "dbo.EPA_ORG_StaffList" + pForList;
                case "AppraisalHistory":
                    return "dbo.EPA_Appr_AppraisalStaffHistory" + pForList;
                case "AppraisalNotice":
                    return "dbo.EPA_Appr_AppraisalStaffListNotice" + pForList + ", @NoticeType, @NoticeArea";
                case "CommonList":
                    return "dbo.EPA_sys_getListsValuePara" + " @Operate, @UserID, @Para1, @Para2, @Para3";
                case "CommonListSchool":
                    return "dbo.EPA_sys_getSchoolList" + " @Operate, @UserID, @Para1, @Para2, @Para3";
                case "ObservationList":
                    return "dbo.EPA_Appr_AppraisalData_ObservationList" + pCompetencyComments;
                case "DomainList":
                    return DomainListMethod.GetSP(action); //  "dbo.EPA_sys_DomainList" + pSystemSetup;
                case "CompetencyList":
                    return CompetencyListMethod.GetSP(action); // "dbo.EPA_sys_DomainCompetencyList" + pSystemSetup;
                case "LookForsList":
                    return LookForsListMethod.GetSP(action);//  "dbo.EPA_sys_DomainCompetencyLookForsList" + pSystemSetup + ", @CompetencyID";
                default:
                    return "";
            }
        }

        public static string GetSingle<T>()
        {
            var typeName = (typeof(T)).Name;
            string pForSingle = " @SchoolYear,@PositionID";
            switch (typeName)
            {
                case "PositionPublish":
                    return "dbo.tcdsb_LTO_PagePublish_Position" + pForSingle;
                case "PositionRequest":
                    return "dbo.tcdsb_LTO_PageApprove_Position" + pForSingle;
                case "PositionConfirmHire":
                    return "dbo.tcdsb_LTO_PageConfrimForHire_Position" + pForSingle;
                case "PositionPosting":
                    return "dbo.tcdsb_LTO_PagePosting_Position" + pForSingle;

                case "QualificationSelected":
                    return "dbo.tcdsb_LTO_QualificationSelectedList" + pForSingle;
                case "LimitDate":
                    return "dbo.tcdsb_LTO_PagePublish_DefaultDate @Operate, @AppType, @SchoolYear, @DatePublish";

                default:
                    return "";

            }

        }


    }
}
