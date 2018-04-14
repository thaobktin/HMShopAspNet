using System;
using System.Threading;

namespace HM.Util
{
    /// <summary>
    /// Class quản lý disposable cho UpgradeableReadLockDisposable
    /// </summary>
    /// <Modified>
    /// Name     Date         Comments
    /// trungtq  6/26/2013   created
    /// </Modified>
    public sealed class UpgradeableReadLockDisposable : IDisposable
    {
        private readonly ReaderWriterLockSlim _rwLock;

        public UpgradeableReadLockDisposable(ReaderWriterLockSlim rwLock)
        {
            this._rwLock = rwLock;
        }

        void IDisposable.Dispose()
        {
            this._rwLock.ExitUpgradeableReadLock();
        }
    }
}
