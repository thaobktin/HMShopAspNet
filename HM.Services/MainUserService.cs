using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using HM.Model;
using HM.Data;
using HM.Data.Interface;
using HM.Data.DataAdapter.SqlServer;

namespace HM.Services
{
    public class MainUserService
    {
        private readonly IMainUserAdapter _mainUserAdapter;

        public MainUserService()
        {
            _mainUserAdapter = new MainUserDataAdapter();
        }

        public string Create(MainUserInfo entity)
        {
            return _mainUserAdapter.Insert(entity);
        }

        public bool Update(MainUserInfo entity)
        {
            return _mainUserAdapter.Update(entity);
        }

        public bool Delete(string id)
        {
            return _mainUserAdapter.Delete(id);
        }

        public MainUserInfo ReadById(string id)
        {
            return _mainUserAdapter.GetById(id);
        }

        public List<MainUserInfo> ReadAll()
        {
            return _mainUserAdapter.GetAll();
        }

        public MainUserInfo ReadByEmail(string email)
        {
            return _mainUserAdapter.GetByEmail(email);
        }

        public MainUserInfo CheckUser(string email, string password)
        {
            return _mainUserAdapter.GetByEmailPassword(email, password);
        }
    }
}
