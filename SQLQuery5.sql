SELECT          Order_1.OrderNo AS Expr8, Order_1.OrderDate AS Expr10, Order_1.ShippingDate AS Expr11, 
                            Order_1.ShippingAddr AS Expr12, Order_1.PayWayID AS Expr13, Order_1.OrdertatusID AS Expr14, 
                            Order_1.MemberID AS Expr15, Order_1.ShippingWayID AS Expr16, Prodect.ProductID AS Expr9, 
                            Prodect.ProductName, Prodect.Description, Prodect.Photo, Prodect.ProductTypeID, Prodect.ProductSpecificationID, 
                            Prodect.BrandID AS Expr1, Prodect.SupplierID, HandleOrder.StaffID, HandleOrder.OrderNo AS Expr2, 
                            HandleOrder.HandleTime, ProductType.TypeID, ProductType.TypeName, ProductSpecification.SpecificationID, 
                            ProductSpecification.SpecificationName, Staff.StaffID AS Expr3, Staff.Name, Staff.ArrivalDate, Staff.Phone, 
                            Staff.RoleID, ShippingWay.ShippingWayID AS Expr4, ShippingWay.ShippingWayName, Supplier.SupplierID AS Expr5,
                             Supplier.SupplierName, Supplier.ContactWindow, Supplier.Moblie, Supplier.Addr, Role.RoleID AS Expr6, 
                            Role.RoleName, OrderDetail.OrderNo AS Expr17, OrderDetail.ProductID, [Order].OrderNo AS Expr18, 
                            [Order].OrderDate, [Order].ShippingDate, [Order].ShippingAddr, [Order].PayWayID, [Order].OrdertatusID, 
                            [Order].MemberID, [Order].ShippingWayID, PayWay.PayWayID AS Expr7, PayWay.PayWayName, Brand.BrandID, 
                            Brand.BrandName, Invoice.*
FROM              [Order] INNER JOIN
                            HandleOrder INNER JOIN
                            [Order] AS Order_1 INNER JOIN
                            PayWay ON Order_1.PayWayID = PayWay.PayWayID ON HandleOrder.OrderNo = Order_1.OrderNo INNER JOIN
                            Staff ON HandleOrder.StaffID = Staff.StaffID INNER JOIN
                            ShippingWay ON Order_1.ShippingWayID = ShippingWay.ShippingWayID INNER JOIN
                            Role ON Staff.RoleID = Role.RoleID ON [Order].OrderNo = HandleOrder.OrderNo AND 
                            [Order].PayWayID = PayWay.PayWayID AND [Order].ShippingWayID = ShippingWay.ShippingWayID INNER JOIN
                            OrderDetail ON [Order].OrderNo = OrderDetail.OrderNo AND Order_1.OrderNo = OrderDetail.OrderNo INNER JOIN
                            Supplier INNER JOIN
                            ProductType INNER JOIN
                            Prodect ON ProductType.TypeID = Prodect.ProductTypeID INNER JOIN
                            ProductSpecification ON Prodect.ProductSpecificationID = ProductSpecification.SpecificationID ON 
                            Supplier.SupplierID = Prodect.SupplierID ON OrderDetail.ProductID = Prodect.ProductID INNER JOIN
                            Brand ON Prodect.BrandID = Brand.BrandID INNER JOIN
                            Invoice ON [Order].OrderNo = Invoice.OrderNo AND Order_1.OrderNo = Invoice.OrderNo