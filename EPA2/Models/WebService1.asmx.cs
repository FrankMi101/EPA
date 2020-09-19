using BLL;
using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace EPA2.Models
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
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
        public string GetUserSnippet(int rowNo, CommentsSnippet parameter)
        {
            try
            {
                parameter.RowNo = rowNo;
                string value = AppraisalLibrary.UserCommentsSnippet(parameter);//  HelpContext.Content(operation, userId, categoryId, areaId, itemCode, helpType);
                return value;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveUserSnippet(string action, CommentsSnippet parameter)
        {
            try
            {
                parameter.Operate = action;
                string value = AppraisalLibrary.UserCommentsSnippet(parameter);//  HelpContext.Content(operation, userId, categoryId, areaId, itemCode, helpType);
                return value;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetHelpContent1(string operation, string type, TitleHelp parameter)
        {
            try
            {
                parameter.Operate = operation;
                parameter.ContentType = type;

                string helpvalue = HelpTitleMessage.GetContent(parameter);//  HelpContext.Content(operation, userId, categoryId, areaId, itemCode, helpType);
                return helpvalue;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveHelpContent1(string operation, string type, TitleHelp parameter)
        {
            try
            {
                parameter.Operate = operation;
                parameter.ContentType = type;

                return HelpTitleMessage.SaveContent(parameter);//  HelpContext.Content(operation, userId, categoryId, areaId, itemCode, helpType, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetHelpContent(string operation, string userId, string categoryId, string areaId, string itemCode, string helpType)
        {
            try
            {
                var parameter = new TitleHelp
                {
                    Operate = operation,
                    UserID = userId,
                    Category = categoryId,
                    Area = areaId,
                    Code = itemCode,
                    ContentType = helpType
                };
                string helpvalue = HelpTitleMessage.GetContent(parameter);//  HelpContext.Content(operation, userId, categoryId, areaId, itemCode, helpType);
                return helpvalue;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveHelpContent(string operation, string userId, string categoryId, string areaId, string itemCode, string helpType, string value)
        {
            try
            {
                var parameter = new TitleHelp
                {
                    Operate = operation,
                    UserID = userId,
                    Category = categoryId,
                    Area = areaId,
                    Code = itemCode,
                    ContentType = helpType,
                    Value = value
                };

                return HelpTitleMessage.SaveContent(parameter);//  HelpContext.Content(operation, userId, categoryId, areaId, itemCode, helpType, value);
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
        public string GetMessageContent(string operation, string userId, string categoryId, string areaId, string itemCode)
        {
            try
            {
                return MessageContext.Content(operation, userId, categoryId, areaId, itemCode);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveMessageContent(string operation, string userId, string categoryId, string areaId, string itemCode, string value)
        {
            try
            {
                return MessageContext.Content(operation, userId, categoryId, areaId, itemCode, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetMessageContent2(string operation, string userId, string categoryId, string areaId, string itemCode, string userRole)
        {
            try
            {
                return MessageContext.Message(operation, userId, categoryId, areaId, itemCode, userRole);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveMessageContent2(string operation, string userId, string categoryId, string areaId, string itemCode, string userRole, string value)
        {
            try
            {
                return MessageContext.Message(operation, userId, categoryId, areaId, itemCode, userRole, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string VerifyUser(string operation, string domain, string userId, string password)
        {
            try
            {
                if (Authentication.IsAuthenticated(domain, userId, password))
                {
                    return "Pass";
                }
                else
                {
                    return "Failed";
                }
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "Failed";
            }

        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public string GetRubricHelpContent(string operation, string categoryId, string domainId, string competencyId)
        {
            try
            {
                var parameter = new
                {
                    Operate = operation,
                    UserID = User.Identity.Name,
                    SchoolYear = "20202021",
                    SchoolCode = "0000",
                    EmployeeID = WorkingAppraisee.EmployeeID,
                    SessionID = WorkingAppraisee.SessionID,
                    Category = categoryId,
                    DomainID = domainId,
                    CompetencyID = competencyId
                };
                return AppraisalContents.Rubrics(parameter); //  AppraisalProcess.Rubrics(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID, WorkingAppraisee.AppraisalSchoolCode, categoryId, domainId, competencyId);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }

        [WebMethod]
        public string GetCompetencyContent(string operation, AppraisalCompetency userId, string categoryId, string areaId, string itemCode, string domainId, string competencyId)
        {
            try
            {   //  string rVal = AppraisalDataDomain.CompetencyTextContent(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode,domainID, competencyID);
                // string rVal = AppraisalData.ITextContentDomain(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID,"","");
                var parameter = AppraisalCompetencyCommentMethod.GetParameters(operation, "userID", WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, itemCode, categoryId, areaId, domainId, competencyId); //  new AppraisalComment()
                string rVal = AppraisalExecute.ValueofT<AppraisalCompetency>(parameter, operation);
                return rVal;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetCompetencyContent(string operation, AppraisalCompetency parameter, string categoryId, string areaId)
        {
            try
            {
                string rVal = AppraisalExecute.ValueofT<AppraisalCompetency>(parameter, operation);
                return rVal;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }

        [WebMethod]
        public string GetCompetencyContent1(string operation, AppraisalCompetency parameter)
        {
            try
            {
                string rVal = AppraisalCommon.CommonValue<string>("AppraisalContentsCompetency", operation, parameter);//  AppraisalExecute.ValueofT<AppraisalCompetency>(parameter, operation);

                return rVal;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }


        [WebMethod]
        public string SaveCompetencyContent1(string operation, AppraisalCompetency para1)
        {
            try
            {
                string result = AppraisalCommon.CommonValue<string>("AppraisalContentsCompetency", operation, para1); // AppraisalExecute.ValueofT<AppraisalCompetency>(para1, operation);

                return result;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetCompetencyContentLog1(string operation, AppraisalCompetency parameter)
        {
            try
            {
                parameter.Operate = operation;
                string result = AppraisalCommon.CommonValue<string>("AppraisalContentsCompetency", operation, parameter);  // AppraisalExecute.ValueofT<AppraisalCompetency>(parameter, operation);
                return result;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }


        [WebMethod]
        public string SaveCompetencyContentLog1(string operation, AppraisalCompetency para1)
        {
            try
            {
                para1.Operate = operation;
                string result = AppraisalCommon.CommonValue<string>("AppraisalContentsCompetency", operation, para1); // AppraisalExecute.ValueofT<AppraisalCompetency>(para1, operation);

                return result;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveCompetencyContent(string operation, AppraisalCompetency parameter, string categoryId, string areaId, string itemCode, string domainId, string competencyId, string rate, string value)
        {
            try
            {
                //  return AppraisalDataDomain.CompetencyTextContent(operation,User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID,rate,value);
                //  return AppraisalData.ITextContentDomain(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID, rate, value);

                // var parameter = AppraisalCompetencyCommentMethod.GetParameters(operation, "", WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, ItemCode, CategoryID, AreaID, domainID, competencyID, rate, value); //  new AppraisalComment()
                string result = AppraisalExecute.ValueofT<AppraisalCompetency>(parameter, operation);

                return result;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveCompetencyContent(string operation, string userId, string categoryId, string areaId, string itemCode, string domainId, string competencyId, string rate, string value)
        {
            try
            {
                //  return AppraisalDataDomain.CompetencyTextContent(operation,User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID,rate,value);
                //  return AppraisalData.ITextContentDomain(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID, rate, value);

                var parameter = AppraisalCompetencyCommentMethod.GetParameters(operation, userId, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, itemCode, categoryId, areaId, domainId, competencyId, rate, value); //  new AppraisalComment()
                string result = AppraisalExecute.ValueofT<AppraisalCompetency>(parameter, operation);

                return result;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetCompetencyContentLog(string operation, string userId, string categoryId, string areaId, string itemCode, string domainId, string competencyId, string actionRole)
        {
            try
            {
                string rVal = AppraisalDomainData.DomainTextContentLOG(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, domainId, competencyId, actionRole);
                return rVal;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetCompetencyEvidenceLog(string operation, string userId, string categoryId, string areaId, string itemCode, string domainId, string competencyId, string actionRole)
        {
            try
            {
                string rVal = AppraisalDomainData.DomainTextEvidenceLog(User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, domainId, competencyId, actionRole);

                return rVal;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveCompetencyContentLog(string operation, string userId, string categoryId, string areaId, string itemCode, string domainId, string competencyId, string actionRole, string value)
        {
            try
            {
                return AppraisalDomainData.DomainTextContentLOG(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, domainId, competencyId, actionRole, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }

        [WebMethod]
        public string SaveEvidenceLogLookForsChose(string operation, BuildLookForsList parameter)
        {
            try
            {
                string result = AppraisalProcess.LookForsListLogSave(operation, parameter);
                return result;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }


        [WebMethod]
        public string SaveObseverationSelect(string operation, string userId, string categoryId, string areaId, string itemCode, string domainId, string competencyId, string check, string value)
        {
            try
            {
                //  return AppraisalDataObservation.ObservationList(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID, check, value);
                return AppraisalData.ObservationList(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, domainId, competencyId, check, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveAppraisalNotes2(string operation, string value, AppraisalComment parameter)
        {
            try
            {
                parameter.Operate = operation;
                parameter.Value = value;
                return AppraisalData.NotesContentSave(parameter); // User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveAppraisalNotes(string operation, string userId, string categoryId, string areaId, string itemCode, string value)
        {
            try
            {
                var parameter = new
                {
                    Operate = operation,
                    UserID = userId,
                    SchoolYear = WorkingAppraisee.AppraisalYear,
                    SchoolCode = WorkingAppraisee.AppraisalSchoolCode,
                    EmployeeID = WorkingAppraisee.EmployeeID,
                    SessionID = WorkingAppraisee.SessionID,
                    Category = categoryId,
                    Area = areaId,
                    ItemCode = itemCode,
                    Value = HttpContext.Current.Server.HtmlDecode(value)
                };
                return AppraisalData.NotesContentSave(parameter); // User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetCompetencyNoteEnrichment(string operation, string userId, string categoryId, string areaId, string itemCode, string domainId, string competencyId, string actionItem)
        {
            try
            {
                string rVal = AppraisalDomainData.DomainTextContentEnrichment(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, domainId, competencyId, actionItem);
                return rVal;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetCompetencyNoteEnrichment(string operation, DomainCompetency notes)
        {
            try
            {
                notes.Operate = operation;
                notes.SchoolYear = WorkingAppraisee.AppraisalYear;
                notes.SchoolCode = WorkingAppraisee.AppraisalSchoolCode;
                notes.EmployeeID = WorkingAppraisee.EmployeeID;
                notes.SessionID = WorkingAppraisee.SessionID;
                return AppraisalDomainData.DomainTextContentEnrichment(operation, notes);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveCompetencyNoteEnrichment(string operation, string userId, string categoryId, string areaId, string itemCode, string domainId, string competencyId, string actionItem, string value)
        {
            try
            {
                return AppraisalDomainData.DomainTextContentEnrichment(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, domainId, competencyId, actionItem, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }

        [WebMethod]
        public string SaveCompetencyNoteEnrichment(string operate, DomainCompetency notes)
        {
            try
            {
                notes.Operate = operate;
                notes.SchoolYear = WorkingAppraisee.AppraisalYear;
                notes.SchoolCode = WorkingAppraisee.AppraisalSchoolCode;
                notes.EmployeeID = WorkingAppraisee.EmployeeID;
                notes.SessionID = WorkingAppraisee.SessionID;
                return AppraisalDomainData.DomainTextContentEnrichment(operate, notes, notes.Value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveGridCellText(string page, AppraisalCommentIMP parameter)
        {
            try
            {
                switch (page)
                {
                    case "IMP2":
                        return AppraisalContentsAGP.AppraisalTextIMP2Save(parameter);
                    case "IMP5":
                        return AppraisalContentsAGP.AppraisalTextIMP5Save(parameter);
                    case "AGP":
                        return AppraisalContentsAGP.AppraisalTextAGPSave(parameter);
                    case "APP":
                        return AppraisalContentsAGP.AppraisalTextAPPSave(parameter);
                    default:
                        return AppraisalContentsAGP.AppraisalTextbyPageSave(parameter);

                }

            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }

        [WebMethod]
        public string SaveAgpText(string operation, string userId, string categoryId, string areaId, string itemCode, string seqNo, string actionItem, string value)
        {
            try
            {
                // AppraisalComment parameter = CommonParameters.GetCommentParameter(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, actionItem,seqNo, value);
                return AppraisalDataGrid.WorkingListContent("AppraisalTextAGPSave", operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, seqNo, actionItem, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveAppText(string operation, string userId, string categoryId, string areaId, string itemCode, string seqNo, string actionItem, string value)
        {
            try
            {
                // AppraisalComment parameter = CommonParameters.GetCommentParameter(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, actionItem, seqNo, value);

                return AppraisalDataGrid.WorkingListContent("AppraisalTextAPPSave", operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, seqNo, actionItem, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveImpText(string operation, string userId, string categoryId, string areaId, string itemCode, string seqNo, string actionItem, string value)
        {
            try
            {
                // AppraisalComment parameter = CommonParameters.GetCommentParameter(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, actionItem, seqNo, value);

                return AppraisalDataGrid.WorkingListContent("AppraisalTextAIPSave", operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, seqNo, actionItem, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        [WebMethod]
        public string SaveImpText(string column, AppraisalCommentIMP parameter)
        {
            try
            {
                if (column == "2")
                    return AppraisalContentsAGP.AppraisalTextIMP2Save(parameter);
                else

                    return AppraisalContentsAGP.AppraisalTextIMP5Save(parameter);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        [WebMethod]
        public string SaveImpText2(AppraisalCommentIMP parameter)
        {
            try
            {
                return AppraisalContentsAGP.AppraisalTextIMP2Save(parameter);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveImpText2(string operation, string userId, string categoryId, string areaId, string itemCode, string seqNo, string actionItem, string value)
        {
            try
            {
                //  AppraisalComment parameter = CommonParameters.GetCommentParameter(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, actionItem, seqNo, value);

                return AppraisalDataGrid.WorkingListContent("AppraisalTextIMP2Save", operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, categoryId, areaId, itemCode, seqNo, actionItem, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SendNotification(string eMailTo, string eMailCc, string eMailBcc, string eMailFrom, string eMailSubject, string eMailBody)
        {
            try
            {
                var emailPara = new EmailNotice()
                {
                    EmailTo = eMailTo,
                    EmailCC = eMailCc,
                    EmailBcc = eMailBcc,
                    EmailFrom = eMailFrom,
                    EmailSubject = eMailSubject,
                    EmailBody = eMailBody,
                    EmailFormat = "HTML"
                };
                string result = eMailNotification.SendMail(emailPara);//  eMailTo, eMailCc, eMailBcc, eMailFrom, eMailSubject, eMailBody, "HTML");
                return result;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveNotification(string operation, string schoolyear, string schoolcode, string employeeId, string noticeType, string noticeArea, string deadlineDate, string subject, string emailBody)
        {
            try
            {
                var parameter = new EmailNoticePara()
                {
                    Operate = operation,
                    UserID = User.Identity.Name,
                    SchoolYear = schoolyear,
                    SchoolCode = schoolcode,
                    EmployeeID = employeeId,
                    SessionID = "",
                    NoticeType = noticeType,
                    NoticeArea = noticeArea,
                    NoticeDate = DateTime.Now.ToString("yyyy/MM/dd"),
                    DeadLineDate = deadlineDate,
                    NoticeSubject = subject,
                    Comments = emailBody
                };


                string result = MailNotification.NotificationeMailSave(parameter); //operation, User.Identity.Name, schoolyear, schoolcode, employeeId, "", noticeType, noticeArea, noticeDate, deadlineDate, subject, emailBody);
                return result;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        [WebMethod]
        public string GetEmailTemplate(string operation, string noticeType, string noticeArea, string category)
        {
            try
            {
                string result = GetNoticeFile.EMailContentByType(operation, User.Identity.Name, category, noticeType, noticeArea, "Appraisee", "Appraiser", "Notice");
                return result;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }

        [WebMethod]
        public string SaveApplicationRole(string operation, string userId, string categoryId, string areaId, string ds, string roleCode, string roleName, string comments, string active)
        {
            try
            {
                return ApplicationSetup.UserRoleManagement(operation, userId, categoryId, areaId, ds, roleCode, roleName, comments, active);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
        [WebMethod]
        public string SignOffActionAutoNotice(string operation, SignOffAutoNotice parameter)
        {
            try
            {
                if (operation == "Get")
                    return BaseData.GeneralValue<string>("AppraisalSignOff", "AutoNotice", parameter);
                else
                    return BaseData.GeneralValue<string>("AppraisalSignOff", "AutoNoticeSave", parameter);
            }
            catch (Exception ex)
            {
                return "";
            }

        }

        [WebMethod]
        public string GetNoticeTemplate(string operation, SignOffAutoNotice parameter)
        {
            try
            {
                parameter.Operate = operation;
                return BaseData.GeneralValue<string>("AppraisalSignOff", "AutoNoticeTemplate", parameter);
            }
            catch (Exception ex)
            {
                return "";
            }

        }

    }
}
