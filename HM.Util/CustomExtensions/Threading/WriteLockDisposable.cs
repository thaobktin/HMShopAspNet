using System;
using System.Threading;

namespace HM.Util
{
    /// <summary>
    /// Class quản lý disposable cho ReaderWriterLockSlim
    /// </summary>
    /// <Modified>
    /// Name     Date         Comments
    /// trungtq  26/6/2013   created
    /// </Modified>
    public sealed class WriteLockDisposable : IDisposable
    {
        private readonly ReaderWriterLockSlim _rwLock;

        public WriteLockDisposable(ReaderWriterLockSlim rwLock)
        {
            this._rwLock = rwLock;
        }

        void IDisposable.Dispose()
        {
            this._rwLock.ExitWriteLock();
        }
    }
}
