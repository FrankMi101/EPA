using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using DataAccess;
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
        public string GetHelpContent(string operation, string userID, string CategoryID, string AreaID, string ItemCode)
        {
            try
            {
                return HelpContext.Content(operation, userID, CategoryID, AreaID, ItemCode,"Help");
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveHelpContent(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string value)
        {
            try
            {
                return HelpContext.Content(operation, userID, CategoryID, AreaID, ItemCode,"Help", value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetTitleContent(string operation, string userID, string CategoryID, string AreaID, string ItemCode)
        {
            try
            {
                return TitleContext.Content(operation, userID, CategoryID, AreaID, ItemCode);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveTitleContent(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string title, string subtitle)
        {
            try
            {
                return TitleContext.Content(operation, userID, CategoryID, AreaID, ItemCode, title, subtitle);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }

        [WebMethod]
        public string SaveApplicationRole(string operation, string userID, string CategoryID, string AreaID, string IDs, string roleCode, string roleName, string comments, string active)
        {
            try
            {
                return ApplicationSetupData.UserRoleManagement(operation, userID, CategoryID, AreaID,IDs,roleCode,roleName,comments,active) ;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveApplicationUsers(string operation, string userID, string CategoryID, string AreaID, string IDs, string userCode, string userName, string userRole,  string comments, string active)
        {
            try
            {
                return ApplicationSetupData.UsersManagement(operation, userID, CategoryID, AreaID, IDs, userCode, userName, userRole, comments, active);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveApplicationMultipleSchoolUsers(string operation, string userID, string CategoryID,  string AreaID,string schoolyear,  string IDs, string userCode, string schoolcode, string comments, string active)
        {
            try
            {
                return ApplicationSetupData.UsersManagementMultipleSchool(operation, userID, CategoryID, AreaID, schoolyear, IDs, userCode, schoolcode, comments, active);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SchoolDistrict(string operation, string userID, string CategoryID, string AreaID, string IDs, string roleCode, string roleName, string comments, string active)
        {
            try
            {
                return ApplicationSetupData.SchoolDistrict(operation, userID, CategoryID, AreaID, IDs, roleCode, roleName, comments, active);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SchoolRegion(string operation, string userID, string CategoryID, string AreaID, string IDs, string roleCode, string roleName, string comments, string active, string district, string superID, string officer)
        {
            try
            {
                return ApplicationSetupData.RegionAreaList(operation, userID, CategoryID, AreaID, IDs, roleCode, roleName, comments, active,district,superID,officer);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string School(string operation, string userID, string CategoryID, string AreaID, string IDs, string roleCode)
        {
            try
            {
                return ApplicationSetupData.SchoolInformation(operation, userID, CategoryID, AreaID, IDs, roleCode);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveSystemItems(string operation, string userID, string category, string itemType, string IDs, string code, string name, string comments, string active,string steps,string keyPoint)
        {
            try
            {
                return ApplicationSetupData.SystemItems(operation, userID, category, itemType, IDs, code, name, comments, active,steps,keyPoint);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveCategory(string operation, string userID,  string IDs, string code, string name, string comments, string active)
        {
            try
            {
                return ApplicationSetupData.Category(operation, userID,IDs, code, name, comments, active);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveDomain(string operation, string userID, string CategoryID, string AreaID, string IDs, string domainCode, string domainName,   string comments, string active)
        {
            try
            {
                return ApplicationSetupData.Domain(operation, userID, CategoryID, AreaID, IDs, domainCode, domainName,  comments, active);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveCompetency(string operation, string userID, string CategoryID, string AreaID, string IDs, string Code, string Name, string comments, string active,string TPA, string NTP,string LTO)
        {
            try
            {
                return ApplicationSetupData.Competency(operation, userID, CategoryID, AreaID, IDs, Code, Name, comments, active,TPA,NTP,LTO);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveLookFors(string operation, string userID, string CategoryID, string AreaID, string competencyID, string IDs, string Code, string Name, string comments, string active )
        {
            try
            {
                return ApplicationSetupData.LookFors(operation, userID, CategoryID, AreaID, competencyID, IDs, Code, Name, comments, active );
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SaveCommentsBank(string operation, string userID, string CategoryID, string AreaID, string type,string owner, string IDs, string domainID, string shared, string comments, string active)
        {
            try
            {
                return ApplicationSetupData.CommentsBank(operation, userID, CategoryID, AreaID, type,owner, IDs, domainID, shared, comments, active);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
    }
}
