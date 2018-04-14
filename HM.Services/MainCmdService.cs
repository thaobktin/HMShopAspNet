using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using HM.Model;
using HM.Util;
using HM.Data.Interface;
using HM.Data.DataAdapter.SqlServer;

namespace HM.Services
{
    public class MainCmdService
    {
        private readonly IMainCmdAdapter _mainCmdAdapter;

        public MainCmdService()
        {
            _mainCmdAdapter = new MainCmdDataAdapter();
        }

        public string Create(MainCmdInfo entity)
        {
            return _mainCmdAdapter.Insert(entity);
        }

        public bool Update(MainCmdInfo entity)
        {
            return _mainCmdAdapter.Update(entity);
        }

        public bool Delete(string cmdId)
        {
            return _mainCmdAdapter.Delete(cmdId);
        }

        public void FillToListBox(ListItemCollection lstCmds)
        {
            lstCmds.Clear();
            var list = _mainCmdAdapter.GetByParentID("");
            foreach (var cmdInfo in list)
            {
                var item = new ListItem
                {
                    Value = cmdInfo.ID,
                    Text = cmdInfo.Name
                };
                item.Attributes.Add("Level", "0");
                lstCmds.Add(item);
                LoadCmdItem(lstCmds, item);
            }
        }

        public void LoadCmdItem(ListItemCollection lstCmds, ListItem curItem)
        {
            int level = Convert.ToInt32(curItem.Attributes["Level"]) + 1;
            var listCmds = _mainCmdAdapter.GetByParentID(curItem.Value);
            foreach (var cmdInfo in listCmds)
            {
                var item = new ListItem
                {
                    Text = MiscUtils.StringIndent(level) + cmdInfo.Name,
                    Value = cmdInfo.ID
                };
                item.Attributes.Add("Level", level.ToString());
                lstCmds.Add(item);
                LoadCmdItem(lstCmds, item);
            }
        }

        public MainCmdInfo ReadByCmd(string cmdVal)
        {
            return _mainCmdAdapter.GetByValue(cmdVal);
        }

        public MainCmdInfo ReadById(string id)
        {
            return _mainCmdAdapter.GetById(id);
        }

        public List<MainCmdInfo> ReadByParentId(string parentId)
        {
            return _mainCmdAdapter.GetByParentID(parentId);
        }

        public int ChildCount(string parentId)
        {
            return _mainCmdAdapter.GetChildCount(parentId);
        }
    }
}
