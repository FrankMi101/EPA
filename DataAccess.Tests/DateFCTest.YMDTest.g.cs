using Microsoft.Pex.Framework.Generated;
using Microsoft.VisualStudio.TestTools.UnitTesting;
// <auto-generated>
// This file contains automatically generated tests.
// Do not modify this file manually.
// 
// If the contents of this file becomes outdated, you can delete it.
// For example, if it no longer compiles.
// </auto-generated>
using System;

namespace DataAccess.Tests
{
    public partial class DateFCTest
    {

[TestMethod]
[PexGeneratedBy(typeof(DateFCTest))]
public void YMDTest85()
{
    string s;
    s = this.YMDTest(default(DateTime));
    Assert.AreEqual<string>("1/01/01", s);
}

[TestMethod]
[PexGeneratedBy(typeof(DateFCTest))]
public void YMDTest675()
{
    string s;
    s = this.YMDTest(new DateTime(4611686018427387903L & 113246209610612736L, 
                                  (DateTimeKind)(113246209610612736uL >> 62)));
    Assert.AreEqual<string>("359/11/13", s);
}
    }
}
