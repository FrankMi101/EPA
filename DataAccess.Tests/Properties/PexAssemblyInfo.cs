// <copyright file="PexAssemblyInfo.cs">Copyright ©  2017</copyright>
using Microsoft.Pex.Framework.Coverage;
using Microsoft.Pex.Framework.Creatable;
using Microsoft.Pex.Framework.Instrumentation;
using Microsoft.Pex.Framework.Settings;
using Microsoft.Pex.Framework.Validation;

// Microsoft.Pex.Framework.Settings
[assembly: PexAssemblySettings(TestFramework = "VisualStudioUnitTest")]

// Microsoft.Pex.Framework.Instrumentation
[assembly: PexAssemblyUnderTest("DataAccess")]
[assembly: PexInstrumentAssembly("itextsharp")]
[assembly: PexInstrumentAssembly("System.Web.Services")]
[assembly: PexInstrumentAssembly("System.Configuration")]
[assembly: PexInstrumentAssembly("System.DirectoryServices")]
[assembly: PexInstrumentAssembly("System.Data")]
[assembly: PexInstrumentAssembly("MyBaseClassC")]
[assembly: PexInstrumentAssembly("System.Web")]

// Microsoft.Pex.Framework.Creatable
[assembly: PexCreatableFactoryForDelegates]

// Microsoft.Pex.Framework.Validation
[assembly: PexAllowedContractRequiresFailureAtTypeUnderTestSurface]
[assembly: PexAllowedXmlDocumentedException]

// Microsoft.Pex.Framework.Coverage
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "itextsharp")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "System.Web.Services")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "System.Configuration")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "System.DirectoryServices")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "System.Data")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "MyBaseClassC")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "System.Web")]

