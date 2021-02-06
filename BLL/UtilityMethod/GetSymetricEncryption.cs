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
        return EncryptionSTR.SymetricEncrypt.GetEncryptedValue(inputValue);  // SymetricEncryption.GetEncryptedValue(inputValue);
    }

    public static string GetMyDecryptedValue(string inputValue)
    {
        return EncryptionSTR.SymetricEncrypt.GetDecryptedValue(inputValue);  // SymetricEncryption.GetDecryptedValue(inputValue);

    }
 
}

