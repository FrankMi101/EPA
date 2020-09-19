using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BLL;
using ClassLibrary;

namespace EPA2.Models
{
    /// <summary>
    /// Summary description for WebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]


    public class WebService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        public string GetHelpContent(string operation, string userId, string categoryId, string areaId, string itemCode)
        {
            try
            {
                return HelpContext.Content(operation, userId, categoryId, areaId, itemCode,"Help");
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveHelpContent(string operation, string userId, string categoryId, string areaId, string itemCode, string value)
        {
            try
            {
                return HelpContext.Content(operation, userId, categoryId, areaId, itemCode,"Help", value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetTitleContent(string operation, string userId, string categoryId, string areaId, string itemCode)
        {
            try
            {
                return TitleContext.Content(operation, userId, categoryId, areaId, itemCode);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveTitleContent(string operation, string userId, string categoryId, string areaId, string itemCode, string title, string subtitle)
        {
            try
            {
                return TitleContext.Content(operation, userId, categoryId, areaId, itemCode, title, subtitle);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public List<CommonList> GetNameCodeListValue(string operate, CommonListParameter parameter)
        {
            try
            {
                return AppraisalGeneral.CommonList<CommonList>("DDList", parameter);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }

        }

        [WebMethod]
        public string SaveApplicationRole(string operation, string userId, string categoryId, string areaId, string ds, string roleCode, string roleName, string comments, string active)
        {
            try
            {
                return ApplicationSetup.UserRoleManagement(operation, userId, categoryId, areaId,ds,roleCode,roleName,comments,active) ;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveApplicationUsers(string operation, string userId, string categoryId, string areaId, string ds, string userCode, string userName, string userRole,  string comments, string active)
        {
            try
            {
                return ApplicationSetup.UsersManagement(operation, userId, categoryId, areaId, ds, userCode, userName, userRole, comments, active);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveApplicationMultipleSchoolUsers(string operation, string userId, string categoryId,  string areaId,string schoolyear,  string ds, string userCode, string schoolcode, string comments, string active)
        {
            try
            {
                return ApplicationSetup.UsersManagementMultipleSchool(operation, userId, categoryId, areaId, schoolyear, ds, userCode, schoolcode, comments, active);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SchoolDistrict(string operation, string userId, string categoryId, string areaId, string ds, string roleCode, string roleName, string comments, string active)
        {
            try
            {
                return ApplicationSetup.SchoolDistrict(operation, userId, categoryId, areaId, ds, roleCode, roleName, comments, active);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SchoolRegion(string operation, string userId, string categoryId, string areaId, string ds, string roleCode, string roleName, string comments, string active, string district, string superId, string officer)
        {
            try
            {
                return ApplicationSetup.RegionAreaList(operation, userId, categoryId, areaId, ds, roleCode, roleName, comments, active,district,superId,officer);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string School(string operation, string userId, string categoryId, string areaId, string ids, string roleCode)
        {
            try
            {
                return ApplicationSetup.SchoolInformation(operation, userId, categoryId, areaId, ids, roleCode);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveSystemItems(string operation, string userId, string category, string itemType, string ids, string code, string name, string comments, string active,string steps,string keyPoint)
        {
            try
            {
                return ApplicationSetup.SystemItems(operation, userId, category, itemType, ids, code, name, comments, active,steps,keyPoint);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveAppraisalCategory(object saveObj)
        {
            try
            {
                return AppraisalSetup.SaveCategory(saveObj);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveAppraisalArea(object saveObj)
        {
            try
            {
                return AppraisalSetup.SaveArea(saveObj);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveDomain(string operation, string userId, string categoryId, string areaId, string ds, string domainCode, string domainName,   string comments, int active)
        {
            try
            {
              //  return ApplicationSetupData.Domain(operation, userID, CategoryID, AreaID, IDs, domainCode, domainName,  comments, active);
                return ApplicationSetup.DomainListDataSave(operation, userId, categoryId, areaId, ds, domainCode, domainName, comments, active);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveCompetency(string operation, string userId, string categoryId, string areaId, string ds, string code, string name, string comments, int active,string tpa, string ntp,string lto)
        {
            try
            {
              //  return ApplicationSetupData.Competency(operation, userID, CategoryID, AreaID, IDs, Code, Name, comments, active,TPA,NTP,LTO);
                return ApplicationSetup.CompetencyList(operation, userId, categoryId, areaId, ds, code, name, comments, active, tpa, ntp, lto);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveLookFors(string operation, string userId, string categoryId, string areaId, string competencyId, string ds, string code, string name, string comments, int active )
        {
            try
            {
                //return ApplicationSetupData.LookFors(operation, userID, CategoryID, AreaID, competencyID, IDs, Code, Name, comments, active );
                return ApplicationSetup.LookForsList(operation, userId, categoryId, areaId, competencyId, ds, code, name, comments, active);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveCommentsBank(string operation, string userId, string categoryId, string areaId, string type,string owner, string ds, string domainId, string shared, string comments, string active)
        {
            try
            {
                return ApplicationSetup.CommentsBankSave(operation, userId, categoryId, areaId, type,owner, ds, domainId, shared, comments, active);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
    }
}
