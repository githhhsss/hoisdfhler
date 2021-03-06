using System;
using System.Collections.Generic;
using System.Text;
using System.IO;
using System.Web.UI.WebControls;
using System.Web;
namespace Maticsoft.Common
{
    /// <summary>
    /// 文件操作
    /// </summary>
    public class FileOper : FileOperBase
    {

        /// <summary>
        /// 获取文件路径
        /// </summary>
        /// <param name="fileName)">文件名</param>	
        public static string GetLogFilePath(string fileName)
        {
            string strFilePath = "";
            string strLogDirPath = AppDomain.CurrentDomain.BaseDirectory + @"SpFile\";
            //判断是否已有文件 
            string[] strFilesArray = Directory.GetFiles(strLogDirPath, fileName);
            if (strFilesArray.Length == 0)
            {
                strFilePath = strLogDirPath + fileName;
                //之前没有文件 需要新建 
                using (File.Create(strFilePath))
                {

                }
            }
            else
            {
                strFilePath = strLogDirPath + fileName;
            }

            return strFilePath;
        }

        /// <summary>
        /// 写文件
        /// </summary>
        /// <param name="msg">信息</param>
        /// <param name="fileName">文件名</param>
        public static void WriteFile(string msg, string fileName)
        {
            try
            {
                System.IO.StreamWriter w = System.IO.File.AppendText(GetLogFilePath(fileName));
                w.BaseStream.Seek(0, SeekOrigin.End);
                //写内容,Environment.NewLine为换行
                w.Write(Environment.NewLine);
                w.Write(msg + Environment.NewLine + "");
                w.Flush();
                w.Close();
            }
            catch
            { }
        }

        /// <summary>
        /// 读取文件内容
        /// </summary>
        /// <param name="fileName">文件名</param>
        /// <returns></returns>
        public static string ReadFile(string fileName)
        {
            StreamReader sr = new StreamReader(GetLogFilePath(fileName), Encoding.Default);
            string msg = sr.ReadToEnd();
            sr.Close();
            sr.Dispose();
            return msg;
        }
        
        /// <summary>
        /// 上传文件（默认文件名）
        /// </summary>
        /// <param name="fileUploadControl">上传控件ID</param>
        /// <param name="SavePath">物理路径</param>
        /// <param name="IsGuid">启用Guid重命名</param>
        /// <returns></returns>
        public static FileMessage UploadFile(FileUpload fileUploadControl, string SavePath, bool IsGuid)
        {           
            FileMessage Message = new FileMessage();
            string filename = fileUploadControl.FileName;
            if (IsGuid)
            {
                //Guid+扩展名
                filename = System.Guid.NewGuid().ToString() + filename.Substring(filename.LastIndexOf("."));
            }
            try
            {

                string FileInServerName = SavePath + filename;
                Message.FileSize = fileUploadControl.PostedFile.ContentLength;
                Message.FileName = filename;
                fileUploadControl.SaveAs(FileInServerName);
                return Message;
            }
            catch (Exception ex)
            {
                throw ex;              
            }
        }
        /// <summary>
        /// 检查是否为合法的上传文件
        /// </summary>
        /// <param name="_fileExt"></param>
        /// <returns></returns>
        private bool CheckFileExt(string _fileExt)
        {
            string[] allowExt = new string[] { ".gif", ".jpg", ".jpeg", ".xls" };
            for (int i = 0; i < allowExt.Length; i++)
            {
                if (allowExt[i] == _fileExt) { return true; }
            }
            return false;

        }
        /// <summary>
        /// 生成日期文件名
        /// </summary>
        /// <returns></returns>
        public static string GetFileName()
        {
            Random rd = new Random();
            StringBuilder serial = new StringBuilder();
            serial.Append(DateTime.Now.ToString("yyyyMMddHHmmssff"));
            serial.Append(rd.Next(0, 999999).ToString());
            return serial.ToString();

        }

        /// <summary>
        /// 上传文件（默认文件名）
        /// </summary>
        /// <param name="fileUploadControl">上传控件ID</param>
        /// <param name="SavePath">物理路径</param>
        /// <param name="IsGuid">启用Guid重命名</param>
        /// <returns></returns>
        public static FileMessage UploadFile(HttpPostedFile postfie, string SavePath, bool IsGuid)
        {
            FileMessage Message = new FileMessage();
            string FileName =Path.GetFileName(postfie.FileName);
            string FileExtesion = Path.GetExtension(postfie.FileName);
            if (IsGuid)
            {
                //Guid+扩展名
                FileName = System.Guid.NewGuid().ToString() + FileExtesion;
            }
            try
            {

                string FileInServerName = SavePath + FileName;
                Message.FileSize = postfie.ContentLength;
                Message.FileName = FileName;
                postfie.SaveAs(FileInServerName);
                return Message;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        ///  文件下载
        /// </summary>
        /// <param name="filefullname">完整文件名 相对路径</param>
        public static void DownLoadSmallFile(string filefullname)
        {
            HttpResponse response = HttpContext.Current.Response;
            HttpRequest request = HttpContext.Current.Request;
            string filepath = filefullname.Substring(0, filefullname.LastIndexOf("/") + 1);
            string filename = filefullname.Remove(0, filepath.Length);
            string Fileparentpath = WebPathTran(filepath);
            try
            {
                if (File.Exists(Fileparentpath + "\\" + filename))
                {

                    FileStream f = new FileStream(WebPathTran(filefullname), FileMode.Open, FileAccess.Read);

                    byte[] data = new byte[f.Length];
                    f.Read(data, 0, (int)f.Length);

                    response.Clear();
                    response.ClearHeaders();
                    response.Buffer = false;
                    response.ContentType = "application/octet-stream";
                    response.AddHeader("Content-Disposition", "attachment;filename=" + System.Web.HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8));
                    response.AppendHeader("Content-Length", data.Length.ToString());

                    f.Close();

                    response.BinaryWrite(data);

                }
                else
                {
                    response.Redirect(request.ServerVariables["HTTP_REFERER"]);
                }
            }
            catch (Exception ew) { response.Write(ew.Message); }

        }


        /// <summary>
        /// 备份文件
        /// </summary>
        /// <param name="sourceFileName">源文件名 物理路径</param>
        /// <param name="destFileName">目标文件名  物理路径</param>
        /// <param name="overwrite">当目标文件存在时是否覆盖</param>
        /// <returns>操作是否成功</returns>
        public static bool BackupFile(string sourceFileName, string destFileName, bool overwrite)
        {
            if (!System.IO.File.Exists(sourceFileName))
            {
                throw new FileNotFoundException(sourceFileName + "文件不存在！");
            }
            if (!overwrite && System.IO.File.Exists(destFileName))
            {
                return false;
            }
            try
            {
                System.IO.File.Copy(sourceFileName, destFileName, true);
                return true;
            }
            catch (Exception e)
            {
                throw e;
            }
        }


        /// <summary>
        /// 备份文件,当目标文件存在时覆盖
        /// </summary>
        /// <param name="sourceFileName">源文件名 物理路径</param>
        /// <param name="destFileName">目标文件名 物理路径</param>
        /// <returns>操作是否成功</returns>
        public static bool BackupFile(string sourceFileName, string destFileName)
        {
            return BackupFile(sourceFileName, destFileName, true);
        }


        /// <summary>
        /// 恢复文件
        /// </summary>
        /// <param name="backupFileName">备份文件名  物理路径 </param>
        /// <param name="targetFileName">要恢复的文件名 物理路径</param>
        /// <param name="backupTargetFileName">要恢复文件再次备份的名称,如果为null,则不再备份恢复文件</param>
        /// <returns>操作是否成功</returns>
        public static bool RestoreFile(string backupFileName, string targetFileName, string backupTargetFileName)
        {
            try
            {
                if (!System.IO.File.Exists(backupFileName))
                {
                    throw new FileNotFoundException(backupFileName + "文件不存在！");
                }
                if (backupTargetFileName != null)
                {
                    if (!System.IO.File.Exists(targetFileName))
                    {
                        throw new FileNotFoundException(targetFileName + "文件不存在！无法备份此文件！");
                    }
                    else
                    {
                        System.IO.File.Copy(targetFileName, backupTargetFileName, true);
                    }
                }
                System.IO.File.Delete(targetFileName);
                System.IO.File.Copy(backupFileName, targetFileName);
            }
            catch (Exception e)
            {
                throw e;
            }
            return true;
        }

        public static bool RestoreFile(string backupFileName, string targetFileName)
        {
            return RestoreFile(backupFileName, targetFileName, null);
        }


        /// <summary>
        /// 文件删除
        /// </summary>
        /// <param name="parentPath">所在父级目录</param>
        /// <param name="filename">文件名</param>
        /// <returns></returns>
        public static bool DeleteFile(string parentPath, string filename)
        {
            try
            {
                string filefullname = WebPathTran(parentPath) + filename;
                File.Delete(filefullname);
                return true;
            }
            catch
            {

                return false;
            }



        }
        /// <summary>
        /// 文件删除
        /// </summary>
        /// <param name="FilePath">物理路径</param>
        /// <returns></returns>
        public static bool DeleteFile(string FilePath)
        {
            FileInfo fi = new FileInfo(FilePath);
            if (fi.Exists)
            {
                try
                {
                    fi.Delete();
                    return true;

                }
                catch
                {
                    return false;
                }
            }
            return true;
        }
        /// <summary>
        /// 判断文件是否存在
        /// </summary>
        /// <param name="FilePath">物理路径</param>
        /// <returns></returns>
        public static bool ExistsFile(string FilePath)
        {            
           return File.Exists(FilePath);            
        }
        /// <summary>
        /// 判断文件夹是否存在
        /// </summary>
        /// <param name="Path">物理路径</param>
        /// <returns></returns>
        public static bool ExistsFold(string Path)
        {
            return Directory.Exists(Path);
        }
        /// <summary>
        /// 创建文件夹
        /// </summary>
        /// <param name="Path">物理路径</param>
        public static void CreateFold(string Path)
        {
            Directory.CreateDirectory(Path);
        }
        /// <summary>
        /// 创建“原始目录/yyyy/mm/dd/”日期目录
        /// </summary>
        /// <param name="Path">物理路径</param>
        /// <returns>返回日期(\yyyy/mm/dd/)的目录</returns>
        public static string CreateDateDirectory(string Path)
        {
            string YearDirectory = DateTime.Now.Year.ToString();
            string MothDirectory = DateTime.Now.Month.ToString();
            string DayDirectory = DateTime.Now.Day.ToString();
            string ReturnPath = "";
            string TempPath = "";
            if (Path.Substring(Path.Length - 1, 1) == "\\")
            {
                TempPath = Path + YearDirectory + "\\" + MothDirectory + "\\" + DayDirectory + "\\";
                ReturnPath = YearDirectory + "\\" + MothDirectory + "\\" + DayDirectory + "\\";
            }
            else
            {
                TempPath = Path + "\\" + YearDirectory + "\\" + MothDirectory + "\\" + DayDirectory + "\\";
                ReturnPath = "\\" + YearDirectory + "\\" + MothDirectory + "\\" + DayDirectory + "\\";
            }
            if (!Directory.Exists(TempPath))
            {
                Directory.CreateDirectory(TempPath);
            }
            return ReturnPath;
        }


    }
}
