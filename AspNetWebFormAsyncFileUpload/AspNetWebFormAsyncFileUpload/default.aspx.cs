using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AspNetWebFormAsyncFileUpload
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpPostedFile file = null;
            if (Request.Files.Count > 0)
            {
                //找到檔案
                file = Request.Files[0];
                //儲存
                var filePath = Server.MapPath(System.IO.Path.GetFileName(file.FileName));
                file.SaveAs(filePath);
                //回應訊息
                Response.Write(filePath + " saved.");
                Response.End();
            }
        }
    }
}