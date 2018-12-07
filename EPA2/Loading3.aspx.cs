﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
namespace EPA2
{
    public partial class Loading3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string GoPage = Page.Request.QueryString["pID"];
                string category = Page.Request.QueryString["type"];
                string area = Page.Request.QueryString["aID"];
                string itemCode = Page.Request.QueryString["iCode"];
                string domainID = Page.Request.QueryString["domainID"];
                string competencyID = Page.Request.QueryString["competencyID"];
                string seqNo = Page.Request.QueryString["SeqNo"];
                string actionItem = Page.Request.QueryString["ActionItem"];
                string parameter = "type=" + category + "&aID=" + area + "&iCode=" + itemCode + "&domainID=" + domainID + "&competencyID=" + competencyID + "&SeqNo=" + seqNo + "&ActionItem=" +actionItem;
                switch (GoPage)
                {
                    case "EvidenceLog":
                        GoPage = "EPAappraisal/Content_EvidenceLog.aspx?" + parameter;
                        break;
                    case "LookFors":
                        GoPage = "EPAappraisal/Content_LookFors.aspx?" + parameter;
                        break;
                    case "Recovery":
                        GoPage = "EPAappraisal/Content_Recovery.aspx?" + parameter;
                        break;
                    case "HelpContent":
                        GoPage = "EPAappraisal/Content_HelpEdit.aspx?" + parameter; ;
                        break;
                    case "CommentsBank":
                        GoPage = "EPAappraisal/Content_Bank.aspx?" + parameter;
                        break;
                    case "SchoolLearningPlan":
                        GoPage = "EPAappraisal/Content_LearningPlan.aspx?" + parameter;
                        break;
                    case "BoardStrategyPlan":
                        GoPage = "EPAappraisal/Content_Strategy.aspx?" + parameter;
                        break;
                    case "OLFLibrary":
                        GoPage = "EPAappraisal/Content_OLFLibrary.aspx?" + parameter;
                        break;
                    case "OLF":
                        GoPage = "Documents/Ontario_Leadership_Framework_OLF.pdf";
                        break;
                    case "AGPChat":
                        GoPage = "Documents/AGPChat.pdf";
                        break;
                    case "APPChat":
                        GoPage = "Documents/APPChat.pdf";
                        break;    
                    case "PPAManual":
                        GoPage = "Documents/PPA_Manual.pdf";
                        break;
                    case "GuidelineE":
                        GoPage = "Documents/MinistryGuidelineE.pdf";
                        break;
                    case "GuidelineNTIP":
                        GoPage = "Documents/MinistryGuidelineNTIP.pdf";
                        break;
                    case "SLIP":
                        string site = WebConfig.getValuebyKey("SLIPLinkSite");
                        string DOCFile = "SLIP_" + WorkingProfile.SchoolCode + "_" + WorkingProfile.SchoolYear + ".pdf";
                        GoPage = site + DOCFile;
                        break;
                    case "BLIP":
                        GoPage = "Documents/BoardLearnigImprovementPlan.pdf"; 
                        break;
                    case "FAQ":
                        GoPage = "Documents/TPA_FAQ_from_Ministry_Education.pdf";
                        break;
                        
                    default:
                        GoPage = "Content_NotExists.aspx";
                        break;
                }

                PageURL.HRef = GoPage;
            }
        }

    }
}