using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Instafens;
using Instafens.Model;

namespace SocialPanel.Model
{
    public class OrderRepository
    {
        DataClassesDataContext DbContext = new DataClassesDataContext();

        public void AddOrder(string OrderType,string OrderNumber, string Url, int Amount, string ClientUserName, DateTime OrderDate, int StartPoint,
            int EndPoint, int CurrentCount, string OrderStatus, DateTime LastUpdateDate,decimal Price, string FeatureType)
        {
            tblOrder order = new tblOrder();

            order.OrderNumber = OrderNumber;
            order.OrderType = OrderType;
            order.Url = Url;
            order.Amount = Amount;
            order.ClientUserName = ClientUserName;
            order.OrderDate = OrderDate;
            order.StartPoint = StartPoint;
            order.EndPoint = EndPoint;
            order.CurrentCount = CurrentCount;
            order.OrderStatus = OrderStatus;
            order.LastUpdateDate = LastUpdateDate;
            order.Paid = double.Parse(Price.ToString());
            order.FeatureType = FeatureType;

            DbContext.tblOrders.InsertOnSubmit(order);
            DbContext.SubmitChanges();
        }

        public void UpdateOderStatus(int OrderId, string OrderStatus, int StartPoint, int EndPoint, DateTime CompleteDate)
        {
            tblOrder order = DbContext.tblOrders.Single(O => O.OrderId == OrderId);

            order.OrderStatus = OrderStatus;
            order.StartPoint = StartPoint;
            order.EndPoint = EndPoint;
            order.StartPoint = StartPoint;
            order.EndPoint = EndPoint;
            order.LastUpdateDate = CompleteDate;

            DbContext.SubmitChanges();
        }

        



        public tblOrder GetDetail(int OrderId)
        {
            return DbContext.tblOrders.First(O => O.OrderId == OrderId);
        }

        public bool IsUrlExist(string Url)
        {
            return DbContext.tblOrders.Where(O=>O.FeatureType =="AutoLike").Any(O => O.Url == Url);
        }

        public void UpdateOrderForAdmin(int OrderId, string OrderType, string Url, int Amount, string ClientUserName, DateTime OrderDate,
           string OrderStatus, DateTime CompleteDate, decimal Price)
        {
            tblOrder order = DbContext.tblOrders.First(O => O.OrderId == OrderId);

            order.OrderType = OrderType;
            order.Url = Url;
            order.Amount = Amount;
            order.ClientUserName = ClientUserName;
            order.OrderDate = OrderDate;
            order.OrderStatus = OrderStatus;
            order.LastUpdateDate = CompleteDate;
            order.Paid = double.Parse(Price.ToString());
            DbContext.SubmitChanges();
        }

        public tblOrder CheckOrderStatus(int OrderId)
        {
            return DbContext.tblOrders.First(O => O.OrderId == OrderId);
        }

        //public object GetFacebookOrders(string Email)
        //{
        //    DataClassesDataContext DbContext = new DataClassesDataContext();
        //    var FacebookOrderDetail = DbContext.spFacebookOrderDetailsForUser(Email, null, null, null, null);
        //    return FacebookOrderDetail.OrderByDescending(o => o.Id);
        //}

        public IQueryable<tblOrder> GetOrders()
        {
            DataClassesDataContext DbContext = new DataClassesDataContext();
            var tblOrderDetails = DbContext.tblOrders;
            return tblOrderDetails.OrderByDescending(O => O.OrderId);
        }

        public IQueryable<tblOrder> GetCompletedOrders()
        {
            DataClassesDataContext DbContext = new DataClassesDataContext();
            var tblOrderDetails = DbContext.tblOrders.Where(O=>O.OrderStatus=="Completed");
            return tblOrderDetails.OrderByDescending(O => O.OrderId);
        }

        public IQueryable<tblOrder> GetCompletedOrders(string FeatureType)
        {
            DataClassesDataContext DbContext = new DataClassesDataContext();
            var tblOrderDetails = DbContext.tblOrders.Where(O => O.OrderStatus == "Completed" && O.FeatureType == FeatureType);
            return tblOrderDetails.OrderByDescending(O => O.OrderId);
        }
        public IQueryable<tblOrder> GetNonCompletedOrders(string FeatureType)
        {
            DataClassesDataContext DbContext = new DataClassesDataContext();
            var tblOrderDetails = DbContext.tblOrders.Where(O => O.OrderStatus != "Completed" && O.FeatureType == FeatureType);
            return tblOrderDetails.OrderByDescending(O => O.OrderId);
        }

        public IQueryable<tblOrder> GetOrders(string ClientUserName)
        {
            DataClassesDataContext DbContext = new DataClassesDataContext();
            var tblOrderDetails = DbContext.tblOrders.Where(O => O.ClientUserName == ClientUserName);
            return tblOrderDetails.OrderByDescending(O => O.OrderId).Take(1000);
        }

        public IQueryable<tblOrder> GetCompletedOrders(string ClientUserName, string FeatureType)
        {
            DataClassesDataContext DbContext = new DataClassesDataContext();
            var tblOrderDetails = DbContext.tblOrders.Where(O => O.ClientUserName == ClientUserName && O.OrderStatus == "Completed" && O.FeatureType == FeatureType);
            return tblOrderDetails.OrderByDescending(O => O.OrderId);
        }

        public IQueryable<tblOrder> GetNonCompletedOrders(string ClientUserName ,string FeatureType)
        {
            DataClassesDataContext DbContext = new DataClassesDataContext();
            var tblOrderDetails = DbContext.tblOrders.Where(O => O.ClientUserName == ClientUserName && O.OrderStatus != "Completed" && O.FeatureType == FeatureType);
            return tblOrderDetails.OrderByDescending(O => O.OrderId);
        }

        public void DeleteOrder(int Id)
        {
            tblOrder order = DbContext.tblOrders.First(O => O.OrderId == Id);
            DbContext.tblOrders.DeleteOnSubmit(order);
            DbContext.SubmitChanges();
        }
    }
}