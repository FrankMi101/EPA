using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL
{
   public  class SPandParameters
    {

        public SPandParameters()
        {

        }
        public static string GetValue<T>()
        {
            var typeName = (typeof(T)).Name;
            string pForComments = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category, @ItemCode, @Comments";
            switch (typeName)
            {
                case "AppraisalComment":
                    return "dbo.EPA_Appr_AppraisalData_Text2" + pForComments;
              
                default:
                    return "";
 
            }

        }
        public static string GetList<T>()
        {
            var typeName = (typeof(T)).Name;
            string pForList = " @Operate,@UserID,@SchoolYear,@PositionType,@Panel,@Status,@SearchBy, @SearchValue1, @SearchValue2";
            switch (typeName)
            {
                case "PositionListPublish":
                    return "dbo.tcdsb_LTO_PagePublish_Positions" + pForList;
                case "PositionListRequest":
                    return "dbo.tcdsb_LTO_PageApprove_Positions" + pForList;
                case "PositionListConfirmHire":
                    return "dbo.tcdsb_LTO_PageConfirmHire_Positions" + pForList;
                case "PositionListPosting":
                    return "dbo.tcdsb_LTO_PagePosting_Positions" + pForList;

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
