// <copyright file="NavigationBuildingTest.cs">Copyright ©  2017</copyright>
using System;
using System.Web.UI.HtmlControls;
using DataAccess;
using Microsoft.Pex.Framework;
using Microsoft.Pex.Framework.Validation;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DataAccess.Tests
{
    /// <summary>This class contains parameterized unit tests for NavigationBuilding</summary>
    [PexClass(typeof(NavigationBuilding))]
    [PexAllowedExceptionFromTypeUnderTest(typeof(InvalidOperationException))]
    [PexAllowedExceptionFromTypeUnderTest(typeof(ArgumentException), AcceptExceptionSubtypes = true)]
    [TestClass]
    public partial class NavigationBuildingTest
    {
        /// <summary>Test stub for Tab(HtmlGenericControl&amp;, String, String, String, String, String)</summary>
        [PexMethod]
        public void TabTest(
            ref HtmlGenericControl myDIVTab,
            string vType,
            string userID,
            string schoolYear,
            string role,
            string grade
        )
        {
            NavigationBuilding.Tab(ref myDIVTab, vType, userID, schoolYear, role, grade);
            // TODO: add assertions to method NavigationBuildingTest.TabTest(HtmlGenericControl&, String, String, String, String, String)
        }
    }
}
