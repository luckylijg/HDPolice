function CheckLodop(){
         var oldVersion=LODOP.Version;
          newVerion="5.0.2.3";    
         if (oldVersion==null)
             document.write("<h3><font color='#FF00FF'>打印控件未安装!点击这里<a href='../Lodop/install_lodop.exe'>执行安装</a>,安装后请刷新页面。</font& gt;</h3>");
          if (oldVersion<newVerion)
             document.write("<h3><font color='#FF00FF'>打印控件需要升级!点击这里<a href='../Lodop/install_lodop.exe'>执行升级</a>,升级后请重新进入。</font& gt;</h3>");
     }
 