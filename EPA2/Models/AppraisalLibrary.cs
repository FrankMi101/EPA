using BLL;
using ClassLibrary;
using System.Collections.Generic;

namespace EPA2
{
    public class AppraisalLibrary : BaseData
    {


        public AppraisalLibrary()
        {

        }
        public static List<BuildLookForsList> LookForsList(object parameter) 
        {
            string SP = "dbo.EPA_Appr_AppraisalData_LookForsListForSUM @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@DomainID,@CompetencyID,@ObjRole";    
            return AppraisalCommon.CommonList<BuildLookForsList>(SP, parameter); 
        }

        public static List<BuildLookForsList> LookForsList(string operate, string userId, string schoolYear, string schoolCode, string employeeId, string sessionId, string category, string area, string itemCode, string domainId, string competencyId, string actionRole, string objRole)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_LookForsListForSUM @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@DomainID,@CompetencyID,@ObjRole";
            var parameter = new BuildLookForsList()
            {
                Operate = operate,
                UserID = userId,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                EmployeeID = employeeId,
                SessionID = sessionId,
                DomainID = domainId,
                CompetencyID = competencyId,
                ObjRole = objRole

            };
            return  AppraisalCommon.CommonList<BuildLookForsList>(SP, parameter); // AppraisalContentsDomain.LookForsList(parameter);
        }

        public static string UserCommentsSnippet(object parameter)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextUserSnippet @Operate,@UserID,@CategoryID,@AreaID,@ItemCode,@DomainID,@CompetencyID,@RowNo,@Comments";
            return AppraisalCommon.CommonValue<string>(SP, parameter);
        }
    }
}