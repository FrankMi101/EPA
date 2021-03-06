﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
namespace EPA2.EPAsystem
{
    public partial class Loading3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string goPage = Page.Request.QueryString["pID"];
                string category = Page.Request.QueryString["type"];
                string area = Page.Request.QueryString["aID"];
                string itemCode = Page.Request.QueryString["iCode"];
                string domainId = Page.Request.QueryString["domainID"];
                string competencyId = Page.Request.QueryString["competencyID"];
                string seqNo = Page.Request.QueryString["SeqNo"];
                string actionItem = Page.Request.QueryString["ActionItem"];
                string parameter = "type=" + category + "&aID=" + area + "&iCode=" + itemCode + "&domainID=" + domainId + "&competencyID=" + competencyId + "&SeqNo=" + seqNo + "&ActionItem=" +actionItem;
                switch (goPage)
                {
               
                    case "HelpContent":
                        goPage = "Content_HelpEdit.aspx?" + parameter; ;
                        break;
                    case "CommentsBank":
                        goPage = "Content_Bank.aspx?" + parameter;
                        break;
                    case "SchoolLearningPlan":
                        goPage = "Content_LearningPlan.aspx?" + parameter;
                        break;
                    case "BoardStrategyPlan":
                        goPage = "Content_Strategy.aspx?" + parameter;
                        break;
                    case "OLFLibrary":
                        goPage = "Content_OLFLibrary.aspx?" + parameter;
                        break;
                    case "OLF":
                        goPage = "../Documents/Ontario_Leadership_Framework_OLF.pdf";
                        break;
                    case "AGPChat":
                        goPage = "../Documents/AGPChat.pdf";
                        break;
                    case "APPChat":
                        goPage = "../Documents/APPChat.pdf";
                        break;    
                    case "PPAManual":
                        goPage = "../Documents/PPA_Manual.pdf";
                        break;
                    case "GuidelineE":
                        goPage = "../Documents/MinistryGuidelineE.pdf";
                        break;
                    case "GuidelineNTIP":
                        goPage = "../Documents/MinistryGuidelineNTIP.pdf";
                        break;
                    case "FAQ":
                        goPage = "../Documents/TPA_FAQ_from_Ministry_Education.pdf";
                        break;
                        
                    default:
                        goPage = "Content_NotExists.aspx";
                        break;
                }

                PageURL.HRef = goPage;
            }
        }

    }
}