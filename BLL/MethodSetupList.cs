using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class MethodSetupList
    {

    }
    public class DomainListMethod 
    {
       
        public static string GetSP(string action)
        {
            string parameter = " @Operate, @UserID, @Category, @Area";
            switch (action)
            {
                case "AddNew":
                    return "dbo.EPA_sys_DomainList" + parameter + ", @IDs, @Code";
                case "Update":
                    return "dbo.EPA_sys_DomainList" + parameter + ", @IDs, @Code, @Name, @Comments, @Active";
                case "Delete":
                    return "dbo.EPA_sys_DomainList" + parameter + ", @IDs";
                default:
                    return "dbo.EPA_sys_DomainList" + parameter;
            }

        }
        public static SetupListParameter GetParameters(string operate, string userId, string category, string area, string ids = "0", string code = "", string name = "", string comments = "", int active = 0)
        {
            var parameters = new SetupListParameter()
            {
                Operate = operate,
                UserID = userId,
                Category = category,
                Area = area,
            };
            if (operate != "Get")
            {
                if (operate == "Delete")
                {
                    parameters.IDs = ids;
                }
                else
                {
                    parameters.IDs = ids;
                    parameters.Code = code;
                    parameters.Name = name;
                    parameters.Comments = comments;
                    parameters.Active = active;
                }
            }
            return parameters;
        }
    }
    public class CompetencyListMethod
    {
   
        public static string GetSP(string action)
        {
            string parameter = " @Operate, @UserID, @Category, @Area";
            switch (action)
            {
                case "AddNew":
                    return "dbo.EPA_sys_DomainCompetencyList" + parameter + ", @IDs, @Code";
                case "Update":
                    return "dbo.EPA_sys_DomainCompetencyList" + parameter + ", @IDs, @Code, @Name, @Comments, @Active,@TPA, @NTP, @LTO";
                case "Delete":
                    return "dbo.EPA_sys_DomainCompetencyList" + parameter + ", @IDs";
                default:
                    return "dbo.EPA_sys_DomainCompetencyList" + parameter;
            }

        }
        public static SetupListParameter GetParameters(string operate, string userId, string category, string area, string ids = "0", string code = "", string name = "", string comments = "", int active = 0, string epa = "", string ntp = "", string lto = "")
        {
            var parameters = new SetupListParameterCompetency()
            {
                Operate = operate,
                UserID = userId,
                Category = category,
                Area = area,
            };
            if (operate != "Get")
            {
                if (operate == "Delete")
                {
                    parameters.IDs = ids;
                }
                else
                {
                    parameters.IDs = ids;
                    parameters.Code = code;
                    parameters.Name = name;
                    parameters.Comments = comments;
                    parameters.Active = active;
                    parameters.TPA = epa;
                    parameters.NTP = ntp;
                    parameters.LTO = lto;
                    ;
                }
            }
            return parameters;
        }
    }
    public class LookForsListMethod
    {
        public static string GetSP(string action)
        {
            string parameter = " @Operate, @UserID, @Category, @Area, @CompetencyID";
            switch (action)
            {
                case "AddNew":
                    return "dbo.EPA_sys_DomainCompetencyLookForsList" + parameter + ", @IDs, @Code";
                case "Update":
                    return "dbo.EPA_sys_DomainCompetencyLookForsList" + parameter + ", @IDs, @Code, @Name, @Comments, @Active";
                case "Delete":
                    return "dbo.EPA_sys_DomainCompetencyLookForsList" + parameter + ", @IDs";
                default:
                    return "dbo.EPA_sys_DomainCompetencyLookForsList" + parameter;
            }

        }
        public static SetupListParameter GetParameters(string operate, string userId, string category, string area, string competencyID, string ids = "0", string code = "", string name = "", string comments = "", int active = 0)
        {
            var parameters = new SetupListParameter()
            {
                Operate = operate,
                UserID = userId,
                Category = category,
                Area = area,
                CompetencyID = competencyID,
            };
            if (operate != "Get")
            {
                if (operate == "Delete")
                {
                    parameters.IDs = ids;
                }
                else
                {
                    parameters.IDs = ids;
                    parameters.Code = code;
                    parameters.Name = name;
                    parameters.Comments = comments;
                    parameters.Active = active;
                }
            }
            return parameters;
        }
    }
}
