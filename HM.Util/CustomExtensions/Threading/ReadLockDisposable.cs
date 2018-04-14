using System;
using System.Threading;

namespace HM.Util
{

    /// <summary>
    /// Class quản lý disposable cho ReaderWriterLockSlim
    /// </summary>
    /// <Modified>
    /// Name     Date         Comments
    /// trungtq  6/26/2013   created
    /// </Modified>
    public sealed class ReadLockDisposable : IDisposable
    {
        private readonly ReaderWriterLockSlim _rwLock;

        public ReadLockDisposable(ReaderWriterLockSlim rwLock)
        {
            this._rwLock = rwLock;
        }

        void IDisposable.Dispose()
        {
            this._rwLock.ExitReadLock();
        }
    }

}
