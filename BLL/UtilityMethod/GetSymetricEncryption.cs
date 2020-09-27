using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Configuration;
using System.Web;


public class GetMySymetricEncryption
{ 
    public static string GetMyEncryptedValue(string inputValue)
    {
       return SymetricEncryption.GetEncryptedValue(inputValue);
    }

    public static string GetMyDecryptedValue(string inputValue)
    {
        return SymetricEncryption.GetDecryptedValue(inputValue);

    }
 

}

