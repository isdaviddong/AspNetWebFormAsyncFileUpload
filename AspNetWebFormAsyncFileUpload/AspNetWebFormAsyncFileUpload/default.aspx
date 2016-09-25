<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="AspNetWebFormAsyncFileUpload._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
//傳入FileControl，配合在asp.net的page load當中
function UploadFileAsync(FileControl) {
    var formData = new FormData();
    //抓取File Control中的檔案
    var file = FileControl.files[0];
    formData.append("file", file);
    //非同步post給自己
    var uploadServerSideScriptPath = window.location.href;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", uploadServerSideScriptPath, false);
    xhr.setRequestHeader("Content-Type", "multipart/form-data");
    xhr.setRequestHeader("X-File-Name", file.name);
    xhr.setRequestHeader("X-File-Size", file.size);
    xhr.setRequestHeader("X-File-Type", file.type);
    //如果狀態改變了
    xhr.onreadystatechange = function () {
        //如果完成了
        if (xhr.readyState == XMLHttpRequest.DONE) {
            //顯示個訊息
            alert(xhr.responseText);
        }
    }
    xhr.send(formData);
}
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <input type="file" id="filecontrol" />
    <input type="button" onclick="UploadFileAsync(document.getElementById('filecontrol'));" value="Upload File" />
    </div>
    </form>
</body>
</html>
