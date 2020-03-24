

string root = @"C:\Temp";  
string subdir = @"C:\Temp\Mahesh";  
// If directory does not exist, create it.  
if (!Directory.Exists(root))  
{  
    Directory.CreateDirectory(root);  
} 