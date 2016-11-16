<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/WEB-INF/views/templates/header.jsp" %>

<br>
<!-- Page Content -->
<div class="container-wrapper" ng-app="cartApp" ng-controller="cartCtrl">


    <div class="container ">
        <div class="row">
            <div class="col-sm-8 col-md-10">
                <div class="page-header">
                    <h1>Todos Nuestros Productos
                        <small>Encuentra el regalo perfecto para ti!</small>
                    </h1>
                </div>
            </div>
        </div>
        <!-- Title -->
        <br>
        <!-- Page Features -->
        <div class="row text-center">

            <c:forEach items="${lista_productos}" var="producto">
                <div class="col-md-3 col-sm-6 hero-feature">
                    <div class="thumbnail">
                        <img src="<c:url value="/resources/product_images/${producto.producto_id}.png" />"
                             alt="${producto.nombre}">
                        <hr>
                        <div class="caption">
                            <p class="product-name"><b>${producto.nombre}</b></p>
                            <p class="precio"><fmt:formatNumber type="currency" >${producto.precio}</fmt:formatNumber> MXN </p>

                            <p>
                                <a href="<spring:url value="/productos/productoDetalles/${producto.producto_id}" />"
                                   class="btn btn-info">
                                    Detalles <span class="glyphicon glyphicon-info-sign"></span>
                                </a>
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <a href="#" class="btn btn-primary" ng-click="addToCart(${producto.producto_id})" data-toggle="modal" data-target="#myModal">
                                        Comprar <span class="glyphicon glyphicon-usd"></span>
                                    </a>
                                </c:if>
                                <c:if test="${pageContext.request.userPrincipal.name == null}">
                                    <a href="<c:url value="/login"/>" class="btn btn-primary">
                                        Comprar <span class="glyphicon glyphicon-usd"></span>
                                    </a>
                                </c:if>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>
        <!-- /.row -->
    </div>
    <!-- /.container -->
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn btn-danger pull-right" data-dismiss="modal">Cerrar</button>
                <h3 class="modal-title" style="text-shadow: 1px 1px 2px dodgerblue"> Operacion Exitosa</h3>
            </div>
            <div class="modal-body">
                <h3 style="text-shadow: 1px 1px 2px darkorchid">El Producto se a&#241;adio a tu carrito de compras con exito.</h3>
                <br>
            </div>
        </div>

    </div>
</div>

<script src="/resources/js/controller.js" type="text/javascript"></script>
<%@include file="/WEB-INF/views/templates/footer.jsp" %>
