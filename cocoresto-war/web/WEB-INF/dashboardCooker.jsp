<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="tile">
    <div id="ordersToDo" class="col-lg-6 col-md-6 col-sm-6">
        <div class="tile-header dvd dvd-btm bg-greensea">
            <h1 class="custom-font"><strong>Plats � faire pour ${userName}</strong></h1>
        </div>

        <div class="tile-body p-0">
            <table class="table table-striped">
                <thead>
                    <tr class="bg-slategray">
                        <th>Commande</th>
                        <th>Date</th>
                        <th>Statut</th>
                        <th>Plats</th>
                        <th>Choisir</th>
                    </tr>
                </thead>
                <tbody>                    
                    <c:forEach var="co" items="${cOrders}" varStatus="loop">
                        <c:forEach var="dishOrderLine" items="${co.dishes}" varStatus="loop">
                            <c:if test="${dishOrderLine.status == 1}">
                                <tr class="text-center">
                                    <td><span class="bg-primary text-center mt-5">${co.number}</span></td>
                                    <td><span class="mt-5"><fmt:formatDate value="${co.orderDate}" pattern="dd/MM � hh:MM" /></span></td>
                                    <td>
                                        <span class="label label-${co.status} mt-5">${co.status.name}</span>
                                    </td>
                                    <td><span class="text-lg text-strong mt-5">${dishOrderLine.dish.name}</span></td>
                                    <td><a class="btn btn-primary center-block status" data-order="${co.id}" data-dish="${dishOrderLine.id}" href="FrontController?option=customerOrder&task=swap&id=${co.id}&dNb=${dishOrderLine.id}&tNb=${co.customerTable.number}">Pr�parer</a></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        <c:forEach var="comboOrderLine" items="${co.combos}">
                            <c:forEach var="cDishOrderLine" items="${comboOrderLine.dishes}" varStatus="loop">
                                <c:if test="${cDishOrderLine.status == 1}">
                                    <tr class="text-center">
                                        <td><span class="bg-primary text-center mt-5">${co.number}</span></td>
                                        <td><span class="mt-5"><fmt:formatDate value="${co.orderDate}" pattern="dd/MM � hh:MM" /></span></td>
                                        <td>
                                            <span class="label label-${co.status} mt-5">${co.status.name}</span>
                                        </td>
                                        <td><span class="text-lg text-strong mt-5">${cDishOrderLine.dish.name} / combo</span></td>
                                        <td><a class="btn btn-primary center-block status" data-order="${co.id}" data-combo="${comboOrderLine.id}" data-dishcombo="${cDishOrderLine.id}" href="FrontController?option=customerOrder&task=swap&id=${co.id}&dcNb=${cDishOrderLine.id}&cId=${comboOrderLine.id}&tNb=${co.customerTable.number}">Pr�parer</a></td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:forEach>

                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="tile-header dvd dvd-btm bg-greensea">
            <h1 class="custom-font"><strong>Boissons � faire pour ${userName}</strong></h1>
        </div>

        <div class="tile-body p-0">
            <table class="table table-striped">
                <thead>
                    <tr class="bg-slategray">
                        <th>Num�ro de la commande</th>
                        <th>Date</th>
                        <th>Statut</th>
                        <th>Boissons</th>
                        <th>Choisir</th>
                    </tr>
                </thead>
                <tbody>                    
                    <c:forEach var="co" items="${cOrders}" varStatus="loop">
                        <c:forEach var="drinkOrderLine" items="${co.drinks}" varStatus="loop">
                            <c:if test="${drinkOrderLine.status == 1}">
                                <tr class="text-center">
                                    <td><span class="bg-primary text-center mt-5">${co.number}</span></td>
                                    <td><span class="mt-5"><fmt:formatDate value="${co.orderDate}" pattern="dd/MM � hh:MM" /></span></td>
                                    <td>
                                        <span class="label label-${co.status} mt-5">${co.status.name}</span>
                                    </td>
                                    <td><span class="text-lg text-strong mt-5">${drinkOrderLine.drink.name}</span></td>
                                    <td><a class="btn btn-primary center-block status" data-order="${co.id}" data-drink="${drinkOrderLine.id}" href="FrontController?option=customerOrder&task=swap&id=${co.id}&drNb=${drinkOrderLine.id}&tNb=${co.customerTable.number}">Pr�parer</a></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </div>

    <div id="ordersInProcess" class="col-lg-6 col-md-6 col-sm-6">

        <div class="tile-header dvd dvd-btm bg-greensea">
            <h1 class="custom-font"><strong>Plats en cours pour ${userName}</strong></h1>
        </div>

        <div class="tile-body p-0">
            <table class="table table-striped">
                <thead>
                    <tr class="bg-slategray">
                        <th>Num�ro de la commande</th>
                        <th>Date</th>
                        <th>Statut</th>
                        <th>Plats</th>
                        <th>Choisir</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cOrder" items="${cOrders}" varStatus="loop">
                        <c:forEach var="dopOrderLine" items="${cOrder.dishes}" varStatus="loop">
                            <c:if test="${dopOrderLine.status == 2}">
                                <tr class="text-center">
                                    <td><span class="bg-primary text-center mt-5">${cOrder.number}</span></td>
                                    <td><span class="mt-5"><fmt:formatDate value="${cOrder.orderDate}" pattern="dd/MM � hh:MM" /></span></td>
                                    <td>
                                        <span class="label label-${cOrder.status} mt-5">${cOrder.status.name}</span>
                                    </td>
                                    <td><span class="text-lg text-strong mt-5">${dopOrderLine.dish.name}</span></td>
                                    <td><a class="btn btn-primary center-block status" data-order="${cOrder.id}" data-dish="${dopOrderLine.id}" href="FrontController?option=customerOrder&task=ready&id=${cOrder.id}&dNb=${dopOrderLine.id}&tNb=${cOrder.customerTable.number}">Pr�t!</a></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        <c:forEach var="copOrderLine" items="${cOrder.combos}">
                            <c:forEach var="copDishOrderLine" items="${copOrderLine.dishes}" varStatus="loop">
                                <c:if test="${copDishOrderLine.status == 2}">
                                    <tr class="text-center">
                                        <td><span class="bg-primary text-center mt-5">${cOrder.number}</span></td>
                                        <td><span class="mt-5"><fmt:formatDate value="${cOrder.orderDate}" pattern="dd/MM � hh:MM" /></span></td>
                                        <td>
                                            <span class="label label-${cOrder.status} mt-5">${cOrder.status.name}</span>
                                        </td>
                                        <td><span class="text-lg text-strong mt-5">${copDishOrderLine.dish.name} / combo</span></td>
                                        <td><a class="btn btn-primary center-block status" data-order="${cOrder.id}" data-combo="${copOrderLine.id}" data-dishcombo="${copDishOrderLine.id}" href="FrontController?option=customerOrder&task=ready&id=${cOrder.id}&dcNb=${copDishOrderLine.id}&cId=${copOrderLine.id}&tNb=${cOrder.customerTable.number}">Pr�t!</a></td>
                                    </tr>
                                </c:if>

                            </c:forEach>
                        </c:forEach>
                    </c:forEach>

                </tbody>
            </table>
        </div>

        <div class="tile-header dvd dvd-btm bg-greensea">
            <h1 class="custom-font"><strong>Boissons en cours pour ${userName}</strong></h1>
        </div>

        <div class="tile-body p-0">
            <table class="table table-striped">
                <thead>
                    <tr class="bg-slategray">
                        <th>Num�ro de la commande</th>
                        <th>Date</th>
                        <th>Statut</th>
                        <th>Boissons</th>
                        <th>Choisir</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cOrder" items="${cOrders}" varStatus="loop">
                        <c:forEach var="dropOrderLine" items="${cOrder.drinks}" varStatus="loop">
                            <c:if test="${dropOrderLine.status == 2}">
                                <tr class="text-center">
                                    <td><span class="bg-primary text-center mt-5">${cOrder.number}</span></td>
                                    <td><span class="mt-5"><fmt:formatDate value="${cOrder.orderDate}" pattern="dd/MM � hh:MM" /></span></td>
                                    <td>
                                        <span class="label label-${cOrder.status} mt-5">${cOrder.status.name}</span>
                                    </td>
                                    <td><span class="text-lg text-strong mt-5">${dropOrderLine.drink.name}</span></td>
                                    <td><a class="btn btn-primary center-block status" data-order="${cOrder.id}" data-drink="${dropOrderLine.id}" href="FrontController?option=customerOrder&task=ready&id=${cOrder.id}&drNb=${dropOrderLine.id}&tNb=${cOrder.customerTable.number}">Pr�t!</a></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:forEach>

                </tbody>
            </table>
        </div>

    </div>


</section>

<script>

    setInterval(function () {
        location.reload();
    }, 8000);

</script>

