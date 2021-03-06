// <copyright file="WebConfigTest.cs">Copyright ©  2017</copyright>

using System;
using DataAccess;
using Microsoft.Pex.Framework;
using Microsoft.Pex.Framework.Validation;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DataAccess.Tests
{
    [TestClass]
    [PexClass(typeof(WebConfig))]
    [PexAllowedExceptionFromTypeUnderTest(typeof(ArgumentException), AcceptExceptionSubtypes = true)]
    [PexAllowedExceptionFromTypeUnderTest(typeof(InvalidOperationException))]
    public partial class WebConfigTest
    {

        [PexMethod]
        public string getValuebyKey(string key)
        {
            string result = WebConfig.getValuebyKey(key);
            return result;
            // TODO: add assertions to method WebConfigTest.getValuebyKey(String)
        }

        /// <summary>Test stub for AppName()</summary>
        [PexMethod]
        public string AppNameTest()
        {
            string result = WebConfig.AppName();
            return result;
            // TODO: add assertions to method WebConfigTest.AppNameTest()
        }

        /// <summary>Test stub for DomainName()</summary>
        [PexMethod]
        public string DomainNameTest()
        {
            string result = WebConfig.DomainName();
            return result;
            // TODO: add assertions to method WebConfigTest.DomainNameTest()
        }

        /// <summary>Test stub for LDAPServer()</summary>
        [PexMethod]
        public string LDAPServerTest()
        {
            string result = WebConfig.LDAPServer();
            return result;
            // TODO: add assertions to method WebConfigTest.LDAPServerTest()
        }

        /// <summary>Test stub for MessageNotAllow()</summary>
        [PexMethod]
        public string MessageNotAllowTest()
        {
            string result = WebConfig.MessageNotAllow();
            return result;
            // TODO: add assertions to method WebConfigTest.MessageNotAllowTest()
        }

        /// <summary>Test stub for ReportFormat()</summary>
        [PexMethod]
        public string ReportFormatTest()
        {
            string result = WebConfig.ReportFormat();
            return result;
            // TODO: add assertions to method WebConfigTest.ReportFormatTest()
        }

        /// <summary>Test stub for ReportPW()</summary>
        [PexMethod]
        public string ReportPWTest()
        {
            string result = WebConfig.ReportPW();
            return result;
            // TODO: add assertions to method WebConfigTest.ReportPWTest()
        }

        /// <summary>Test stub for ReportPath()</summary>
        [PexMethod]
        public string ReportPathTest()
        {
            string result = WebConfig.ReportPath();
            return result;
            // TODO: add assertions to method WebConfigTest.ReportPathTest()
        }

        /// <summary>Test stub for ReportPath2(String)</summary>
        [PexMethod]
        public string ReportPath2Test(string vSES)
        {
            string result = WebConfig.ReportPath2(vSES);
            return result;
            // TODO: add assertions to method WebConfigTest.ReportPath2Test(String)
        }

        /// <summary>Test stub for ReportPathWS()</summary>
        [PexMethod]
        public string ReportPathWSTest()
        {
            string result = WebConfig.ReportPathWS();
            return result;
            // TODO: add assertions to method WebConfigTest.ReportPathWSTest()
        }

        /// <summary>Test stub for ReportServer()</summary>
        [PexMethod]
        public string ReportServerTest()
        {
            string result = WebConfig.ReportServer();
            return result;
            // TODO: add assertions to method WebConfigTest.ReportServerTest()
        }

        /// <summary>Test stub for ReportServices()</summary>
        [PexMethod]
        public string ReportServicesTest()
        {
            string result = WebConfig.ReportServices();
            return result;
            // TODO: add assertions to method WebConfigTest.ReportServicesTest()
        }

        /// <summary>Test stub for ReportUser()</summary>
        [PexMethod]
        public string ReportUserTest()
        {
            string result = WebConfig.ReportUser();
            return result;
            // TODO: add assertions to method WebConfigTest.ReportUserTest()
        }

        /// <summary>Test stub for Reportsource()</summary>
        [PexMethod]
        public string ReportsourceTest()
        {
            string result = WebConfig.Reportsource();
            return result;
            // TODO: add assertions to method WebConfigTest.ReportsourceTest()
        }

        /// <summary>Test stub for RunningModel()</summary>
        [PexMethod]
        public string RunningModelTest()
        {
            string result = WebConfig.RunningModel();
            return result;
            // TODO: add assertions to method WebConfigTest.RunningModelTest()
        }

        /// <summary>Test stub for SchoolSystem()</summary>
        [PexMethod]
        public string SchoolSystemTest()
        {
            string result = WebConfig.SchoolSystem();
            return result;
            // TODO: add assertions to method WebConfigTest.SchoolSystemTest()
        }

        /// <summary>Test stub for currentDatabase()</summary>
        [PexMethod]
        public string currentDatabaseTest()
        {
            string result = WebConfig.currentDatabase();
            return result;
            // TODO: add assertions to method WebConfigTest.currentDatabaseTest()
        }

        /// <summary>Test stub for eMailGo()</summary>
        [PexMethod]
        public string eMailGoTest()
        {
            string result = WebConfig.eMailGo();
            return result;
            // TODO: add assertions to method WebConfigTest.eMailGoTest()
        }

        /// <summary>Test stub for getValuebyKey(String)</summary>
        [PexMethod]
        public string getValuebyKeyTest(string key)
        {
            string result = WebConfig.getValuebyKey(key);
            return result;
            // TODO: add assertions to method WebConfigTest.getValuebyKeyTest(String)
        }
    }
}
