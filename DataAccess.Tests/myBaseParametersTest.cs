using MyCommon;
// <copyright file="myBaseParametersTest.cs">Copyright ©  2017</copyright>

using System;
using DataAccess;
using Microsoft.Pex.Framework;
using Microsoft.Pex.Framework.Validation;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DataAccess.Tests
{
    [TestClass]
    [PexClass(typeof(myBaseParameters))]
    [PexAllowedExceptionFromTypeUnderTest(typeof(ArgumentException), AcceptExceptionSubtypes = true)]
    [PexAllowedExceptionFromTypeUnderTest(typeof(InvalidOperationException))]
    public partial class myBaseParametersTest
    {

        [PexMethod]
        public void SetupBaseParameters(
            ref MyParameterDB[] myPara,
            string operate,
            string userID,
            string schoolYear,
            string schoolCode,
            string employeeID,
            string sessionID,
            string category,
            string area,
            string iCode,
            string domainID,
            string competencyID,
            string lookForsID
        )
        {
            myBaseParameters.SetupBaseParameters
                (ref myPara, operate, userID, schoolYear, schoolCode, employeeID,
                 sessionID, category, area, iCode, domainID, competencyID, lookForsID);
            // TODO: add assertions to method myBaseParametersTest.SetupBaseParameters(MyParameterDB[]&, String, String, String, String, String, String, String, String, String, String, String, String)
        }
    }
}
