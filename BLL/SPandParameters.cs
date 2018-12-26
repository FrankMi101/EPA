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
            string pForComments = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category, @ItemCode, @Comments";
            string pForDomain = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category, @ItemCode, @DomainID,@CompetencyID";
            switch (typeName)
            {
                case "AppraisalComment":
                    return "dbo.EPA_Appr_AppraisalData_Text2" + pForComments;
                case "AppraisalCommentOnDomain":
                    return "dbo.EPA_Appr_AppraisalData_DomainText2" + pForDomain + ",@Value";
                case "AppraisalRateOnDomain":
                    return "dbo.EPA_Appr_AppraisalData_DomainRate2" + pForDomain + ",@Value";
                case "AppraisalCompetency":
                    return "dbo.EPA_Appr_AppraisalData_TextCompetency2" + pForDomain + ",@Rate, @Value";
                default:
                    return "";
                  

            }

        }
        public static string GetList<T>()
        {
            var typeName = (typeof(T)).Name;
            string pForList = " @Operate,@UserID,@SchoolYear,@SchoolCode,@SearchBy,@SearchValue";
            switch (typeName)
            {
                case "AppraisalList":
                    return "dbo.EPA_Appr_AppraisalStaffList" + pForList;
                case "AppraisalStaffList":
                    return "dbo.EPA_ORG_StaffList" + pForList;
                case "AppraisalHistory":
                    return "dbo.EPA_Appr_AppraisalStaffHistory" + pForList;
                case "AppraisalNotice":
                    return "dbo.EPA_Appr_AppraisalStaffListNotice" + pForList + ",@NoticeType,@NoticeArea";
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
