// <copyright file="iCalendarTest.cs">Copyright ©  2017</copyright>

using System;
using DataAccess;
using Microsoft.Pex.Framework;
using Microsoft.Pex.Framework.Validation;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DataAccess.Tests
{
    [TestClass]
    [PexClass(typeof(iCalendar))]
    [PexAllowedExceptionFromTypeUnderTest(typeof(ArgumentException), AcceptExceptionSubtypes = true)]
    [PexAllowedExceptionFromTypeUnderTest(typeof(InvalidOperationException))]
    public partial class iCalendarTest
    {

        [PexMethod]
        public byte[] getiCalendarbyStringBuiding(
            string userID,
            DateTime sDate,
            DateTime eDate,
            string teacherName,
            string subject,
            string description,
            string location,
            string toMail,
            string appraiser
        )
        {
            byte[] result = iCalendar.getiCalendarbyStringBuiding
                                (userID, sDate, eDate, teacherName, subject, description, location, toMail, appraiser);
            return result;
            // TODO: add assertions to method iCalendarTest.getiCalendarbyStringBuiding(String, DateTime, DateTime, String, String, String, String, String, String)
        }
    }
}
